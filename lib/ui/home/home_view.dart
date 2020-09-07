import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/ui/home/home_viewmodel.dart';

import 'home_component.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            brightness: Brightness.dark,
            title: Text(
              'To-Do List',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.redAccent,
            onPressed: model.onTapNavigateAddTodo,
          ),
          body: ValueListenableBuilder(
              valueListenable: Hive.box<TodoModel>('todoBox').listenable(),
              builder: (context, Box<TodoModel> box, _) {
                // Empty list
                if (box.values.isEmpty) return Container();

                // List
                return ListView.builder(
                  padding: EdgeInsets.only(bottom: 100),
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    return TodoWidget(box.getAt(index), index);
                  },
                );
              }),
        );
      },
      viewModelBuilder: () => HomeViewmodel(),
    );
  }
}
