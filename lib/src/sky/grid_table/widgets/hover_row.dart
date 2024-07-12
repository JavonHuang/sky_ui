part of '../grid_table.dart';

class HoverRow extends StatefulWidget {
  const HoverRow({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  State<HoverRow> createState() => _HoverRowState();
}

class _HoverRowState extends State<HoverRow> {
  late Color? bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        setState(() {
          bgColor = SkyColors().defaultBg;
        });
      },
      onExit: (e) {
        setState(() {
          bgColor = Colors.white;
        });
      },
      child: Container(
        color: bgColor,
        child: widget.child,
      ),
    );
  }
}
