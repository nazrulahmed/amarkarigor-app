class NotificationModel {
  NotificationModel(
    this.id,
    this.title,
    this.image,
    this.content,
  );
  int id;
  String title;
  String image;
  String content;

  factory NotificationModel.fromJSON(json) {
    return NotificationModel(
      int.parse(json['id']),
      json['title'],
      json['image'],
      json['content'],
    );
  }
}
