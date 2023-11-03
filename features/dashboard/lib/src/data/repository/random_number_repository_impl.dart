import 'package:core/core.dart';
import 'package:dashboard/src/data/data_source/random_number_memory_data_source.dart';
import 'package:dashboard/src/data/data_source/random_number_stream_data_source.dart';

import '../../domain/repository/random_number_repository.dart';
import '../data_source/random_number_data_source.dart';
import '../model/random_number_model.dart';
import '../mapper/random_number_mapper.dart';

class RandomNumberRepositoryImpl implements RandomNumberRepository {
  final RandomNumberDataSource _randomNumberDataSource;
  final RandomNumberStreamDataSource _randomNumberStreamDataSource;
  final RandomNumberMemoryDataSource _memory;

  const RandomNumberRepositoryImpl(
    this._randomNumberDataSource,
    this._randomNumberStreamDataSource,
    this._memory,
  );

  @override
  Future<RandomNumberEntity> getRandomNumber(int maxLimit) async {
    try {
      RandomNumberModel numberModel =
          await _randomNumberDataSource.getRandomNumber(maxLimit);
      _memory.randomNumber = numberModel;
      RandomNumberEntity numberEntity =
          RandomNumberMapper(numberModel).toEntity();
      return numberEntity;
    } on RandomNumberException catch (_) {
      rethrow;
    }
  }

  @override
  Stream<RandomNumberEntity> getRandomNumberStream(int maxLimit) async* {
    try {
      Stream<RandomNumberModel> modelStream =
          _randomNumberStreamDataSource.getRandomNumberStream(maxLimit);
      yield* modelStream.map((numberModel) {
        _memory.randomNumber = numberModel;
        return RandomNumberMapper(numberModel).toEntity();
      });
    } on RandomNumberException catch (_) {
      rethrow;
    }
  }

  @override
  Future<RandomNumberEntity> getStoredRandomNumber() {
    RandomNumberEntity randomNumberEntity =
        RandomNumberMapper(_memory.randomNumber).toEntity();
    return Future.value(randomNumberEntity);
  }

  @override
  void stopNumberGeneration() {
    _randomNumberStreamDataSource.stopNumberGeneration();
  }
}
