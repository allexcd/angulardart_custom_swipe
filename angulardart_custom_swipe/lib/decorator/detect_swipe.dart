// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of angulardart.custom.swipe;

class detectSwipe{
  Map _startCoord, _endCoord;
  Function swipeRight, swipeLeft;

  detectSwipe(dom.Element target) {
    target.onTouchStart.listen(_touchStart);
    target.onTouchEnd.listen(_touchEnd);
  }

  Map _getTouchCoordinates(dom.TouchEvent ev) {
    dom.Touch t = ev.changedTouches.first;
    return {
      "x": t.client.x,
      "y": t.client.y
    };
  }

  double _getTheta() {
    num dy, dx;
    double theta;
    dy = _endCoord["y"] - _startCoord["y"]; //opposite cathetus
    dx = _endCoord["x"] - _startCoord["x"]; //adjacent cathetus

    //the angle
    theta = Math.atan2(dy, dx);
    theta *= 180 / Math.PI;

    //return the angle
    return theta.abs();
  }

  void _makeSwipe() {
    if (_startCoord != null && _endCoord != null) {
      if ((_startCoord["x"] - _endCoord["x"]) < -10) {
        if (swipeRight != null) {
          if (_getTheta() >= 0 && _getTheta() <= 10) {
            swipeRight();
          }
        }
      } else if ((_startCoord["x"] - _endCoord["x"]) > 10) {
        if (swipeLeft != null) {
          if (_getTheta() >= 170 && _getTheta() <= 180) {
            swipeLeft();
          }
        }
      }
    }
  }

  void _touchStart(dom.TouchEvent ev) {
    _startCoord = _getTouchCoordinates(ev);
  }

  void _touchEnd(dom.TouchEvent ev) {
    _endCoord = _getTouchCoordinates(ev);
    _makeSwipe();
  }
}

@Decorator(
    selector: '[custom-swipe]',
    map: const {
        'custom-swipe-right':'&swipeRight',
        'custom-swipe-left':'&swipeLeft'
    }
)
class customSwipe extends detectSwipe {
  customSwipe(dom.Element target) : super(target);
}