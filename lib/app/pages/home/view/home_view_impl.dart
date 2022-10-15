import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/models/user_model.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view.dart';

import '../home_page.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? user;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }

  @override
  void setUser(UserModel user) {
    setState(() {
      this.user = user;
    });
    hideLoader();
  }
}
