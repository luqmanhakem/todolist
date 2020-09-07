import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todolist/app/locator.dart';
import 'package:todolist/app/router.gr.dart';
import 'package:todolist/model/todo.dart';
import 'package:intl/intl.dart';

class HomeViewmodel extends BaseViewModel {
  //============================ SERVICES ======================================
  final NavigationService _navigationService = locator<NavigationService>();

  //============================= VARIABLES ====================================
  Box<TodoModel> todoBox = Hive.box<TodoModel>('todoBox');

  //============================ METHOD ========================================

  String parseDate(String unformatdate) {
    DateTime parsedDate = DateTime.parse(unformatdate);
    return DateFormat('dd MMM yyyy').format(parsedDate);
  }

  DateTime parseDateTime(String unformateDate) {
    return DateTime.parse(unformateDate);
  }

  String parseStatus(bool status) {
    return status ? 'Complete' : 'Incomplete';
  }

  int parseTimeLeft(String startDate, String endDate) {
    DateTime _parsedEndDate = DateTime.parse(endDate);
    return _parsedEndDate.millisecondsSinceEpoch;
  }

  Future<void> onTapDeleteTodo(int index) async {
    await todoBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> onTapCheckbox(bool status, int index) async {
    TodoModel todo = todoBox.get(index);
    todo.isComplete = status;
    await todo.save();
    notifyListeners();
  }

  void onTapNavigateDetails(int index) async {
    await _navigationService.navigateTo(
      Routes.todoFormViewRoute,
      arguments: TodoFormViewArguments(isCreate: false, index: index),
    );
    notifyListeners();
  }

  void onTapNavigateAddTodo() async {
    await _navigationService.navigateTo(
      Routes.todoFormViewRoute,
      arguments: TodoFormViewArguments(isCreate: true),
    );
    notifyListeners();
  }
}
