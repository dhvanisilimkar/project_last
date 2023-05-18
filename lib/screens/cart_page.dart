import 'package:flutter/material.dart';
import 'package:project_last/utils/routes_util.dart';

import '../modal/pro_modal.dart';
import '../modal/pro_util.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int ind = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.favourite_page);
            },
            icon: Icon(
              Icons.favorite_outlined,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) => Card(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  foregroundImage: NetworkImage(
                    cart[index].thumbnail,
                  ),
                ),
                SizedBox(
                  width: s.width * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: s.width * 0.27,
                      child: Text(
                        "${cart[index].title} ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: s.height * 0.004,
                    ),
                    Text(
                      "\$ ${cart[index].price} ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: s.width * 0.03,
                ),
                FloatingActionButton(
                  onPressed: () {
                    // setState(() {
                    //   // if (Products.cartPro > 1) {
                    //   //   Products.cartPro--;
                    //   }
                    // // });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "-",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  backgroundColor: Colors.black,
                  mini: true,
                ),
                SizedBox(
                  width: s.width * 0.03,
                ),
                Text(
                  "${index} ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: s.width * 0.02,
                ),
                FloatingActionButton(
                  onPressed: () {
                    cartValue.add(
                      Cart(cartPro: index),
                    );
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  backgroundColor: Colors.black,
                  mini: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
