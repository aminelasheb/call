import 'package:call/Screens/ComposeNumber.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:call/globals.dart' as globals;
import 'package:provider/provider.dart';

import '../Providers/Infos.dart';

class ContactUI extends StatefulWidget {
  const ContactUI({Key? key}) : super(key: key);

  @override
  State<ContactUI> createState() => _ContactUIState();
}

bool _isLoading = false;

class _ContactUIState extends State<ContactUI> {
  Future<void> getContact() async {
    setState(() {
      _isLoading = true;
    });
    if (await Permission.contacts.request().isGranted) {
      Provider.of<Infos>(context, listen: false).contacts =
          await ContactsService.getContacts();
      print(Provider.of<Infos>(context, listen: false)
          .contacts
          .length
          .toString());
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  @override
  Widget build(BuildContext context) {
    final sizee = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: globals.primaryColor,
      body: _isLoading
          ? Center(
              child: Container(
                  width: sizee.width * 0.1,
                  height: sizee.width * 0.1,
                  child: CircularProgressIndicator(
                    color: globals.fourthColor,
                  )))
          : Container(
              margin: EdgeInsets.symmetric(
                  vertical: sizee.height * 0.04,
                  horizontal: sizee.width * 0.04),
              padding: EdgeInsets.symmetric(
                  vertical: sizee.height * 0.02,
                  horizontal: sizee.width * 0.02),
              color: globals.primaryColor,
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Contact',
                        style: TextStyle(
                            color: globals.textColor,
                            fontSize: sizee.width * 0.06),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: sizee.height * 0.01),
                      margin: EdgeInsets.only(top: sizee.height * 0.02),
                      height: sizee.height * 0.7,
                      child: ListView.builder(
                          itemCount: Provider.of<Infos>(context, listen: false)
                              .contacts
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return Provider.of<Infos>(context, listen: false)
                                        .onlong !=
                                    index
                                ? GestureDetector(
                                    onLongPress: () {
                                      setState(() {
                                        Provider.of<Infos>(context,
                                                listen: false)
                                            .onlong = index;
                                      });
                                    },
                                    child: Container(
                                      height: sizee.height / 11,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: sizee.height * 0.035,
                                            child: Provider.of<Infos>(context,
                                                        listen: false)
                                                    .contacts[index]
                                                    .avatar!
                                                    .isEmpty
                                                ? Text(Provider.of<Infos>(
                                                        context,
                                                        listen: false)
                                                    .contacts[index]
                                                    .displayName
                                                    .toString()[0])
                                                : Container(),
                                            backgroundColor:
                                                globals.secondlyColor,
                                            backgroundImage: MemoryImage(
                                                Provider.of<Infos>(context,
                                                        listen: false)
                                                    .contacts[index]
                                                    .avatar!),
                                          ),
                                          SizedBox(
                                            width: sizee.width * 0.05,
                                          ),
                                          Expanded(
                                            child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      fontSize:
                                                          sizee.width * 0.04,
                                                      color: globals.textColor),
                                                  text: Provider.of<Infos>(
                                                          context,
                                                          listen: false)
                                                      .contacts[index]
                                                      .displayName
                                                      .toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onLongPress: () {
                                      setState(() {
                                        Provider.of<Infos>(context,
                                                listen: false)
                                            .onlong = 900;
                                      });
                                    },
                                    child: Container(
                                      height: sizee.height / 11,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: sizee.width * 0.01,
                                                vertical: sizee.height * 0.005),
                                            margin: EdgeInsets.only(
                                                right: sizee.width * 0.02),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: Color(0xff58c6fa),
                                            ),
                                            width: sizee.height * 0.035 * 8,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CircleAvatar(
                                                  radius: sizee.height * 0.031,
                                                  child: Provider.of<Infos>(
                                                              context,
                                                              listen: false)
                                                          .contacts[index]
                                                          .avatar!
                                                          .isEmpty
                                                      ? Text(Provider.of<Infos>(
                                                              context,
                                                              listen: false)
                                                          .contacts[index]
                                                          .displayName
                                                          .toString()[0])
                                                      : Container(),
                                                  backgroundColor:
                                                      globals.secondlyColor,
                                                  backgroundImage: MemoryImage(
                                                      Provider.of<Infos>(
                                                              context,
                                                              listen: false)
                                                          .contacts[index]
                                                          .avatar!),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Not implemented yet",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  },
                                                  child: CircleAvatar(
                                                    radius:
                                                        sizee.height * 0.031,
                                                    backgroundColor:
                                                        Color(0xff90dbf8),
                                                    child: Icon(
                                                      Icons.duo,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await FlutterPhoneDirectCaller
                                                        .callNumber(Provider.of<
                                                                    Infos>(
                                                                context,
                                                                listen: false)
                                                            .contacts[index]!
                                                            .phones![0]
                                                            .toString());
                                                  },
                                                  child: CircleAvatar(
                                                    radius:
                                                        sizee.height * 0.031,
                                                    backgroundColor:
                                                        Color(0xff90dbf8),
                                                    child: Icon(
                                                      Icons.call,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Not implemented yet",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.red,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  },
                                                  child: CircleAvatar(
                                                    radius:
                                                        sizee.height * 0.031,
                                                    backgroundColor:
                                                        Color(0xff90dbf8),
                                                    child: Icon(
                                                      Icons.chat,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      fontSize:
                                                          sizee.width * 0.04,
                                                      color: globals.textColor),
                                                  text: Provider.of<Infos>(
                                                          context,
                                                          listen: false)
                                                      .contacts[index]
                                                      .displayName
                                                      .toString()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: sizee.width * 0.06),
                      margin: EdgeInsets.only(top: sizee.height * 0.01),
                      height: sizee.height * 0.11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ComposeNumber()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                              ),
                              child: Container(
                                child: Icon(
                                  Icons.dialpad,
                                  color: globals.thirdlyColor,
                                  size: sizee.height * 0.05,
                                ),
                                decoration: BoxDecoration(
                                  color: globals.primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                height: sizee.height * 0.09,
                                width: sizee.height * 0.09,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              Fluttertoast.showToast(
                                  msg: "Not implemented yet",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: globals.fourthColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                              ),
                              child: Container(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: sizee.height * 0.05,
                                ),
                                decoration: BoxDecoration(
                                  color: globals.thirdlyColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                height: sizee.height * 0.09,
                                width: sizee.height * 0.09,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Not implemented yet",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                              ),
                              child: Container(
                                child: Icon(
                                  Icons.sms,
                                  color: globals.thirdlyColor,
                                  size: sizee.height * 0.04,
                                ),
                                decoration: BoxDecoration(
                                  color: globals.primaryColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                height: sizee.height * 0.09,
                                width: sizee.height * 0.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
