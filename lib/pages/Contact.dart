import 'dart:io';

import 'package:aronze/customicons/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    backgroundColor: Colors.black,
                    child: Icon(
                      CustomIcons.left,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    elevation: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/contact_image.png"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 140, 126, 1),
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () async {
                              String url() {
                                if (Platform.isAndroid) {
                                  // add the [https]
                                  return "https://wa.me/918111963618/?text=${Uri.parse("Hi, Aronze Support")}"; // new line
                                } else {
                                  // add the [https]
                                  return "https://api.whatsapp.com/send?phone=918111963618=${Uri.parse("Hi, Aronze Support")}"; // new line
                                }
                              }

                              await launch(url());
                            },
                            borderRadius: BorderRadius.circular(1000.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                CustomIcons.whatapp,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () async{
                              await launch("tel:918111963618");
                            },
                            borderRadius: BorderRadius.circular(1000.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                CustomIcons.call,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                        SizedBox(width: 20,),
                      Material(
                        type: MaterialType.transparency,
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () {

                              String? encodeQueryParameters(Map<String, String> params) {
                                return params.entries
                                    .map((e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                    .join('&');
                              }

                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'aronzecare@gmail.com',
                                query: encodeQueryParameters(<String, String>{
                                  'Aronze Support': 'Hi, Aronze Support'
                                }),
                              );

                              launch(emailLaunchUri.toString());
                            },
                            borderRadius: BorderRadius.circular(1000.0),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                CustomIcons.email,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],),
                    SizedBox(height: 100,),
                  ],
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/aronze_logo_tb.jpg"),
                    width: 50,
                  ),
                  Text(
                    "Aronze",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
