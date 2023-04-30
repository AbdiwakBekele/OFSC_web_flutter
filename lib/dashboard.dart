import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_family_centric_student_information_system/student_managment.dart';
import 'package:online_family_centric_student_information_system/student_registration.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DashBoard"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Student Registration Card
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentRegistration(),
                          ));
                    },
                    child: Card(
                      elevation: 5,
                      child: Center(
                          child: Text(
                        "Student Registration".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      )),
                    ),
                  )),
              // Student Managment Card
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentManagment(),
                          ));
                    },
                    child: Card(
                      child: Center(
                          child: Text("Student Managment".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 20))),
                      elevation: 5,
                    ),
                  )),
            ],
          ),
        ));
  }
}
