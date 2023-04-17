part of 'meal_bloc.dart';

abstract class MealBlocState {
  final List<Meal> meals;

  MealBlocState(this.meals);
  MealBlocState.initial()
      : meals = [];
}

class InitState extends MealBlocState {
  InitState(meals) : super(meals);
}

class LoadedMealsState extends MealBlocState {
  LoadedMealsState(meals) : super(meals);
}

class UpdatedState extends MealBlocState {
  UpdatedState(meals)
      : super(meals);
}

class CreatedState extends MealBlocState {
  CreatedState(meals)
      : super(meals);
}

class DeletedState extends MealBlocState {
  DeletedState(meals)
      : super(meals);
}