import 'package:flutter/material.dart';
import 'package:waste_management_app/extensions/date_time_extensions.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key, this.totalAmount});

  final String? totalAmount;

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Transaction> transactions = [
    Transaction(
      binNumber: 'WXY123456',
      method: 'MOMO',
      amount: '10.00',
      status: 'Completed',
    ),
    Transaction(
      binNumber: 'WXY256743',
      method: 'Card',
      amount: '50.00',
      status: 'Pending',
    ),
    Transaction(
      binNumber: 'WXY128496',
      method: 'Cash',
      amount: '100.00',
      status: 'Failed',
    ),
  ];

  List<Transaction> transactionsPastWeek = [
    Transaction(
      binNumber: 'WXY123456',
      method: 'MOMO',
      amount: '10.00',
      status: 'Completed',
    ),
    Transaction(
      binNumber: 'WXY256743',
      method: 'Card',
      amount: '50.00',
      status: 'Pending',
    ),
    Transaction(
      binNumber: 'WXY128496',
      method: 'Cash',
      amount: '100.00',
      status: 'Failed',
    ),
    Transaction(
      binNumber: 'WXY357159',
      method: 'Card',
      amount: '150.50',
      status: 'Completed',
    ),
    Transaction(
      binNumber: 'WXY456852',
      method: 'MOMO',
      amount: '25.00',
      status: 'Failed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: AppStrings.transactionsCaps,
      body: Expanded(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Text(
              'Today',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            ...transactions.map((e) => transactionCard(e)),
            const SizedBox(height: 16),
            const Text(
              'Past Week',
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            ...transactionsPastWeek.map((e) => transactionCard(e)),
          ],
        ),
      ),
    );
  }

  Widget transactionCard(Transaction transaction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transactionDetail(
                    title: 'Bin Number', detail: transaction.binNumber),
                const SizedBox(height: 8),
                transactionDetail(
                    title: 'Amount', detail: 'GH₵ ${transaction.amount}'),
                const SizedBox(height: 8),
                Text(DateTime.now().friendlySlashDate()),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transactionDetail(title: 'Method', detail: transaction.method),
                const SizedBox(height: 8),
                transactionDetail(
                  title: 'Status',
                  detail: transaction.status,
                  isStatus: true,
                  transaction: transaction,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget transactionDetail(
      {required String title,
      required String detail,
      bool isStatus = false,
      Transaction? transaction}) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: AppColors.darkBlueText,
          fontFamily: 'Nunito',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        text: '$title: ',
        children: <TextSpan>[
          TextSpan(
            style: TextStyle(
                color: isStatus
                    ? transaction?.statusColor()
                    : AppColors.darkBlueText,
                fontFamily: 'Nunito',
                fontSize: 13,
                fontWeight: FontWeight.w400),
            text: detail,
          ),
        ],
      ),
    );
  }
}
