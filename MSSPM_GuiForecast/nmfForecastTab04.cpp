#include "nmfForecastTab04.h"
#include "nmfConstantsMSSPM.h"
#include "nmfUtils.h"
#include "nmfUtilsQt.h"
#include "nmfConstants.h"

nmfForecast_Tab4::nmfForecast_Tab4(QTabWidget  *tabs,
                                   nmfLogger   *logger,
                                   nmfDatabase *databasePtr,
                                   std::string &projectDir)
{
    QUiLoader loader;

    m_logger      = logger;
    m_databasePtr = databasePtr;
    m_fontSize    = 9;
    m_ProjectDir  = projectDir;
    m_SaveDlg     = nullptr;
    m_currentScenario.clear();
    m_ProjectSettingsConfig.clear();
    m_SortedForecastLabelsMap.clear();

    m_logger->logMsg(nmfConstants::Normal,"nmfForecast_Tab4::nmfForecast_Tab4");

    Forecast_Tabs = tabs;

    // Load ui as a widget from disk
    QFile file(":/forms/Forecast/Forecast_Tab04.ui");
    file.open(QFile::ReadOnly);
    Forecast_Tab4_Widget = loader.load(&file, Forecast_Tabs);
    file.close();

    // Add the loaded widget as the new tabbed page
    Forecast_Tabs->addTab(Forecast_Tab4_Widget, tr("4. Run Forecast"));

    Forecast_Tab4_OutputTE    = Forecast_Tabs->findChild<QTextEdit   *>("Forecast_Tab4_OutputTE");
    Forecast_Tab4_RunPB       = Forecast_Tabs->findChild<QPushButton *>("Forecast_Tab4_RunPB");
    Forecast_Tab4_SaveToMultiScenarioPB = Forecast_Tabs->findChild<QPushButton *>("Forecast_Tab4_SaveToMultiScenarioPB");
    Forecast_Tab4_PrevPB      = Forecast_Tabs->findChild<QPushButton *>("Forecast_Tab4_PrevPB");
    Forecast_Tab4_FontSizeCMB = Forecast_Tabs->findChild<QComboBox   *>("Forecast_Tab4_FontSizeCMB");
    Forecast_Tab1_NameLE      = Forecast_Tabs->findChild<QLineEdit   *>("Forecast_Tab1_NameLE");

    QFont font = Forecast_Tab4_OutputTE->font();
    font.setBold(false);
    Forecast_Tab4_OutputTE->setFont(font);
    Forecast_Tab4_PrevPB->setText("\u25C1--");

    connect(Forecast_Tab4_PrevPB,      SIGNAL(clicked()),
            this,                      SLOT(callback_PrevPB()));
    connect(Forecast_Tab4_RunPB,       SIGNAL(clicked()),
            this,                      SLOT(callback_RunPB()));
    connect(Forecast_Tab4_SaveToMultiScenarioPB,  SIGNAL(clicked()),
            this,                      SLOT(callback_RunMultiScenarioPB()));
    connect(Forecast_Tab4_FontSizeCMB, SIGNAL(currentTextChanged(QString)),
            this,                      SLOT(callback_Forecast_Tab4_FontSizeCMB(QString)));

} // end constructor


nmfForecast_Tab4::~nmfForecast_Tab4()
{
}

void
nmfForecast_Tab4::setOutputTE(QString msg)
{
    Forecast_Tab4_OutputTE->setText(msg);
    callback_Forecast_Tab4_FontSizeCMB(QString::number(m_fontSize));
}

void
nmfForecast_Tab4::appendOutputTE(QString msg)
{
    QString currentMsg = Forecast_Tab4_OutputTE->document()->toHtml();
    Forecast_Tab4_OutputTE->setText(currentMsg+msg);
    callback_Forecast_Tab4_FontSizeCMB(QString::number(m_fontSize));
}

void
nmfForecast_Tab4::clearOutputTE()
{
    Forecast_Tab4_OutputTE->clear();
}

void
nmfForecast_Tab4::callback_PrevPB()
{
    int prevPage = Forecast_Tabs->currentIndex()-1;
    Forecast_Tabs->setCurrentIndex(prevPage);
}

std::string
nmfForecast_Tab4::getCurrentForecastName()
{
    return Forecast_Tab1_NameLE->text().toStdString();
}

void
nmfForecast_Tab4::callback_RunPB()
{
    m_logger->logMsg(nmfConstants::Normal,"");
    m_logger->logMsg(nmfConstants::Normal,"Start Forecast");

    std::string ForecastName = Forecast_Tab1_NameLE->text().toStdString();

    emit RunForecast(ForecastName,true);
}

void
nmfForecast_Tab4::setOutputScenario(std::string scenario)
{
    m_currentScenario = scenario;
}

void
nmfForecast_Tab4::callback_RunMultiScenarioPB()
{
    m_logger->logMsg(nmfConstants::Normal,"");
    m_logger->logMsg(nmfConstants::Normal,"Start MultiScenario");

    emit QueryOutputScenario();

    m_SaveDlg = new MultiScenarioSaveDialog(
                Forecast_Tabs,
                m_databasePtr,
                m_logger,
                m_SortedForecastLabelsMap,
                m_currentScenario,
                getCurrentForecastName());
    connect(m_SaveDlg, SIGNAL(RefreshOutput()),
            this,    SLOT(callback_RefreshOutput()));

    if (m_SaveDlg->exec()) {  // OK pressed
        QMessageBox::information(Forecast_Tabs,
                                 tr("Forecast Saved"),
                                 tr("\nForecast saved to Multi-Scenario.\n"),
                                 QMessageBox::Ok);

    }

    callback_RefreshOutput();
}

void
nmfForecast_Tab4::callback_RefreshOutput()
{
    if (m_SaveDlg) {
        m_SaveDlg->getOrderedForecastLabels(m_SortedForecastLabelsMap);
    }
    emit UpdateOutputScenarios();
    emit SetChartType("Multi-Scenario Plots",m_SortedForecastLabelsMap);
    emit RefreshOutput();
    emit SetOutputScenarioText(QString::fromStdString(m_SaveDlg->getScenarioName()));
}


void
nmfForecast_Tab4::callback_Forecast_Tab4_FontSizeCMB(QString theFontSize)
{
    m_fontSize = theFontSize.toInt();

    QTextCursor cursor = Forecast_Tab4_OutputTE->textCursor();
    Forecast_Tab4_OutputTE->selectAll();
    Forecast_Tab4_OutputTE->setFontPointSize(m_fontSize);
    Forecast_Tab4_OutputTE->setTextCursor( cursor );
}


bool
nmfForecast_Tab4::loadWidgets()
{
std::cout << "nmfForecast_Tab4::loadWidgets()" << std::endl;

    return true;
}

void
nmfForecast_Tab4::setFontSize(int fontSize)
{
    if (Forecast_Tab4_FontSizeCMB != nullptr) {
        int index = Forecast_Tab4_FontSizeCMB->findText(QString::number(fontSize));
        Forecast_Tab4_FontSizeCMB->setCurrentIndex(index);
    }
}

void
nmfForecast_Tab4::readSettings()
{

}

void
nmfForecast_Tab4::saveSettings()
{
    QSettings settings("NOAA", "MSSPM");

    settings.beginGroup("Forecast");
    settings.setValue("FontSize", Forecast_Tab4_FontSizeCMB->currentText());
    settings.endGroup();
}
