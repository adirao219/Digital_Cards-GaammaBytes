import 'package:digitalcards_gaammabytes/core/app_export.dart';import 'package:digitalcards_gaammabytes/presentation/footer_screen/models/footer_model.dart';class FooterController extends GetxController {Rx<FooterModel> footerModelObj = FooterModel().obs;

SelectionPopupModel? selectedDropDownValue;

SelectionPopupModel? selectedDropDownValue1;

SelectionPopupModel? selectedDropDownValue2;

SelectionPopupModel? selectedDropDownValue3;

SelectionPopupModel? selectedDropDownValue4;

@override void onReady() { super.onReady(); } 
@override void onClose() { super.onClose(); } 
onSelected(dynamic value) { selectedDropDownValue = value as SelectionPopupModel; footerModelObj.value.dropdownItemList.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); footerModelObj.value.dropdownItemList.refresh(); } 
onSelected1(dynamic value) { selectedDropDownValue1 = value as SelectionPopupModel; footerModelObj.value.dropdownItemList1.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); footerModelObj.value.dropdownItemList1.refresh(); } 
onSelected2(dynamic value) { selectedDropDownValue2 = value as SelectionPopupModel; footerModelObj.value.dropdownItemList2.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); footerModelObj.value.dropdownItemList2.refresh(); } 
onSelected3(dynamic value) { selectedDropDownValue3 = value as SelectionPopupModel; footerModelObj.value.dropdownItemList3.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); footerModelObj.value.dropdownItemList3.refresh(); } 
onSelected4(dynamic value) { selectedDropDownValue4 = value as SelectionPopupModel; footerModelObj.value.dropdownItemList4.forEach((element) {element.isSelected = false; if (element.id == value.id) {element.isSelected = true;}}); footerModelObj.value.dropdownItemList4.refresh(); } 
 }
