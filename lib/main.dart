import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: Colors.green,
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
        MyRoutes.home: (context) => Builder(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Search product",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Color(0xffebeaef),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(29.0),
                            child: Container(
                              height: 53,
                              width: double.infinity,
                              child: EasySearchBar(
                                backgroundColor: Colors.white,
                                title: const Text(
                                  "",
                                ),
                                onSearch: (value) =>
                                    setState(() => searchValue = value),
                                suggestions: _suggestion,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment(-0.8, 0),
                            child: Text(
                              "Found\n10 Results",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                       children: [
                         Container(
                           height: 120,
                           width: 100,
                           child: Image.network("https://in.pinterest.com/pin/213217363596485056/"),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                         ),

                      //   Column(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Align(
                      //       alignment: Alignment(-0.8, 0),
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         height: 200,
                      //         width: 150,
                      //         child: Image.network(
                      //           "https://in.pinterest.com/pin/213217363596485056/",
                      //         ),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //           color: Colors.blue,
                      //         ),
                      //
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Align(
                      //       alignment: Alignment(-0.8, 0),
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         height: 200,
                      //         width: 150,
                      //         child: Text(
                      //           "hello",
                      //           style: TextStyle(color: Colors.black),
                      //         ),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(10),
                      //           color: Colors.blue,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
                         ]
                      ),
                    ],
                  ),
                ),

                backgroundColor: Color(0xffebeaef),
              );
            }
            ),
      },
    );
  }
}
