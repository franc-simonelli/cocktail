enum Environment { dev, prod }

class EnvironmentConfig {
  final Environment environment;
  final String baseUrl;

  EnvironmentConfig({
    required this.environment,
    required this.baseUrl,
  });

  bool get isDev => environment == Environment.dev;
  bool get isProd => environment == Environment.prod;

  factory EnvironmentConfig.dev() {
    return EnvironmentConfig(
      environment: Environment.dev,
      baseUrl: 'https://www.thecocktaildb.com/api/json/',
    );
  }

  factory EnvironmentConfig.prod() {
    return EnvironmentConfig(
      environment: Environment.prod,
      baseUrl: 'https://www.thecocktaildb.com/api/json/',
    );
  }
}
