import 'package:flutter/material.dart';
import 'package:online_family_centric_student_information_system/constants.dart';
import 'package:online_family_centric_student_information_system/dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
              "Online Family Centric Student Information System for Jimma Community School"
                  .toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.blue)),
          Image.asset(
            "assets/images/jucs.jpg",
            height: MediaQuery.of(context).size.height * 0.7,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Dashboard();
                },
              ));
            },
            child: Text("Get Started"),
            style: kStyle(context, Theme.of(context).primaryColor),
          ),
        ]),
      ),
    );
  }
}
