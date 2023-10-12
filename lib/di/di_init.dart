import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:settings/settings.dart';

class InitDependencyInjection {
  static void init(BuildConfig config) {
    //Other
    Injector.registerSingleton((c) => Logger());
    Injector.registerSingleton<BuildConfig>((c) => config);

    // Data Source
    Injector.registerSingleton<RandomNumberDataSource>(
      (c) => RandomNumberDataSourceImpl(
        c<Logger>(),
      ),
    );
    Injector.registerSingleton<RandomNumberStreamDataSource>(
      (c) => RandomNumberStreamDataSourceImpl(
        c<Logger>(),
      ),
    );

    // Repository
    Injector.registerSingleton<RandomNumberRepository>(
      (c) => RandomNumberRepositoryImpl(
        c<RandomNumberDataSource>(),
        c<RandomNumberStreamDataSource>(),
      ),
    );

    // UseCase
    Injector.registerSingleton(
      (c) => GetRandomNumberUseCase(
        c<RandomNumberRepository>(),
      ),
    );
    Injector.registerSingleton(
      (c) => GetRandomNumberStreamUseCase(
        c<RandomNumberRepository>(),
      ),
    );

    // Bloc
    Injector.registerFactory((c) => MainBloc(c<Logger>()));
    Injector.registerFactory(
      (c) => NumberBloc(
        c<GetRandomNumberUseCase>(),
        c<Logger>(),
      ),
    );
    Injector.registerFactory(
      (c) => StreamBloc(
        c<GetRandomNumberStreamUseCase>(),
        c<Logger>(),
      ),
    );
    Injector.registerFactory(
      (c) => SettingsBloc(
        c<Logger>(),
      ),
    );
  }
}
