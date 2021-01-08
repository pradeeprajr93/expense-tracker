import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double fillPercentage;
  final double totalSpending;

  ChartBar(this.label, this.totalSpending, this.fillPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrainsts) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: constrainsts.maxHeight * 0.15,
            child: FittedBox(
                child: Text(
              '\$${totalSpending.toStringAsFixed(0)}',
            )),
          ),
          SizedBox(
            height: constrainsts.maxHeight * 0.05,
          ),
          Container(
            height: constrainsts.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: fillPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: constrainsts.maxHeight * 0.05,
          ),
          Container(
            height: constrainsts.maxHeight * 0.15,
            child: Text(label),
          )
        ],
      );
    });
  }
}
