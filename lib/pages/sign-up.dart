import 'package:flutter_application_1/pages/inputemail.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);
  static String phoneNumber = '';
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: '+216');
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
      backgroundColor: Color(0xFF0D1724),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.6, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(50, 41, 100, 0),
                        child: SelectionArea(
                            child: Text(
                          'Enter your phone number',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                        )),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.05, -0.05),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.6, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    45, 106, 0, 0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: TextFormField(
                                    controller: textController1,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: '+999',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF4048BF),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 106, 80, 0),
                                child: TextFormField(
                                  controller: textController2,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF4048BF),
                                        width: 1,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0x00FFFFFF),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            1, 0, 0, 0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          if (textController2 != null) {
                            SignUpWidget.phoneNumber =
                                textController1!.text + textController2!.text;
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InputMailWidget()));
                        },
                        text: 'Accept and Continue',
                        options: FFButtonOptions(
                          width: 315,
                          height: MediaQuery.of(context).size.height * 0.08,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
