import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton,QMessageBox,QLabel,QMainWindow
from PyQt5 import QtCore
from PyQt5.QtCore import *
from PyQt5.QtGui import QIcon
import datetime

class Windows(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.startis = None
        self.setGeometry(300, 300, 300, 200)
        self.setFixedWidth(500)
        self.setFixedHeight(500)
        self.setWindowTitle("Bomb")
        self.setWindowIcon(QIcon("bomb.png"))
        self.btn = QPushButton(self)
        self.btn.setGeometry(QtCore.QRect(250, 10, 50, 50))
        self.btn.setIcon(QIcon("gogogo.png"))
        self.tx = QLabel(self)
        self.tx.setFixedWidth(200)
        self.tx.move(0,10)
        self.btn.clicked.connect(self.Timer)
        self.timer = QTimer(self)
        self.timer.start(1000)
        self.timer.timeout.connect(self.timeout)
        self.show()


    @pyqtSlot()
    def Timer(self):
        time = QDateTime.currentDateTime()
        self.startis = time

    @pyqtSlot()
    def timeout(self):
        time = QDateTime.currentDateTime()
        if self.startis is None:
            say = time.toString("hh:mm:ss")
            self.tx.setText("当前时间为：" + say)
        else:
            say = str(self.startis.msecsTo(time)//1000)
            self.tx.setText("游戏开始:" + say)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = Windows()
    sys.exit(app.exec_())