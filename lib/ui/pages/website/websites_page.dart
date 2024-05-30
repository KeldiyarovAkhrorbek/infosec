import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosec/raw.dart';
import 'package:infosec/ui/pages/videocourse/videos_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/color_changer.dart';

class WebSitesPage extends StatefulWidget {
  static const routeName = '/web-sites-page';

  @override
  State<WebSitesPage> createState() => _WebSitesPageState();
}

class _WebSitesPageState extends State<WebSitesPage> {
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
          'Veb-saytlar',
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
                  height: 10,
                ),
                itemBuilder: (context, index) => InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchUrl(Uri.parse(sites[index].url),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              FancyShimmerImage(
                                height: 70,
                                width: 100,
                                imageUrl: sites[index].image,
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
                                      sites[index].name,
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
                                        sites[index].description,
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Sayt turi: " + sites[index].type,
                                      style: GoogleFonts.ubuntu(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: sites.length,
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
