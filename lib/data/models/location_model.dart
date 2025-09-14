class LocationModel {
  LocationModel({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}