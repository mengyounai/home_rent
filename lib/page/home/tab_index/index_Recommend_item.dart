class IndexRecommendItem {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String navigateUrl;

  const IndexRecommendItem(
      this.title, this.subTitle, this.imageUrl, this.navigateUrl);
}

const List<IndexRecommendItem> indexRecommendData = [
  IndexRecommendItem("义龙园", "归属的感觉", "images/3.0x/绝世风华.jpg", "/login"),
  IndexRecommendItem("四龙环", "大都市生活", "images/3.0x/绝世风华.jpg", "/login"),
  IndexRecommendItem("石家庄", "旅游圣地", "images/3.0x/绝世风华.jpg", "/login"),
  IndexRecommendItem("十号线", "交通方便", "images/3.0x/绝世风华.jpg", "/login"),
];
