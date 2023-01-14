import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AbcdWidget extends StatefulWidget {
  const AbcdWidget({Key? key}) : super(key: key);

  @override
  _AbcdWidgetState createState() => _AbcdWidgetState();
}

class _AbcdWidgetState extends State<AbcdWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _address = TextEditingController();
  final _destination = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(31, 78, 70, 70),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0.85),
                child: Container(
                  width: 400,
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.85, -0.6),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: Color(0xFF4949C1),
                            size: 18,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.6, -0.6),
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
                          alignment: AlignmentDirectional(-0.5, 0.45),
                          child: TextFormField(
                            controller: _destination,
                            decoration: const InputDecoration(
                              labelText: 'Destination',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.85, -0.6),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: Color(0xFF4949C1),
                            size: 18,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.85, 0.15),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircle,
                            color: Color(0xFF72B104),
                            size: 18,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.6, 0.15),
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
                          alignment: AlignmentDirectional(-0.5, -0.3),
                          child: TextFormField(
                            controller: _address,
                            decoration: const InputDecoration(
                                labelText: 'Your address',
                                border: OutlineInputBorder()),
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
