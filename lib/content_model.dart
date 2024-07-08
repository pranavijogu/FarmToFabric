class UnBoardingContent {
  String image;
  String title;
  String description;

  UnBoardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnBoardingContent> contents = [
  UnBoardingContent(
      title: "Marketplace",
      image: 'images/Marketplace.jpeg',
      description:
          "Common Trade platform for Farmers , Producers & End Consumers as well as Updated market prices and info from market places/textile industries in regular intervals."),
  UnBoardingContent(
      title: "Quality assurance",
      image: 'images/Quality.jpeg',
      description:
          "Our app uses smart technology to check the quality of wool just by taking a picture. It uses fancy math to quickly tell you if the wool is good or not, making it easy to evaluate without manual inspection."),
  UnBoardingContent(
      title: "Services",
      image: 'images/services.jpeg',
      description:
          "Our app helps wool processing stores sign up to attract more customers, offering a convenient platform for them. Additionally, it provides info on warehouses, streamlining the wool processing journey for both businesses and users."),
  UnBoardingContent(
      title: "Education",
      image: 'images/Education.jpeg',
      description:
          "Our app goes beyond services, offering learning materials for those curious about wool and its processes. Explore educational resources to enhance your knowledge and understanding of the wool industry.")
];
