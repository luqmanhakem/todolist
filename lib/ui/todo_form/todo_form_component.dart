import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:todolist/ui/todo_form/todo_form_viewmodel.dart';

class FormWidget extends HookViewModelWidget<TodoFormViewmodel> {
  @override
  Widget buildViewModelWidget(BuildContext context, TodoFormViewmodel model) {
    var todoController = useTextEditingController(text: model.getTodoValue);
    var startDateController = useTextEditingController();
    var endDateController = useTextEditingController();

    startDateController.text = model.getStartDateValue;
    endDateController.text = model.getEndDateValue;

    return Padding(
      padding: EdgeInsets.only(top: 40, left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///
            /// [TO-DO TITLE]
            ///
            Text(
              'To-Do Title',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.grey),
            ),

            ///
            ///
            ///
            SizedBox(height: 15),

            ///
            /// [KEY-IN CONTAINER]
            ///
            Container(
              child: TextField(
                controller: todoController,
                onChanged: model.setTodoText,
                minLines: 7,
                maxLines: 15,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Please key in your To-Do title here',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            ///
            ///
            ///
            SizedBox(height: 25),

            ///
            /// [START DATE TITLE]
            ///
            Text(
              'Start Date',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.grey),
            ),

            ///
            ///
            ///
            SizedBox(height: 15),

            ///
            /// [DROPDOWN START DATE]
            ///
            Container(
              child: TextField(
                controller: startDateController,
                onTap: () async {
                  final DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: model.getSelectedDate,
                    firstDate: model.getSelectedDate,
                    lastDate: DateTime(2101),
                  );

                  model.setStartDate(picked);
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select a date',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),

            ///
            ///
            ///
            SizedBox(height: 25),

            ///
            /// [ESTIMATED END DATE TITLE]
            ///
            Text(
              'Estimated End Date',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.grey),
            ),

            ///
            ///
            ///
            SizedBox(height: 15),

            ///
            /// [DROPDOWN START DATE]
            ///
            Container(
              child: TextField(
                controller: endDateController,
                onTap: () async {
                  final DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: model.getSelectedDate,
                    firstDate: model.getSelectedDate,
                    lastDate: DateTime(2101),
                  );

                  model.setEndDate(picked);
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select a date',
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateButtonWidget extends ViewModelWidget<TodoFormViewmodel> {
  final bool isCreate;

  CreateButtonWidget(this.isCreate);

  @override
  Widget build(BuildContext context, TodoFormViewmodel model) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: () async => await model.onTapCreateTodo(),
        splashColor: Colors.yellow[800],
        child: Container(
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              isCreate ? 'Create Now' : 'Save',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
