import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/ui/todo_form/todo_form_component.dart';
import 'package:todolist/ui/todo_form/todo_form_viewmodel.dart';

class TodoFormView extends StatelessWidget {
  final bool isCreate;
  final int index;

  const TodoFormView({Key key, this.isCreate, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoFormViewmodel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            brightness: Brightness.dark,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(
              'Add new To-Do List',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          body: Stack(
            children: <Widget>[
              ///
              /// [TO-DOFORM]
              ///
              FormWidget(),

              ///
              /// [CREATE NOW BUTTON]
              ///
              Align(
                alignment: Alignment.bottomCenter,
                child: CreateButtonWidget(isCreate),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => TodoFormViewmodel(index),
    );
  }
}
