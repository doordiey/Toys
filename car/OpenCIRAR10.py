import pickle
import numpy as np
from PIL import Image
from torchvision.transforms import transforms
import torch

def LoadFile():
	carlist = []
	labelslist = []
	File = open('./test/CIRAR10/cifar-10-batches-py/data_batch_5','rb')
	filedict = pickle.load(File,encoding='latin1')
	for m in range(10000):
		if filedict['labels'][m] == 1 or filedict['labels'][m] == 9:
			carlist.append(m)
			labelslist.append(filedict['labels'][m])
	mydict = {'data':[],'labels':labelslist}
	for n in carlist:
		mydict['data'].append(filedict['data'][n])
	mydict['data'] = np.array(mydict['data'])
	MyFile = open('./study/mydatabatch5','wb')
	pickle.dump(mydict, MyFile)
	MyFile.close()
	print(filedict)

def MyDataDel():
	transform = transforms.Compose(
        [transforms.ToTensor(),
         transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
	carlist = []
	labels = []
	for m in range(30):
		img_loc = "test/公交车/" + str(m) + ".jpg"
		try:
			img = Image.open(img_loc).convert('RGB')
		except:
			print("被删掉了")
			continue
		loader = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
		image = loader(img).unsqueeze(0)
		image_tensor = image.to(torch.float)
		carlist.append(image_tensor)
		labels.append(3)
	print(len(carlist))
	mydict = {'data':carlist,'labels':labels}
	File = open('./study/newkind','wb')
	pickle.dump(mydict,File)
	File.close()

if __name__ == "__main__":
	# LoadFile()
	MyDataDel()
