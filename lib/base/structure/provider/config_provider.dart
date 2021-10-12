import 'package:flutter/material.dart';
import 'package:flutter_novel/base/structure/provider/base_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

enum AppNightState {
  STATE_NIGHT,
  STATE_DAY,
}

class ConfigProvider extends BaseProvider {
  AppNightState nightState = AppNightState.STATE_NIGHT;

  @override
  SingleChildWidget getProviderContainer() {
    return ChangeNotifierProvider(create: (BuildContext context) {
      return ConfigProvider();
    });
  }
}
