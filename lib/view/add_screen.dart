import 'package:condact_service/controller/add_controller.dart';
import 'package:condact_service/model/conact_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  final Contact? contact;
  AddScreen({super.key, this.contact});

  @override
  Widget build(BuildContext context) {
   
    final provider = Provider.of<AddController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
                keyboardType: TextInputType.text,
                controller: provider.nameCtrl,
                decoration: const InputDecoration(hintText: 'Enter the name')),
            Gap(20),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: provider.emailCtrl,
                decoration: const InputDecoration(hintText: 'Enter the email')),
            const Gap(20),
            TextFormField(
                keyboardType: TextInputType.phone,
                controller: provider.phoneCtrl,
                decoration: const InputDecoration(hintText: 'Enter the Phone')),
            const Gap(20),
            TextFormField(
                keyboardType: TextInputType.text,
                controller: provider.addresCtrl,
                decoration:
                    const InputDecoration(hintText: 'Enter the addres')),
            const Gap(20),
            ElevatedButton(
                onPressed: () {
                  submit(
                      context,
                      provider.nameCtrl.text,
                      provider.phoneCtrl.text,
                      provider.emailCtrl.text,
                      provider.addresCtrl.text);
                },
                child: provider.isss==true? Text('Submit'):Text('Edit Submit'))
          ],
        ),
      ),
    );
  }

  Future<void> submit(BuildContext context, String name, String phone,
      String email, String address) async {
    final pro = Provider.of<AddController>(context, listen: false);
    await pro.submitData(name, phone, address, email);
    pro.clearControllers();
    pro.fetchContact(context);
  }
}
    