import 'dart:math';

const _alphabet = 'abcdefghijklmnopqrstuvwxyz';
final _alphabetFull =
    '0123456789$_alphabet${_alphabet.toUpperCase()}'.split('');
final _random = Random();

String randomString(int length) {
  return Iterable.generate(
    length,
    (_) => _alphabetFull[_random.nextInt(_alphabetFull.length)],
  ).join();
}

String randomKey() => randomString(32);
