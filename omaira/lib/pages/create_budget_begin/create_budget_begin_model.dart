import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_budget_begin_widget.dart' show CreateBudgetBeginWidget;
import 'package:flutter/material.dart';

class CreateBudgetBeginModel extends FlutterFlowModel<CreateBudgetBeginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ProductName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for StockInicial widget.
  FocusNode? stockInicialFocusNode;
  TextEditingController? stockInicialTextController;
  String? Function(BuildContext, String?)? stockInicialTextControllerValidator;
  // State field(s) for UPCcode widget.
  FocusNode? uPCcodeFocusNode;
  TextEditingController? uPCcodeTextController;
  String? Function(BuildContext, String?)? uPCcodeTextControllerValidator;
  // State field(s) for Valor widget.
  FocusNode? valorFocusNode;
  TextEditingController? valorTextController;
  String? Function(BuildContext, String?)? valorTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  BudgetsRecord? crearDocumento;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    stockInicialFocusNode?.dispose();
    stockInicialTextController?.dispose();

    uPCcodeFocusNode?.dispose();
    uPCcodeTextController?.dispose();

    valorFocusNode?.dispose();
    valorTextController?.dispose();
  }
}
