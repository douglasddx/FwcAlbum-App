import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';

class StatusTile extends StatelessWidget {
  final Image icon;
  final String label;
  final int value;

  const StatusTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 46,
          child: CircleAvatar(
            radius: 46,
            backgroundColor: ColorsApp.i.gray,
            child: icon, //Image.asset('assets/images/all_icon.png'),
          ),
        ),
        title: Text(
          label, //'Todas',
          style: TextStyles.i.textPrimaryFontRegular.copyWith(
            color: Colors.white,
          ),
        ),
        trailing: Text(
          '$value', //'45',
          style: TextStyles.i.textPrimaryFontMedium.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
