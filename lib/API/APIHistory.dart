// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

class APIHistory {
  String id, name, itemname, itemprice, point, createddate, status, apimessage;

  APIHistory(
      {this.id,
      this.name,
      this.itemname,
      this.itemprice,
      this.point,
      this.createddate,
      this.status,
      this.apimessage});

  factory APIHistory.hasilData(Map<String, dynamic> object) {
    return APIHistory(
        id: object['id'],
        name: object['name'],
        itemname: object['itemname'],
        itemprice: object['itemprice'],
        point: object['point'],
        createddate: object['createddate'],
        status: object['status'],
        apimessage: object['apimessage']);
  }

  static Future<List<APIHistory>> getHistory(
      BuildContext context, String email) async {
    String apiURL = "http://10.0.2.2/api_melcosh/History/getHistory/$email";
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

        List<APIHistory> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIHistory.hasilData(listData[i]));
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

  static Future<List<APIHistory>> getHistoryDetail(
      BuildContext context, String id) async {
    String apiURL = "http://10.0.2.2/api_melcosh/History/getHistoryDetail/$id";
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

        List<APIHistory> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIHistory.hasilData(listData[i]));
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
