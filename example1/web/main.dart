// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:angulardart_custom_swipe/angulardart_custom_swipe.dart';
import 'package:example1/service/appContext.dart';

class AppModule extends Module{
  AppModule(){
    bind(appContext);
    bind(customSwipe);
  }
}

void main(){
  applicationFactory().addModule(new AppModule()).rootContextType(appContext).run();
}