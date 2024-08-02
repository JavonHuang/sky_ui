import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_ui/sky_ui.dart';

class FlexLayoutTestRoute extends StatelessWidget {
  const FlexLayoutTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.red,
          width: double.infinity,
          child: Wrap(
            spacing: 20, // 主轴(水平)方向间距
            runSpacing: 0.0, // 纵轴（垂直）方向间距
            // alignment: WrapAlignment.center, //沿主轴方向居中
            // crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: <Widget>[
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: new Text('Hamilton'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                label: new Text('Lafayette'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                label: new Text('Mulligan'),
              ),
              new Chip(
                avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: new Text('Laurens'),
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 300,
              )
            ],
          ),
        ),
        SkyRow(
          children: [
            SkyCol(
              span: SkyColSpan.span1,
            ),
            SkyCol(
                // span: SkyColSpan.span1,
                ),
            SkyCol(
                // span: SkyColSpan.span1,
                ),
            SkyCol(
              span: SkyColSpan.span1,
            ),
            SkyCol(
              span: SkyColSpan.span21,
            ),
            SkyCol(
              span: SkyColSpan.span1,
            ),
          ],
        ),
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 20.0),
        //   child: SizedBox(
        //     height: 100.0,
        //     //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
        //     child: Flex(
        //       direction: Axis.horizontal,
        //       children: <Widget>[
        //         Expanded(
        //           flex: 2,
        //           child: Container(
        //             height: 30.0,
        //             color: Colors.red,
        //           ),
        //         ),
        //         Spacer(
        //           flex: 1,
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: Container(
        //             height: 30.0,
        //             color: Colors.green,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
