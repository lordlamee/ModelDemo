class MemeModel {
  MemeModel({
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.boxCount,
  });

  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;

  factory MemeModel.fromJson(Map<String, dynamic> json) => MemeModel(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
        boxCount: json["box_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "width": width,
        "height": height,
        "box_count": boxCount,
      };
}
