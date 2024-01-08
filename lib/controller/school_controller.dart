import 'package:school_meal_application/model/school_info.dart';
import 'package:school_meal_application/repository/main_repository.dart';

class SchoolController{
  final NeisRepository _neisRepository = NeisRepository();

  Future<List<SchoolInfo>> getSchools() => _neisRepository.getSchools();
}