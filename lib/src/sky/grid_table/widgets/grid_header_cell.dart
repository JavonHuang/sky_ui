part of '../grid_table.dart';

class SkyGridHeaderCell<T> extends StatelessWidget {
  const SkyGridHeaderCell({
    super.key,
    required this.column,
  });
  final SkyGridTableColumn<T> column;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: column.cellWidth,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: SkyColors().baseBorder,
            width: 1,
          ),
        ),
      ),
      child: Text(column.headerTitle.text ?? ''),
    );
  }
}
