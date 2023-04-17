import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:isar_watcher/collections/meal.dart';
import 'package:isar_watcher/collections/prediction.dart';
import 'package:isar_watcher/db/isar_manager.dart';

part 'meal_bloc_events.dart';
part 'meal_bloc_state.dart';

class MealBloc extends Bloc<MealBlocEvent, MealBlocState> {
  MealBloc(meals) : super(InitState(meals)) {
    on<InitEvent>(_init);
    on<LoadMealsEvent>(_loadMeals);
    on<UpdateMealEvent>(_updateMeal);
    on<CreateMealEvent>(_createMeal);
    on<DeleteMealEvent>(_deleteMeal);
  }

  void _init(InitEvent event, Emitter<MealBlocState> emit) async {
    emit(InitState(state.meals));
  }

  void _loadMeals(LoadMealsEvent event, Emitter<MealBlocState> emit) async {
    final List<Meal> meals = await IsarManager.instance.isar.meals.where().findAll();

    if (meals == null) {
      emit(LoadedMealsState([]));
    } else {
      emit(LoadedMealsState(meals));
    }
  }

  void _updateMeal(UpdateMealEvent event, Emitter<MealBlocState> emit) async {
    await IsarManager.instance.isar.writeTxn(() async {
      await IsarManager.instance.isar.meals.put(event.meal);
    });

    final meals = await IsarManager.instance.isar.meals.where().findAll();
    emit(UpdatedState(meals));
  }

  void _createMeal(CreateMealEvent event, Emitter<MealBlocState> emit) async {
    final prediction = Prediction(
      label: event.meal.label,
      created: event.meal.created,
      model: "Model",
    )..meal.value = event.meal;

    event.meal.prediction.value = prediction;

    await IsarManager.instance.isar.writeTxn(() async {
      await IsarManager.instance.isar.meals.put(event.meal);
      await IsarManager.instance.isar.predictions.put(prediction);
      await prediction.meal.save();
      await event.meal.prediction.save();
    });

    final meals = await IsarManager.instance.isar.meals.where().findAll();

    emit(CreatedState(meals));
  }

  void _deleteMeal(DeleteMealEvent event, Emitter<MealBlocState> emit) async {
    await IsarManager.instance.isar.writeTxn(() async {
      await IsarManager.instance.isar.meals.delete(event.id);
    });

    final meals = await IsarManager.instance.isar.meals.where().findAll();
    emit(CreatedState(meals));
  }
}
