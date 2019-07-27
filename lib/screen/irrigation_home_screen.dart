import 'package:flutter/material.dart';
import 'package:villa_galetta_flutter/service/irrigation_status_service.dart';

class IrrigationHomeScreen extends StatefulWidget {
  @override
  _IrrigationHomeScreenState createState() => _IrrigationHomeScreenState();
}

class _IrrigationHomeScreenState extends State<IrrigationHomeScreen> {
  IrrigationStatusService _irrigationStatusService = IrrigationStatusService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _irrigationStatusService.getStatus(),
        builder: (context, AsyncSnapshot<Get> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }
          if (snapshot.hasData) {
            return Container(child: Text(snapshot.data.status ? 'Acceso' : 'Spento'),);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
