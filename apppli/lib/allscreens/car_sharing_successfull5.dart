import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FhgjWidget extends StatefulWidget {
  const FhgjWidget({Key? key}) : super(key: key);

  @override
  _FhgjWidgetState createState() => _FhgjWidgetState();
}

class _FhgjWidgetState extends State<FhgjWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 350,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -0.9),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 8, 0, 0),
                      child: Text(
                        'Car sharing successful',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF4048BF),
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0.1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                      child: Text(
                        'Your offer has been confirmed !\nYou will recieve a notification if someone wants to share with you.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF969696),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
