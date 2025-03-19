import 'package:flutter/material.dart';
import 'package:vitwoai_report/src/settings/colors.dart';

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

  void showSelectionBottomSheet(BuildContext context, String title,
      List<String> options, Function(String) onSelected, IconData iconName) {
    String? selectedOption;

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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: selectedOption != null
                              ? () {
                                  onSelected(selectedOption!);
                                  Navigator.of(context).pop();
                                }
                              : null,
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.grey),
                    Expanded(
                      child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          String option = options[index];
                          return ListTile(
                            leading: Icon(iconName, color: Colors.blueAccent),
                            title: Text(option),
                            trailing: Radio<String>(
                              value: option,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                selectedOption = option;
                              });
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
              color: Colors.blueAccent,
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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text("General Setting",
              style: TextStyle(color: Colors.white)),
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
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
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
                  "Choose Date Format",
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
                    const Text(
                      "Date format",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedDateFormat,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey,
                          ),
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
                print("presssed Default use screen");
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Default use screen",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
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
                    "Choose Currency",
                    [
                      "INR",
                      "USD",
                      "GBP",
                      "IDFC",
                      "FNP",
                      "UME",
                      "EUR",
                      "JPY",
                      "CNY"
                    ],
                    updateCurrency,
                    Icons.paid);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Currency",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectedCurrency,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
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
                  "Choose Day",
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
                    const Text(
                      "First day of the week",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectDayOfWeek,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
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
                    "Choose First Date of Month",
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First day of month",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "This month: 02/01/2025 - 02/28/2025",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectFirstDayOfMonth,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
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
                    "Choose First Month of Year",
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First month of year",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "This year: 01/01/2025 - 12/31/2025",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          selectFirstMonthOfYear,
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
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
          ],
        ));
  }
}
