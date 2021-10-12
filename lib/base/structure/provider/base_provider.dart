import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseProvider extends ChangeNotifier{

  SingleChildWidget getProviderContainer();

}