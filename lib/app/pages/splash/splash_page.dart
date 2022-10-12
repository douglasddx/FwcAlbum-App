import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/helpers/loader.dart';
import 'package:fwc_album_app/app/core/ui/helpers/messages.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/core/ui/widgets/rounded_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with Loader<SplashPage>, Messages<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Splash Page',
        ),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () async {
              showLoader();
              await Future.delayed(
                const Duration(
                  seconds: 3,
                ),
              );
              hideLoader();
            },
            style: ButtonStyles.i.primaryButton,
            child: const Text('Salvar'),
          ),
          OutlinedButton(
            onPressed: () {
              showError('Erro no botão outline!');
            },
            style: ButtonStyles.i.primaryOutlineButton,
            child: const Text('Salvar'),
          ),
          const TextField(),
          Button(
            label: 'Salvar',
            onPressed: () {
              showInfo('Info no botão outline');
            },
            style: ButtonStyles.i.primaryOutlineButton,
            labelStyle: TextStyles.i.textPrimaryFontBold,
            outline: true,
          ),
          Button.primiry(
            width: MediaQuery.of(context).size.width * .95,
            height: 40,
            label: 'Salvar',
            onPressed: () {
              showSuccess('Success no botão Salvar!');
            },
          ),
          RoundedButton(
            icon: Icons.add,
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
