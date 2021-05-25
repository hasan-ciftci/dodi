import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:flutter/material.dart';

Align buildBottomAppBar(
    Size size, BuildContext context, SelectedPage selectedPage) {
  Color unSelectedColor = Color(0xFFC4C4C4);
  Color selectedColor = Theme.of(context).disabledColor;
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: size.height * .08,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 2),
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Theme.of(context).bottomAppBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: selectedPage == SelectedPage.SHOP
                      ? selectedColor
                      : unSelectedColor,
                ),
                if (selectedPage == SelectedPage.SHOP)
                  Text(
                    "Market",
                    style: TextStyle(
                      color: selectedPage == SelectedPage.SHOP
                          ? selectedColor
                          : unSelectedColor,
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/evaluationOverview"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bar_chart,
                  color: selectedPage == SelectedPage.OVERVIEW
                      ? selectedColor
                      : unSelectedColor,
                ),
                if (selectedPage == SelectedPage.OVERVIEW)
                  Text(
                    "Değerlendirme",
                    style: TextStyle(
                      color: selectedPage == SelectedPage.OVERVIEW
                          ? selectedColor
                          : unSelectedColor,
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: selectedPage == SelectedPage.HOME
                      ? selectedColor
                      : unSelectedColor,
                ),
                if (selectedPage == SelectedPage.HOME)
                  Text(
                    "Ana Sayfa",
                    style: TextStyle(
                      color: selectedPage == SelectedPage.HOME
                          ? selectedColor
                          : unSelectedColor,
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/newClassSelectView"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu_book,
                  color: selectedPage == SelectedPage.TESTS
                      ? selectedColor
                      : unSelectedColor,
                ),
                if (selectedPage == SelectedPage.TESTS)
                  Text(
                    "Testler",
                    style: TextStyle(
                      color: selectedPage == SelectedPage.TESTS
                          ? selectedColor
                          : unSelectedColor,
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/chooseProfileExtra"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: selectedPage == SelectedPage.PROFILE
                      ? selectedColor
                      : unSelectedColor,
                ),
                if (selectedPage == SelectedPage.PROFILE)
                  Text(
                    "Profil",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: selectedPage == SelectedPage.PROFILE
                          ? selectedColor
                          : unSelectedColor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
