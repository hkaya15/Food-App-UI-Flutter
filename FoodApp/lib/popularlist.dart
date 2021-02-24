class Popular {
  final String title;
  final String icon;
  final String description;
  final int oldPrice;
  final int price;
  final double star;
  final bool isLiked;

  Popular(
      {this.title,
      this.icon,
      this.description,
      this.oldPrice,
      this.price,
      this.star,
      this.isLiked});

  static List<Popular> getList() {
    List<Popular> _popular = <Popular>[
      Popular(
          title: "Big Mac",
          icon: 'assets/img/bigmac.png',
          description: "Hamburger Menü",
          oldPrice: 25,
          price: 21,
          star: 4.3,
          isLiked: false),
      Popular(
          title: "Sosyal Pizza",
          icon: 'assets/img/pizza.png',
          description: "Karışık Büyük Boy",
          oldPrice: 65,
          price: 42,
          star: 4.7,
          isLiked: true),
      Popular(
          title: "İskender Kebap",
          icon: 'assets/img/kebap.png',
          description: "İskender Menü",
          oldPrice: 28,
          price: 21,
          star: 3.5,
          isLiked: false),
    ];

    return _popular;
  }
}
