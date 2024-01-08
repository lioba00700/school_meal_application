import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NeisClient {
  final GetConnect _connect = Get.put(GetConnect());
  

  Future<Map<String,dynamic>> getMeal(String eduCode, String adCode) async {
    String date = DateFormat('yyyyMMdd').format(DateTime.now());

    Response response = await _connect.get(
      'https://open.neis.go.kr/hub/mealServiceDietInfo',
      query: {
        'KEY':'',//인증키
        'Type': 'json',
        'ATPT_OFCDC_SC_CODE': eduCode,
        'SD_SCHUL_CODE': adCode,
        'MLSV_YMD': date,
      }
    );

    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getSchool(int index, String name) async{
    Response response = await _connect.get(
      'https://open.neis.go.kr/hub/schoolInfo',
      query: {
        'KEY':'',//인증키
        'Type': 'json',
        'pIndex': '$index',
        'pSize':'1000',
        'SCHUL_NM': name
      },
    );

    return jsonDecode(response.body);
  }
}