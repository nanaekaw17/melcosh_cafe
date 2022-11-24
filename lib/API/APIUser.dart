// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

class APIUser {
  String email,
      name,
      dob,
      phone,
      password,
      createddate,
      point,
      status,
      apimessage;

  APIUser(
      {this.email,
      this.name,
      this.dob,
      this.phone,
      this.password,
      this.createddate,
      this.point,
      this.status,
      this.apimessage});

  factory APIUser.hasilData(Map<String, dynamic> object) {
    return APIUser(
        email: object['email'],
        name: object['name'],
        dob: object['dob'],
        phone: object['phone'],
        password: object['password'],
        createddate: object['createddate'],
        point: object['point'],
        status: object['status'],
        apimessage: object['apimessage']);
  }

  static Future<List<APIUser>> login(
      BuildContext context, String email, String password) async {
    String apiURL =
        "http://10.0.2.2/api_melcosh/User/login/" + email + "/" + password;
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

        List<APIUser> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIUser.hasilData(listData[i]));
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

  static Future<List<APIUser>> getUser(
      BuildContext context, String email) async {
    String apiURL = "http://10.0.2.2/api_melcosh/User/getUser/" + email;
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

        List<APIUser> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIUser.hasilData(listData[i]));
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

  static Future<List<APIUser>> resetPassword(
      BuildContext context, String email, String phone) async {
    String apiURL =
        "http://10.0.2.2/api_melcosh/User/resetPassword/" + email + "/" + phone;
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

        List<APIUser> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIUser.hasilData(listData[i]));
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

  static Future<List<APIUser>> insertUser(BuildContext context, String email,
      String name, String dob, String phone, String password) async {
    String apiURL = "http://10.0.2.2/api_melcosh/User/insertUser";

    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.post(apiURL, data: {
      "email": email,
      "name": name,
      "dob": dob,
      "phone": phone,
      "password": password
    });

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APIUser> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIUser.hasilData(listData[i]));
        }
        return data;
      } else {
        g.Get.snackbar("Maaf",
            "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
            backgroundColor: Colors.yellow);
        return null;
      }
    } catch (e) {
      g.Get.snackbar("Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
          backgroundColor: Colors.yellow);
      return null;
    }
  }

  static Future<List<APIUser>> updateUser(BuildContext context, String email,
      String name, String dob, String phone) async {
    String apiURL = "http://10.0.2.2/api_melcosh/User/updateUser";

    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.post(apiURL,
        data: {"email": email, "name": name, "dob": dob, "phone": phone});

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APIUser> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIUser.hasilData(listData[i]));
        }
        return data;
      } else {
        g.Get.snackbar("Maaf",
            "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
            backgroundColor: Colors.yellow);
        return null;
      }
    } catch (e) {
      g.Get.snackbar("Maaf",
          "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
          backgroundColor: Colors.yellow);
      return null;
    }
  }

  static Future<List<APIUser>> updatePassword(BuildContext context,
      String email, String oldpassword, String newpassword) async {
    String apiURL = "http://10.0.2.2/api_melcosh/User/updatePassword";

    BaseOptions options = BaseOptions(
      baseUrl: apiURL,
      connectTimeout: 60000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(options);

    Response response = await dio.post(apiURL, data: {
      "email": email,
      "oldpassword": oldpassword,
      "newpassword": newpassword
    });

    try {
      if (response.statusCode == 200) {
        dynamic listData = response.data;

        List<APIUser> data = [];
        for (int i = 0; i < listData.length; i++) {
          data.add(APIUser.hasilData(listData[i]));
        }
        return data;
      } else {
        g.Get.snackbar("Maaf",
            "Gagal Mendapat Respon Dari Server\nSilahkan Buka Ulang Aplikasi Anda",
            backgroundColor: Colors.yellow);
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
