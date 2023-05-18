import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_last/modals/pro_detai_modal.dart';
import 'package:project_last/modal/pro_modal.dart';
import 'package:project_last/modal/pro_detail_modal.dart';
import 'package:project_last/utils/routes_util.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.favourite_page,
              );
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
        backgroundColor: Colors.black,
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
                                    MyRoutes.
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
                                            allProducts[index].thumbnail),
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
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: i,
        onTap: (val) {
          setState(() {
            i = val;
          });
        },
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
    );
  }
}
