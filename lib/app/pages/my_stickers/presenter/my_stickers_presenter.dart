import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_sticker_view.dart';

abstract class MyStrickersPresenter extends FwcPresenter<MyStickerView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);
  void refresh();
}
