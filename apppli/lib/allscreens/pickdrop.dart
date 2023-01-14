import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_mate/allscreens/confmap3.dart';

class AbcdWidget extends StatefulWidget {
  const AbcdWidget({Key? key}) : super(key: key);

  @override
  _AbcdWidgetState createState() => _AbcdWidgetState();
}

class _AbcdWidgetState extends State<AbcdWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -0.15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.6, -0.8),
                          child: Text(
                            'PICK UP',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF8D8D8E),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.85, -0.8),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: Color(0xFF4949C1),
                            size: 18,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.85, 0),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: Color(0xFF72B104),
                            size: 18,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.6, 0),
                          child: Text(
                            'DROP OFF',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF8D8D8E),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.5, 0.3),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
                            child: TextFormField(
                              controller: textController1,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0x40ffffff),
                                  fontSize: 18,
                                ),
                                hintText: 'Destination',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0x40FFFFFF),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.5, -0.5),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(65, 0, 0, 0),
                            child: TextFormField(
                              controller: textController2,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0x40FFFFFF),
                                  fontSize: 18,
                                ),
                                hintText: 'Current localization',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0x40FFFFFF),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.83),
                          // ignore: unnecessary_new
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () {
                                _navigateToNextScreen(context);
                              },
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(0, 91, 86, 143)),
                              ),
                            ),
                            //new BorderRadius BorderRadius.circular(8),

                            width: 130.0,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MainScreen2()));
}
