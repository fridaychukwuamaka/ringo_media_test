import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_router.dart';
import '../states/login_page_state/login_page_state.dart';

class LoginViewModel extends Notifier<LoginPageState> {
  late final GoRouter _appRouter;

  late final pwdCtrl = TextEditingController();
  late final emailCtrl = TextEditingController();

  @override
  LoginPageState build() {
    onInit();
    _appRouter = ref.read(appRouter);
    return const LoginPageState();
  }

  void goToHome() {
    _appRouter.goNamed(RouteName.home);
  }

  void onInit() {
    pwdCtrl.addListener(() {
      state = state.copyWith(
        disabled: pwdCtrl.text.isEmpty || emailCtrl.text.isEmpty,
      );
    });
    emailCtrl.addListener(() {
      state = state.copyWith(
        disabled: pwdCtrl.text.isEmpty || emailCtrl.text.isEmpty,
      );
    });
  }
}

final loginViewModel =
    NotifierProvider<LoginViewModel, LoginPageState>(LoginViewModel.new);
