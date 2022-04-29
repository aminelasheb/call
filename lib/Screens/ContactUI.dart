import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class ContactUI extends StatefulWidget {
  const ContactUI({Key? key}) : super(key: key);

  @override
  State<ContactUI> createState() => _ContactUIState();
}

class _ContactUIState extends State<ContactUI> {
  List<Contact> contacts = [] ;

  Future<void> getContact () async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> contacts = await ContactsService.getContacts();
      print(contacts.toString()) ;    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact() ;

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
