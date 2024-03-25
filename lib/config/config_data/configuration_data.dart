class ConfigurationData {
  ConfigurationData({
    this.BASE_URL = "http://localhost:34545",
    this.CONTENT_TYPE = "application/json",
    this.DEBUGGING = true,
  });

  String BASE_URL;
  final String CONTENT_TYPE;
  final bool DEBUGGING;

  ConfigurationData copyWith({
    String? BASE_URL,
    String? CONTENT_TYPE,
    bool? DEBUGGING,
  }) {
    return ConfigurationData(
      BASE_URL: BASE_URL ?? this.BASE_URL,
      CONTENT_TYPE: CONTENT_TYPE ?? this.CONTENT_TYPE,
      DEBUGGING: DEBUGGING ?? this.DEBUGGING,
    );
  }
}