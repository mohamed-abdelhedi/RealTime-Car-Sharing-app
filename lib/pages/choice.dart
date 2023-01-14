import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/allscreens/passengerapp/pickdropp2.dart';
import 'package:flutter_application_1/allscreens/riderapp/pickdropoff2.dart';

class ChosingWidget extends StatefulWidget {
  const ChosingWidget({Key? key}) : super(key: key);

  @override
  _ChosingWidgetState createState() => _ChosingWidgetState();
}

class _ChosingWidgetState extends State<ChosingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String email = "";
  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
  }

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
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0xFF0D1724),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 268, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            PermissionStatus locationstatus =
                                await Permission.location.request();
                            if (locationstatus == PermissionStatus.granted) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pickdrop2()));
                            }
                          },
                          text: 'Requast a Car',
                          options: FFButtonOptions(
                            width: 315,
                            height: 56,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 68, 0, 0),
                        child: Text(
                          'OR',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 68, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            PermissionStatus locationstatus =
                                await Permission.location.request();
                            if (locationstatus == PermissionStatus.granted) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()));
                            }
                          },
                          text: 'Share your car',
                          options: FFButtonOptions(
                            width: 315,
                            height: 56,
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
