#ifndef MYHELPER_H
#define MYHELPER_H

#include <QObject>
#include <QString>
#include <QStringList>

class MyHelper : public QObject
{
    Q_OBJECT
public:
    explicit MyHelper(QObject *parent = nullptr);

public slots:

    Q_INVOKABLE QString browseImage();
     Q_INVOKABLE QStringList listImagesInFolder(const QString &folderPath);
};

#endif // MYHELPER_H
