import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:isar_watcher/bloc/meal_bloc/meal_bloc.dart';
import 'package:isar_watcher/collections/audit.dart';
import 'package:isar_watcher/collections/meal.dart';
import 'package:isar_watcher/collections/prediction.dart';
import 'package:isar_watcher/db/isar_provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IsarProvider(
          child: MyHomePage(),
          databaseSchema: [MealSchema, PredictionSchema, AuditSchema]),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isar watcher'),
      ),
      body: BlocProvider(
        create: (_) => MealBloc(<Meal>[])
          ..add(
            LoadMealsEvent(),
          ),
        child: BlocBuilder<MealBloc, MealBlocState>(builder: (context, state) {
          return ListView(
            children: [
              Column(
                children: [
                  ...state.meals.map((meal) => MealCard(meal: meal)).toList(),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Define your static meal properties
                  Meal newMeal = Meal(
                    label: 'Hamburger',
                    created: DateTime.now(),
                    updated: DateTime.now(),
                  );

                  // Dispatch the CreateMealEvent with the new meal
                  context.read<MealBloc>().add(CreateMealEvent(meal: newMeal));
                },
                child: Text('Add Meal'),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({required this.meal, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(meal.label),
            subtitle: Text(DateFormat("EEEE, MMMM dd, yyyy 'at' hh:mm")
                .format(meal.created!)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Edit'),
                onPressed: () {
                  meal.label = "Pizza";
                  context.read<MealBloc>().add(UpdateMealEvent(meal: meal));
                },
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  context.read<MealBloc>().add(DeleteMealEvent(id: meal.id));
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
