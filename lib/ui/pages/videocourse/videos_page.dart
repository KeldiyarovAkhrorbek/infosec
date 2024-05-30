import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infosec/raw.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/color_changer.dart';
import '../../../models/video_course.dart';

class VideosPage extends StatefulWidget {
  static const routeName = '/videos-page';

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  String courseName = '';
  int courseID = 0;

  List<VideoCourse> videos = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    courseName = args['courseName'];
    courseID = args['courseID'];
    videoCourses.forEach((element) {
      if (element.videoCategoryId == courseID) {
        videos.add(element);
      }
    });
  }

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
          courseName,
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
                    await launchUrl(Uri.parse(videos[index].url),
                        mode: LaunchMode.externalApplication);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 220,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FancyShimmerImage(
                            height: 70,
                            width: 100,
                            imageUrl: videos[index].image,
                            boxFit: BoxFit.contain,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                videos[index].name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  videos[index].description,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: videos.length,
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
