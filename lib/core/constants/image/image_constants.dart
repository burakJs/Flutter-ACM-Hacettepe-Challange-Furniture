class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String get circleAvatar => toJpg('ben');
  String get blueChair => toPng('blueChair');
  String get blackChair => toPng('blackChair');
  String get grayChair => toPng('grayChair');
  String get orangeChair => toPng('orangeChair');
  String toPng(String name) => 'assets/images/$name.png';
  String toJpg(String name) => 'assets/images/$name.jpg';
}
