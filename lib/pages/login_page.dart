import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/login/login_layout.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Material(
        child: Center(
          child: LoginLayout(),
        ),
      ),
    );
  }
}
