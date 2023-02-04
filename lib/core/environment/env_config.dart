import 'base_env_config.dart';
import 'dev_env_config.dart';
import 'prod_env_config.dart';

enum Environment { dev, prod  }

class EnvConfig {
  static BaseEnvConfig config = DevEnvConfig();

  static initConfig({Environment? environment}) {
    config = _getConfig(environment ?? null);
  }

  static _getConfig([Environment? environment]) {
    switch (environment) {
      case Environment.dev:
        return DevEnvConfig();
      case Environment.prod:
        return ProdEnvConfig();
      default:
        return DevEnvConfig();
    }
  }
}
