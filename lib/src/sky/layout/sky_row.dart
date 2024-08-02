part of "index.dart";

class SkyRow extends StatelessWidget {
  const SkyRow({
    super.key,
    required this.children,
    this.gutter,
  });
  final List<SkyCol> children;
  final double? gutter;

  List<Widget> renderColList(double rowWidth) {
    List<Widget> resultListRow = [];
    List<Widget> resultRowListItem = [];

    double sumWidth = 0;
    for (int i = 0; i < children.length; i++) {
      SkyCol item = children[i];
      if (item.width == null && item.span == null) {
        resultListRow.add(
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...resultRowListItem,
                Expanded(
                  child: Container(color: Colors.blue, child: item),
                ),
              ],
            ),
          ),
        );
        resultRowListItem = [];
      } else {
        sumWidth += item.width != null ? item.width! / rowWidth : item.span!.value;
        Widget colItem = Container(
          color: Colors.blue,
          width: item.width ?? item.span!.width(rowWidth),
          child: item,
        );
        if (sumWidth < 24) {
          resultRowListItem.add(colItem);
        } else {
          resultListRow.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: resultRowListItem,
              ),
            ),
          );
          resultRowListItem = [];
          sumWidth = 0;
          resultRowListItem.add(colItem);
        }
        if (i == children.length - 1) {
          resultListRow.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: resultRowListItem,
              ),
            ),
          );
          sumWidth = 0;
          resultRowListItem = [];
        }
      }
    }
    return resultListRow;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, b) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: renderColList(b.maxWidth),
      );
    });
  }
}
