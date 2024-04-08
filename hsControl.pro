TEMPLATE = app
TARGET = basicmain

DEPENDPATH += .
INCLUDEPATH += .

# Use the declarative module
QT += quick

CONFIG+=qml_debug

# Build outside the source tree
MOC_DIR = build/moc
RCC_DIR = build/rcc
OBJECTS_DIR = build/obj
UI_DIR = build/uic

# Input
SOURCES += \
    main.cpp \
    testingtxt.cpp

OTHER_FILES +=

RESOURCES += \
    view.qrc

HEADERS += \
    testingtxt.h

DISTFILES += \
