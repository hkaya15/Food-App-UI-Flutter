class Category {
  final String title;
  final String icon;

  Category({this.title, this.icon});

  static List<Category> getList() {
    List<Category> _category = <Category>[
      Category(
        title: "Burger",
        icon: 'assets/img/burger.png',
      ),
      Category(
        title: "Tavuk",
        icon: 'assets/img/chicken.png',
      ),
      Category(
        title: "Tatlı",
        icon: 'assets/img/dessert.png',
      ),
      Category(
        title: "İçecek",
        icon: 'assets/img/drink.png',
      ),
      Category(
        title: "Kebap",
        icon: 'assets/img/kebap.png',
      ),
      Category(
        title: "Pizza",
        icon: 'assets/img/pizza.png',
      )
    ];

    return _category;
  }
}
