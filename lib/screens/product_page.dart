import 'package:flutter/material.dart';
import 'package:project_last/modal/pro_detail_modal.dart';
import 'package:project_last/utils/routes_util.dart';

class product_page extends StatefulWidget {
  const product_page({Key? key}) : super(key: key);

  @override
  State<product_page> createState() => _product_pageState();
}

class _product_pageState extends State<product_page> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Product Details",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.cart_page);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: s.height,
              width: s.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(allProducts[index].thumbnail),
                fit: BoxFit.cover,
              )),
            ),
            Container(
              height: s.height * 0.4,
              width: s.width,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: s.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${allProducts[index].title}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${allProducts[index].price}",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: s.height * 0.03,
                    ),
                    Text(
                      "${allProducts[index].description}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        cart.add(allProducts[index]);
                      },
                      child: Container(
                        height: s.height,
                        width: s.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: s.width * 0.37,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
