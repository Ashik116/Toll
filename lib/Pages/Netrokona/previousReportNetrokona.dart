import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toll_plaza/Animation/loadingAnimation.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/winVehicleReportModule.dart';
import 'package:toll_plaza/DatabaseModule/Netrokona/previousNetrokonaData.dart';
import 'package:toll_plaza/ThemeAndColors/themeAndColors.dart';

class PreviousReportNetrokona extends StatefulWidget {
  const PreviousReportNetrokona({Key key}) : super(key: key);

  @override
  _PreviousReportNetrokonaState createState() => _PreviousReportNetrokonaState();
}

class _PreviousReportNetrokonaState extends State<PreviousReportNetrokona> {
  @override
  Widget build(BuildContext context) {
    final previousReport = Provider.of<PreviousReportNetrokonaDatabase>(context);
    return previousReport.previousDataListNetrokona.isNotEmpty ?
    ListView.builder(
      itemCount: previousReport.previousDataListNetrokona.length,
      itemBuilder: (context, snapshot) {
        if(previousReport.previousDataListNetrokona[snapshot] != null){
          return _widgetBuilder(previousReport.previousDataListNetrokona[snapshot]);
        } else {
          return null;
        }},
    ) :
    Center(
      child: loadingAnimation(),
    );
  }
  Widget _widgetBuilder(ShortReportModel previousReportData) {
    final themeAndColor = Provider.of<ThemeAndColorProvider>(context);

    return Card(
      elevation: 20,
      color: themeAndColor.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(previousReportData.date,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: themeAndColor.thirdTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    )
                ),
              ),
              Expanded(
                flex: 7,
                child: Card(
                  color: themeAndColor.sevenDaysCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Total ${previousReportData.total}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: themeAndColor.highlighterTextColor,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8),
                        ),
                      ),
                      Divider(
                        thickness: 3,
                        height: 2,
                        color: themeAndColor.backgroundColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Overloaded\n${previousReportData.regular}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: themeAndColor.secondTextColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .8
                                  ),
                                )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
