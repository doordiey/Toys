import datetime
import os
import requests
from bs4 import BeautifulSoup
from PIL import Image


# 根据url爬取需要的文字和图片，某一天具体的
# def GetInfo(url):
#     headers = {"content-type": "application/json",
#                "User-Agent": 'Mozilla/5.0 (X11;Ubuntu;Linux x86_64; rv:22.0) Gecko/20100101 Firefox'}
#     page = requests.get(url, headers=headers).text
#     print("爬到了以下信息：")
#     bsText = BeautifulSoup(page, "html.parser")
#     word = bsText.find_all('div', class_="one-cita")[0].contents[0] + "\n"
#     pictureURL = bsText.find_all('div', class_="one-imagen")[0].img['src']
#     PicText = HandlePic(pictureURL)
#     return word, PicText

# 主页获取
def GetInfo(url):
    headers = {"content-type": "application/json",
               "User-Agent": 'Mozilla/5.0 (X11;Ubuntu;Linux x86_64; rv:22.0) Gecko/20100101 Firefox'}
    page = requests.get(url, headers=headers).text
    print("爬到了以下信息：")
    bsText = BeautifulSoup(page, "html.parser")
    word = bsText.find_all('div', class_="fp-one-cita")[0].a.contents[0] + "\n"
    pictureURL = bsText.find_all('img', class_="fp-one-imagen")[0]['src']
    PicText = HandlePic(pictureURL)
    return word, PicText



# 确认有内容的网址,好像并不需要
# def BuildURLs():
#     urlList = []
#     for x in range(14, 20):
#         baseURL = "http://wufazhuce.com/one/"+str(x)
#         if not JudgmentExist(baseURL):
#             urlList.append(baseURL)
#         else:
#             print(x)
#     return urlList

# 判断页面信息是否存在
def JudgmentExist(url):
    page = requests.get(url).text
    bsText = BeautifulSoup(page, "html.parser")
    return "404 Not Found" in bsText.title.contents[0]

# 发送内容是一个txt文件，将图片信息转化一下，即彩色图片变字符画，用字符表达彩色符号
# 图片太高清了，处理后一塌糊涂，待找新的合适的图片源
def HandlePic(picURL):
    # 把图片下载下来
    try:
        response = requests.get(picURL)
    except requests.exceptions.ConnectionError:
        print("当前图片无法下载")
    file_name = "./pic/" + datetime.datetime.now().strftime('%Y-%m-%d') + '.jpg'
    if not os.path.exists(file_name):
        fp = open(file_name, "wb")
        fp.write(response.content)
        fp.close()
        print("下载图片中")
    image = Image.open(file_name)
    # print(image.size)
    # 按尺寸缩放
    image.thumbnail((30, 30))
    # print(image.size)
    height = image.size[0]
    weight = image.size[1]
    PicTxt = ''
    for i in range(height):
        for j in range(weight):
            date_color = image.getpixel((i, j))
            color_r = date_color[0]
            color_g = date_color[1]
            color_b = date_color[2]
            PicTxt += get_char(color_r, color_g, color_b)
        PicTxt += "\n"
    return PicTxt

def get_char(r, g, b, alpha=256):
    if alpha == 0:
        return ' '
    ascii_char = list(".-i")
    gray = int(0.2126 * r + 0.7152 * g + 0.0722 * b)
    x = int(gray / ((256.0 + 1) / len(ascii_char)))
    return ascii_char[x]

def BuildContent(word, PicText):
    title = "【摸鱼提醒】\n"
    today = datetime.datetime.now()
    Today = "今天是" + str(today.year) + "年" + str(today.month) + "月" + str(today.day) + "日\n"
    Weekday = "距离本周周末还有" + str(6 - today.weekday()-1) + "天\n"
    OtherHappy = ""
    HappyFile = "./HappyDay.txt"
    f = open(HappyFile, 'r', encoding='UTF-8')
    for s in f.readlines():
        that = datetime.datetime.strptime(s.split(',')[0], '%Y-%m-%d')
        dayname = s.split(',')[1].replace("\n", "")
        OtherHappy += "距离" + dayname + "还有" + str((that-today).days+1) + "天"
        OtherHappy += "\n"
    f.close()
    HappyContent = title + Today + Weekday + OtherHappy + "\n" + word + "           出处：一个\n" + PicText
    return HappyContent

def WriteContent(content):
    f = open("./content/fish" + datetime.datetime.now().strftime('%Y-%m-%d') + ".txt", "w", encoding='UTF-8')
    f.write(content)
    f.close()

if __name__ == "__main__":
    # print("先看看要爬啥")
    # judgmentExist("http://wufazhuce.com/one/1")
    # urllist = BuildURLs()
    # print("我已经知道要爬啥了，在这个列表里")
    # print(urllist)
    # print("总共要爬" + str(len(urllist)) + "条")
    word, PicText = GetInfo("http://wufazhuce.com/")
    print("获取了要爬的信息了")
    content = BuildContent(word, PicText)
    print("写成一个txt就成了")
    WriteContent(content)
    print("收工")
