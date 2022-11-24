import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melcosh_cafe/API/APIUser.dart';
import 'package:melcosh_cafe/Model/data_sharedpreferences.dart';
import 'package:melcosh_cafe/detailPage/rewardpage.dart';

class HomeSubPage extends StatefulWidget {
  const HomeSubPage({Key key}) : super(key: key);

  @override
  _HomeSubPageState createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubPage> {
  String _nama = "-", _point = "-";
  final List<Widget> _slide = [
    Image.asset('assets/slide/slide1.jpeg', fit: BoxFit.fill),
    Image.asset('assets/slide/slide2.jpeg', fit: BoxFit.fill),
    Image.asset('assets/slide/slide3.jpeg', fit: BoxFit.fill)
  ];

  @override
  void initState() {
    super.initState();
    DataSharedPreferences().readString('email').then((value) {
      APIUser.getUser(context, value).then((value) {
        setState(() {
          _nama = value[0].name;
          _point = value[0].point;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Welcome Back"),
                Text(
                  _nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const RewardPage());
                      },
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Melcosh Rewards",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Total Points : $_point",
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          const Expanded(
                            child: Center(
                              child: Icon(
                                Icons.star_outline,
                                size: 75,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(height: 250.0),
                    items: _slide.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Card(
                                    shadowColor: Colors.grey,
                                    elevation: 5,
                                    color: Colors.white10,
                                    child: i,
                                  )));
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Info Terbaru",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.blue[200],
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Jam Operasional Selama PPKM",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Jam operasional berubah selama PPKM dari 08.00 - 20.00 wib",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.grey,
                    elevation: 5,
                    color: Colors.blue[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Pengumuman",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "berhubung ada kegiatan reservasi, Melcosh Cafe Kaliurang akan tutup pada tanggal 7 - 9 Februari 2022. Melcosh akan buka kembali pada tanggal 10 Februari 2022",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
