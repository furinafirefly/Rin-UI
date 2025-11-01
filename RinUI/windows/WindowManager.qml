pragma Singleton
import QtQuick 2.15

Item {
    function _isWinMgrInitialized() {
        return typeof WinEventManager!== "undefined"
    }

    function sendDragWindowEvent(window) {
        if (!_isWinMgrInitialized()) {
            console.error("WindowManager is not defined.")
            return -1
        }
        WinEventManager.drag_window_event(WinEventManager.getWindowId(window))
    }

    function maximizeWindow(window) {
        if (!_isWinMgrInitialized()) {
            console.warn("WindowManager is not defined.")
        }

        // 检查WinEventManager是否存在
        if (Qt.platform.os === "windows" && typeof WinEventManager !== "undefined") {
        WinEventManager.maximizeWindow(WinEventManager.getWindowId(window))
        return //理想情况下使用了PySide且拥有WinEventManager类
        }


        toggleMaximizeWindow(window)
    }

    function toggleMaximizeWindow(window) {
        if (!window) return;

        if (window.visibility === Window.Maximized || window.isMaximized) {
            window.showNormal();
        } else {
            window.showMaximized();
        }
    }
}
