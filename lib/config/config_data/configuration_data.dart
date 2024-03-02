class ConfigurationData {
  const ConfigurationData({
    this.BASE_URL = "http://0.0.0.0:34545",
    this.CONTENT_TYPE = "application/json",
  });

  final String BASE_URL;
  final String CONTENT_TYPE;

  ConfigurationData copyWith({
    String? BASE_URL,
    String? CONTENT_TYPE,
  }) {
    return ConfigurationData(
      BASE_URL: BASE_URL ?? this.BASE_URL,
      CONTENT_TYPE: CONTENT_TYPE ?? this.CONTENT_TYPE,
    );
  }
}