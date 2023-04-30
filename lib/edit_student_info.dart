import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_family_centric_student_information_system/constants.dart';
import 'package:online_family_centric_student_information_system/dashboard.dart';

class EditStudentInfo extends StatefulWidget {
  final String studentId;
  final String fullName;
  final String motherName;
  final String address;
  final String phone;
  final String age;
  final String maths;
  final String english;
  final String biology;
  final String chemistry;
  final String physics;
  final String discipline;
  final String healthStatus;

  const EditStudentInfo(
      {Key? key,
      required this.studentId,
      required this.fullName,
      required this.motherName,
      required this.address,
      required this.phone,
      required this.age,
      required this.maths,
      required this.english,
      required this.biology,
      required this.chemistry,
      required this.physics,
      required this.discipline,
      required this.healthStatus})
      : super(key: key);

  @override
  State<EditStudentInfo> createState() => _EditStudentInfoState();
}

class _EditStudentInfoState extends State<EditStudentInfo> {
  // TextController Objects
  TextEditingController fullName_controller = new TextEditingController();
  TextEditingController motherName_controller = new TextEditingController();
  TextEditingController address_controller = new TextEditingController();
  TextEditingController phone_controller = new TextEditingController();
  TextEditingController age_controller = new TextEditingController();
  TextEditingController maths_controller = new TextEditingController();
  TextEditingController english_controller = new TextEditingController();
  TextEditingController biology_controller = new TextEditingController();
  TextEditingController chemistry_controller = new TextEditingController();
  TextEditingController physics_controller = new TextEditingController();
  TextEditingController discipline_controller = new TextEditingController();
  TextEditingController health_controller = new TextEditingController();

  String create_api_url =
      "http://onlinefamilycentricstudentmanagmentsystem.melkamtechnology.com/update.php";
  bool isValidated = true;

  Future _updateStudentInfo() async {
    var url = Uri.parse(create_api_url);
    return await http.post(url, headers: {}, body: {
      'id': widget.studentId,
      'full_name': fullName_controller.text.toString(),
      'mother_name': motherName_controller.text.toString(),
      'address': address_controller.text.toString(),
      'phone': phone_controller.text.toString(),
      'age': age_controller.text.toString(),
      'maths': maths_controller.text.toString(),
      'english': english_controller.text.toString(),
      'biology': biology_controller.text.toString(),
      'chemistry': chemistry_controller.text.toString(),
      'physics': physics_controller.text.toString().toString(),
      'discipline': discipline_controller.text,
      'health': health_controller.text.toString()
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
  void initState() {
    super.initState();
    fullName_controller.text = widget.fullName;
    motherName_controller.text = widget.motherName;
    address_controller.text = widget.address;
    phone_controller.text = widget.phone;
    age_controller.text = widget.age;
    maths_controller.text = widget.maths;
    english_controller.text = widget.english;
    biology_controller.text = widget.biology;
    chemistry_controller.text = widget.chemistry;
    physics_controller.text = widget.physics;
    discipline_controller.text = widget.discipline;
    health_controller.text = widget.healthStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Student Info"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Table(
                  children: [
                    // Student ID
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Student ID"),
                        tableText(widget.studentId),
                      ],
                    ),

                    // Full Name Row
                    TableRow(
                      children: [
                        tableText("Full Name"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: fullName_controller,
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
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: motherName_controller,
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
                            controller: address_controller,
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
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: phone_controller,
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
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: age_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration:
                                InputDecoration(hintText: "Student's Age"),
                          ),
                        )
                      ],
                    ),

                    // Mathematics
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Mathematics"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: maths_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Mathematics Result!"),
                          ),
                        )
                      ],
                    ),

                    // English
                    TableRow(
                      children: [
                        tableText("English"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: english_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's English Result!"),
                          ),
                        )
                      ],
                    ),

                    // Biology
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Biology"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: biology_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Biology Result!"),
                          ),
                        )
                      ],
                    ),

                    // Chemistry
                    TableRow(
                      children: [
                        tableText("Chemistry"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: chemistry_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Chemistry Result!"),
                          ),
                        )
                      ],
                    ),

                    // Physics
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Physics"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: physics_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Physics Result!"),
                          ),
                        )
                      ],
                    ),

                    // Discipline
                    TableRow(
                      children: [
                        tableText("Discipline"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: discipline_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Discipline Status!"),
                          ),
                        )
                      ],
                    ),

                    // Health Status
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Health Status"),
                        Container(
                          height: 30,
                          margin: const EdgeInsets.all(8),
                          child: TextField(
                            controller: health_controller,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Student's Health Status!"),
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
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          )
                        ],
                      ),
                    ),

              // Divider
              Divider(height: 30, color: Colors.grey),

              TextButton.icon(
                onPressed: () async {
                  if (fullName_controller.text.isNotEmpty &&
                      motherName_controller.text.isNotEmpty &&
                      address_controller.text.isNotEmpty &&
                      phone_controller.text.isNotEmpty &&
                      age_controller.text.isNotEmpty &&
                      maths_controller.text.isNotEmpty &&
                      english_controller.text.isNotEmpty &&
                      biology_controller.text.isNotEmpty &&
                      chemistry_controller.text.isNotEmpty &&
                      physics_controller.text.isNotEmpty &&
                      discipline_controller.text.isNotEmpty &&
                      health_controller.text.isNotEmpty) {
                    var result = await _updateStudentInfo().then((value) {
                      final scaffold = ScaffoldMessenger.of(context);

                      return scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('Data Submitted Successfully'),
                        ),
                      );
                    });

                    setState(() {
                      isValidated = true;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ),
                          (route) => false);
                    });
                  } else {
                    setState(() {
                      isValidated = false;
                    });
                  }
                },
                label: Text(
                  "Update!",
                  style: TextStyle(fontSize: 20),
                ),
                icon: Icon(Icons.update),
              ),

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
