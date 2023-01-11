import 'package:flutter_application_1/pages/sign-in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/service/flutterfire.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotemailpasswordWidget extends StatefulWidget {
  const ForgotemailpasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgotemailpasswordWidgetState createState() =>
      _ForgotemailpasswordWidgetState();
}

class _ForgotemailpasswordWidgetState extends State<ForgotemailpasswordWidget> {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  void forgetPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future passswordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
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
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 75, 153, 0),
                          child: SelectionArea(
                              child: Text(
                            'Enter your e-mail',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                          )),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.05, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(50, 25, 100, 0),
                          child: TextFormField(
                            controller: textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Exemple@gmail.com',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF4048BF),
                                  width: 1,
                                ),
                              ),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            passswordReset(textController!.text);
                          },
                          text: 'send code',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
