import 'package:flutter/widgets.dart';

class Expenselog extends StatelessWidget {
  Expenselog(this.amount, this.expensetitle);
  String amount;
  String expensetitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Amount: $amount'),
        const SizedBox(
          width: 5,
        ),
        Text('- $expensetitle')
      ],
    );
  }
}
