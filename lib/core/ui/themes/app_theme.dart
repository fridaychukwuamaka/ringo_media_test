part of 'theme.dart';

class AppThemes {
  static final String _font = GoogleFonts.urbanist().fontFamily!;

  static const iconTheme = IconThemeData(color: AppColors.primary);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: _font,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.background,
      onSurface: AppColors.primary,
      primaryContainer: AppColors.primary,
      onPrimaryContainer: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: iconTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
      titleTextStyle: AppTextStyle.body1.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontFamily: _font,
      ),
      iconTheme: iconTheme,
      centerTitle: false,
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
    ),
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      color: AppColors.lightGrey,
      space: 1,
    ),
    
    useMaterial3: true,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.title,
      displayMedium: AppTextStyle.subtitle,
      bodyLarge: AppTextStyle.body1,
      bodyMedium: AppTextStyle.body2,
      labelLarge: AppTextStyle.button,
      bodySmall: AppTextStyle.overline,
    ),
  );
}
