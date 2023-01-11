import 'package:flutter_application_1/pages/sign-in.dart';
import 'package:flutter_application_1/pages/sign-up.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xFF0D1724),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF514BC3), Color(0xFF4048BF)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, -0.5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 134, 0, 0),
                                  child: SelectionArea(
                                      child: Text(
                                    'CarMate',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 32,
                                        ),
                                  )),
                                ),
                              ),
                              SelectionArea(
                                  child: Text(
                                'Get There',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                              )),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 48.5, 0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  ),
                                  child: Image.network(
                                    'https://blog.autoslash.com/wp-content/uploads/2022/09/First_Time_Rental-1024x576.jpg',
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.3788,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInWidget()));
                          },
                          text: 'Sign-in',
                          options: FFButtonOptions(
                            width: 315,
                            height: MediaQuery.of(context).size.height * 0.09,
                            color: Color(0xFF514BC3),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpWidget()));
                          },
                          text: 'Get Started',
                          options: FFButtonOptions(
                            width: 315,
                            height: MediaQuery.of(context).size.height * 0.09,
                            color: Color(0xFF514BC3),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 31.84, 0, 0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
