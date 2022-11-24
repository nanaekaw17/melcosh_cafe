import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:melcosh_cafe/API/APIHistory.dart';
import 'package:melcosh_cafe/Model/format_changer.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({Key key}) : super(key: key);

  @override
  _DetailHistoryState createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
  String _tanggal = "", _tempat = "", _poin = "";
  int _pricetotal = 0;
  var formatter = NumberFormat('###,###');
  final List<Widget> _wPesanan = [];

  @override
  void initState() {
    super.initState();
    APIHistory.getHistoryDetail(context, Get.arguments).then((value) {
      _tanggal = FormatChanger().tanggalIndoFromString(value[0].createddate);
      _tempat = value[0].name;
      _poin = "+" + value[0].point;
      for (int i = 0; i < value.length; i++) {
        _wPesanan.add(Text(
          value[i].itemname,
        ));
        _pricetotal += int.parse(value[i].itemprice);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail History"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.blue,
                ),
                Text(
                  "Berhasil",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(_tanggal),
            const SizedBox(
              height: 50,
            ),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(4),
              },
              children: [
                TableRow(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    Text(_tempat),
                  ],
                ),
                TableRow(
                  children: [
                    const Icon(
                      Icons.notes,
                      color: Colors.blue,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _wPesanan,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Icon(
                      Icons.monetization_on,
                      color: Colors.blue,
                    ),
                    Row(
                      children: [
                        const Text("Total Price "),
                        Expanded(
                          child: Text(
                            "Rp. " +
                                formatter
                                    .format(_pricetotal)
                                    .toString()
                                    .replaceAll(",", "."),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Icon(
                      Icons.star_outlined,
                      color: Colors.blue,
                    ),
                    Row(
                      children: [
                        const Text("Melcosh Points "),
                        Expanded(
                          child: Text(
                            _poin,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
