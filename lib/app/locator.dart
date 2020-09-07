import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todolist/model/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'locator.iconfig.dart';

final locator = GetIt.instance;
//final localStorageLocator = GetIt.instance;
final hiveLocator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);

// Future setupLocalStorage() async {
//   var instance = await LocalStorageService.getInstance();
//   localStorageLocator.registerSingleton<LocalStorageService>(instance);
// }

Future setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todoBox');
}
