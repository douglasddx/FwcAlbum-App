import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;

  const StickerStatusFilter({
    super.key,
    required this.filterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStrickersPresenter>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      // Funciona similar a Row, porém faz a quebra de linha
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSelected == 'all'
                ? ButtonStyles.i.yellowButton
                : ButtonStyles.i.primaryButton,
            labelStyle: filterSelected == 'all'
                ? TextStyles.i.textSecondaryFontMedium
                    .copyWith(color: ColorsApp.i.primary)
                : TextStyles.i.textSecondaryFontMedium,
            label: 'Todas',
            onPressed: () {
              presenter.statusFilter('all');
            },
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSelected == 'missing'
                ? ButtonStyles.i.yellowButton
                : ButtonStyles.i.primaryButton,
            labelStyle: filterSelected == 'missing'
                ? TextStyles.i.textSecondaryFontMedium
                    .copyWith(color: ColorsApp.i.primary)
                : TextStyles.i.textSecondaryFontMedium,
            label: 'Faltando',
            onPressed: () {
              presenter.statusFilter('missing');
            },
          ),
          Button(
            width: MediaQuery.of(context).size.width * .3,
            style: filterSelected == 'repeated'
                ? ButtonStyles.i.yellowButton
                : ButtonStyles.i.primaryButton,
            labelStyle: filterSelected == 'repeated'
                ? TextStyles.i.textSecondaryFontMedium
                    .copyWith(color: ColorsApp.i.primary)
                : TextStyles.i.textSecondaryFontMedium,
            label: 'Repetidas',
            onPressed: () {
              presenter.statusFilter('repeated');
            },
          ),
        ],
      ),
    );
  }
}
