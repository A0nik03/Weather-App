import 'package:api/Models/Weathh.dart';
import 'package:api/fetch.dart';
import 'package:api/glassmo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  final myController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: WeatherData.getData(
              myController.text.isEmpty ? "Aligarh" : myController.text),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Image(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=872&q=80"),
                        height: size.height,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                      Glass(
                        height: size.height,
                        width: size.width,
                        opacity: 0.5,
                        blur: 20,
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: search == true
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            search = true;
                                          });
                                        },
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                      search == false
                                          ? Text(
                                              "Weather",
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                      color: Colors.white,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            )
                                          : Container(
                                              height: size.height * 0.038,
                                              width: size.width * 0.85,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: TextField(
                                                    controller: myController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    cursorOpacityAnimates: true,
                                                    style: GoogleFonts.aBeeZee(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Enter a City Name",
                                                      errorText: _validate
                                                          ? "Must Enter a City Name"
                                                          : null,
                                                    )),
                                              ),
                                            ),
                                      search == false
                                          ? Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  search = true;
                                                  myController.text.isEmpty
                                                      ? _validate = true
                                                      : _validate = false;
                                                });
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Text("GO",
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15))),
                                                decoration: BoxDecoration(
                                                    color: Colors.blueAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Expanded(
                                child: Container(
                                  height: size.height * 0.43,
                                  width: size.width * 0.95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              snapshot.data!.name.toString(),
                                              style: GoogleFonts.aBeeZee(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: size.height * 0.25,
                                                width: size.width * 0.25,
                                                child: Image.asset(
                                                    "weather/${snapshot.data!.weather![index].icon}.png",
                                                    scale: 0.78),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                height: size.height * 0.35,
                                                width: size.width * 0.32,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 10),
                                                    Expanded(
                                                      child: Text(
                                                        "${snapshot.data!.main!.temp.toString().substring(0, 2)}°",
                                                        style: GoogleFonts.aBeeZee(
                                                            color: Colors.white,
                                                            fontSize: 110,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 40),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .weather![index]
                                                              .description
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 35),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Container(
                                              height: size.height * 0.35,
                                              width: size.width * 0.16,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height:
                                                            size.height * 0.1,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .orangeAccent
                                                              .withOpacity(
                                                                  0.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 8),
                                                            Image.asset(
                                                              "icons/windspeed.png",
                                                              height:
                                                                  size.height *
                                                                      0.044,
                                                            ),
                                                            Text(
                                                              "Windspeed",
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
                                                            ),
                                                            Text(
                                                              "${snapshot.data!.wind!.speed.toString()}m/s",
                                                              style: GoogleFonts.aBeeZee(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.8),
                                                                  fontSize:
                                                                      10),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height:
                                                            size.height * 0.1,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.orange
                                                              .withOpacity(
                                                                  0.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 8),
                                                            Image.asset(
                                                              "icons/humidity.png",
                                                              height:
                                                                  size.height *
                                                                      0.044,
                                                            ),
                                                            Text(
                                                              "Humidity",
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
                                                            ),
                                                            Text(
                                                              "${snapshot.data!.main!.humidity.toString()}%",
                                                              style: GoogleFonts.aBeeZee(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.8),
                                                                  fontSize:
                                                                      10),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        height:
                                                            size.height * 0.1,
                                                        width:
                                                            size.width * 0.13,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.orange
                                                              .withOpacity(
                                                                  0.1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 8),
                                                            Image.asset(
                                                              "icons/pressure.png",
                                                              height:
                                                                  size.height *
                                                                      0.044,
                                                            ),
                                                            Text(
                                                              "Pressure",
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          10),
                                                            ),
                                                            Text(
                                                              "${snapshot.data!.main!.pressure.toString()}pa",
                                                              style: GoogleFonts.aBeeZee(
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.8),
                                                                  fontSize:
                                                                      10),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1.2,
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Text(
                                  "Comfort Level",
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                              SizedBox(height: 20),
                              SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                  customWidths: CustomSliderWidths(
                                      progressBarWidth: 15,
                                      trackWidth: 15,
                                      shadowWidth: 5),
                                  size: 200,
                                  animationEnabled: true,
                                  customColors: CustomSliderColors(
                                      dynamicGradient: true,
                                      trackColor: Colors.blue.withOpacity(0.6),
                                      dotColor: Colors.white,
                                      shadowMaxOpacity: 10,
                                      progressBarColors: [
                                        Colors.greenAccent,
                                        Colors.deepPurpleAccent,
                                      ]),
                                  animDurationMultiplier: 5,
                                  infoProperties: InfoProperties(
                                    bottomLabelText: "Humidity",
                                    bottomLabelStyle: GoogleFonts.aBeeZee(
                                        color: Colors.orangeAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    mainLabelStyle: GoogleFonts.aBeeZee(
                                        color: Colors.white, fontSize: 45),
                                  ),
                                ),
                                min: 0,
                                max: 100,
                                initialValue:
                                    snapshot.data!.main!.humidity!.toDouble(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Feels Like:${snapshot.data!.main!.feelsLike!.toDouble()}",
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.orangeAccent,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "Gust:${snapshot.data!.wind!.gust!.toDouble()}",
                                    style: GoogleFonts.aBeeZee(
                                      color: Colors.orangeAccent,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]);
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
