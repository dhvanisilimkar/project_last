import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_last/utils/routes_util.dart';
import '../modal/pro_util.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  String searchValue = '';
  final List<String> _suggestion = ['hello ', 'hello2', 'hello3', 'hello4'];

  int i = 0;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.favourite_page);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.cart_page);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(29.0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: EasySearchBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    "Your Product Search..",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onSearch: (value) => setState(() => searchValue = value),
                  suggestions: _suggestion,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4 / 2,
                    crossAxisSpacing: 9,
                  ),
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MyRoutes.favourite_page,
                              arguments: index,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    NetworkImage(allProducts[index].thumbnail),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  allProducts[index].like =
                                      !allProducts[index].like;

                                  if (allProducts[index]) {
                                    favourite.add(allProducts[index]);
                                  } else {
                                    favourite.removeAt(index);
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: allProducts[index].like
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                      Text(
                        "${allProducts[index].title}",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                      Text(
                        "${allProducts[index].title}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "\$ ${allProducts[index].price}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
