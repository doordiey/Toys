import requests
from bs4 import BeautifulSoup
import re

def getHtml(url):
	headers = {"content-type": "application/json", "User-Agent": 'Mozilla/5.0 (X11;Ubuntu;Linux x86_64; rv:22.0) Gecko/20100101 Firefox'}
	query_parameters = {"q": "公交车", "first": 1, "count": 100}
	page = requests.get(url, headers=headers, params=query_parameters).text
	bsthat = BeautifulSoup(page, "html.parser")
	divList = bsthat.findAll(name="a", attrs={"class":"iusc"})
	return divList

def ReDel(urllist, mlist):
	pattern = 'href="(.*?)"'
	p = re.compile(pattern)
	for m in mlist:
		m = str(m)
		s = p.findall(m)
		urllist.append(s[0])
	return urllist

def FindImageURL(imglist,imgurllist):
	pattern = "http%3a.*.jpg"
	p = re.compile(pattern)
	for m in imglist:
		s = p.findall(m)
		if len(s) == 0:
			continue
		s[0] = s[0].replace("%3a", ":")
		s[0] = s[0].replace("%2f", "/")
		imgurllist.append(s[0])
	return imgurllist

def downloadImage(imgurllist):
	i = 0
	for m in imgurllist:
		try:
			response = requests.get(m,timeout=3)
		except requests.exceptions.ConnectionError:
			print("当前图片无法下载")
			continue
		file_name = "./test/公交车/"+str(i)+".jpg"
		fp = open(file_name,"wb")
		fp.write(response.content)
		fp.close()
		i += 1

if __name__ == "__main__":
	urllist = []
	imgurllist = []
	a = getHtml("https://cn.bing.com/images/search?q=%E5%85%AC%E4%BA%A4%E8%BD%A6&qs=n&form=QBIRMH&sp=-1&pq=%E5%85%AC%E4%BA%A4%E8%BD%A6&sc=8-3&sk=&cvid=7AFF1C4E3D9C469C88BC9082337640F0")
	c = ReDel(urllist, a)
	d = FindImageURL(c,imgurllist)
	downloadImage(d)
