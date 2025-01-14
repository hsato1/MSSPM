#-------------------------------------------------
#
# Project created by QtCreator 2018-05-06T14:44:14
#
#-------------------------------------------------

QT       += core gui charts sql datavisualization uitools concurrent

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = MSSPM
TEMPLATE = app

#PRECOMPILED_HEADER = /home/rklasky/workspaceQtCreator/MSSPM/MSSPM_Main/precompiled_header.h
PRECOMPILED_HEADER = /Users/hiro/Internship/NoaaInternshipGit/MSSPM/MSSPM_Main/precompiled_header.h
CONFIG += precompile_header
QTPLUGIN += qsqlmysql
QMAKE_CXXFLAGS += -DATL_HAS_EIGEN
QMAKE_CFLAGS += -DATL_HAS_EIGEN

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
QMAKE_CXXFLAGS += -std=c++0x


# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++14

#LIBS += -lboost_system -lboost_filesystem

SOURCES += \
    SimulatedBiomassDialog.cpp \
    TableNamesDialog.cpp \
    main.cpp \
    nmfMainWindow.cpp \
    ClearOutputDialog.cpp \
    PreferencesDialog.cpp

HEADERS  += \
    SimulatedBiomassDialog.h \
    TableNamesDialog.h \
    mainpage.h \
    nmfMainWindow.h \
    ClearOutputDialog.h \
    PreferencesDialog.h

FORMS += \
    nmfMainWindow.ui

RESOURCES += \
    resource.qrc \
    qdarkstyle/style.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

# For the Bees code
INCLUDEPATH += /home/rklasky

##unix|win32: LIBS += -L/Users/satouhiroshiki/nlopt/build -lnlopt # -lnlopt_cxx
#INCLUDEPATH += /Users/satouhiroshiki/nlopt/build
INCLUDEPATH += /Users/hiro/Downloads/boost_1_76_0




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../nlopt/build/release/ -lnlopt.0.11.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../nlopt/build/debug/ -lnlopt.0.11.0
else:unix: LIBS += -L$$PWD/../../../../nlopt/build/ -lnlopt.0.11.0

INCLUDEPATH += $$PWD/../../../../nlopt/src/api
DEPENDPATH += $$PWD/../../../../nlopt/src/api

unix|win32: LIBS += -L/usr/local/lib -lnlopt # -lnlopt_cxx
INCLUDEPATH += /Users/satouhiroshiki/nlopt/build






win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfUtilities-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lnmfUtilities.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfUtilities-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lnmfUtilities.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-nmfUtilities-Desktop_Qt_5_15_2_clang_64bit-Release/ -lnmfUtilities.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/nmfUtilities
DEPENDPATH += $$PWD/../../nmfSharedUtilities/nmfUtilities

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfDatabase-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lnmfDatabase.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfDatabase-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lnmfDatabase.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-nmfDatabase-Desktop_Qt_5_15_2_clang_64bit-Release/ -lnmfDatabase.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/nmfDatabase
DEPENDPATH += $$PWD/../../nmfSharedUtilities/nmfDatabase

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfCharts-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lnmfCharts.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfCharts-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lnmfCharts.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-nmfCharts-Desktop_Qt_5_15_2_clang_64bit-Release/ -lnmfCharts.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/nmfCharts
DEPENDPATH += $$PWD/../../nmfSharedUtilities/nmfCharts

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-BeesAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lBeesAlgorithm.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-BeesAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lBeesAlgorithm.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-BeesAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/ -lBeesAlgorithm.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/BeesAlgorithm
DEPENDPATH += $$PWD/../../nmfSharedUtilities/BeesAlgorithm

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfModels-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lnmfModels.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfModels-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lnmfModels.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-nmfModels-Desktop_Qt_5_15_2_clang_64bit-Release/ -lnmfModels.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/nmfModels
DEPENDPATH += $$PWD/../../nmfSharedUtilities/nmfModels

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfGuiDialogs-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lnmfGuiDialogs.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfGuiDialogs-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lnmfGuiDialogs.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-nmfGuiDialogs-Desktop_Qt_5_15_2_clang_64bit-Release/ -lnmfGuiDialogs.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/nmfGuiDialogs
DEPENDPATH += $$PWD/../../nmfSharedUtilities/nmfGuiDialogs


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_ParameterEstimationNLoptAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_ParameterEstimationNLoptAlgorithm.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_ParameterEstimationNLoptAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_ParameterEstimationNLoptAlgorithm.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_ParameterEstimationNLoptAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_ParameterEstimationNLoptAlgorithm.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_ParameterEstimationNLoptAlgorithm
DEPENDPATH += $$PWD/../MSSPM_ParameterEstimationNLoptAlgorithm

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_ParameterEstimationBeesAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_ParameterEstimationBeesAlgorithm.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_ParameterEstimationBeesAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_ParameterEstimationBeesAlgorithm.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_ParameterEstimationBeesAlgorithm-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_ParameterEstimationBeesAlgorithm.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_ParameterEstimationBeesAlgorithm
DEPENDPATH += $$PWD/../MSSPM_ParameterEstimationBeesAlgorithm

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiSetup-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_GuiSetup.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiSetup-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_GuiSetup.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiSetup-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_GuiSetup.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_GuiSetup
DEPENDPATH += $$PWD/../MSSPM_GuiSetup

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiEstimation-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_GuiEstimation.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiEstimation-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_GuiEstimation.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiEstimation-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_GuiEstimation.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_GuiEstimation
DEPENDPATH += $$PWD/../MSSPM_GuiEstimation

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiOutput-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_GuiOutput.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiOutput-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_GuiOutput.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiOutput-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_GuiOutput.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_GuiOutput
DEPENDPATH += $$PWD/../MSSPM_GuiOutput

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiDiagnostic-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_GuiDiagnostic.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiDiagnostic-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_GuiDiagnostic.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiDiagnostic-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_GuiDiagnostic.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_GuiDiagnostic
DEPENDPATH += $$PWD/../MSSPM_GuiDiagnostic

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiForecast-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_GuiForecast.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiForecast-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_GuiForecast.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_GuiForecast-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_GuiForecast.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_GuiForecast
DEPENDPATH += $$PWD/../MSSPM_GuiForecast

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_SimulatedData-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lMSSPM_SimulatedData.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-MSSPM_SimulatedData-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lMSSPM_SimulatedData.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-MSSPM_SimulatedData-Desktop_Qt_5_15_2_clang_64bit-Release/ -lMSSPM_SimulatedData.1.0.0

INCLUDEPATH += $$PWD/../MSSPM_SimulatedData
DEPENDPATH += $$PWD/../MSSPM_SimulatedData

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-REMORA-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lREMORA.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-REMORA-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lREMORA.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-REMORA-Desktop_Qt_5_15_2_clang_64bit-Release/ -lREMORA.1.0.0

INCLUDEPATH += $$PWD/../../REMORA/REMORA
DEPENDPATH += $$PWD/../../REMORA/REMORA

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfGuiComponentsMain-Desktop_Qt_5_15_2_clang_64bit-Release/release/ -lnmfGuiComponentsMain.1.0.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../builds/build-nmfGuiComponentsMain-Desktop_Qt_5_15_2_clang_64bit-Release/debug/ -lnmfGuiComponentsMain.1.0.0
else:unix: LIBS += -L$$PWD/../../../builds/build-nmfGuiComponentsMain-Desktop_Qt_5_15_2_clang_64bit-Release/ -lnmfGuiComponentsMain.1.0.0

INCLUDEPATH += $$PWD/../../nmfSharedUtilities/nmfGuiComponentsMain
DEPENDPATH += $$PWD/../../nmfSharedUtilities/nmfGuiComponentsMain

#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../satouhiroshiki/nlopt/build/release/ -lnlopt.0.11.0
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../satouhiroshiki/nlopt/build/debug/ -lnlopt.0.11.0
#else:unix: LIBS += -L$$PWD/../../../../../satouhiroshiki/nlopt/build/ -lnlopt.0.11.0

#INCLUDEPATH += $$PWD/../../../../../satouhiroshiki/nlopt/src/api
#DEPENDPATH += $$PWD/../../../../../satouhiroshiki/nlopt/src/api

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../usr/local/lib/release/ -lnlopt.0.11.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../usr/local/lib/debug/ -lnlopt.0.11.0
else:unix: LIBS += -L$$PWD/../../../../../../usr/local/lib/ -lnlopt.0.11.0

INCLUDEPATH += $$PWD/../../../../../../usr/local/include
DEPENDPATH += $$PWD/../../../../../../usr/local/include
