// 资讯数据准备,注意下面的格式

class InfoItem {
  final String title;
  final String imageUrl;
  final String source;
  final String time;
  final String navigateUrl;
  const InfoItem(
      {required this.title,
      required this.imageUrl,
      required this.source,
      required this.time,
      required this.navigateUrl});
}

const List<InfoItem> infoData = [
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_03Rjh4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: '1'),
  const InfoItem(
      title: '置业选择 | 珠江新城 三室一厅 广州的隔江眺望',
      imageUrl:
          'http://image-jishanle2.test.upcdn.net//blog/www.acg.gy_03Rjh4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: '2'),
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl: 'http://image-jishanle2.test.upcdn.net//blog/acg.gy_18lAr4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: '3'),
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl: 'http://image-jishanle2.test.upcdn.net//blog/acg.gy_10xcN4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: '4'),
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'http://image-jishanle2.test.upcdn.net//blog/9853%20(2)gpK4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: '5'),
  const InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl: 'http://image-jishanle2.test.upcdn.net//blog/ACG.GY_03lxS4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: '6'),
];
