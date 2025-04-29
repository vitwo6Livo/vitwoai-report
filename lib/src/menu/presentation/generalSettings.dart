import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class GeneralSettingScreen extends StatefulWidget {
  const GeneralSettingScreen({super.key});

  @override
  State<GeneralSettingScreen> createState() => _GeneralSettingScreenState();
}

class _GeneralSettingScreenState extends State<GeneralSettingScreen> {
  String selectedDateFormat = "MM/dd/yyyy";
  String selectedCurrency = "INR";
  String selectDayOfWeek = "Monday";
  String selectFirstDayOfMonth = "1";
  String selectFirstMonthOfYear = "January";
  String selectDefaultScreen = 'Dashboard';

  void showSelectionBottomSheet(
      BuildContext context,
      String title,
      List<String> options,
      Function(String) onSelected,
      IconData iconName) async {
    const savedOptionKey = "SavedOption";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? selectedOption = sharedPreferences.getString(savedOptionKey);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: AppColor.menuDivider),
                    Expanded(
                      child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final option = options[index];
                          return ListTile(
                            leading: Icon(iconName,
                                color: AppColor.bottomSheetOptionIconColor),
                            title: Text(option),
                            trailing: Radio<String>(
                              value: option,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    selectedOption = value;
                                  });
                                  sharedPreferences.setString(
                                      savedOptionKey, value);
                                  onSelected(value);
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            onTap: () {
                              setState(() {
                                selectedOption = option;
                              });
                              sharedPreferences.setString(
                                  savedOptionKey, option);
                              onSelected(option);
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget selectionOption(inconName, BuildContext context, String option,
      Function(String) onSelected) {
    return InkWell(
      onTap: () {
        onSelected(option);
        Navigator.of(context).pop();
      },
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              inconName,
              color: AppColor.selectedOptionColor,
            ),
          ],
        ),
      ),
    );
  }

  void updateDateFormat(String format) {
    setState(() {
      selectedDateFormat = format;
    });
  }

  void updateCurrency(String format) {
    setState(() {
      selectedCurrency = format;
    });
  }

  void updateFirstDayWeek(String format) {
    setState(() {
      selectDayOfWeek = format;
    });
  }

  void updateFirstDayOfMonth(String format) {
    setState(() {
      selectFirstDayOfMonth = format;
    });
  }

  void updateFirstMonthOfYear(String format) {
    setState(() {
      selectFirstMonthOfYear = format;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.appBarIcon,
              )),
          title: Text(HandText.menuGeneralSettingsTitle,
              style: TextStyle(color: AppColor.appbarFont)),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.appBarColor1, AppColor.appBarColor2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.done,
                  color: AppColor.appBarIcon,
                ),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showSelectionBottomSheet(
                  context,
                  HandText.genSettDateBttmSheetTitle,
                  ["MM/dd/yyyy", "dd/MM/yyyy", "yyyy/MM/dd"],
                  updateDateFormat,
                  Icons.calendar_today,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HandText.menuGenSettDateFormatTitle,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedDateFormat,
                          style: TextStyle(
                              color: AppColor.selectedOptionColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: AppColor.menuGenSettOptionArrowColor2,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: AppColor.menuGenSettOptionDivider,
            ),
            // InkWell(
            //   onTap: () {
            //     print("presssed Default use screen");
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           HandText.menuGenSettDefaultScrTitle,
            //           style: const TextStyle(fontWeight: FontWeight.w400),
            //         ),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text(
            //               selectDefaultScreen,
            //               style: TextStyle(
            //                   color: AppColor.selectedOptionColor,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //             const SizedBox(
            //               width: 5,
            //             ),
            //             Icon(
            //               Icons.arrow_forward_ios,
            //               size: 16,
            //               color: AppColor.menuGenSettOptionArrowColor2,
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(
            //   color: Colors.grey[200],
            // ),
            InkWell(
              onTap: () {
                showSelectionBottomSheet(
                    context,
                    HandText.genSettChooseCurrencyBttmSheetTitle,
                    [
                      "INR",
                      "USD",
                    ],
                    updateCurrency,
                    Icons.paid);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HandText.menuGenSettCurrencyTitle,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedCurrency,
                          style: TextStyle(
                              color: AppColor.selectedOptionColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColor.menuGenSettOptionArrowColor2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
            ),
            InkWell(
              onTap: () {
                showSelectionBottomSheet(
                  context,
                  HandText.genSettChooseDayBttmSheetTitle,
                  [
                    "Monday",
                    "Tuesday",
                    "Wednesday",
                    "Thursday",
                    "Friday",
                    "Saturday",
                    "Sunday"
                  ],
                  updateFirstDayWeek,
                  Icons.calendar_today,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      HandText.menuGenSettSelect_WeekTitle,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectDayOfWeek,
                          style: TextStyle(
                              color: AppColor.selectedOptionColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColor.menuGenSettOptionArrowColor2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
            ),
            InkWell(
              onTap: () {
                showSelectionBottomSheet(
                    context,
                    HandText.genSettSelect_FirstDayBttmSheetTitle,
                    [
                      "1",
                      "2",
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                      "10",
                      "11",
                      "12",
                      "13",
                      "14",
                      "15",
                      "16",
                      "17",
                      "18",
                      "19",
                      "20",
                      "21",
                      "22",
                      "23",
                      "24",
                      "25",
                      "26",
                      "27",
                      "28",
                      "29",
                      "30"
                    ],
                    updateFirstDayOfMonth,
                    Icons.calendar_month);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          HandText.menuGenSettSelect_DayTitle,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "This month: 02/01/2025 - 02/28/2025",
                          style: TextStyle(
                              color: AppColor.menuGenSettOptionBelowTxtColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectFirstDayOfMonth,
                          style: TextStyle(
                              color: AppColor.selectedOptionColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColor.menuGenSettOptionArrowColor2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: AppColor.menuGenSettOptionDivider,
            ),
            InkWell(
              onTap: () {
                showSelectionBottomSheet(
                    context,
                    HandText.genSettSelect_FirstMonthBttmSheetTitle,
                    [
                      "January",
                      "February",
                      "March",
                      "April",
                      "May",
                      "June",
                      "July",
                      "August",
                      "September",
                      "October",
                      "November",
                      "December"
                    ],
                    updateFirstMonthOfYear,
                    Icons.calendar_month);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          HandText.menuGenSettSelect_YearTitle,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "This year: 01/01/2025 - 12/31/2025",
                          style: TextStyle(
                              color: AppColor.menuGenSettOptionBelowTxtColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectFirstMonthOfYear,
                          style: TextStyle(
                              color: AppColor.selectedOptionColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColor.menuGenSettOptionArrowColor2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: AppColor.menuGenSettOptionDivider,
            ),
          ],
        ));
  }
}
