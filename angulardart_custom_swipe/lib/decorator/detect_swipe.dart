// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
part of angulardart.custom.swipe;

class detectSwipe{
  Map _startCoord, _endCoord;
  Function swipeRight, swipeLeft;

  void setConsoleMsg(msg) {
    dom.window.console.info(msg);
  }

  double _getTheta(Map endCoord, Map startCoord) {
    num dy, dx;
    double theta;
    dy = endCoord["y"] - startCoord["y"]; //opposite cathetus
    dx = endCoord["x"] - startCoord["x"]; //adjacent cathetus

    //the angle
    theta = Math.atan2(dy, dx);
    theta *= 180 / Math.PI;

    //return the angle
    return theta.abs();
  }

  double _getSwipeTheta(){
    return _getTheta(_endCoord, _startCoord);
  }

  Map _getTouchCoordinates(dom.TouchEvent ev) {
    dom.Touch t = ev.changedTouches.first;
    return {
        "x": t.client.x,
        "y": t.client.y
    };
  }

  detectSwipe(dom.Element target) {
    target.onTouchStart.listen(_touchStart);
    target.onTouchEnd.listen(_touchEnd);

    // touchEnd does not fire fix
    // When a touchmove event occurs if the browser decides that this is a scroll event
    // it will fire touchcancel and never fire touchend.
    // But the scroll must pe allowed on some conditions, if moving the finger up and down on the screen
    target.onTouchMove.listen((e){
      double moveTheta = _getTheta(_getTouchCoordinates(e), _startCoord);
      if(moveTheta > 30 && moveTheta < 150){
        setConsoleMsg('scroll');
      } else {
        setConsoleMsg('disable scroll');
        e.preventDefault();
      }
    });
    //end fix
  }

  void _makeSwipe() {
    if (_startCoord != null && _endCoord != null) {
      if ((_startCoord["x"] - _endCoord["x"]) < -10) {
        if (swipeRight != null) {
          if (_getSwipeTheta() >= 0 && _getSwipeTheta() <= 10) {
            setConsoleMsg('swiped right');
            swipeRight();
          }
        }
      } else if ((_startCoord["x"] - _endCoord["x"]) > 10) {
        if (swipeLeft != null) {
          if (_getSwipeTheta() >= 170 && _getSwipeTheta() <= 180) {
            setConsoleMsg('swiped left');
            swipeLeft();
          }
        }
      }
    }
  }

  void _touchStart(dom.TouchEvent ev) {
    setConsoleMsg('touchStart');
    _startCoord = _getTouchCoordinates(ev);
  }

  void _touchEnd(dom.TouchEvent ev) {
    setConsoleMsg('touchEnd');
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