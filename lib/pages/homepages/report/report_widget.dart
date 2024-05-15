import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    this.glowUpReportPost,
    this.glowUpReportCommon,
  });

  final GlowUpPostRecord? glowUpReportPost;
  final GlowUpPostCommentRecord? glowUpReportCommon;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  late ReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 62.0,
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 32.0,
            ),
            onPressed: () async {
              setState(() {
                FFAppState().GlowUpPauseVideo = false;
              });
              context.pop();
            },
          ),
          title: Text(
            'Report',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'MiSans',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 7.0),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Wrap(
                      spacing: 9.0,
                      runSpacing: 9.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 163.0,
                          height: 72.0,
                          decoration: BoxDecoration(
                            color: _model.glowUpReportChecked ==
                                    GlowUpReportType.Politicalsensitivity
                                ? FlutterFlowTheme.of(context).logoColor
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.glowUpReportChecked =
                                    GlowUpReportType.Politicalsensitivity;
                              });
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Political sensitivity',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SourceHanSans',
                                          color: _model.glowUpReportChecked ==
                                                  GlowUpReportType
                                                      .Politicalsensitivity
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .growUpReportText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/GrowUp_key_reportChecked.png',
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 163.0,
                          height: 72.0,
                          decoration: BoxDecoration(
                            color: _model.glowUpReportChecked ==
                                    GlowUpReportType.Violentpornography
                                ? FlutterFlowTheme.of(context).logoColor
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.glowUpReportChecked =
                                    GlowUpReportType.Violentpornography;
                              });
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Violent pornography',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SourceHanSans',
                                          color: _model.glowUpReportChecked ==
                                                  GlowUpReportType
                                                      .Violentpornography
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .growUpReportText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/GrowUp_key_reportChecked.png',
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 163.0,
                          height: 72.0,
                          decoration: BoxDecoration(
                            color: _model.glowUpReportChecked ==
                                    GlowUpReportType.Advertisingharassment
                                ? FlutterFlowTheme.of(context).logoColor
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.glowUpReportChecked =
                                    GlowUpReportType.Advertisingharassment;
                              });
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Advertising \nharassment',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SourceHanSans',
                                          color: _model.glowUpReportChecked ==
                                                  GlowUpReportType
                                                      .Advertisingharassment
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .growUpReportText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/GrowUp_key_reportChecked.png',
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 163.0,
                          height: 72.0,
                          decoration: BoxDecoration(
                            color: _model.glowUpReportChecked ==
                                    GlowUpReportType.Infringement
                                ? FlutterFlowTheme.of(context).logoColor
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.glowUpReportChecked =
                                    GlowUpReportType.Infringement;
                              });
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Infringement',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SourceHanSans',
                                          color: _model.glowUpReportChecked ==
                                                  GlowUpReportType.Infringement
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .growUpReportText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/GrowUp_key_reportChecked.png',
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 163.0,
                          height: 72.0,
                          decoration: BoxDecoration(
                            color: _model.glowUpReportChecked ==
                                    GlowUpReportType.Other
                                ? FlutterFlowTheme.of(context).logoColor
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.glowUpReportChecked =
                                    GlowUpReportType.Other;
                              });
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Other',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SourceHanSans',
                                          color: _model.glowUpReportChecked ==
                                                  GlowUpReportType.Other
                                              ? FlutterFlowTheme.of(context)
                                                  .info
                                              : FlutterFlowTheme.of(context)
                                                  .growUpReportText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/GrowUp_key_reportChecked.png',
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 189.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 12.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.none,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SourceHanSans',
                                    color: const Color(0xFFAAACB3),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w100,
                                    useGoogleFonts: false,
                                  ),
                              alignLabelWithHint: true,
                              hintText:
                                  'Describe more clear reporting information',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'SourceHanSans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w100,
                                    useGoogleFonts: false,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            textAlign: TextAlign.start,
                            maxLines: 7,
                            maxLength: 50,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 113.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (widget.glowUpReportPost != null) {
                              await widget.glowUpReportPost!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'Glow_Up_ReportedList':
                                        FieldValue.arrayUnion([
                                      getGlowUpReportsFirestoreData(
                                        updateGlowUpReportsStruct(
                                          GlowUpReportsStruct(
                                            glowUpReportTime:
                                                getCurrentTimestamp,
                                            glowUpReportContent:
                                                _model.textController.text,
                                            glowUpReportType:
                                                _model.glowUpReportChecked,
                                          ),
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            } else {
                              await widget.glowUpReportCommon!.reference
                                  .update(createGlowUpPostCommentRecordData(
                                glowUpReportedList: updateGlowUpReportsStruct(
                                  GlowUpReportsStruct(
                                    glowUpReportTime: getCurrentTimestamp,
                                    glowUpReportContent:
                                        _model.textController.text,
                                    glowUpReportType:
                                        _model.glowUpReportChecked,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                            }

                            context.safePop();
                          },
                          text: 'Submit',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 46.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).logoColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
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
      ),
    );
  }
}
