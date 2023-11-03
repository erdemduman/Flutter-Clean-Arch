import 'package:dashboard/src/data/model/random_number_model.dart';

abstract class RandomNumberMemoryDataSource {
  set randomNumber(RandomNumberModel value);
  RandomNumberModel get randomNumber;
}

class RandomNumberMemoryDataSourceImpl implements RandomNumberMemoryDataSource {
  RandomNumberModel _randomNumber = const RandomNumberModel(number: 23);

  RandomNumberMemoryDataSourceImpl();

  @override
  set randomNumber(RandomNumberModel value) => _randomNumber = value;
  @override
  RandomNumberModel get randomNumber => _randomNumber;
}
