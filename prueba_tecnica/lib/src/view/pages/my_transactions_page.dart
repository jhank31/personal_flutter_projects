import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/src/model/transaction_model.dart';
import 'package:prueba_tecnica/src/provider/provider.dart';
import 'package:prueba_tecnica/src/services/firebase/firebase_services.dart';

class MyTransactionsPage extends StatelessWidget {
  const MyTransactionsPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<MyDataProvider>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: FutureBuilder(
            future: getTransactions(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final List<TransactionModel> listTransactions = snapshot.data;
                return ListView.builder(
                  itemCount: listTransactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    DateTime date =
                        DateTime.parse(listTransactions[index].date.toString());
                    String formattedDate =
                        DateFormat('dd-MM-yyyy HH:mm:ss').format(date);
                    String formattedAmount = myData.formatCurrency(
                        listTransactions[index].amountTranferred);
                    return Card(
                      elevation: 4,
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fecha: $formattedDate',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: textStyle(),
                            ),
                            Text(
                              'Cuenta de origen: ${listTransactions[index].originAccount}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: textStyle(),
                            ),
                            Text(
                              'Cuenta de destino: ${listTransactions[index].destinationAccount}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: textStyle(),
                            ),
                            Text(
                              'Monto: $formattedAmount',
                              style: textStyle(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  }
}


