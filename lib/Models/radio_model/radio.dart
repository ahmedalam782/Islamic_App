class Radio {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Radio({this.id, this.name, this.url, this.recentDate});

  factory Radio.fromMap(Map<String, dynamic> data) => Radio(
        id: data['id'] as int?,
        name: data['name'] as String?,
        url: data['url'] as String?,
        recentDate: data['recent_date'] as String?,
      );
}
