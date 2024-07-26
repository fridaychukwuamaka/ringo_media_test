import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../extensions/extension.dart';
import '../../utils/utils.dart';
import '../themes/theme.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.buttonTitle,
    required this.onPressed,
    this.borderRadius = 8,
    this.width,
    this.disabled = false,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
    super.key,
  });

  final String buttonTitle;
  final Function() onPressed;

  final double? width;
  final double borderRadius;
  final EdgeInsets padding;
  final bool disabled;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextButton(
        onPressed: widget.disabled
            ? null
            : () async {
                hideKeyboard();
                widget.onPressed();
              },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: widget.padding,
          disabledBackgroundColor: AppColors.disabled,
          disabledForegroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          foregroundColor: context.colorScheme.onPrimary,
        ),
        child: Text(
          widget.buttonTitle,
          style: AppTextStyle.body1.copyWith(
            fontWeight: FontWeight.w700,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}

class AppOutlineButton extends StatefulWidget {
  const AppOutlineButton({
    required this.onPressed,
    this.child,
    super.key,
    this.buttonTitle,
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
    this.color,
  });

  final String? buttonTitle;
  final Function() onPressed;

  final Widget? child;
  final EdgeInsets padding;
  final Color? color;

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        hideKeyboard();
        widget.onPressed();
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size.zero,
        foregroundColor: AppColors.primary,
        backgroundColor: Colors.transparent, // button color
        side: BorderSide(
          width: 1.5,
          color: widget.color ?? AppColors.lightGrey,
        ), // border color and width
        padding: widget.padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: widget.child ??
          Text(
            widget.buttonTitle!,
            style: AppTextStyle.button,
          ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.onPressed,
    required this.buttonTitle,
    required this.iconPath,
    super.key,
  });

  final Function() onPressed;
  final String buttonTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(iconPath),
          Text(
            buttonTitle,
            style: AppTextStyle.body1.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Opacity(
            opacity: 0,
            child: SvgPicture.asset('assets/icons/Google.svg'),
          ),
        ],
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.lightGrey,
            width: 1.5,
          ),
        ),
        child: child,
      ),
    );
  }
}
