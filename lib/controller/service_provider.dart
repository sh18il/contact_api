// import 'package:condact_service/model/conact_model.dart';
// import 'package:condact_service/services/api_service.dart';
// import 'package:flutter/material.dart';

// class ServiceProvider extends ChangeNotifier {
//   List<Contact> contacts = [];

//   Future<List<Contact>> fetchingData() async {
//     try {
//       final response = await ContactService().fetchingContact();
//       if (response.isEmpty) {
//         throw Exception('Failed to fetch data');
//       }
//       contacts = response;
//       return contacts; 
//     } catch (e) {
//       throw e; 
//     }
//   }
// }