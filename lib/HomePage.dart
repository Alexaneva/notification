
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'local_notification_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final NotificationService service;

  @override
  void initState() {
    super.initState();
    service = NotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 550,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        service.showDailyNotification;
                      },
                      label: const Text('Push'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}