import 'package:flutter/material.dart';
import 'package:villa_galetta_flutter/response/get_status_giardino.dart';
import 'package:villa_galetta_flutter/service/irrigation_status_service.dart';

class IrrigationHomeScreen extends StatefulWidget {
  @override
  _IrrigationHomeScreenState createState() => _IrrigationHomeScreenState();
}

class _IrrigationHomeScreenState extends State<IrrigationHomeScreen> {
  IrrigationStatusService _irrigationStatusService = IrrigationStatusService();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      controller: pageController,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.red,
          child: FutureBuilder(
            future: _irrigationStatusService.getStatus(),
            builder: (context, AsyncSnapshot<GetStatusGiardino> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error),
                );
              }
              if (snapshot.hasData) {
                return Column(children: <Widget>[
                  Text('esito: ${snapshot.data.esito}'),
                  Text('status: ${snapshot.data.statusGiardino}'),
                  Text('task: ${snapshot.data.taskGiardinoDetail}'),
                ]);
              }
              return CircularProgressIndicator();
            },
          ),
        ),
        Container(
          color: Colors.blueAccent,
          child: Container(),
        ),
      ],
    );
  }
}

class StartEndCard extends StatefulWidget {
  @override
  _StartEndCardState createState() => _StartEndCardState();
}

class _StartEndCardState extends State<StartEndCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}