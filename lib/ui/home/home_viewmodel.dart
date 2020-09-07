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

  // Parse toIso8601String date to dd MMM yyyy format 
  String parseDate(String unformatdate) {
    DateTime parsedDate = DateTime.parse(unformatdate);
    return DateFormat('dd MMM yyyy').format(parsedDate);
  }

  // Parse toIso8601String date to DateTime
  DateTime parseDateTime(String unformateDate) {
    return DateTime.parse(unformateDate);
  }

  // Parse bool to complete/incomplete
  String parseStatus(bool status) {
    return status ? 'Complete' : 'Incomplete';
  }

  // Parse end date to millisecond epoch
  int parseTimeLeft(String endDate) {
    DateTime _parsedEndDate = DateTime.parse(endDate);
    return _parsedEndDate.millisecondsSinceEpoch;
  }

  // Delete current todo 
  Future<void> onTapDeleteTodo(int index) async {
    await todoBox.deleteAt(index);
    notifyListeners();
  }

  // Change checkbox status
  Future<void> onTapCheckbox(bool status, int index) async {
    TodoModel todo = todoBox.get(index);
    todo.isComplete = status;
    await todo.save();
    notifyListeners();
  }

  // Navigate to existing todo form page
  void onTapNavigateDetails(int index) async {
    await _navigationService.navigateTo(
      Routes.todoFormViewRoute,
      arguments: TodoFormViewArguments(isCreate: false, index: index),
    );
    notifyListeners();
  }

  // Navigate todo form page
  void onTapNavigateAddTodo() async {
    await _navigationService.navigateTo(
      Routes.todoFormViewRoute,
      arguments: TodoFormViewArguments(isCreate: true),
    );
    notifyListeners();
  }
}
