import sys
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
from PyQt5.Qt import *
from PyQt5.QtGui import *
from car import *

class Views(QWidget):

    def __init__(self):
        super().__init__()
        self.fname = ""
        layout = QVBoxLayout()
        self.btn = QPushButton("加载图片")
        self.btn.move(200,100)
        self.btn.resize(200,200)
        self.le = QLabel("")
        self.result = QTextEdit(self, readOnly = True)
        self.master = QLabel("Made by ycp")
        self.btn.clicked.connect(self.getfile)
        layout.addWidget(self.le)
        layout.addStretch(0)
        layout.addWidget(self.btn)
        layout.addStretch(0)
        layout.addWidget(self.result)
        layout.addStretch(0)
        layout.addWidget(self.master)
        self.setLayout(layout)
        self.Title()

    def Title(self):
        self.setGeometry(800, 200, 800, 800)
        self.setWindowTitle("What's car in picture?")
        self.setWindowIcon(QIcon('车辆类型.png'))

    def getfile(self):
        fname, _ = QFileDialog.getOpenFileName(self, 'Open File', 'c:\\Users\\lenovo\\PycharmProjects\\car\\test', "Image files (*.jpg *.gif)")
        self.fname = fname
        img = QImage(fname)
        size = QSize(128, 128)
        pixImg = QPixmap.fromImage(img.scaled(size,Qt.IgnoreAspectRatio))
        self.result.setPlainText("我看到图片上是一辆"+ ViewDate(fname))
        self.le.setPixmap(pixImg)
        self.le.move(100,200)

    def closeEvent(self, event):
        reply = QMessageBox.question(self, "Message", "Are you sure to qiut?", QMessageBox.Yes|QMessageBox.No, QMessageBox.No)
        if reply == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()

def MyView():
    app = QApplication(sys.argv)  #创建应用对象
    app.aboutToQuit.connect(app.deleteLater)
    m = Views()
    m.show()
    sys.exit((app.exec_()))

if __name__ == "__main__":
	MyView()