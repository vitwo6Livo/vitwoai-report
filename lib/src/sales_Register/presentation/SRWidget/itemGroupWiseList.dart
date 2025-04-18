import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitwoai_report/golobal-Widget/shimmer_screen.dart';
import 'package:vitwoai_report/src/sales_Register/data/salesRegisterFatchData.dart';
import 'package:vitwoai_report/src/settings/colors.dart';
import 'package:vitwoai_report/src/settings/texts.dart';

class ItemGroupWiseScreen extends ConsumerStatefulWidget {
  @override
  _ItemGroupWiseScreenState createState() => _ItemGroupWiseScreenState();
}

class _ItemGroupWiseScreenState extends ConsumerState<ItemGroupWiseScreen> {
  late final TextEditingController itemGroupWiseSearchController;

  @override
  void initState() {
    super.initState();
    itemGroupWiseSearchController = TextEditingController();
  }

  @override
  void dispose() {
    itemGroupWiseSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final salesRegisterItemGroupWiseList = ref.watch(
        salesRegisterItemGroupProvider(
            itemGroupWiseSearchController.text.toString()));
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
          HandText.srItemGroupWiseTitle,
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
                salesRegisterItemGroupWiseList.when(
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
                          controller: itemGroupWiseSearchController,
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
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            ref.read(salesRegisterItemGroupProvider(
                                itemGroupWiseSearchController.text.toString()));
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
          Expanded(
            child: salesRegisterItemGroupWiseList.when(
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
                                        data.content[index].itemGroupName,
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
                                            text: HandText.srSOQuantity,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].soQuantity,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
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
                                                text: data.content[index]
                                                    .invoiceQuantity,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSOValueNet,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data
                                                    .content[index].soValueNet,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSOValueGross,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index]
                                                    .soValueGross,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
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
                                                text: data
                                                    .content[index].baseValue,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srCGST,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].cgst,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srSGST,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].sgst,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                            text: HandText.srIGST,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: data.content[index].igst,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
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
                                                text: data.content[index]
                                                    .invoiceValue,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
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
