import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:melcosh_cafe/API/APICafe.dart';

class MenuSubDetail extends StatefulWidget {
  const MenuSubDetail({Key key}) : super(key: key);

  @override
  _MenuSubDetailState createState() => _MenuSubDetailState();
}

class _MenuSubDetailState extends State<MenuSubDetail> {
  final List<Widget> _wListItem = [];

  var formatter = NumberFormat('###,###');

  @override
  void initState() {
    super.initState();
    APICafe.getItem(context, Get.arguments[0], Get.arguments[1]).then((value) {
      for (int i = 0; i < value.length; i++) {
        _wListItem.add(
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1.3,
            child: Card(
              color: Colors.white70,
              elevation: 10,
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: double.maxFinite,
                    child: Image.network(
                      'http://10.0.2.2/api_melcosh/source/Gambar/' +
                          value[i].name.toLowerCase() +
                          '.jpg',
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              value[i].name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              "Rp. " +
                                  formatter
                                      .format(int.parse(value[i].price))
                                      .toString()
                                      .replaceAll(",", "."),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments[1]),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 3,
            crossAxisSpacing: 4,
            children: _wListItem,
          ),
        ),
      ),
    );
  }
}
