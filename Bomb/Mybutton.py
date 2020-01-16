from PyQt5 import QtCore, QtWidgets
from PyQt5.QtGui import QIcon
from PyQt5.QtWidgets import QMessageBox


class myButton(QtWidgets.QPushButton):

    def __init__(self, type, x, y, bombs, parent=None):
        super(myButton, self).__init__(parent)
        self.type = type
        self.setGeometry(QtCore.QRect(x, y, 40, 40))
        self.setIcon(QIcon("picture/no.png"))
        self.setFlat(True)
        self.b = bombs

    def mousePressEvent(self, e):
        # 左键按下
        if e.buttons() == QtCore.Qt.LeftButton:
            if self.type == -1:
                self.setIcon(QIcon("picture/bomb.png"))
                QMessageBox.information(self, 'bomb', '踩到炸弹了')
            elif self.type == 0:
                self.setVisible(False)
            elif self.type == 1:
                self.setIcon(QIcon("picture/1.png"))
            elif self.type == 2:
                self.setIcon(QIcon("picture/2.png"))
            elif self.type == 3:
                self.setIcon(QIcon("picture/3.png"))
            elif self.type == 4:
                self.setIcon(QIcon("picture/4.png"))
            elif self.type == 5:
                self.setIcon(QIcon("picture/5.png"))
            elif self.type == 6:
                self.setIcon(QIcon("picture/6.png"))
            elif self.type == 7:
                self.setIcon(QIcon("picture/7.png"))
            elif self.type == 8:
                self.setIcon(QIcon("picture/8.png"))
        # 右键按下
        elif e.buttons() == QtCore.Qt.RightButton:
            self.setIcon(QIcon("picture/flag.png"))

