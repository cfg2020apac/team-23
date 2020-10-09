class eventDeats {
  final String videoUrl;
  final String desc;

  eventDeats({this.videoUrl, this.desc});

  factory eventDeats.fromJson(Map<String, dynamic> json) {
    return eventDeats(
      videoUrl: json['videoUrl'],
      desc: json['desc'],
    );
  }
}