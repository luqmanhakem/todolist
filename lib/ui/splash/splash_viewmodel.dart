import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todolist/app/locator.dart';
import 'package:todolist/app/router.gr.dart';

class SplashViewmodel extends FutureViewModel {
  //============================ SERVICES ======================================
  final NavigationService _navigationService = locator<NavigationService>();

  //============================ METHOD ========================================
  @override
  Future futureToRun() async {
    setBusy(true);
    await _getDataFromApi();
    setBusy(false);
  }

  // Call API from Server
  //
  // e.g. App versioning
  Future<void> _getDataFromApi() async {
    await Future.delayed(Duration(seconds: 2));

    await _navigationService.clearStackAndShow(Routes.homeViewRoute);
  }
}
