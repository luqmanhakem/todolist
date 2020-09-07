# todolist app

Application for monitoring task with a due date for you to be aware, made with Flutter.

**Web:** [https://todolist-web-e620d.web.app/index.html](https://todolist-web-e620d.web.app/index.html)

**Android (APK):** [https://1drv.ms/u/s!AvRsPdzus1wzh_pFzqsR1xyHr1F5RQ?e=u2VAxH
](https://1drv.ms/u/s!AvRsPdzus1wzh_pFzqsR1xyHr1F5RQ?e=u2VAxH
) 



## Basic Overview

The basic idea is that you are able to fill of what task need you want to be done with the timeline, and the app will let you keep track of how much time left for you to accomplish the task.

### Basic Functionality

#### Android/iOS Screenshot

![mobile#1](https://i.imgur.com/TfHfHEs.jpg)
![mobile#2](https://i.imgur.com/5EA555F.jpg)
![mobile#3](https://i.imgur.com/oejpW7K.jpg)
![mobile#4](https://i.imgur.com/ZchwAix.jpg)

The three screenshots above show the basic functionality of the app. You will start with a splash screen where in future you can call an API (e.g. check apps versioning). After that, you can view all your to do list and see how much time left to accomplish those task. You can swipe to the left at the task for deleting purpose or you can tap on it to view and update the task. As you tap on add icon, it will navigate you to an empty to do form.


#### Web Screenshot

![Web #1](https://i.imgur.com/LLjK2am.jpg)
![Web #2](https://i.imgur.com/Dzyg7cY.jpg)
![Web #3](https://i.imgur.com/H8FOOSn.jpg)
![Web #4](https://i.imgur.com/ij0z86i.jpg)

We extend this project using Flutter Web to demonstrate how Flutter can do! The web apps will acquired similar functionality along with the responsive user interface when resizing.


## Flutter Version Used

- Channel beta, 1.18.0-11.1.pre.
- Due to Flutter channel beta 1.20 breaking changes, auto_route packages are not compatible yet.

## Architecture

- This project was inspired by using Stacked Architecture.
- Stacked able to separate user interface (UI) and logic code.
- [https://pub.dev/packages/stacked](https://pub.dev/packages/stacked)


## Folder Structure 


```folder structure
|   generated_plugin_registrant.dart
|   main.dart
|   output.doc
|   
+---app
|       locator.dart
|       locator.iconfig.dart
|       router.dart
|       router.gr.dart
|       
+---config
|       custom_color.dart
|       
+---model
|       todo.dart
|       todo.g.dart
|       
+---services
|       services.dart
|       
\---ui
    +---home
    |       home_component.dart
    |       home_view.dart
    |       home_viewmodel.dart
    |       
    +---splash
    |       splash_view.dart
    |       splash_viewmodel.dart
    |       
    +---todo_form
    |       todo_form_component.dart
    |       todo_form_view.dart
    |       todo_form_viewmodel.dart
    |       
    \---widget
        \---countdown_timer
                countdown_timer.dart
                
```

## Unit Test

![unittest](https://i.imgur.com/7H44Yq1.png)

- You can try out the logic test by running:

```
flutter test
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.