# angulardart_custom_swipe

AngularDart Swipe Decorator

Installation
-------------------------------

Add "angulardart_custom_swipe" in pubspec.yaml file:

```dart
    dependencies:
        angulardart_custom_swipe: any
```

then use pub to get the dependencies

How to use
--------------------------------
Import the module in your main.dart file

```dart
  import 'package:angulardart_custom_swipe/angulardart_custom_swipe.dart';
```

Add custom swipe decorator to the list of modules

```dart
  class AppModule extends Module {
    AppModule() {
      bind(customSwipe);
    }
  }
```

Use the decorator where you need it:

```dart
<div custom-swipe
     custom-swipe-right="swipeRightCallback()"
     custom-swipe-left="swipeLeftCallback()">Swipe on this container</div>
```

See examples provided on GitHub (https://github.com/allexcd/angulardart_custom_swipe).
Load them in Dart Editor or WebStorm and open them in default or Dartium browsers.