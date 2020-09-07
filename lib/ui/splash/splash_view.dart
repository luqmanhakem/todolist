import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todolist/ui/splash/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      viewModelBuilder: () => SplashViewmodel(),
    );
  }
}
