import 'package:flutter/widgets.dart';

class Expenselog extends StatelessWidget {
  const Expenselog(this.amount, this.expensetitle, {Key? expenselog})
      : super(key: expenselog);
  final String amount;
  final String expensetitle;
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
