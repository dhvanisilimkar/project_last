import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_last/utils/pro_util.dart';
import 'package:project_last/utils/routes_util.dart';

void main() => runApp(
      const Myapp(),
    );

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool isGrid = false;
  bool isDark = false;
  String searchValue = '';
  final List<String> _suggestion = ['hello ', 'hello2', 'hello3', 'hello4'];
  // List<Map<dynamic, dynamic>> allProductsData,
  // bool ProductsData = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        brightness: Brightness.dark,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          // backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        MyRoutes.home: (context) => Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(
                      " product",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    // backgroundColor: Color(0xffebeaef),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        icon: Icon(
                          isDark
                              ? Icons.lightbulb_circle_outlined
                              : Icons.dark_mode_outlined,
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.all(20),
                      //   child: Icon(Icons.more_vert_sharp),
                      // )
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
                              onSearch: (value) =>
                                  setState(() => searchValue = value),
                              suggestions: _suggestion,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: allProducts.length,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                title: Text(allProducts[index].title),
                                leading: CircleAvatar(
                                  foregroundImage: NetworkImage(
                                      allProducts[index].thumbnail),
                                ),
                                subtitle: Text(
                                  allProducts[index].description,
                                  maxLines: 2,
                                ),
                                trailing: Text(
                                  allProducts[index].price.toString(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        icon:
                        Icon(Icons.add);
                      });
                    },
                  ),
                );
              },
            ),
      },
    );
  }
}
