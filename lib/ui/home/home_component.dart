import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/config/custom_color.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/ui/home/home_viewmodel.dart';
import 'package:todolist/ui/widget/countdown_timer/countdown_timer.dart';

class TodoWidget extends ViewModelWidget<HomeViewmodel> {
  final TodoModel todoModel;
  final int index;

  TodoWidget(this.todoModel, this.index);

  @override
  Widget build(BuildContext context, HomeViewmodel model) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: GestureDetector(
        onTap: () => model.onTapNavigateDetails(index),
        child: Slidable(
          actionPane: SlidableBehindActionPane(),
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () async {
                await model.onTapDeleteTodo(index);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Deleted')));
              },
            ),
          ],
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(blurRadius: 8, spreadRadius: 2, color: Colors.black12)
              ],
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///
                      /// [TITLE]
                      ///
                      Text(
                        todoModel.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),

                      ///
                      ///
                      ///
                      SizedBox(height: 15),

                      ///
                      /// [DURATION]
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ///
                          /// [START DATE]
                          ///
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Start Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                model.parseDate(todoModel.startDate),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                              ),
                            ],
                          ),

                          ///
                          /// [END DATE]
                          ///
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'End Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                model.parseDate(todoModel.endDate),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                              ),
                            ],
                          ),

                          ///
                          /// [TIME LEFT]
                          ///
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Time left',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              CountdownTimer(
                                isCompleted: todoModel.isComplete,
                                startDateTime:
                                    model.parseDateTime(todoModel.startDate),
                                endDateTime:
                                    model.parseDateTime(todoModel.endDate),
                                endTime: model.parseTimeLeft(todoModel.endDate),
                                hoursSymbol: " hrs ",
                                minSymbol: " min ",
                                hoursTextStyle: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                                hoursSymbolTextStyle: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                                minTextStyle: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                                minSymbolTextStyle: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 12),
                                daysSymbolTextStyle: TextStyle(fontSize: 0),
                                daysTextStyle: TextStyle(fontSize: 0),
                                secTextStyle: TextStyle(fontSize: 0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ///
                /// [YELLOW CONTAINER]
                ///
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: lightBrown,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ///
                        /// [STATUS]
                        ///
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Status  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            children: <TextSpan>[
                              TextSpan(
                                text: model.parseStatus(todoModel.isComplete),
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),

                        ///
                        /// [TICK BOX]
                        ///
                        Row(
                          children: <Widget>[
                            ///
                            /// [TEXT]
                            ///
                            Text(
                              'Tick if completed',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  color: Colors.grey[800]),
                            ),

                            ///
                            ///
                            ///
                            SizedBox(width: 10),

                            ///
                            /// [CHECKBOX]
                            ///
                            Container(
                              width: 15,
                              height: 15,
                              color: Colors.white,
                              child: Checkbox(
                                value: todoModel.isComplete,
                                onChanged: (value) async =>
                                    await model.onTapCheckbox(value, index),
                                activeColor: Colors.yellow[800],
                                checkColor: Colors.black,
                                tristate: false,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
