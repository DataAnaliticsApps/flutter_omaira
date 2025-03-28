import '/flutter_flow/flutter_flow_util.dart';
import 'transaction_e_d_i_t_widget.dart' show TransactionEDITWidget;
import 'package:flutter/material.dart';

class TransactionEDITModel extends FlutterFlowModel<TransactionEDITWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pg18rcyu' /* Please enter an amount */,
      );
    }

    return null;
  }

  // State field(s) for ProductName widget.
  FocusNode? productNameFocusNode1;
  TextEditingController? productNameTextController1;
  String? Function(BuildContext, String?)? productNameTextController1Validator;
  // State field(s) for ProductName widget.
  FocusNode? productNameFocusNode2;
  TextEditingController? productNameTextController2;
  String? Function(BuildContext, String?)? productNameTextController2Validator;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    productNameFocusNode1?.dispose();
    productNameTextController1?.dispose();

    productNameFocusNode2?.dispose();
    productNameTextController2?.dispose();
  }
}
