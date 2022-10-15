import 'package:fwc_album_app/app/models/user_model.dart';

abstract class HomeView {
  // Métodos de atualização da tela
  void setUser(UserModel user);
  void error(String message);
  void showLoader();
  void logoutSuccess();
}
