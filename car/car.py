import torch
import torchvision
import torchvision.transforms as transforms
import matplotlib.pyplot as plt
import numpy as np
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from PIL import Image
import sys
import pickle
import os
from torch.autograd import Variable


def ImgDel(path):#将图片格式处理一致
    for a in range(108):
        try:
            img = Image.open(path+ str(a) + ".jpg")
        except :
            print("该图片无法打开")
            try:
                os.remove(path + str(a) + ".jpg")
            except:
                print("该文件不存在")
                continue
        img = img.resize((32 ,32))
        new_name = path + str(a) + ".jpg"
        try:
            img.save(new_name,"jpeg")
        except:
            print("该文件无法保存")
            os.remove(new_name)
            continue

def imshow(img): #进行图片展示：使用plt库，将图片进行展示
    img = img / 2 + 0.5    #将归一化数据还原成图片格式
    plt.imshow(np.transpose(img, (1, 2, 0)))
    plt.show()

class Net(nn.Module):#神经网络构造:声明Net类继承自nn.Module
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5) # 卷积层
        self.pool = nn.MaxPool2d(2, 2)  # 池化层
        self.conv2 = nn.Conv2d(6, 16, 5) #卷积层
        self.fc1 = nn.Linear(16 * 5 * 5, 120) #全连接层
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 4)   #10个输出

    def forward(self, x):
        #定义网络的前向传播方式
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 16 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

def MydataLoad():
    transform = transforms.Compose(
        [transforms.ToTensor(),
         transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
    File = open("./study/mydatabatch1", 'rb')
    # File = open("./study/newkind","rb")
    File1 = open("./test/myexample.pickle",'rb')
    Traindata = pickle.load(File)
    Testdata = pickle.load(File1)

    return Traindata,Testdata

def TrainMyNet():
    traindic, testdic = MydataLoad()
    net = NetReload()
    transform = transforms.Compose(
        [transforms.ToTensor(),
         transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
    optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
    for m in range(1):
        running_loss = 0.0
        for i,data in enumerate(traindic['data'], 0):
            data = data.reshape(32, 32, 3)
            im = Image.fromarray(data)
            img = im.convert('RGB')
            image = transform(img).unsqueeze(0)
            image_tensor = image.to(torch.float)
            label = traindic['labels'][i]
            optimizer.zero_grad()
            output = net(image_tensor)
            if label == 9:
                label = torch.tensor([2])
            else:
                label = torch.tensor([1])
            criterion = nn.CrossEntropyLoss()
            loss = criterion(output, label)

            loss.backward()
            optimizer.step()
            running_loss += loss.item()
            if i % 100 == 99:
                print("[%d,%5d] loss: %.3f" % (m + 1, i + 1, running_loss / 100))
                running_loss = 0.0
    print("Finished Training")
    torch.save(net, 'net.pkl')
    torch.save(net.state_dict(), 'netparm.pkl')

def Trainbus():
    traindic, testdic = MydataLoad()
    net = NetReload()
    optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
    for m in range(1):
        running_loss =0.0
        for i in range(len(traindic['data'])):
            optimizer.zero_grad()
            output = net(traindic['data'][i])
            print(output)
            label = torch.tensor([0])
            criterion = nn.CrossEntropyLoss()
            loss = criterion(output, label)
            loss.backward()
            optimizer.step()
            running_loss += loss.item()
            if i % 5 == 4:
                print("[%d,%5d] loss: %.3f" % (m + 1, i + 1, running_loss / 100))
                running_loss = 0.0
    print("Finished Training")
    torch.save(net,"net.pkl")

def NetReload():
    trainedNet = torch.load('net.pkl')
    return trainedNet

def TestMyDate(): #原有数据筛选后的
    PastModel = NetReload()
    carlist = []
    labelslist = []
    File = open("./test/myexample.pickle","rb")
    filedict = pickle.load(File,encoding="latin1")
    carlist = filedict['data']
    labelslist = filedict['labels']
    sum_num = len(carlist)
    transform = transforms.Compose(
        [transforms.ToTensor(),
         transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
    right = 0
    for c in range(sum_num):
        m = carlist[c]
        m = m.reshape(32, 32, 3)
        im = Image.fromarray(m)
        img = im.convert('RGB')
        image = transform(img).unsqueeze(0)
        image_tensor = image.to(torch.float)
        output = PastModel(image_tensor)
        _, predicted = torch.max(output.data, 1)
        if labelslist[c] == int(predicted):
            right = right + 1
    print(right/2000)

def ViewDate(filename):
    carkind = ["公交车", "货车", "小轿车"]
    transform = transforms.Compose(
        [transforms.ToTensor(),
         transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
    PastModel = NetReload()
    img = Image.open(filename).convert('RGB')
    loader = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
    image = loader(img).unsqueeze(0)
    image_tensor = image.to(torch.float)
    output = PastModel(image_tensor)
    _, predicted = torch.max(output.data, 1)
    predicted = predicted.data.numpy()
    return carkind[predicted[0]]

if __name__ == "__main__":
    # MydataLoad()
    # Trainbus()
    TrainMyNet()
    # TrainNet()
    # TestNet()
    # MytestNet()
    # MyView()
    # ImgDel(" ./test/货车/")
    # TestMyDate()
    for m in range(10):
        print(ViewDate("./test/小轿车/"+str(m)+".jpg"))