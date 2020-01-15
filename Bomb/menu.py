import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton,QMessageBox,QLabel,QMainWindow,QAction,qApp
from PyQt5 import QtCore
from PyQt5.QtCore import *
from PyQt5.QtGui import QIcon
from Ambush import Ambush
import datetime

class Windows(QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.startis = None
        self.bombs = 10

        self.setGeometry(300, 300, 300, 200)
        self.setFixedWidth(500)
        self.setFixedHeight(500)
        self.setWindowTitle("Bomb")
        self.setWindowIcon(QIcon("picture/bomb.png"))

        level1Action = QAction(QIcon('picture/level1.png'), '&简单', self)
        level1Action.setStatusTip('初级')
        level2Action = QAction(QIcon('picture/level2.png'), '&中等', self)
        level2Action.setStatusTip('中级')
        level3Action = QAction(QIcon('picture/level3.png'), '&困难', self)
        level3Action.setStatusTip('困难')

        menubar = self.menuBar()
        levelBar = menubar.addMenu('&level')
        levelBar.addAction(level1Action)
        levelBar.addAction(level2Action)
        levelBar.addAction(level3Action)
        level1Action.triggered.connect(lambda: self.leveldo(1))
        level2Action.triggered.connect(lambda: self.leveldo(2))
        level3Action.triggered.connect(lambda: self.leveldo(3))

        self.btn = QPushButton(self)
        self.btn.setGeometry(QtCore.QRect(250, 30, 50, 50))
        self.btn.setIcon(QIcon("picture/gogogo.png"))

        self.tx = QLabel(self)
        self.tx.setFixedWidth(200)
        self.tx.setFixedHeight(50)
        self.tx.move(0, 30)

        self.bn = QLabel(self)
        self.bn.setFixedWidth(100)
        self.bn.setFixedHeight(50)
        self.bn.move(350, 30)

        self.btn.clicked.connect(self.Timer)
        self.timer = QTimer(self)
        self.timer.start(1000)
        self.timer.timeout.connect(self.timeout)

        self.show()


    @pyqtSlot()
    def Timer(self):
        time = QDateTime.currentDateTime()
        self.startis = time
        Ambush(1)

    @pyqtSlot()
    def timeout(self):
        time = QDateTime.currentDateTime()
        if self.startis is None:
            say = time.toString("hh:mm:ss")
            self.tx.setText("当前时间为：" + say)
        else:
            say = str(self.startis.msecsTo(time)//1000)
            self.tx.setText("游戏开始:" + say)
            self.bn.setText("炸弹剩余：" + str(self.bombs))

    @pyqtSlot()
    def leveldo(self, level):
        print(Ambush(1))
        time = QDateTime.currentDateTime()
        self.startis = time
        if level == 1:
            self.setFixedWidth(810)
            self.setFixedHeight(850)
            self.bombs = 10
        elif level == 2:
            self.bombs = 50
            self.setFixedWidth(800)
            self.setFixedHeight(900)
        elif level == 3:
            self.bombs = 100
            self.setFixedWidth(1500)
            self.setFixedHeight(600)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = Windows()
    sys.exit(app.exec_())