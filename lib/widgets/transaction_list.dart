import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTx;

  TransactionList(this.transactionList, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          height: 300,
          child: transactionList.isEmpty
              ? Column(
                  children: [
                    Text(
                      'No transactions found!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset(
                        'assets/images/waiting.png',
                      ),
                    )
                  ],
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                        elevation: 5,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: FittedBox(
                                child: Text(
                                  '\$${transactionList[index].amount.toStringAsFixed(2)}',
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            transactionList[index].title,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          subtitle: Text(
                            DateFormat.yMMMd()
                                .format(transactionList[index].date),
                          ),
                          trailing: MediaQuery.of(context).size.width > 420
                              ? FlatButton.icon(
                                  icon: Icon(Icons.delete),
                                  label: Text('Delete'),
                                  textColor: Theme.of(context).errorColor,
                                  onPressed: () {
                                    deleteTx(transactionList[index].id);
                                  },
                                )
                              : IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Theme.of(context).errorColor,
                                  onPressed: () {
                                    deleteTx(transactionList[index].id);
                                  },
                                ),
                        ));
                  },
                  itemCount: transactionList.length,
                ),
        );
      },
    );
  }
}
