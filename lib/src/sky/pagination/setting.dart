part of 'index.dart';

class SkyPaginationLayout {
  final bool prev;
  final bool pager;
  final bool next;
  final bool jumper;
  final bool total;
  final bool sizes;

  const SkyPaginationLayout({
    this.prev = true,
    this.pager = true,
    this.next = true,
    this.jumper = true,
    this.total = true,
    this.sizes = true,
  });
}
