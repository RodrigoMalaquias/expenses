import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      child: transactions.isEmpty? Column(
        children: [
          SizedBox(height: 20),
          Text(
            'No transactions registered',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
              ),
          )
        ],
      ) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('R\$${tr.value}')
                  ),
                ),
              ),
              title: Text(
                tr.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                DateFormat('d MMM y').format(tr.date)
              ),
              trailing: IconButton(
                onPressed: () => onRemove(tr.id), 
                icon: Icon(Icons.delete),
                color: Colors.red
              ),
            ),
          );
        },
      ),
    );
  }
}