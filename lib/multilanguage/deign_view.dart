import 'package:easy_localization/easy_localization.dart';
import 'package:expackpro/main.dart';
import 'package:flutter/material.dart';

class designview extends StatefulWidget {
  const designview({super.key});

  @override
  State<designview> createState() => _designviewState();
}

class _designviewState extends State<designview> {
  String isselected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DropdownButtonFormField(
            value: context.locale
                .languageCode, // Set initial selected value to the current locale's language
            items: const [
              DropdownMenuItem(
                value: "ta", // Tamil
                child: Text("Tamil"),
              ),
              DropdownMenuItem(
                value: "en", // English
                child: Text("English"),
              ),
              DropdownMenuItem(
                value: "es", // Spanish
                child: Text("Spanish"),
              ),
              DropdownMenuItem(
                value: "ur", // Urdu
                child: Text("Urdu"),
              ),
            ],
            onChanged: (value) {
              print("Selected language: $value");

              // Check the selected language and set the corresponding locale
              Locale selectedLocale;

              switch (value) {
                case 'ta':
                  selectedLocale = const Locale('ta', 'IN'); // Tamil (India)
                  break;
                case 'en':
                  selectedLocale =
                      const Locale('en', 'US'); // English (United States)
                  break;
                case 'es':
                  selectedLocale = const Locale('es', 'ES'); // Spanish (Spain)
                  break;
                case 'ur':
                  selectedLocale = const Locale('ur', 'PK'); // Urdu (Pakistan)
                  break;
                default:
                  selectedLocale =
                      const Locale('en', 'US'); // Default to English
              }

              // Set the new locale
              context.setLocale(selectedLocale);
            },
          ),
          DataTable(columns: [
            DataColumn(
              label: Text("Name".tr()),
            ),
            DataColumn(
              label: Text("AppName".tr()),
            )
          ], rows: [
            DataRow(cells: [
              DataCell(
                Text("name".tr()),
              ),
              DataCell(
                Text("app_name".tr()),
              )
            ])
          ])
        ],
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      // //       const Text("AppName"),
      // //       const SizedBox(
      //         height: 10,
      //       ),
      //       const Text("app_name").tr(),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       const Text("Name"),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       const Text("name").tr(),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             context.setLocale(const Locale("ta", "IN"));
      //           },
      //           child: const Text("Tamil")),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             context.setLocale(const Locale("en", "US"));
      //           },
      //           child: const Text("English")),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             context.setLocale(const Locale("es", "ES"));
      //           },
      //           child: const Text("Spanish")),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       ElevatedButton(
      //           onPressed: () {
      //             context.setLocale(const Locale("ur", "PK"));
      //           },
      //           child: const Text("Urdu")),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
