import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APICafe.dart';
import 'package:melcosh_cafe/detailPage/menusubdetail.dart';

class MenuDetail extends StatefulWidget {
  const MenuDetail({Key key}) : super(key: key);

  @override
  _MenuDetailState createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  final List<Widget> _wListCategory = [];

  @override
  void initState() {
    super.initState();
    APICafe.getCategory(context, Get.arguments).then((value) {
      for (int i = 0; i < value.length; i++) {
        _wListCategory.add(Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const MenuSubDetail(),
                      arguments: [Get.arguments, value[i].category]);
                },
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.network(
                          'http://10.0.2.2/api_melcosh/source/Gambar/' +
                              value[i].category.toLowerCase() +
                              '.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      value[i].category,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ))));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: _wListCategory,
          ),
        ),
      ),
    );
  }
}
