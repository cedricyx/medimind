import 'package:flutter/material.dart';
import 'package:medimind/main.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 670,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(100.0),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            offset: Offset(0.00, 10.0))
                      ]),
                  child: Column(
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: '1',
                        onPressed: () =>
                            NotificationController.createNewNotification(),
                        tooltip: 'Create New notification',
                        child: const Icon(Icons.snooze),
                      ),
                    ],
                  ))
            ]),
          ],
        ))));
  }
}
