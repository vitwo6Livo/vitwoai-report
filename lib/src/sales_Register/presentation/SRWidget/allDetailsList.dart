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
      backgroundColor: const Color(0xffff9f9f9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          HandText.srAllSalesRegisterTitle,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
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
              color: Colors.white,
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
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.search, color: Colors.white),
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
                      color: Colors.white,
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
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].items_ItemCode,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srItemGroupName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .items_GoodsItems_goodGroupName,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data
                                          .content[index].customer_Trade_name,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerCode,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .customer_Customer_code,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerGSTNo,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .customer_Customer_gstin,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srKamCode,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].kam_KamCode,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srKamName,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].kam_KamName,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srInvoiceNo,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].invoiceNo,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srInvoiceDate,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].invoiceDate,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srInvoiceQuantity,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].items_Qty,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srBaseValue,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].sub_total_amt,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srInvoiceValue,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index].allTotalAmount,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srCustomerAddress,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .customer_Customer_address_state,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ]),
                            ),
                            Text.rich(
                              TextSpan(
                                  text: HandText.srFunctionalArea,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: data.content[index]
                                          .companyFunction_functionalities_name,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black),
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
