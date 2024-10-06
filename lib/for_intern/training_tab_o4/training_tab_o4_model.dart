import '/flutter_flow/flutter_flow_util.dart';
import 'training_tab_o4_widget.dart' show TrainingTabO4Widget;
import 'package:flutter/material.dart';

class TrainingTabO4Model extends FlutterFlowModel<TrainingTabO4Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
