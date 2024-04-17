import 'package:condact_service/services/api_service.dart';
import 'package:flutter/material.dart';

class AddController extends ChangeNotifier {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController addresCtrl = TextEditingController();
   bool isss = true;

  Future<bool> submitData(
      String name, String phone, String address, String email) async {
    try {
      await ContactService().postData(name, email, address, phone);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> fetchContact(BuildContext context) async {
    try {
      final response = await ContactService().fetchingContact();
      if (response.isEmpty) {
        throw Exception('faild to fetch data');
      }

    } catch (e) {
      Center(
        child: Text('Error$e'),
      );
    }
    notifyListeners();
  }

  void clearControllers() {
    nameCtrl.clear();
    phoneCtrl.clear();
    addresCtrl.clear();
    emailCtrl.clear();
    notifyListeners();
  }

  Future<void> deletControl(String id) async {
    await ContactService().deleteById(id);
    notifyListeners();
  }

  Future<void> updateContrl(String id, String name, String phone, String email,
      String address) async {
    await ContactService().updateData(id, name, phone, email, address);
  }
}
