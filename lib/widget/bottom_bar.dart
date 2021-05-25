import 'package:dodi/core/enums/selected_page_enum.dart';
import 'package:flutter/material.dart';

Align buildBottomAppBar(
    Size size, BuildContext context, SelectedPage selectedPage) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: size.height * .08,
      decoration: BoxDecoration(
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
                  color: Color(0xFFB0B0B0),
                ),
                if (selectedPage == SelectedPage.SHOP)
                  Text(
                    "Market",
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/evaluationOverview"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.bar_chart, color: Color(0xFFB0B0B0)),
                if (selectedPage == SelectedPage.OVERVIEW)
                  Text(
                    "Değerlendirme",
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
              ],
            ),
          ),
          GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, color: Color(0xFFB0B0B0)),
                if (selectedPage == SelectedPage.HOME)
                  Text(
                    "Ana Sayfa",
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/newClassSelectView"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book, color: Color(0xFFB0B0B0)),
                if (selectedPage == SelectedPage.TESTS)
                  Text(
                    "Testler",
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/chooseProfileExtra"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, color: Color(0xFFB0B0B0)),
                if (selectedPage == SelectedPage.PROFILE)
                  Text(
                    "Profil",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
