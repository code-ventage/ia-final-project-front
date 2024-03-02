class ConfigurationData {
  const ConfigurationData({
    this.BASE_URL = "http://0.0.0.0:34545",
    this.CONTENT_TYPE = "application/json",
    this.DEBUGING = true,
  });

  final String BASE_URL;
  final String CONTENT_TYPE;
  final bool DEBUGING;

  ConfigurationData copyWith({
    String? BASE_URL,
    String? CONTENT_TYPE,
    bool? DEBUG,
  }) {
    return ConfigurationData(
      BASE_URL: BASE_URL ?? this.BASE_URL,
      CONTENT_TYPE: CONTENT_TYPE ?? this.CONTENT_TYPE,
      DEBUGING: DEBUG ?? this.DEBUGING,
    );
  }
}