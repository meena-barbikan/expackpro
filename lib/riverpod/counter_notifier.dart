import 'package:riverpod/riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(super.value);

  void increment() => state++;
  void decrement() => state--;
}

final counterProvider = StateNotifierProvider((ref) {
  return CounterNotifier(0);
});
