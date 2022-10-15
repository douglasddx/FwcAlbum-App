import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            context.get<CustomDio>().auth().get('/api/me');
            // final sp = await SharedPreferences.getInstance();
            // sp.clear();
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text('Testando auth'),
        ),
      ),
    );
  }
}
