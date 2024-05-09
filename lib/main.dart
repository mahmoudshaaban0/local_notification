import 'package:flutter/material.dart';
import 'package:local_notification/flutter_local_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notification',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Local Notification'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                LocalNotificationService.showBasicNotification();
              },
              child: const Text('Show Notification'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                LocalNotificationService.showRepeatedNotifiation();
              },
              child: const Text('Show Notification'),
            ),
          ),
        ],
      ),
    );
  }
}
