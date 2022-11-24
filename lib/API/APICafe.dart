// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

class APICafe {
  String id,
      name,
      alamat,
      operational,
      latitude,
      longitude,
      category,
      price,
      status,
      apimessage;

  APICafe(
      {this.id,
      this.name,
      this.alamat,
      this.operational,
      this.latitude,
      this.longitude,
      this.category,
      this.price,
      this.status,
      this.apimessage});

  factory APICafe.hasilData(Map<String, dynamic> object) {
    return APICafe(
        id: object['id'],
        name: object['name'],
        alamat: object['alamat'],
        operational: object['operational'],
        latitude: object['latitude'],
        longitude: object['longitude'],
        category: object['category'],
        price: object['price'],
        status: object['status'],
        apimessage: object['apimessage']);
  }

  static Future<List<APICafe>> getAll(BuildContext context) async {
    String apiURL = "http://10.0.2.2/api_melcosh/Cafe/getAll";
    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.get(apiURL);

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APICafe> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APICafe.hasilData(listData[i]));
        }
        return data;
      } else {
        g.Get.snackbar(
          "Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
        );
        return null;
      }
    } catch (e) {
      g.Get.snackbar("Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
          backgroundColor: Colors.yellow);
      return null;
    }
  }

  static Future<List<APICafe>> getCategory(
      BuildContext context, String id) async {
    String apiURL = "http://10.0.2.2/api_melcosh/Cafe/getCategory/" + id;
    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.get(apiURL);

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APICafe> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APICafe.hasilData(listData[i]));
        }
        return data;
      } else {
        g.Get.snackbar(
          "Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
        );
        return null;
      }
    } catch (e) {
      g.Get.snackbar("Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
          backgroundColor: Colors.yellow);
      return null;
    }
  }

  static Future<List<APICafe>> getItem(
      BuildContext context, String id, String category) async {
    String apiURL =
        "http://10.0.2.2/api_melcosh/Cafe/getItem/" + id + "/" + category;
    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.get(apiURL);

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APICafe> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APICafe.hasilData(listData[i]));
        }
        return data;
      } else {
        g.Get.snackbar(
          "Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
        );
        return null;
      }
    } catch (e) {
      g.Get.snackbar("Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
          backgroundColor: Colors.yellow);
      return null;
    }
  }
}
