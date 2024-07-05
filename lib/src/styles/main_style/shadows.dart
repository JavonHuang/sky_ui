part of '../styles.dart';

class SkyShadows {
  const SkyShadows._();
  static BoxShadow tbFixedRight = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(-1.0, -1), //阴影y轴偏移量
    blurRadius: 2, //阴影模糊程度
    spreadRadius: 1, //阴影扩散
  );
  static BoxShadow tbFixedLeft = const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(1.0, -1),
    blurRadius: 2,
    spreadRadius: 1,
  );
}
