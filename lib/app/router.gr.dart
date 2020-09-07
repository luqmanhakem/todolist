// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:todolist/ui/splash/splash_view.dart';
import 'package:todolist/ui/home/home_view.dart';
import 'package:todolist/ui/todo_form/todo_form_view.dart';

abstract class Routes {
  static const splashScreenRoute = '/';
  static const homeViewRoute = '/home-view-route';
  static const todoFormViewRoute = '/todo-form-view-route';
  static const all = {
    splashScreenRoute,
    homeViewRoute,
    todoFormViewRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.todoFormViewRoute:
        if (hasInvalidArgs<TodoFormViewArguments>(args)) {
          return misTypedArgsRoute<TodoFormViewArguments>(args);
        }
        final typedArgs =
            args as TodoFormViewArguments ?? TodoFormViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => TodoFormView(
              key: typedArgs.key,
              isCreate: typedArgs.isCreate,
              index: typedArgs.index),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//TodoFormView arguments holder class
class TodoFormViewArguments {
  final Key key;
  final bool isCreate;
  final int index;
  TodoFormViewArguments({this.key, this.isCreate, this.index});
}
