import 'package:condact_service/controller/add_controller.dart';
import 'package:condact_service/controller/service_provider.dart';
import 'package:condact_service/model/conact_model.dart';
import 'package:condact_service/services/api_service.dart';
import 'package:condact_service/view/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddController>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddScreen(),
        ));
      }),
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        future: ContactService()
            .fetchingContact(), // Assuming fetchContacts() is a method in ServiceProvider
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Contact>? contacts = snapshot.data;
            return ListView.builder(
              itemCount: contacts?.length ?? 0,
              itemBuilder: (context, index) {
                Contact contact = contacts![index];
                return ListTile(
                  title: Text(contact.name ?? ''),
                  subtitle: Text(contact.email ?? ''),
                  // Add more contact details here if needed
                  trailing: IconButton(
                      onPressed: () {
                        provider.deletControl(contact.sId!);
                      },
                      icon: Icon(Icons.delete)),
                  leading: IconButton(
                      onPressed: () {
                        provider.isss == false;
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddScreen(),
                        ));
                      },
                      icon: Text('edit')),
                );
              },
            );
          }
        },
      ),
    );
  }
}
