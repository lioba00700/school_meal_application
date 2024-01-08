import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NeisClient {
  final GetConnect _connect = Get.put(GetConnect());
  

  Future<Map<String,dynamic>> getMeal() async {
    String date = DateFormat('yyyyMMdd').format(DateTime.now());

    Response response = await _connect.get(
      'https://open.neis.go.kr/hub/mealServiceDietInfo',
      query: {
        'KEY':'',
        'Type': 'json',
        'ATPT_OFCDC_SC_CODE': 'R10',
        'SD_SCHUL_CODE': '8750767',
        'MLSV_YMD': date,
      }
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getSchool() async{
    Response response = await _connect.get(
      'https://open.neis.go.kr/hub/schoolInfo',
      query: {
        'KEY':'',
        'Type': 'json',
        'pIndex': '1',
        'pSize':'1000',
      },
    );

    return jsonDecode(response.body);
  }
}