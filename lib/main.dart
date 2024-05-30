import 'package:flutter/material.dart';
import 'package:infosec/ui/pages/book/book_categories_page.dart';
import 'package:infosec/ui/pages/book/book_categories_page.dart';
import 'package:infosec/ui/pages/book/books_page.dart';
import 'package:infosec/ui/pages/book/books_page.dart';
import 'package:infosec/ui/pages/main/home_page.dart';
import 'package:infosec/ui/pages/news/news_page.dart';
import 'package:infosec/ui/pages/news/news_page.dart';
import 'package:infosec/ui/pages/registration/login_page.dart';
import 'package:infosec/ui/pages/splash/splash_page.dart';
import 'package:infosec/ui/pages/videocourse/video_categories_page.dart';
import 'package:infosec/ui/pages/videocourse/videos_page.dart';
import 'package:infosec/ui/pages/website/websites_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: SplashPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        VideoCategoriesPage.routeName: (context) => VideoCategoriesPage(),
        VideosPage.routeName: (context) => VideosPage(),
        WebSitesPage.routeName: (context) => WebSitesPage(),
        BookCategoriesPage.routeName: (context) => BookCategoriesPage(),
        BooksPage.routeName: (context) => BooksPage(),
        NewsPage.routeName: (context) => NewsPage(),
      },
    );
  }
}
