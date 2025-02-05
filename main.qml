import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt.labs.platform
import MyHelper 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        width: parent.width
        height: 30
        color: "lightblue"
        anchors.top: parent.top
    }

    Rectangle {
        width: parent.width
        height: 20
        color: "lightgray"
        anchors.bottom: parent.bottom
    }

    Button {
        id: browseFolderButton
        text: "Browse Folder"
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: button.bottom
            topMargin: 10
        }
        onClicked: {
            folderDialog.open()
        }
    }

    FolderDialog {
        id: folderDialog
        title: "Select a folder"
        folder: shortcuts.home
        onAccepted: {
            console.log("Selected folder path:", folder)
            var imagePaths = myHelper.listImagesInFolder(folder);
            console.log("Image paths:", imagePaths);
            imageModel.clear();
            for (var i = 0; i < imagePaths.length; ++i) {
                // Convert local file path to URL
                var url = "file:///" + imagePaths[i];
                imageModel.append({ "imageName": url });
            }
        }
    }

    Rectangle {
        id: imageContainer
        width: 200 // Set your desired width
        height: 200 // Set your desired height
        anchors.centerIn: parent

        Image {
            id: firstImage
            anchors.fill: parent
            source: imageModel.count > 0 ? imageModel.get(currentIndex).imageName : ""
            fillMode: Image.PreserveAspectFit
        }
    }

    ListModel {
        id: imageModel
    }

    MyHelper {
        id: myHelper
    }

    property int currentIndex: 0

    Button {
        id: nextButton
        text: "Next"
        anchors {
            top: imageContainer.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 10
        }
        onClicked: {
            if (currentIndex < imageModel.count - 1) {
                currentIndex++
                firstImage.source = imageModel.get(currentIndex).imageName
            }
        }
    }

    Button {
        id: prevButton
        text: "Previous"
        anchors {
            top: nextButton.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 10
        }
        onClicked: {
            if (currentIndex > 0) {
                currentIndex--
                firstImage.source = imageModel.get(currentIndex).imageName
            }
        }
    }
}
