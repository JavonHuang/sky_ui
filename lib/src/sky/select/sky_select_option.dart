part of 'index.dart';

class SkySelectOption<T> {
  SkySelectOption({
    this.key,
    required this.value,
    required this.label,
  });
  final Key? key;
  final T value;
  final String label;
}
