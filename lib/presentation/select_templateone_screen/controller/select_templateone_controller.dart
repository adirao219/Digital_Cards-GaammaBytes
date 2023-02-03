import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/select_templateone_screen/models/select_templateone_model.dart';class SelectTemplateoneController extends GetxController {Rx<SelectTemplateoneModel> selectTemplateoneModelObj = SelectTemplateoneModel().obs;

SelectionPopupModel? selectedDropDownValue;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; selectTemplateoneModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); selectTemplateoneModelObj.value.dropdownItemList.refresh(); } 
 }
