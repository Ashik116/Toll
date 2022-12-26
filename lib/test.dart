import 'package:flutter/material.dart';
import 'package:toll_plaza/api.dart';

class Notificationmodel extends StatefulWidget {
  const Notificationmodel({Key key}) : super(key: key);

  @override
  State<Notificationmodel> createState() => _NotificationmodelState();
}

class _NotificationmodelState extends State<Notificationmodel> {
  bool isLoading = true;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  aka() {
    if (_counter == 8 || _counter == 16) {
      NotificationApi.showNotification(title: "KKJHU", body: "LKIOOUJ");
    }
  }

  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    //aka();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  NotificationApi.showNotification(
                      title: "Regnum Toll", body: "Check you current Blance");
                },
                child: Text("NOTIFICATIONs"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          setState(() {
            aka();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}