part of "index.dart";

class SkyRow extends StatelessWidget {
  const SkyRow({
    super.key,
    required this.children,
    this.gutter,
  });
  final List<SkyCol> children;
  final double? gutter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
