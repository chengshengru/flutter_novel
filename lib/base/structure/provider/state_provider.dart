import 'package:flutter/material.dart';
import 'package:flutter_novel/base/structure/provider/base_provider.dart';
import 'package:flutter_novel/base/widget/view_common_loading.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

enum PageState {
  STATE_IDLE,
  STATE_LOADING,
  STATE_LOAD_FAILED,
  STATE_LOAD_SUCCESS
}

class PageStateProvider extends BaseProvider {
  late PageState currentState;

  Widget mLoadingView = CommonLoadingView();

  void startLoading() {
    currentState = PageState.STATE_LOADING;
    notifyListeners();
  }

  void stopLoading(bool isSuccess, bool isShowTips) {
    currentState = isShowTips
        ? (isSuccess ? PageState.STATE_LOADING : PageState.STATE_LOAD_FAILED)
        : PageState.STATE_IDLE;
    notifyListeners();
  }

  void resetState() {
    currentState = PageState.STATE_IDLE;
    notifyListeners();
  }

  void setLoadingView(Widget newLoadingView){
    mLoadingView=newLoadingView;
  }

  @override
  SingleChildWidget getProviderContainer() {
     return ChangeNotifierProvider(create: (BuildContext context) {
      return PageStateProvider();
    });
  }
}
