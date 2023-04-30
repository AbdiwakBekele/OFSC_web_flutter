import 'package:flutter/material.dart';
import 'package:online_family_centric_student_information_system/constants.dart';
import 'package:http/http.dart' as http;

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  String create_api_url =
      "http://onlinefamilycentricstudentmanagmentsystem.melkamtechnology.com/insert.php/";
  String nameInput = "";
  String motherInput = "";
  String ageInput = "";
  String addressInput = "";
  String phoneInput = "";

  bool isValidated = true;

  Future _createStudent() async {
    var url = Uri.parse(create_api_url);
    return await http.post(url, headers: {}, body: {
      'full_name': nameInput,
      'mother_name': motherInput,
      'phone': phoneInput,
      'age': ageInput,
      'address': addressInput
    });
  }

  Widget tableText(String data) {
    if (data.isEmpty) {
      data = '-';
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register New Students"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 100,
            right: 100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Table(
                  children: [
                    // Full Name Row
                    TableRow(
                      children: [
                        tableText("Full Name"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            onChanged: (value) {
                              nameInput = value;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Full Name!"),
                          ),
                        )
                      ],
                    ),

                    // Mother Name Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Mother Name"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            onChanged: (value) {
                              motherInput = value;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Mother Name"),
                          ),
                        )
                      ],
                    ),

                    // Address Row
                    TableRow(
                      children: [
                        tableText("Address"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            onChanged: (value) {
                              addressInput = value;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Address Here"),
                          ),
                        )
                      ],
                    ),

                    //Phone Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Phone Number"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            onChanged: (value) {
                              phoneInput = value;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Phone Number"),
                          ),
                        )
                      ],
                    ),

                    //Age Row
                    TableRow(
                      children: [
                        tableText("Age"),
                        Container(
                          //width: MediaQuery.of(context).size.width * 0.5,
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            onChanged: (value) {
                              ageInput = value;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration:
                                InputDecoration(hintText: "Student's Age"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              (isValidated)
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red, size: 17),
                          SizedBox(width: 10),
                          Text(
                            "All the Input Fields are required!",
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          )
                        ],
                      ),
                    ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    if (nameInput.isNotEmpty &&
                        motherInput.isNotEmpty &&
                        ageInput.isNotEmpty &&
                        addressInput.isNotEmpty &&
                        phoneInput.isNotEmpty) {
                      var result = await _createStudent().then((value) {
                        final scaffold = ScaffoldMessenger.of(context);

                        return scaffold.showSnackBar(
                          SnackBar(
                            content: const Text('Data Submitted Successfully'),
                          ),
                        );
                      });

                      setState(() {
                        isValidated = true;
                        Navigator.pop(context);
                      });
                    } else {
                      setState(() {
                        isValidated = false;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 10),
                      Text("Submit!"),
                    ],
                  ),
                  style: kStyle(context, Theme.of(context).primaryColor))
            ],
          ),
        ),
      ),
    );
  }
}
