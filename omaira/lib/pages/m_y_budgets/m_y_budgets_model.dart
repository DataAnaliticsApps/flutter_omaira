import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'm_y_budgets_widget.dart' show MYBudgetsWidget;
import 'package:flutter/material.dart';

class MYBudgetsModel extends FlutterFlowModel<MYBudgetsWidget> {
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
