import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
//import 'package:telephony/telephony.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome Notification"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 1,
                  channelKey: "Basic_channel",
                  title: "Hello World",
                  body: "I have Local Notification"));
        },
        child: const Icon(Icons.notifications_active_outlined),
      ),
    );
  }
}

class SmsAutoread extends StatefulWidget {
  const SmsAutoread({super.key});

  @override
  State<SmsAutoread> createState() => _SmsAutoreadState();
}

class _SmsAutoreadState extends State<SmsAutoread> {
  // final Telephony telephony = Telephony.instance;
  // String textRecived = "";

  // void startListening() {
  //   telephony.listenIncomingSms(
  //     onNewMessage: (SmsMessage message) {
  //       setState(() {
  //         textRecived = message.body!;
  //       });
  //     },
  //     listenInBackground: false,

  //     //onBackgroundMessage: backgroundMessageHandler
  //   );
  // }

  @override
  void initState() {
    //startListening();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("Message Received :")],
      ),
    );
  }
}
