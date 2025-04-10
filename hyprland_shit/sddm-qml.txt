import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import SddmComponents 2.0

Rectangle {
    id: root
    color: config.backgroundColor || "#282c34"
    
    property string notificationMessage: ""
    
    Connections {
        target: sddm
        
        function onLoginSucceeded() {
            notificationMessage = ""
            errorMessage.opacity = 0
        }
        
        function onLoginFailed() {
            notificationMessage = "Login Failed"
            errorMessage.opacity = 1
        }
    }
    
    // Background Image
    Image {
        id: backgroundImage
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        opacity: config.backgroundMode === "color" ? 0 : config.backgroundOpacity || 1
        visible: config.backgroundMode !== "color"
    }
    
    // Clock
    Text {
        id: timeLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 4
        color: "#ecbe7b"
        font.pointSize: 48
        font.family: config.font
        
        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(), "HH:mm")
        }
        
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: timeLabel.updateTime()
        }
        
        Component.onCompleted: updateTime()
    }
    
    // Date
    Text {
        id: dateLabel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: timeLabel.bottom
        anchors.topMargin: 10
        color: "#bbc2cf"
        font.pointSize: 14
        font.family: config.font
        
        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), "dddd, MMMM d, yyyy")
        }
        
        Timer {
            interval: 60000 // update every minute
            running: true
            repeat: true
            onTriggered: dateLabel.updateDate()
        }
        
        Component.onCompleted: updateDate()
    }
    
    // Main Layout containing login controls
    ColumnLayout {
        id: mainLayout
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 4
        spacing: 20
        width: 350
        
        // User selection
        ComboBox {
            id: userBox
            Layout.fillWidth: true
            model: userModel
            textRole: "name"
            currentIndex: userModel.lastIndex
            
            background: Rectangle {
                color: "#3e4451"
                radius: 6
                border.color: "#51afef"
                border.width: 2
            }
            
            contentItem: Text {
                leftPadding: 12
                rightPadding: 12
                text: userBox.displayText
                font.family: config.font
                font.pointSize: 12
                color: "#bbc2cf"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            
            delegate: ItemDelegate {
                width: userBox.width
                contentItem: Text {
                    text: name
                    font.family: config.font
                    font.pointSize: 12
                    color: "#bbc2cf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: userBox.highlightedIndex === index
                background: Rectangle {
                    color: highlighted ? "#51afef" : "#3e4451"
                    radius: 6
                }
            }
            
            popup: Popup {
                y: userBox.height - 1
                width: userBox.width
                implicitHeight: contentItem.implicitHeight
                padding: 1
                
                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: userBox.popup.visible ? userBox.delegateModel : null
                    currentIndex: userBox.highlightedIndex
                    ScrollIndicator.vertical: ScrollIndicator {}
                }
                
                background: Rectangle {
                    color: "#282c34"
                    border.color: "#51afef"
                    border.width: 1
                    radius: 6
                }
            }
        }
        
        // Password field
        TextField {
            id: passwordField
            Layout.fillWidth: true
            placeholderText: "Password"
            echoMode: TextInput.Password
            passwordCharacter: "•"
            passwordMaskDelay: 1000
            focus: true
            selectByMouse: true
            
            background: Rectangle {
                color: "#3e4451"
                border.color: parent.activeFocus ? "#51afef" : "#3e4451"
                border.width: 2
                radius: 6
            }
            
            color: "#bbc2cf"
            font.family: config.font
            font.pointSize: 12
            
            Keys.onPressed: {
                if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                    sddm.login(userBox.currentText, passwordField.text, sessionBox.currentIndex)
                    event.accepted = true
                }
            }
        }
        
        // Session selection
        ComboBox {
            id: sessionBox
            Layout.fillWidth: true
            model: sessionModel
            textRole: "name"
            currentIndex: sessionModel.lastIndex
            
            background: Rectangle {
                color: "#3e4451"
                radius: 6
                border.color: "#51afef"
                border.width: 2
            }
            
            contentItem: Text {
                leftPadding: 12
                rightPadding: 12
                text: sessionBox.displayText
                font.family: config.font
                font.pointSize: 12
                color: "#bbc2cf"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            
            delegate: ItemDelegate {
                width: sessionBox.width
                contentItem: Text {
                    text: name
                    font.family: config.font
                    font.pointSize: 12
                    color: "#bbc2cf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                }
                highlighted: sessionBox.highlightedIndex === index
                background: Rectangle {
                    color: highlighted ? "#51afef" : "#3e4451"
                    radius: 6
                }
            }
            
            popup: Popup {
                y: sessionBox.height - 1
                width: sessionBox.width
                implicitHeight: contentItem.implicitHeight
                padding: 1
                
                contentItem: ListView {
                    clip: true
                    implicitHeight: contentHeight
                    model: sessionBox.popup.visible ? sessionBox.delegateModel : null
                    currentIndex: sessionBox.highlightedIndex
                    ScrollIndicator.vertical: ScrollIndicator {}
                }
                
                background: Rectangle {
                    color: "#282c34"
                    border.color: "#51afef"
                    border.width: 1
                    radius: 6
                }
            }
        }
        
        // Login button
        Button {
            id: loginButton
            Layout.fillWidth: true
            text: "Login"
            
            background: Rectangle {
                color: parent.down ? "#c678dd" : "#51afef"
                radius: 6
            }
            
            contentItem: Text {
                text: loginButton.text
                font.family: config.font
                font.pointSize: 12
                color: "#282c34"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            
            onClicked: sddm.login(userBox.currentText, passwordField.text, sessionBox.currentIndex)
        }
        
        // Error message
        Text {
            id: errorMessage
            text: root.notificationMessage
            color: "#ff6c6b"
            font.family: config.font
            font.pointSize: 10
            horizontalAlignment: Text.AlignHCenter
            Layout.fillWidth: true
            opacity: 0
            
            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                }
            }
        }
    }
    
    // Power buttons row
    Row {
        id: powerRow
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        
        // Shutdown button
        Button {
            id: shutdownButton
            icon.name: "system-shutdown"
            icon.width: 22
            icon.height: 22
            
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                color: "#3e4451"
                radius: 20
                
                Image {
                    anchors.centerIn: parent
                    source: "icons/power.svg"
                    width: 22
                    height: 22
                    sourceSize.width: 22
                    sourceSize.height: 22
                }
            }
            
            onClicked: sddm.powerOff()
            
            ToolTip {
                visible: parent.hovered
                text: config.translationsShutdownButton || "Shutdown"
                font.family: config.font
                delay: 500
                
                background: Rectangle {
                    color: "#282c34"
                    border.color: "#51afef"
                    border.width: 1
                    radius: 4
                }
                
                contentItem: Text {
                    text: parent.text
                    font.family: config.font
                    font.pointSize: 10
                    color: "#bbc2cf"
                }
            }
        }
        
        // Reboot button
        Button {
            id: rebootButton
            icon.name: "system-reboot"
            icon.width: 22
            icon.height: 22
            
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                color: "#3e4451"
                radius: 20
                
                Image {
                    anchors.centerIn: parent
                    source: "icons/restart.svg"
                    width: 22
                    height: 22
                    sourceSize.width: 22
                    sourceSize.height: 22
                }
            }
            
            onClicked: sddm.reboot()
            
            ToolTip {
                visible: parent.hovered
                text: config.translationsRebootButton || "Reboot"
                font.family: config.font
                delay: 500
                
                background: Rectangle {
                    color: "#282c34"
                    border.color: "#51afef"
                    border.width: 1
                    radius: 4
                }
                
                contentItem: Text {
                    text: parent.text
                    font.family: config.font
                    font.pointSize: 10
                    color: "#bbc2cf"
                }
            }
        }
    }
    
    Component.onCompleted: {
        // Set initial focus to the password field
        passwordField.forceActiveFocus()
    }
}
