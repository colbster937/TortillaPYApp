import sys
import os
import subprocess

try:
    import pyautogui
    from PyQt5.QtCore import QUrl
    from PyQt5.QtWidgets import QApplication
    from PyQt5.QtWebEngineWidgets import QWebEngineView
    from PyQt5.QtNetwork import QNetworkProxy
    from PyQt5.QtWidgets import QApplication, QMainWindow
    from PyQt5.QtWebEngineWidgets import QWebEngineView
except ImportError as e:
    subprocess.check_call([sys.executable, "-m", "pip", "install", "PyQt5", "PyQtWebEngine", "tk", "pyautogui", "--break-system-packages"])
    subprocess.check_call([sys.executable, __file__])

os.system("start /b ssh -o StrictHostKeyChecking=no -D 52892 -N -C public@739retsbloc.colbster937.dev")

proxy = QNetworkProxy()
proxy.setType(QNetworkProxy.Socks5Proxy)
proxy.setHostName('127.0.0.1')
proxy.setPort(52892)
QNetworkProxy.setApplicationProxy(proxy)

username = os.getlogin()

class Browser(QMainWindow):
    def __init__(self):
        super(Browser, self).__init__()
        
        screen = QApplication.primaryScreen().geometry()

        width, height= pyautogui.size()

        windowHeight = int(height - 200)
        windowWidth = int(width - 200)

        self.resize(windowWidth, windowHeight)

        self.browserView = QWebEngineView()
        self.setCentralWidget(self.browserView)
        
        self.browserView.loadFinished.connect(self.update_title)

        self.setWindowTitle("Tortilla")
        
    def update_title(self):
        title = self.browserView.page().title()
        self.setWindowTitle(title)

def main():
    app = QApplication([])
    window = Browser()
    window.show()
    window.browserView.load(QUrl(f"http://tortillagames.org?user={username}"))
    app.exec_()

if __name__ == "__main__":
    main()
