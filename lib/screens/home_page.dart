import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_last/utils/routes_util.dart';
import '../modal/pro_detail_modal.dart';
import '../modal/pro_modal.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int i = 0;
  String myCategory = "";
  List<Product?> myProducts = [];

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories
                      .map(
                        (c) => ElevatedButton(
                      onPressed: () {
                        setState(() {
                          myCategory = c;
                          myProducts = allProducts.map((e) {
                            if (e.category == c) {
                              return e;
                            }
                          }).toList();
                          myProducts
                              .removeWhere((element) => element == null);
                        });
                      },
                      child: Text(c),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.03,
            ),
            Expanded(
              flex: 12,
              child: (myCategory.isEmpty)
                  ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3 / 2,
                  crossAxisSpacing: 8,
                ),
                itemCount: allProducts.length,
                      itemBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MyRoutes.product_page,
                              arguments: index,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  allProducts[index].thumbnail,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  allProducts[index].like =
                                  !allProducts[index].like;

                                  if (allProducts[index].like) {
                                    favourite.add(allProducts[index]);
                                  } else {
                                    favourite.remove(allProducts[index]);
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: allProducts[index].like
                                    ? Colors.red
                                    : Colors.white,
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
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "\$ ${allProducts[index].price}",
                        style: TextStyle(
                          color: Colors.amber,
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
              )
                  : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3 / 2,
                  crossAxisSpacing: 8,
                ),
                itemCount: myProducts.length,
                itemBuilder: (context, index) {
                  if (myProducts[index]!.category == myCategory) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    myProducts[index]!.thumbnail),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                        Text(
                          "${myProducts[index]!.title}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          "\$ ${myProducts[index]!.price}",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.02,
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: s.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          MyRoutes.home_page,
                        );
                      },
                      icon: Icon(
                        Icons.home,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          MyRoutes.favourite_page,
                          arguments: i,
                        );
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          MyRoutes.cart_page,
                          arguments: i,
                        );
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 33,
                      ),
                    ),
                  ],
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