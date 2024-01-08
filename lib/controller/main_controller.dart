import 'package:get/get.dart';
import 'package:school_meal_application/model/meal_type.dart';
import 'package:school_meal_application/repository/main_repository.dart';

class MainController {
  final NeisRepository _neisRepository = NeisRepository();

  final Rx<MealType> _mealTypeState = Rx(MealType.lunch);

  MealType get mealType => _mealTypeState.value;
  set _mealType(MealType value) => _mealTypeState(value);

  void previousMealType(){
    if (mealType.index>0){
      _mealType = MealType.values[mealType.index - 1];
    }
  }

  Future<String> getMeal() => _neisRepository.getMeal();
}