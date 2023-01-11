import 'package:flutter_application_1/pages/inputemail.dart';
import 'package:flutter_application_1/pages/inputname.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPwdWidget extends StatefulWidget {
  const InputPwdWidget({Key? key}) : super(key: key);
  static String password = '';

  @override
  _InputPwdWidgetState createState() => _InputPwdWidgetState();
}

class _InputPwdWidgetState extends State<InputPwdWidget> {
  TextEditingController? textController;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
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
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(3, 75, 153, 0),
                          child: SelectionArea(
                              child: Text(
                            'Enter your password',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                          )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(31, 75, 146, 0),
                        child: TextFormField(
                          controller: textController,
                          autofocus: true,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            hintText: '********',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4048BF),
                                width: 1,
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (textController != null) {
                              InputPwdWidget.password = textController!.text;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InputnameWidget()));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
