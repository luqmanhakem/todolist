// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:todolist/services/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final servicesModule = _$ServicesModule();
  g.registerLazySingleton<DialogService>(() => servicesModule.dialogServices);
  g.registerLazySingleton<NavigationService>(
      () => servicesModule.navigationServices);
}

class _$ServicesModule extends ServicesModule {
  @override
  DialogService get dialogServices => DialogService();
  @override
  NavigationService get navigationServices => NavigationService();
}
