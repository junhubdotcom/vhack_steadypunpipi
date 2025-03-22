import 'package:flutter/material.dart';

SearchBar searchBar() {
  return SearchBar(
    leading: Icon(
      Icons.search,
      color: Colors.black,
    ),
    hintText: 'Search',
    backgroundColor: WidgetStateProperty.all(Colors.white),
    shadowColor: WidgetStateProperty.all(Colors.black54),
    elevation: WidgetStateProperty.all(4),
    padding: WidgetStateProperty.all(EdgeInsets.only(left: 18, right: 18)),
  );
}
