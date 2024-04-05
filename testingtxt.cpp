#include "testingtxt.h"

TestingTxt::TestingTxt(QObject *parent) : QObject(parent)
{

}

void TestingTxt::setText(const QString &newText)
{
    if(mText !=newText){
        mText = newText;
       emit TextChanged();
    }


}

const QString &TestingTxt::text() const
{
    return mText;
}

QString TestingTxt::dateTime()
{
    QDateTime date;
    return  date.currentDateTime().toString();
}
