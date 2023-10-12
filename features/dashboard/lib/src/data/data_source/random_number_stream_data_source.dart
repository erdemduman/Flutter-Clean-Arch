import 'dart:math';

import 'package:core/core.dart';

import '../model/random_number_model.dart';

abstract class RandomNumberStreamDataSource {
  Stream<RandomNumberModel> getRandomNumberStream(int maxLimit);
}

class RandomNumberStreamDataSourceImpl implements RandomNumberStreamDataSource {
  final Random _rng = Random();
  final Logger _logger;

  RandomNumberStreamDataSourceImpl(this._logger);

  @override
  Stream<RandomNumberModel> getRandomNumberStream(int maxLimit) async* {
    try {
      while (true) {
        await Future.delayed(const Duration(seconds: 1));
        var number = _rng.nextInt(maxLimit);
        _logger.i('Number $number has been generated to be returned.');
        yield RandomNumberModel(number: number);
      }
    } catch (_) {
      throw const RandomNumberException();
    }
  }
}
