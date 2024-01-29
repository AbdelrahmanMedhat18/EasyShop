import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:handling/logic/controller/setting_controller.dart';
import 'package:handling/utils/my_string.dart';

import '../../utils/text_utils.dart';
import '../../utils/theme.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({super.key});

  SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (_)=>Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: languageSettings,
                      ),
                      child: const Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextUtils(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      text: "Language".tr,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      textDecoration: TextDecoration.none,
                    ),
                  ],
                ),
              ),
              Container(
                // width: 120,
                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.black,width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconSize: 25,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          english,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: ene,
                      ),
                      DropdownMenuItem(
                        child: Text(
                          arabic,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: ara,
                      ),
                      DropdownMenuItem(
                        child: Text(
                          france,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        value: frf,
                      ),
                    ],
                    value: controller.langLocal,
                    onChanged: (String? value) {
                      controller.changeLanguage(value!);
                      Get.updateLocale(Locale(value));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
