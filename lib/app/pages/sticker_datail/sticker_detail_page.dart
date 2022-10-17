import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';
import 'package:fwc_album_app/app/pages/sticker_datail/presenter/sticker_detail_presenter.dart';
import 'view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({
    super.key,
    required this.presenter,
  });

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe Figurinha'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                hasSticker
                    ? 'assets/images/sticker.png'
                    : 'assets/images/sticker_pb.png',
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: TextStyles.i.textPrimaryFontBold.copyWith(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RoundedButton(
                      icon: Icons.remove,
                      onPressed: widget.presenter.decrementAmount,
                    ),
                  ),
                  Text(
                    '$amount',
                    style: TextStyles.i.textSecondaryFontMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RoundedButton(
                      icon: Icons.add,
                      onPressed: widget.presenter.incrementAmount,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  bottom: 10,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  countryName,
                  style: TextStyles.i.textPrimaryFontRegular,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button.primiry(
                onPressed: widget.presenter.saveSticker,
                label:
                    hasSticker ? 'Atualizar Figurinha' : 'Adicionar Figurinha',
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                onPressed: widget.presenter.deleteSticker,
                outline: true,
                width: MediaQuery.of(context).size.width * .9,
                style: ButtonStyles.i.primaryOutlineButton,
                labelStyle: TextStyles.i.textSecondaryFontExtraBoldPrimiryColor,
                label: 'Excluir Figurinha',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
