import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/ui/todo_form/todo_form_viewmodel.dart';

import '../setup/test_helpers.dart';

void main() {
  group('TodoFormViewmodelTest -', () {
    setUp(() => registerServices());
    setUp(() async => await setupHiveDb());

    tearDown(() => unregisterServices());
    tearDown(() async => await closeBox());

    group('futureToRun -', () {
      test(
          'When initialise futureToRun with index, TodoModel should be non-null',
          () async {
        int index;
        var model = TodoFormViewmodel(index);

        model.setTodoText('First Task');
        model.setStartDate(DateTime.now());
        model.setEndDate(DateTime.now());

        await model.onTapCreateTodo();

        var anotherModel = TodoFormViewmodel(0);

        await anotherModel.futureToRun();

        expect(anotherModel.isTodoModel, true);
      });
      test(
          'When initialise futureToRun with null index, TodoModel should be null',
          () async {
        int index;
        var model = TodoFormViewmodel(index);

        await model.futureToRun();

        expect(model.isTodoModel, false);
      });
    });

    group('canSubmit -', () {
      test('When constructed canSubmit should be false', () {
        int index;
        var model = TodoFormViewmodel(index);

        expect(model.canSubmit, false);
      });

      test(
          'When constructed canSubmit filled getTodoValue, getStartDateValue and getEndDateValue should be true',
          () {
        int index;
        var model = TodoFormViewmodel(index);

        model.setTodoText('First Task');
        model.setStartDate(DateTime.now());
        model.setEndDate(DateTime.now());

        expect(model.canSubmit, true);
      });
    });

    group('onTapCreateTodo -', () {
      test(
          'When called onTapCreateTodo and successfully store all required value should go back to Routes.homeViewRoute',
          () async {
        var navigationService = getAndRegisterNavigationServiceMock();

        int index;
        var model = TodoFormViewmodel(index);

        model.setTodoText('First Task');
        model.setStartDate(DateTime.now());
        model.setEndDate(DateTime.now());

        await model.onTapCreateTodo();

        expect(model.canSubmit, true);
        verify(navigationService.back());
      });

      test(
          'When called onTapCreateTodo with existing todoModel data and successfully update all value should go back to Routes.homeViewRoute',
          () async {
        var navigationService = getAndRegisterNavigationServiceMock();

        int index;
        var model = TodoFormViewmodel(index);

        model.setTodoText('First Task');
        model.setStartDate(DateTime.now());
        model.setEndDate(DateTime.now());

        await model.onTapCreateTodo();

        expect(model.canSubmit, true);
        verify(navigationService.back());
      });

      test(
          'When called onTapCreateTodo, only _todoValue is null should show dialog',
          () async {
        var dialogService = getAndRegisterDialogServiceMock();

        int index;
        var model = TodoFormViewmodel(index);

        model.setStartDate(DateTime.now());
        model.setEndDate(DateTime.now());

        await model.onTapCreateTodo();

        expect(model.canSubmit, false);
        verifyNever(dialogService.showDialog());
      });

      test(
          'When called onTapCreateTodo, only _startDate is null should show dialog',
          () async {
        var dialogService = getAndRegisterDialogServiceMock();

        int index;
        var model = TodoFormViewmodel(index);

        model.setTodoText('First Task');
        model.setEndDate(DateTime.now());

        await model.onTapCreateTodo();

        expect(model.canSubmit, false);
        verifyNever(dialogService.showDialog());
      });

      test(
          'When called onTapCreateTodo, only _endDate is null should show dialog',
          () async {
        var dialogService = getAndRegisterDialogServiceMock();

        int index;
        var model = TodoFormViewmodel(index);

        model.setTodoText('First Task');
        model.setStartDate(DateTime.now());

        await model.onTapCreateTodo();

        expect(model.canSubmit, false);
        verifyNever(dialogService.showDialog());
      });
    });
  });
}
