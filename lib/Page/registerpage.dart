import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APIUser.dart';
import 'package:melcosh_cafe/Model/format_changer.dart';
import 'package:melcosh_cafe/Page/loginpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Hi There,",
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Create an Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextField(
                      controller: _firstname,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "First Name",
                        prefixStyle: const TextStyle(
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
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
                      controller: _lastname,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Last Name",
                        prefixStyle: const TextStyle(
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
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
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        labelText: "Phone Number",
                        prefixStyle: const TextStyle(
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email",
                        prefixStyle: const TextStyle(
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
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
                      controller: _password,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        labelText: "Password",
                        prefixStyle: const TextStyle(
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
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
                      controller: _confirmation,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.vpn_key),
                        labelText: "Password Confirmation",
                        prefixStyle: const TextStyle(
                            color: Color(0xFF000080),
                            fontWeight: FontWeight.w600),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[900]),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_firstname.text == "" ||
                                  _lastname.text == "" ||
                                  _dob.text == "" ||
                                  _phone.text == "" ||
                                  _email.text == "") {
                                Get.snackbar("Maaf", "Harap Lengkapi Data Anda",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              } else if (_password.text.length < 3) {
                                Get.snackbar(
                                    "Maaf", "Minimal Password 3 Karakter",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              } else if (_password.text != _confirmation.text) {
                                Get.snackbar("Maaf",
                                    "Password dan Konfirmasi Tidak Sama",
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              } else {
                                APIUser.insertUser(
                                        context,
                                        _email.text,
                                        _firstname.text + " " + _lastname.text,
                                        FormatChanger()
                                            .tanggalAPIString(_dob.text),
                                        _phone.text,
                                        _password.text)
                                    .then(
                                  (value) {
                                    Get.snackbar(
                                        "Informasi", value[0].apimessage,
                                        backgroundColor: Colors.yellow);
                                    if (value[0].status == "success") {
                                      Get.offAll(() => const LoginPage());
                                    }
                                  },
                                );
                              }
                            },
                            child: const Text("REGISTER"),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
