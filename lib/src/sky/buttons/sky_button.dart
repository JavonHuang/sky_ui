part of 'buttons.dart';

class SkyButton extends StatelessWidget {
  const SkyButton({
    super.key,
    required this.disabled,
    required this.loading,
    required this.type,
    this.plain = false,
  });
  final SkyButtonType type;

  /// State
  final bool disabled;
  final bool loading;
  final bool plain;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: type.getBackgroundColor(
            context: context,
            disabled: disabled,
            loading: loading,
            plain: plain,
          ),
        ),
        child: Text(
          '89989',
          style: TextStyle(
              color: type.getTextColor(
            context: context,
            plain: plain,
          )),
        ),
      ),
    );
  }
}
