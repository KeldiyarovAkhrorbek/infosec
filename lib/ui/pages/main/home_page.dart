import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosec/helpers/secure_storage.dart';
import 'package:infosec/ui/pages/book/book_categories_page.dart';
import 'package:infosec/ui/pages/book/books_page.dart';
import 'package:infosec/ui/pages/news/news_page.dart';
import 'package:infosec/ui/pages/registration/login_page.dart';
import 'package:infosec/ui/pages/videocourse/video_categories_page.dart';
import 'package:infosec/ui/pages/website/websites_page.dart';

import '../../../helpers/color_changer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () async {
              await SecureStorage().deleteSecureData('token');
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginPage.routeName, (route) => false);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                HexColor('#0D1B2A'),
                HexColor('#1A1A1A'),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/image/logo.png',
                height: 170,
                width: 170,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'InfoSec',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GridView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor('#1E90FF').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(VideoCategoriesPage.routeName);
                      },
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/image/course.jpg',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Video darslar',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor('#1E90FF').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(WebSitesPage.routeName);
                      },
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/image/website.png',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Veb saytlar',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor('#1E90FF').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(BookCategoriesPage.routeName);
                      },
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/image/books.jpg',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Elektron kitoblar',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: HexColor('#1E90FF').withOpacity(0.5),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(NewsPage.routeName);
                      },
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/image/news.jpg',
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Kiber yangiliklar',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
