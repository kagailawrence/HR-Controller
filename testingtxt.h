#ifndef TESTINGTXT_H
#define TESTINGTXT_H

#include <QObject>
#include<QDateTime>

class TestingTxt : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ui_Text READ text WRITE setText NOTIFY TextChanged)

public:
    explicit TestingTxt(QObject *parent = nullptr);

    void setText(const QString &newText);
    const QString &text() const;

    Q_INVOKABLE QString dateTime();

signals:
   void TextChanged();

private:
    QString mText="Hello world";

};

#endif // TESTINGTXT_H
