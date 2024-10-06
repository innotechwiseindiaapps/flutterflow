import '/flutter_flow/flutter_flow_util.dart';
import 'training_tab_o4_copy_widget.dart' show TrainingTabO4CopyWidget;
import 'package:flutter/material.dart';

class TrainingTabO4CopyModel extends FlutterFlowModel<TrainingTabO4CopyWidget> {
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
