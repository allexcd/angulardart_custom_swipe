// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library Header;

import 'package:angular/angular.dart';

@Component(
    selector: 'header',
    templateUrl: 'packages/example2/component/header.html',
    useShadowDom: false
)
class Header {
  void headerSwipeLeft() {
    print('swiped left on header');
  }

  void headerSwipeRight() {
    print('swiped right on header');
  }

  String swipeHere = 'Swipe on header';
}