part of 'meal_bloc.dart';

abstract class MealBlocEvent {
  MealBlocEvent();
}

class InitEvent extends MealBlocEvent {
  InitEvent();
}

class LoadMealsEvent extends MealBlocEvent {
  LoadMealsEvent();
}

class CreateMealEvent extends MealBlocEvent {
  Meal meal;
  CreateMealEvent({
    required this.meal,
  });
}

class UpdateMealEvent extends MealBlocEvent {
  Meal meal;
  UpdateMealEvent({
    required this.meal,
  });
}

class DeleteMealEvent extends MealBlocEvent {
  Id id;
  DeleteMealEvent({
    required this.id,
  });
}
