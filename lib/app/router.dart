import 'package:auto_route/auto_route_annotations.dart';
import 'package:todolist/ui/home/home_view.dart';
import 'package:todolist/ui/splash/splash_view.dart';
import 'package:todolist/ui/todo_form/todo_form_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  SplashView splashScreenRoute;
  HomeView homeViewRoute;
  TodoFormView todoFormViewRoute;
}
