import 'package:school_meal_application/model/school_info.dart';
import 'package:school_meal_application/service/neis_client.dart';

class NeisRepository {
  final NeisClient _client = NeisClient();

  Future<String> getMeal(int index, SchoolInfo schoolInfo) async {
    Map<String, dynamic> result = await _client.getMeal(
      schoolInfo.officeOfEduCode, 
      schoolInfo.adminStandardCode
    );
    String dishName =
        result['mealServiceDietInfo'][1]['row'][index]['DDISH_NM'];

    return dishName.replaceAll('<br/>', '\n');
  }

  Future<List<SchoolInfo>> getSchools(int index, String name) async {
    Map<String, dynamic> result = await _client.getSchool(index, name);
    List data = result['schoolInfo'][1]['row'];

    return data.map((e) => SchoolInfo.fromJson(e)).toList();
  }
}
