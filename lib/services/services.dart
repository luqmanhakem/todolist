import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ServicesModule {
  @lazySingleton
  NavigationService get navigationServices;

  @lazySingleton
  DialogService get dialogServices;
}
