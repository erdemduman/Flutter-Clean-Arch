import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';

class StopNumberGenerationUseCase implements UseCase<void> {
  final RandomNumberRepository _randomNumberRepository;

  const StopNumberGenerationUseCase(this._randomNumberRepository);

  @override
  void call({required UseCaseParameter parameter}) {
    _randomNumberRepository.stopNumberGeneration();
  }
}
