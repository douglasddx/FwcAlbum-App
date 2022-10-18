import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';

import '../view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  // Métodos de ação - event
  Future<void> getUserData();
  Future<void> logout();
  void refresh();
}
