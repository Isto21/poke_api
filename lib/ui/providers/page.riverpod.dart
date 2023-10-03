import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page.riverpod.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() => 0;
  void nextPage() {
        print('ejaquiiiii======== '+state.toString());
    state++;
  }

  void previousPage() {
    state--;
  }
}
