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
