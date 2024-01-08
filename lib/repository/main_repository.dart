import 'package:school_meal_application/service/neis_client.dart';

class NeisRepository {
  final NeisClient _client = NeisClient();

  Future<String> getMeal() async{
    Map<String, dynamic> result = await _client.getMeal();
    String dishName = result['mealServiceDietInfo'][1]['row'][1]['DDISH_NM'];

    return dishName.replaceAll('<br/>', '\n');
  } 
}