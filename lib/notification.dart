import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5816DB),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Send Push Notification',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Push Notifications are used to notify users of any programe thatPush Notifications are used to notify users of any programe that is about to start is about to startPush NotifPush Notifications are used to notify users of any programe that is about to startications are used to notify users of any programe that is about to start',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 25,
                    decoration: InputDecoration(
                      hintText: 'Notification Title',
                      labelText: 'Title',
                      fillColor: Colors.grey[400],
                      filled: true,
                      labelStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 150,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Notification Body',
                      labelText: 'Message',
                      fillColor: Colors.grey[400],
                      filled: true,
                      labelStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Text('Push'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
