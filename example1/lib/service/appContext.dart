// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular/angular.dart';

@Injectable()
class appContext{
  void _swipeRight(){
    print('swiped to right');
  }
  
  void _swipeLeft(){
    print('swiped to left');
  }

  get swipeRight => _swipeRight;
  get swipeLeft => _swipeLeft;
}