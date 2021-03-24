import 'dart:convert';

class CatigoryModel {
  final String id;
  final String name;
  final String url;
  final String status;
  CatigoryModel({
    this.id,
    this.name,
    this.url,
    this.status,
  });

  CatigoryModel copyWith({
    String id,
    String name,
    String url,
    String status,
  }) {
    return CatigoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'status': status,
    };
  }

  factory CatigoryModel.fromMap(Map<String, dynamic> map) {
    return CatigoryModel(
      id: map['id'],
      name: map['name'],
      url: map['url'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CatigoryModel.fromJson(String source) => CatigoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CatigoryModel(id: $id, name: $name, url: $url, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatigoryModel &&
      other.id == id &&
      other.name == name &&
      other.url == url &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      url.hashCode ^
      status.hashCode;
  }
}
