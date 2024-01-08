import 'package:school_meal_application/model/school_info.dart';
import 'package:school_meal_application/service/neis_client.dart';

class NeisRepository {
  final NeisClient _client = NeisClient();

  Future<String> getMeal(int index) async {
    Map<String, dynamic> result = await _client.getMeal();
    String dishName =
        result['mealServiceDietInfo'][1]['row'][index]['DDISH_NM'];

    return dishName.replaceAll('<br/>', '\n');
  }

  Future<List<SchoolInfo>> getSchools() async {
    Map<String, dynamic> result = await _client.getSchool();
    List data = result['schoolInfo'][1]['row'];

    return data.map((e) => SchoolInfo.fromJson(e)).toList();
  }
}
