import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/select_templatetwo_screen/models/select_templatetwo_model.dart';class SelectTemplatetwoController extends GetxController {Rx<SelectTemplatetwoModel> selectTemplatetwoModelObj = SelectTemplatetwoModel().obs;

SelectionPopupModel? selectedDropDownValue;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; selectTemplatetwoModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); selectTemplatetwoModelObj.value.dropdownItemList.refresh(); } 
 }
