import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:melcosh_cafe/API/APIUser.dart';
import 'package:melcosh_cafe/Model/data_sharedpreferences.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key key}) : super(key: key);

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  String _nama = "-";
  String _terdaftar = "-";
  String _poin = "-";
  String _barcode = "-";

  final List<String> _pdk = [
        "Setiap Melakukan transaksi minimum senilai Rp. 10.000, maka Anda akan mendapatkan Melcosh Poin Setiap 1 Melcosh poin yang Anda kumpulkan bernilai Rp 1.",
        "Dapatkan 20.000 Melcosh Poin saat Anda berulang tahun",
        "Poin yang dikumpulkan dapat ditukar dengan seluruh menu di Melcosh Cafe"
      ],
      _sdk = [
        "Poin Berlaku 12 bulan (sampai september 2022)",
        "Poin didapatkan saat menggunakan Melcosh Card Member yang terdaftar"
      ];

  final List<Widget> _wPDK = [], _wSDK = [];

  @override
  void initState() {
    super.initState();
    DataSharedPreferences().readString("email").then((value) {
      APIUser.getUser(context, value).then((value) {
        _nama = value[0].name;
        _terdaftar = value[0].createddate;
        _barcode = value[0].email;
        _poin = value[0].point;
        setState(() {});
      });
    });
    for (int i = 0; i < _pdk.length; i++) {
      _wPDK.add(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "• " + _pdk[i],
            overflow: TextOverflow.clip,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ));
    }
    for (int i = 0; i < _sdk.length; i++) {
      _wSDK.add(Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "• " + _sdk[i],
            overflow: TextOverflow.clip,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Melcosh Rewards",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 10,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Melcosh Member",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _nama,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Terdaftar Sejak - $_terdaftar",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Total Poin : $_poin",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Poin berlaku sampai - $_terdaftar",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      child: BarcodeWidget(
                        data: _barcode,
                        barcode: Barcode.code128(),
                        drawText: false,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Poin dan Keuntungan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(children: _wPDK),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Syarat dan Ketentuan Berlaku",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(children: _wSDK)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
