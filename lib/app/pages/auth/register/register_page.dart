import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/styles/text_styles.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;
  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEditController = TextEditingController();
  final emailEditController = TextEditingController();
  final passwordEditController = TextEditingController();
  final confirmPasswordEditController = TextEditingController();

  @override
  void dispose() {
    nameEditController.dispose();
    emailEditController.dispose();
    passwordEditController.dispose();
    confirmPasswordEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 106.82,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bola.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Cadastrar Usuário',
              style: TextStyles.i.titleBlack,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameEditController,
                    decoration: const InputDecoration(
                      label: Text('Nome Completo'),
                    ),
                    validator: Validatorless.required('Obrigatório'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailEditController,
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordEditController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.min(
                          6, 'Senha deve conter no mínimo 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: confirmPasswordEditController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Confirma Senha'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.min(
                          6, 'Senha deve conter no mínimo 6 caracteres'),
                      Validatorless.compare(
                          passwordEditController, 'Senhas são diferentes')
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button.primiry(
                    label: 'Cadastrar',
                    width: MediaQuery.of(context).size.width * .9,
                    onPressed: () {
                      final formValid =
                          formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        showLoader();
                        widget.presenter.register(
                          name: nameEditController.text,
                          email: emailEditController.text,
                          password: passwordEditController.text,
                          confirmPassword: confirmPasswordEditController.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
