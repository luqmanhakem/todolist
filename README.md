# todolist app

An application to monitor your daily tasks. Complete with a due date settings, to reach your goals within desired timeline. Developed using Flutter.

**Web:** [https://todolist-web-e620d.firebaseapp.com](https://todolist-web-e620d.firebaseapp.com)

**Android (APK):** [https://1drv.ms/u/s!AvRsPdzus1wzh_pH6ghdxVTHTWWfuQ?e=4AAATV](https://1drv.ms/u/s!AvRsPdzus1wzh_pH6ghdxVTHTWWfuQ?e=4AAATV) 



## Basic Overview

This application allows you to key in your task, with it's starting and ending date. The apps will set a countdown timer, showing how much time left for you to complete a single task. You're able to add on as many tasks as you have!

### Basic Functionality

#### Android/iOS Screenshot

![mobile#1](https://i.imgur.com/TfHfHEs.jpg)
![mobile#2](https://i.imgur.com/5EA555F.jpg)
![mobile#3](https://i.imgur.com/oejpW7K.jpg)
![mobile#4](https://i.imgur.com/ZchwAix.jpg)

The above screenshots show the basic functionality of the apps. The first page is a splash screen(In future, we can integrate such as check app versioning). The second page is the main screen showing the list of added tasks with it's time left(countdown timer). The third page shows the swipe function, where swiping to the left will give you a delete option. The fourth page is a landing page when you either i) tap on the plus button or ii) tap on the list of task. This page allows you to add in a new to-do-list or Edit current to-do-list.


#### Web Screenshot

![Web #1](https://i.imgur.com/LLjK2am.jpg)
![Web #2](https://i.imgur.com/Dzyg7cY.jpg)
![Web #3](https://i.imgur.com/H8FOOSn.jpg)
![Web #4](https://i.imgur.com/ij0z86i.jpg)

We extend this project using Flutter Web to demonstrate the versatility of Flutter! The web application will deploy similar functionality along with the UI resizing.


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
