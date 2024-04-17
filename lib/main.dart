import 'package:condact_service/controller/add_controller.dart';
import 'package:condact_service/controller/service_provider.dart';
import 'package:condact_service/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (context) => AddController(),)
      ],
      child: 
      MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}