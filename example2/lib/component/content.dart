// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
library Content;

import 'package:angular/angular.dart';

@Component(
    selector: 'content',
    templateUrl: 'packages/example2/component/content.html',
    useShadowDom: false
)
class Content {
  String swipeHere = 'Swipe on content';
  String swipeDirection;

  void contentSwipeLeft() {
    print('swiped left on content');
    swipeDirection = 'swiped left';
  }

  void contentSwipeRight() {
    print('swiped right on content');
    swipeDirection = 'swiped right';
  }
}