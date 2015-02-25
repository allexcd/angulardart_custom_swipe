// Copyright (c) 2015, AlexCD. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular/angular.dart';
import 'package:angular/application_factory.dart';
import 'package:example2/wrapper/resource_url_resolver_wrapper.dart';
import 'package:angulardart_custom_swipe/angulardart_custom_swipe.dart';
import 'package:example2/component/header.dart';
import 'package:example2/component/content.dart';

class AppModule extends Module{
  AppModule(){
    bind(Header);
    bind(Content);
    bind(customSwipe);
    bind(ResourceResolverConfig, toValue: new ResourceResolverConfig.resolveRelativeUrls(false));
    bind(ResourceUrlResolver, toImplementation: ResourceUrlResolverWrapper);
  }
}

void main(){
  applicationFactory().addModule(new AppModule()).run();
}