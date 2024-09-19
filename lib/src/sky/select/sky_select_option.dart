part of 'index.dart';

class SkySelectOption<T> {
  SkySelectOption({
    this.key,
    required this.value,
    required this.label,
    this.disabled = false,
    this.children,
  }) {
    children = [];
  }
  final Key? key;
  final T value;
  final String label;
  final bool disabled;
  List<SkySelectOption>? children;
}
