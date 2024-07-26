import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../extensions/extension.dart';
import '../themes/theme.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    this.label,
    this.hint,
    this.obscureText,
    this.validator,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.inputFormatters,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(
      vertical: 8,
    ),
    this.prefix,
    this.suffix,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry padding;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final void Function()? onTap;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late bool _isObscure = widget.obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyle.body2.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          obscureText: _isObscure,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          initialValue: widget.initialValue,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyle.body1.copyWith(
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
          obscuringCharacter: '*',
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyle.body1.copyWith(
              color: AppColors.cadetGrey,
            ),
            contentPadding: widget.padding,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.colorScheme.secondary,
                width: 1.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.brightGrey,
                width: 1.5,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.colorScheme.error,
                width: 1.5,
              ),
            ),
            prefixIcon: widget.prefix,
            suffixIcon: widget.obscureText == true
                ? IconButton(
                    icon: Icon(
                      _isObscure == false
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      color: context.colorScheme.secondary,
                      size: 19,
                    ),
                    onPressed: onObscure,
                  )
                : widget.suffix,
          ),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }

  void onObscure() {
    setState(() => _isObscure = !_isObscure);
  }
}
