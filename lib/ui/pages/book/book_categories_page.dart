import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosec/raw.dart';
import 'package:infosec/ui/pages/book/books_page.dart';
import 'package:infosec/ui/pages/videocourse/videos_page.dart';

import '../../../helpers/color_changer.dart';

class BookCategoriesPage extends StatefulWidget {
  static const routeName = '/book-categories-page';

  @override
  State<BookCategoriesPage> createState() => _BookCategoriesPageState();
}

class _BookCategoriesPageState extends State<BookCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#0D1B2A'),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Kitoblar',
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
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
            tileMode: TileMode.clamp,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(BooksPage.routeName, arguments: {
                      'bookCategoryName': bookCategories[index].name,
                      'bookCategoryId': bookCategories[index].id,
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          FancyShimmerImage(
                            height: 70,
                            width: 100,
                            imageUrl: bookCategories[index].image,
                            boxFit: BoxFit.contain,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bookCategories[index].name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    bookCategories[index].description,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: bookCategories.length,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
