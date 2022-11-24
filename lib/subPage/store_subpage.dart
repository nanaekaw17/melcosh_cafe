import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APICafe.dart';
import 'package:melcosh_cafe/detailPage/menudetail.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreSubPage extends StatefulWidget {
  const StoreSubPage({Key key}) : super(key: key);

  @override
  _StoreSubPageState createState() => _StoreSubPageState();
}

class _StoreSubPageState extends State<StoreSubPage> {
  final List<Widget> _list = [];

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    APICafe.getAll(context).then((value) {
      for (int i = 0; i < value.length; i++) {
        _list.add(Container(
          margin: const EdgeInsets.all(5),
          width: double.maxFinite,
          child: Card(
            elevation: 10,
            shadowColor: Colors.grey,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    value[i].name,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value[i].alamat,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jam Operasional : " + value[i].operational,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                              _launchInBrowser(
                                  'https://www.google.com/maps/search/?api=1&query=' +
                                      value[i].latitude +
                                      ',' +
                                      value[i].longitude);
                            },
                            child: const Text("Directions"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[900]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                              Get.to(() => const MenuDetail(),
                                  arguments: value[i].id);
                            },
                            child: const Text("Menu"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //  Image.asset('assets/location_map.jpg'),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "LOKASI CAFE",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: _list,
            )
          ],
        ),
      ),
    );
  }
}
