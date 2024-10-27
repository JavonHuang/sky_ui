import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';

import '../../styles/styles.dart';

class SkyPagination extends StatefulWidget {
  const SkyPagination({super.key});

  @override
  State<SkyPagination> createState() => _SkyPaginationState();
}

class _SkyPaginationState extends State<SkyPagination> {
  List<String> showPageList = List.generate(10, (e) => e.toString());
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          SkyHover(
            disabled: false,
            builder: (context, onHover, setvalue) {
              return Container(
                alignment: Alignment.center,
                width: 35,
                child: Icon(
                  ElementIcons.arrowLeft,
                  color: onHover ? SkyColors().primary : SkyColors().primaryText,
                  size: SkyIconSizes().mediumFont,
                ),
              );
            },
          ),
          ...showPageList.map(
            (e) {
              return SkyHover(
                disabled: false,
                builder: (context, onHover, setvalue) {
                  return Container(
                    alignment: Alignment.center,
                    width: 35,
                    child: Text(
                      e,
                      style: TextStyle(
                        color: onHover ? SkyColors().primary : SkyColors().primaryText,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SkyHover(
            disabled: false,
            builder: (context, onHover, setvalue) {
              return Container(
                alignment: Alignment.center,
                width: 35,
                child: Icon(
                  ElementIcons.arrowRight,
                  color: onHover ? SkyColors().primary : SkyColors().primaryText,
                  size: SkyIconSizes().mediumFont,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
