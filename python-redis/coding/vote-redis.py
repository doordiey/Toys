import redis
import time

ONE_WEEK_IN_SRCOUNDS = 7 * 86400
VOTE_SCORE = 432
ARTICLES_PER_PAGE = 25

def article_vote(conn, user, article):
    cutoff = time.time() - ONE_WEEK_IN_SRCOUNDS
    if conn.zscore('time:', article) < cutoff:
    # zscore: Get the score associated with the given member in a sorted set
        return
    article_id = article.partition(":")[-1]

    if conn.add("voted:" + article, user):
        conn.zincrby('score:', article, VOTE_SCORE)
    # zincrby: Increment the score of a member in a sorted set

        conn.hincrby(article, 'votes', 1)
    # hincrby: Increment the integer value of a hash field by the given number

def post_article(conn, user, title, link):
    article_id = str(conn.incr('article:'))
    # incr: Increment the integer value of a key by one

    voted = 'voted:' + article_id
    conn.sadd(voted, user)
    conn.expire(voted, ONE_WEEK_IN_SRCOUNDS)
    # expire: Set a key's time to live in seconds

    now = time.time()
    article = 'article:' + article_id
    conn.hmset(article, {
        'title': title,
        'link': link,
        'poster': user,
        'time': now,
        'votes': 1,
    })
    mapping = {
        article: now + VOTE_SCORE
    }
    mapping1 = {
        article: now
    }
    conn.zadd('score:', mapping)
    conn.zadd('time:', mapping1)

    return article_id

def get_articles(conn, page, order='score:'):
    start = (page-1) * ARTICLES_PER_PAGE
    end = start + ARTICLES_PER_PAGE - 1

    ids = conn.zrevrange(order, start, end)
    # zervrange: return a range of a members in a sorted set, by index, with scores ordered from high to low

    articles = []
    for id in ids:
        article_data = conn.hgetall(id)
        article_data['id'] = id
        articles.append(article_data)

    return articles

def add_remove_groups(conn, article_id, to_add=[], to_remove=[]):
    article = 'article:' + article_id
    for group in to_add:
        conn.sadd('group:' + group, article)
    for group in to_remove:
        conn.srem('group:' + group, article)

def get_group_articles(conn, group, page, order='score:'):
    key = order + group
    if not conn.exists(key):
        conn.zinterstore(key,
                         ['group:' + group, order],
                         aggregate='max',
                         )
        conn.expire(key,60)
    return get_articles(conn, page, key)

def read_dic(dic):
    print("\n现有文章按分数排序：")
    for x in dic:
        print(x['id'])

if __name__ == "__main__":
    conn = redis.Redis()
    start = 1
    while start==1:
        print("** redis 投票系统 **")
        print("功能目录")
        print("1.发布文章")
        print("2.投票")
        print("3.查看全部文章")
        print("4.退出系统")
        select = input("请选择功能：")
        if select == "1":
            post_article(conn, "ycp", "123", "123.com")
        elif select == "2":
            article_vote(conn, "ycp", "123")
        elif select == "3":
            read_dic(get_articles(conn, 1))
        elif select == "4":
            start = 0

