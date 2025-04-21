import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class SalesRegisterSOScreen extends ConsumerStatefulWidget {
  @override
  _SalesRegisterSOScreenState createState() => _SalesRegisterSOScreenState();
}

class _SalesRegisterSOScreenState extends ConsumerState<SalesRegisterSOScreen> {
  late final TextEditingController searchItem;

  @override
  void initState() {
    super.initState();
    searchItem = TextEditingController();
  }

  @override
  void dispose() {
    searchItem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterSOList =
        ref.watch(salesRegisterSOProvider(searchItem.text.toString()));
    return Scaffold(
      backgroundColor: AppColor.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.appBarIcon,
            )),
        title: Text(
          HandText.srSOWiseTitle,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: AppColor.appBarIcon,
              )),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColor.appBarColor1, AppColor.appBarColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              height: 80,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: AppColor.lightFontCpy,
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  salesRegisterSOList.when(
                    data: (value) {
                      return Text(
                        "${HandText.totalRecords} ${value.totalElements.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                    error: (error, stack) =>
                        Center(child: Text('${HandText.errorMessage} $error')),
                    loading: () => Text(HandText.loadingMessage),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 9,
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          height: 40,
                          child: TextField(
                            controller: searchItem,
                            decoration: InputDecoration(
                              hintText: HandText.searchBox,
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 104, 181, 244),
                                  width: 2.0,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                            ),
                            cursorHeight: 20,
                            cursorColor: AppColor.cursonColor,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              ref.read(
                                  salesRegisterSOProvider(searchItem.text));
                            });
                            print("Sooooooooooooo Pressssssssss");
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.searchBttnColor,
                              border: Border.all(color: AppColor.cursonColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.search,
                              color: AppColor.lightFontCpy,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: salesRegisterSOList.when(
                data: (data) {
                  return data.content.isEmpty
                      ? Center(
                          child: Text(HandText.noData),
                        )
                      : ListView.builder(
                          itemCount: data.content.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.content[index].soNumber,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSODate,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    data.content[index].soDate,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSOQuantity,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].soQuantity,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srInvoiceQuantity,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index]
                                                    .invoiceQuantity,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSOValueNet,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].soValueNet,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSOValueGross,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index]
                                                    .soValueGross,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srBaseValue,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].baseValue,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srCGST,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].cgst,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSGST,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].sgst,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srIGST,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].igst,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srInvoiceValue,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColor.cardDataKeyColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index]
                                                    .invoiceValue,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColor
                                                        .cardDataValueColor),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
                error: (error, stack) =>
                    Center(child: Text('${HandText.errorMessage} $error')),
                loading: () => screen_shimmer(120, 800)),
          ),
        ],
      ),
    );
  }
}
