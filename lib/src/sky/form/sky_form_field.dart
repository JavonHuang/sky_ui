part of 'sky_form.dart';

class SkyFormField<T> extends StatefulWidget {
  const SkyFormField({super.key, required this.builder});
  final SkyFormFieldBuilder<T> builder;
  @override
  SkyFormFieldState<T> createState() => SkyFormFieldState<T>();
}

class SkyFormFieldState<T> extends State<SkyFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(this);
  }
}

typedef SkyFormFieldBuilder<T> = Widget Function(SkyFormFieldState<T> field);
