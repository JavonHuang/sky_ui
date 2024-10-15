part of 'buttons.dart';

class SkyButton extends ButtonField<SkyButton> {
  const SkyButton({
    super.key,
    super.text,
    super.type,
    super.size = SkySize.medium,
    super.disabled,
    super.loading,
    super.plain,
    super.round,
    super.circle,
    super.leftIcon,
    super.rightIcon,
    super.onTap,
    super.buttonKey,
    super.customTextColor,
    super.customHoverColor,
    super.customSize,
  });
  @override
  ButtonFieldState<SkyButton> createState() => _SkyButtonState();
}

class _SkyButtonState extends ButtonFieldState<SkyButton> {
  // SkyButton get _widget => super.widget as SkyButton;
}
