import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerPercentWidget extends StatelessWidget {
  final int percent;

  const StickerPercentWidget({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: ColorsApp.i.gray,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$percent%',
              style: TextStyles.i.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: -pi / 2.0,
            child: CircularProgressIndicator(
              value: percent / 100,
              strokeWidth: 5,
              color: Colors.white,
              backgroundColor: Colors.white.withOpacity(.5),
            ),
          ),
        )
      ],
    );
  }
}
