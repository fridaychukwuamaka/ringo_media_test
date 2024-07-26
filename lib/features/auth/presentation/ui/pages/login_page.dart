import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../../../../../core/ui/widgets/app_input.dart';
import '../../view_models/login_view_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.read(loginViewModel.notifier);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.all(context.appPaddingVal).copyWith(
          top: kToolbarHeight + 24,
        ),
        children: [
          Text(
            'Login',
            style: AppTextStyle.title.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sign in to your account',
            style: AppTextStyle.body2.copyWith(
              color: AppColors.cadetGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          AppInput(
            label: 'Username / Email',
            hint: 'Enter your username or email',
            controller: viewModel.emailCtrl,
          ),
          const SizedBox(height: 24),
          AppInput(
            label: 'Password',
            hint: 'Enter your password',
            controller: viewModel.pwdCtrl,
            obscureText: true,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot Password?',
                style: AppTextStyle.body2.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(loginViewModel);
              return AppButton(
                disabled: state.disabled,
                buttonTitle: 'Login',
                onPressed: viewModel.goToHome,
              );
            },
          ),
          const SizedBox(height: 24),
          Text(
            'Or login with account',
            textAlign: TextAlign.center,
            style: AppTextStyle.overline.copyWith(
              color: AppColors.cadetGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          SocialButton(
            iconPath: 'assets/icons/Google.svg',
            buttonTitle: 'Continue with Google',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          SocialButton(
            iconPath: 'assets/icons/Facebook.svg',
            buttonTitle: 'Continue with Facebook',
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          SocialButton(
            iconPath: 'assets/icons/Apple.svg',
            buttonTitle: 'Continue with Apple',
            onPressed: () {},
          ),
          const SizedBox(height: 40),
          Text.rich(
            TextSpan(
              text: "Don't have an account? ",
              style: AppTextStyle.body2.copyWith(
                color: AppColors.cadetGrey,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: 'Register Here',
                  style: AppTextStyle.body2.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
