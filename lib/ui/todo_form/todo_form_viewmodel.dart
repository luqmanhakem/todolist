import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todolist/app/locator.dart';
import 'package:todolist/model/todo.dart';

class TodoFormViewmodel extends FutureViewModel {
  //============================ SERVICES ======================================
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  //============================= VARIABLES ====================================
  DateTime _selectedDate = DateTime.now();
  DateTime _startDate;
  DateTime _endDate;

  String _todoValue;
  String _startDateValue;
  String _endDateValue;

  TodoModel _todoModel;

  int _index;

  //============================== GETTER ======================================
  DateTime get getSelectedDate => _selectedDate;

  String get getTodoValue => _todoValue;
  String get getStartDateValue => _startDateValue;
  String get getEndDateValue => _endDateValue;

  TodoModel get todoModel => _todoModel;

  bool get canSubmit =>
      _todoValue != null && _startDate != null && _endDate != null;

  bool get isTodoModel => _todoModel != null;

  //============================ CONSTRUCTOR ===================================
  TodoFormViewmodel(int index) {
    _index = index;
  }

  //========================= INITIALIZATION ===================================
  @override
  Future futureToRun() async {
    setBusy(true);
    await _getTodoDetails();
    setBusy(false);
    notifyListeners();
  }

  //============================ METHOD ========================================
  Future<void> _getTodoDetails() async {
    if (_index != null) {
      Box<TodoModel> todoBox = Hive.box<TodoModel>('todoBox');
      _todoModel = todoBox.getAt(_index);
      _todoValue = _todoModel.title;
      _startDate = DateTime.parse(_todoModel.startDate);
      _endDate = DateTime.parse(_todoModel.endDate);
      _startDateValue = parseDate(_todoModel.startDate);
      _endDateValue = parseDate(_todoModel.endDate);
    }
  }

  String parseDate(String unformatdate) {
    DateTime parsedDate = DateTime.parse(unformatdate);
    return DateFormat('dd MMM yyyy').format(parsedDate);
  }

  void setTodoText(String text) {
    _todoValue = text;
    notifyListeners();
  }

  void setStartDate(DateTime date) async {
    // Check if end date < start date
    if (_endDate != null) if (_endDate.isBefore(date)) {
      await _dialogService.showDialog(
        title: 'Oops!',
        description: 'Start date cannot be earlier than end date.',
      );
      return;
    }
    _startDate = date;
    _startDateValue = DateFormat('dd MMM yyyy').format(date);
    notifyListeners();
  }

  void setEndDate(DateTime date) async {
    // Check if end date < start date
    if (_startDate != null) if (date.isBefore(_startDate)) {
      await _dialogService.showDialog(
        title: 'Oops!',
        description: 'End date cannot be earlier than start date.',
      );
      return;
    }
    _endDate = date;
    _endDateValue = DateFormat('dd MMM yyyy').format(date);
    notifyListeners();
  }

  Future<void> onTapCreateTodo() async {
    // Check if all field filled
    if (!canSubmit) {
      await _dialogService.showDialog(
        title: 'Oops!',
        description: 'Please fill all the required field.',
      );
      return;
    }

    // Unwrap db
    Box<TodoModel> todoBox = Hive.box<TodoModel>('todoBox');

    // Create
    if (_todoModel == null && _index == null) {
      await todoBox.add(TodoModel(
        title: _todoValue,
        startDate: _startDate.toIso8601String(),
        endDate: _endDate.toIso8601String(),
        isComplete: false,
      ));
    } else {
      TodoModel todo = todoBox.get(_index);
      todo.title = _todoValue;
      todo.startDate = _startDate.toIso8601String();
      todo.endDate = _endDate.toIso8601String();
      await todo.save();
    }

    _navigationService.back();
  }
}
