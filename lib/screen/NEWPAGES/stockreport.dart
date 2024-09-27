import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sqlorder24/components/commoncolor.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../SALES/print_report.dart';

class StockReport extends StatefulWidget {
  const StockReport({Key? key}) : super(key: key);

  @override
  State<StockReport> createState() => _StockReportState();
}

class _StockReportState extends State<StockReport> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<Controller>(context, listen: false)
  //       .selectStockandProdfromDB(context);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // bottomNavigationBar: Consumer<Controller>(
      //   builder: (context, value, child) => Container(
      //     color: Colors.yellow,
      //     height: size.height * 0.06,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         // Text(" Total :   "),
      //         // Text(
      //         //   "\u{20B9}${value.saleReportTotal.toStringAsFixed(2)}",
      //         //   style: TextStyle(fontWeight: FontWeight.bold),
      //         // )
      //       ],
      //     ),
      //   ),
      // ),
      body: Consumer<Controller>(
        builder: (context, value, child) => SingleChildScrollView(
          child: value.isLoading
              ? Container(
                  height: size.height * 0.6,
                  child: Center(
                    child: SpinKitCircle(
                      color: P_Settings.salewaveColor,
                    ),
                  ),
                )
              : value.prodstockList.length == 0
                  ? Container(
                      height: size.height * 0.6,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'asset/noData1.png',
                              height: size.height * 0.09,
                              fit: BoxFit.cover,
                              color: P_Settings.collection1,
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Text(
                              "No Stock Report",
                              style: TextStyle(
                                fontSize: 18,
                                color: P_Settings.collection1,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: size.width,
                          child: DataTable(
                            border: TableBorder.all(width: 1),
                            showBottomBorder: true,
                            // datatable widget
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 224, 223, 223)),
                            columns: [
                              // column to set the name
                              DataColumn(
                                label: Container(
                                    // width: 40,
                                    child: Text(
                                  'Item ',
                                  style: TextStyle(fontSize: 12),
                                )),
                              ),
                             
                              DataColumn(
                                label: Text(
                                  'Stock',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                               DataColumn(
                                label: Text(
                                  'Sale',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                               DataColumn(
                                label: Text(
                                  'Balance',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                            rows: value
                                .prodstockList // Loops through dataColumnText, each iteration assigning the value to element
                                .map(
                                  ((element) => DataRow(
                                        cells: <DataCell>[
                                          DataCell(Container(
                                            // width: 40,
                                            child: Text(
                                              "${element["pritem"]} ( ${element["prcode"].toString()} )",
                                              style: TextStyle(fontSize: 12),
                                              // element["sale_Num"]
                                            ),
                                          )), //Extracting from Map element the value                     
                                          DataCell(Text(
                                            element["OpStock"].toString(),
                                            style: TextStyle(fontSize: 12),
                                          )),
                                          DataCell(Text(
                                            element["SalesQty"].toStringAsFixed(1),
                                            style: TextStyle(fontSize: 12),
                                          )),
                                          DataCell(Text(
                                            element["BalStock"].toStringAsFixed(1),
                                            style: TextStyle(fontSize: 12),
                                          )),
                                        ],
                                      )),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
