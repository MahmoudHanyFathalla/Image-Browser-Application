#include "myhelper.h"
#include <QDebug>
#include <QFileDialog>
#include <QDebug>
#include <QDir>
#include <QStringList>

MyHelper::MyHelper(QObject *parent) : QObject(parent)
{
}



QString MyHelper::browseImage()
{
    QString fileName = QFileDialog::getOpenFileName(nullptr, "Select Image", QDir::homePath(), "Image Files (*.png *.jpg *.bmp)");
    return fileName;
}
QStringList MyHelper::listImagesInFolder(const QString &folderPath) {
    qDebug() << "Folder path received:" << folderPath;
    // Rest of the method implementation...
    QString localFolderPath = QUrl(folderPath).toLocalFile();
    qDebug() << "Local folder path:" << localFolderPath;

    QStringList imageList;
    QDir directory(localFolderPath);


    QStringList filters;
    filters << "*.png" << "*.jpg" << "*.bmp"; // Add more image formats if needed
    directory.setNameFilters(filters);
    QDir::Filters dirFilter = QDir::Files | QDir::NoDotAndDotDot;
    QFileInfoList fileList = directory.entryInfoList(dirFilter);
    for (const auto &fileInfo : fileList) {
        imageList.append(fileInfo.absoluteFilePath());
    }
     qDebug() << "Image paths found:" << imageList;
    return imageList;
}
