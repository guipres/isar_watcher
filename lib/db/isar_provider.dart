import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:isar/isar.dart';
import 'package:isar_watcher/collections/audit.dart';
import 'package:isar_watcher/collections/meal.dart';
import 'package:isar_watcher/db/isar_manager.dart';

class IsarProvider extends StatefulWidget {
  final Widget child;
  final List<CollectionSchema> databaseSchema;

  IsarProvider({required this.child, required this.databaseSchema});

  @override
  _IsarProviderState createState() => _IsarProviderState();
}

class _IsarProviderState extends State<IsarProvider> {
  Future<Isar> loadDB() async {
    await IsarManager.instance.init(widget.databaseSchema);
    final _isar = IsarManager.instance.isar;

    List<Meal> oldMeals = await _isar.meals.where().findAll();

    Stream<List<Meal>> mealUpdated = _isar.meals
        .where()
        .watchLazy()
        .asyncMap((_) => _isar.meals.where().findAll());

    mealUpdated.listen((List<Meal> updatedMeals) async {
      if (oldMeals.length == updatedMeals.length) {
        updatedMeals.asMap().entries.map((entry) {
          if (entry.value.label != oldMeals[entry.key].label) {
            final audit = Audit(
              mealId: entry.value.id,
              userAcceptedLabel: entry.value.label,
              predictedLabel: entry.value.prediction.value!.label,
              predictionId: entry.value.prediction.value!.id,
            );

            _isar.writeTxn(() async {
              await _isar.audits.put(audit);
            });

            print(
                "label changed! ${entry.value.prediction.value!.label} -> ${entry.value.label}");
          }
        }).toList();
      }

      oldMeals = updatedMeals;
    });

    return _isar != null ? _isar : await Isar.open(widget.databaseSchema);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Isar>(
      future: loadDB(),
      builder: (BuildContext context, AsyncSnapshot<Isar> isarHolder) {
        if (isarHolder.hasData) {
          return IsarInheritedWrapper(
            isar: isarHolder.data!,
            child: widget.child,
          );
        } else {
          return Container(
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class IsarInheritedWrapper extends InheritedWidget {
  final Isar isar;

  IsarInheritedWrapper({required this.isar, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(IsarInheritedWrapper oldWidget) {
    return oldWidget.isar != isar;
  }

  static IsarInheritedWrapper of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<IsarInheritedWrapper>()!;
  }
}
