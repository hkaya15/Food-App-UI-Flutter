import 'package:dominos/appdrawer.dart';
import 'package:dominos/categorieslist.dart';
import 'package:dominos/popularlist.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: homeAppBar(),
      drawer: AppDrawer(),
      body: buildHomePage(context, size),
    );
  }

  GestureDetector buildHomePage(BuildContext context, Size size) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              welcomeSection,
              description,
              searchBox,
              categories,
              categoriesList,
              mostPopularSection,
              popularSectionList
            ]),
      ),
    );
  }

  AppBar homeAppBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.4,
              child: locationSearch(),
            ),
          ),
        ],
      );

  TextFormField locationSearch() {
    return TextFormField(
        keyboardType: TextInputType.streetAddress,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.location_on_outlined),
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Location'));
  }

  Widget get welcomeSection => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "İyi Günler!",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 25),
                ),
                Text(
                  " Hüseyin",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 25),
                ),
              ],
            )),
      );
  Widget get description => Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "Harika yemekler",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 25),
                ),
                Text(
                  " seni bekliyor...",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontSize: 25),
                ),
              ],
            )),
      );
  Widget get searchBox => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: "Restoran, Yiyecek",
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)))))),
              ),
            ),
          ),
          sortButton()
        ],
      );

  RawMaterialButton sortButton() {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 1.0,
      fillColor: Colors.white,
      child: Icon(Icons.sort),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    );
  }

  Widget get categories => Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Kategoriler",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            sortIconButton()
          ],
        ),
      );

  IconButton sortIconButton() =>
      IconButton(icon: Icon(Icons.more_horiz_outlined), onPressed: () {});
  Widget get categoriesList => Container(
        height: 150,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: Category.getList().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: () => setColorIndex(index),
                  child: Container(
                    width: 100,
                    child: Card(
                        color: buildCategoryButtonColor(context, index),
                        elevation: 2,
                        semanticContainer: true,
                        margin: EdgeInsets.all(5),
                        shape: StadiumBorder(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [categoryImage(index), categoryName(index)],
                        )),
                  ),
                ),
              );
            }),
      );

  Text categoryName(int index) {
    return Text(
      Category.getList()[index].title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    );
  }

  Container categoryImage(int index) {
    return Container(
      height: 70,
      width: 70,
      child: Image(
        height: 75,
        image: AssetImage(Category.getList()[index].icon),
        fit: BoxFit.contain,
      ),
    );
  }

  void setColorIndex(int index) {
    setState(() {
      _count = index;
    });
  }

  Color buildCategoryButtonColor(BuildContext context, sectionindex) =>
      _count == sectionindex ? Theme.of(context).primaryColor : Colors.white;
  Widget get mostPopularSection => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "En Çok Tercih Edilenler",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            sortButtonPopular()
          ],
        ),
      );

  IconButton sortButtonPopular() =>
      IconButton(icon: Icon(Icons.more_horiz_outlined), onPressed: () {});
  Widget get popularSectionList => Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: Popular.getList().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 150,
                  child: Card(
                      semanticContainer: true,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              popularImage(index),
                              Container(
                                height: 120,
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    popularTitle(index, context),
                                    popularDescription(index, context),
                                    popularPrice(index, context)
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 75,
                                    width: 60,
                                    child: Stack(children: [
                                      popularBookMark(context),
                                      popularIcon(),
                                      popularRate(index),
                                    ]),
                                  ),
                                  popularLiked(index),
                                ],
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              );
            }),
      );

  IconButton popularLiked(int index) {
    return IconButton(
        icon: Popular.getList()[index].isLiked
            ? Icon(Icons.favorite, color: Colors.red)
            : Icon(Icons.favorite_border_outlined),
        onPressed: () {});
  }

  Positioned popularRate(int index) {
    return Positioned(
        bottom: 30,
        left: 28,
        child: Text(
          Popular.getList()[index].star.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  Positioned popularIcon() {
    return Positioned(
      top: -9,
      left: 14,
      child: IconButton(icon: Icon(Icons.star_half_outlined), onPressed: () {}),
    );
  }

  Positioned popularBookMark(BuildContext context) {
    return Positioned(
      top: -9,
      child: Icon(
        Icons.bookmark,
        color: Theme.of(context).primaryColor,
        size: 80,
      ),
    );
  }

  Row popularPrice(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        price(index, context),
        oldPrice(index),
      ],
    );
  }

  Text oldPrice(int index) {
    return Text(Popular.getList()[index].oldPrice.toString() + " TL",
        style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 15));
  }

  Text price(int index, BuildContext context) {
    return Text(Popular.getList()[index].price.toString() + " TL",
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ));
  }

  Text popularDescription(int index, BuildContext context) {
    return Text(Popular.getList()[index].description,
        style: Theme.of(context).textTheme.bodyText2);
  }

  Text popularTitle(int index, BuildContext context) {
    return Text(Popular.getList()[index].title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold));
  }

  Container popularImage(int index) {
    return Container(
      height: 120,
      width: 100,
      child: Image(
        height: 75,
        image: AssetImage(Popular.getList()[index].icon),
        fit: BoxFit.contain,
      ),
    );
  }
}
