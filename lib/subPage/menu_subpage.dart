import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APICafe.dart';
import 'package:melcosh_cafe/detailPage/menudetail.dart';

class MenuSubPage extends StatefulWidget {
  const MenuSubPage({Key key}) : super(key: key);

  @override
  _MenuSubPageState createState() => _MenuSubPageState();
}

class _MenuSubPageState extends State<MenuSubPage> {
  final List<Widget> _wContainer = [];

  @override
  void initState() {
    super.initState();
    APICafe.getAll(context).then((value) {
      if (value[0].status == "success") {
        for (int i = 0; i < value.length; i++) {
          _wContainer.add(
            InkWell(
              onTap: () {
                Get.to(() => const MenuDetail(), arguments: value[i].id);
              },
              child: Card(
                shadowColor: Colors.grey,
                elevation: 5,
                color: Colors.blue,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/logo_menu.png',
                          scale: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Text(
                          value[i].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        setState(() {});
      } else {
        Get.snackbar("Maaf", "Gagal Mendapat Data Dari Server",
            backgroundColor: Colors.yellow);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            "MENU STORE",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: _wContainer,
          )
        ],
      ),
    );
  }
}
