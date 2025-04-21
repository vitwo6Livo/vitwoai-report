import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class AllSalesRegisterList extends ConsumerStatefulWidget {
  const AllSalesRegisterList({super.key});

  @override
  ConsumerState<AllSalesRegisterList> createState() =>
      _AllSalesRegisterListState();
}

class _AllSalesRegisterListState extends ConsumerState<AllSalesRegisterList> {
  late final TextEditingController receivableSearchController;

  @override
  void initState() {
    super.initState();
    receivableSearchController = TextEditingController();
  }

  @override
  void dispose() {
    receivableSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterList =
        ref.watch(salesRegisterProvider(receivableSearchController.text));
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
          HandText.srAllSalesRegisterTitle,
          style: TextStyle(color: AppColor.appbarFont),
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
            alignment: Alignment.centerLeft,
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
                salesRegisterList.when(
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
                //
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
                          controller: receivableSearchController,
                          decoration: InputDecoration(
                            hintText: HandText.searchBox,
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ref.read(salesRegisterProvider(
                                receivableSearchController.text.toString()));
                          });
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.searchBttnColor,
                            border: Border.all(color: AppColor.cursonColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:
                              Icon(Icons.search, color: AppColor.lightFontCpy),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //
          Expanded(
              child: salesRegisterList.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.content.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Card(
                      color: AppColor.cardBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.content[index].items_ItemName,
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
                                  text: HandText.srItemCode,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].items_ItemCode,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srItemGroupName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .items_GoodsItems_goodGroupName,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.cardDataValueColor,
                                      ),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data
                                          .content[index].customer_Trade_name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerCode,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .customer_Customer_code,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerGSTNo,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .customer_Customer_gstin,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srKamCode,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].kam_KamCode,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srKamName,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].kam_KamName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srInvoiceNo,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].invoiceNo,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srInvoiceDate,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].invoiceDate,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
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
                                      text: data.content[index].items_Qty,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
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
                                      text: data.content[index].sub_total_amt,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
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
                                      text: data.content[index].allTotalAmount,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerAddress,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .customer_Customer_address_state,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srFunctionalArea,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.cardDataKeyColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .companyFunction_functionalities_name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.cardDataValueColor),
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
            loading: () => screen_shimmer(120, 800),
          )),
        ],
      ),
    );
  }
}
