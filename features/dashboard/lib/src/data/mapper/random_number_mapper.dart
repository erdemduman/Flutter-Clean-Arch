import 'package:core/core.dart';

import '../model/random_number_model.dart';

extension RandomNumberMapper on RandomNumberModel {
  RandomNumberEntity toEntity() => RandomNumberEntity(number: number ?? -1);
}
