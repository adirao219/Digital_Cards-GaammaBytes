import 'base_env_config.dart';

class ProdEnvConfig extends BaseEnvConfig {
  @override
  String get bASEURL => 'https://digital.gaamma.cards';
  String get greetingHelpURL => 'https://digital.gaamma.cards/Help/help';
}
