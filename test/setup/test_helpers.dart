import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todolist/app/locator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/todo.dart';
import 'dart:async';
import 'dart:io';

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

class MockHiveInterface extends Mock implements HiveInterface {}

class MockHiveBox extends Mock implements Box {}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();

  var navigationService = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(navigationService);
  return navigationService;
}

DialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();

  var dialogService = DialogServiceMock();
  locator.registerSingleton<DialogService>(dialogService);
  return dialogService;
}

Future<void> setupHiveDb() async {
  WidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return ".";
  });

  // Quick fix
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoModelAdapter());
    bool isInit = Hive.isAdapterRegistered(0);
    print(isInit);
    await Hive.openBox<TodoModel>('todoBox');
  } catch (err) {
    await Hive.openBox<TodoModel>('todoBox');
  }
}

Future<void> closeBox() async {
  await Hive.close();
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterDialogServiceMock();
}

void unregisterServices() {
  locator.unregister<NavigationService>();
  locator.unregister<DialogService>();
}

void _removeRegistrationIfExists<T>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
