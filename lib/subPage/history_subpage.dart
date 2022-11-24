import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APIHistory.dart';
import 'package:melcosh_cafe/Model/data_sharedpreferences.dart';
import 'package:melcosh_cafe/detailPage/detailhistory.dart';

class HistorySubPage extends StatefulWidget {
  const HistorySubPage({Key key}) : super(key: key);

  @override
  _HistorySubPageState createState() => _HistorySubPageState();
}

class _HistorySubPageState extends State<HistorySubPage> {
  final List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    DataSharedPreferences().readString('email').then((email) {
      APIHistory.getHistory(context, email).then((value) {
        for (int i = 0; i < value.length; i++) {
          _list.add(InkWell(
            onTap: () {
              Get.to(() => const DetailHistory(), arguments: value[i].id);
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  width: double.maxFinite,
                  color: Colors.blue,
                  child: Text(
                    value[i].createddate,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Text(
                        value[i].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          value[i].point,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));
        }
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          const Text(
            "HISTORY",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: _list,
          )
        ],
      ),
    );
  }
}
