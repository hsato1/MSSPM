#include "nmfMainWindow.h"
#include <QApplication>
#include <QStyleFactory>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QCoreApplication::setAttribute(Qt::AA_DontUseNativeMenuBar);
    nmfMainWindow w;

    if (w.isStartUpOK()) {
        w.show();
        return a.exec();
    }
    return 0;
}
