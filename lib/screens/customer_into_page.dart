import 'package:flutter/material.dart';
import 'package:project_last/modal/pro_modal.dart';
import 'package:project_last/modal/pro_detail_modal.dart';
import 'package:project_last/utils/routes_util.dart';

import '../components/mySnackbar.dart';

class CustomerIntroPage extends StatefulWidget {
  const CustomerIntroPage({Key? key}) : super(key: key);

  @override
  State<CustomerIntroPage> createState() => _customer_into_pageState();
}

class _customer_into_pageState extends State<CustomerIntroPage> {
  String? firstName;
  String? lastName;
  String? contact;
  String? email;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
          ),
        ),
        title: Text(
          " Customer Informetoin ",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                allProducts.add(
                  Contacts(
                    firstName: firstName!,
                    lastName: lastName!,
                    contact: contact!,
                    email: email!,
                  ) as Product,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  mySnackBar(text: "Successful!!", color: Colors.green),
                );
                Navigator.of(context).pushNamed(MyRoutes.invoice_preview_page);
              }
            },
            icon: Icon(
              Icons.done,
            ),
          ),
        ],
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: s.height * 0.02,
                ),
                Text(
                  "First Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    hintText: "Enter First Name",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter the Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    firstName = val!;
                  },
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Text(
                  "Last Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    hintText: "Enter Last Name",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter the Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    lastName = val;
                  },
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    hintText: "dhvani@gmail.com",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter the Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    email = val;
                  },
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                      ),
                    ),
                    hintText: "+91 6352036854",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter the Name";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    contact = val;
                  },
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
