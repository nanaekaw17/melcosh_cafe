import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APIUser.dart';
import 'package:melcosh_cafe/Model/data_sharedpreferences.dart';
import 'package:melcosh_cafe/Model/format_changer.dart';
import 'package:melcosh_cafe/splashscreen.dart';

class ProfileSubPage extends StatefulWidget {
  const ProfileSubPage({Key key}) : super(key: key);

  @override
  _ProfileSubPageState createState() => _ProfileSubPageState();
}

class _ProfileSubPageState extends State<ProfileSubPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _oldpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmation = TextEditingController();
  String email = "";

  @override
  void initState() {
    super.initState();
    DataSharedPreferences().readString('email').then((value) {
      setState(() {
        _email.text = value;
        email = value;
      });
      APIUser.getUser(context, _email.text).then((value) {
        if (value[0].status == "success") {
          setState(() {
            _name.text = value[0].name;
            _dob.text = value[0].dob;
            _phone.text = value[0].phone;
            _email.text = value[0].email;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "PROFILE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: "Name",
                    prefixStyle: const TextStyle(
                        color: Color(0xFF000080), fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _dob,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now())
                        .then((value) {
                      if (value != null) {
                        _dob.text = FormatChanger().tanggalIndo(value);
                      }
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.calendar_today),
                    labelText: "Date of Birth",
                    prefixStyle: const TextStyle(
                        color: Color(0xFF000080), fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Phone Number",
                    prefixStyle: const TextStyle(
                        color: Color(0xFF000080), fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _email,
                  readOnly: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: "Email",
                    prefixStyle: const TextStyle(
                        color: Color(0xFF000080), fontWeight: FontWeight.w600),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_name.text == "" ||
                          _dob.text == "" ||
                          _phone.text == "" ||
                          _email.text == "") {
                        Get.snackbar("Maaf", "Harap Lengkapi Data Anda",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      } else {
                        APIUser.updateUser(context, _email.text, _name.text,
                                _dob.text, _phone.text)
                            .then((value) {
                          Get.snackbar("Informasi", value[0].apimessage,
                              backgroundColor: Colors.yellow);
                        });
                      }
                    },
                    child: const Text(
                      "EDIT PROFILE",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Center(child: Text("Ganti Password?")),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _oldpassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  labelText: "Password Lama",
                                  prefixStyle: const TextStyle(
                                      color: Color(0xFF000080),
                                      fontWeight: FontWeight.w600),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue[900]),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _newpassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  labelText: "Password Baru",
                                  prefixStyle: const TextStyle(
                                      color: Color(0xFF000080),
                                      fontWeight: FontWeight.w600),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue[900]),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _confirmation,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  labelText: "Konfirmasi",
                                  prefixStyle: const TextStyle(
                                      color: Color(0xFF000080),
                                      fontWeight: FontWeight.w600),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.blue[900]),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("BATAL")),
                            ElevatedButton(
                              onPressed: () {
                                if (_oldpassword.text == "") {
                                  Get.snackbar("Maaf", "Lengkapi Data Anda",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                } else if (_newpassword.text.length < 3) {
                                  Get.snackbar(
                                      "Maaf", "Minimal Password 3 Karakter",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                } else if (_newpassword.text !=
                                    _confirmation.text) {
                                  Get.snackbar("Maaf",
                                      "Password dan Konfirmasi Tidak Sama",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                } else {
                                  APIUser.updatePassword(context, email,
                                          _oldpassword.text, _newpassword.text)
                                      .then((value) {
                                    Get.back();
                                    Get.snackbar(
                                        "Informasi", value[0].apimessage,
                                        backgroundColor: Colors.yellow);
                                    setState(() {
                                      _oldpassword.text = "";
                                      _newpassword.text = "";
                                      _confirmation.text = "";
                                    });
                                  });
                                }
                              },
                              child: const Text("YA"),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "GANTI PASSWORD",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(), primary: Colors.yellow),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Center(child: Text("LOGOUT?")),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("BATAL")),
                                  ElevatedButton(
                                    onPressed: () {
                                      DataSharedPreferences().clearData();
                                      Get.offAll(() => const SplashScreen());
                                    },
                                    child: const Text("YA"),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red),
                                  ),
                                ],
                              ));
                    },
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(), primary: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
