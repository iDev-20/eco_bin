import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waste_management_app/components/bottom_sheets.dart';
import 'package:waste_management_app/extensions/date_time_extensions.dart';
import 'package:waste_management_app/models/ui_models.dart';
import 'package:waste_management_app/navigation/navigation.dart';
import 'package:waste_management_app/providers/transaction_provider.dart';
import 'package:waste_management_app/resources/app_colors.dart';
import 'package:waste_management_app/resources/app_page.dart';
import 'package:waste_management_app/resources/app_strings.dart';
import 'package:waste_management_app/views/pages/pickup/request_pickup_page.dart';
import 'package:waste_management_app/views/pages/transactions/transaction_details_bottom_sheet.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key, this.totalAmount});

  final String? totalAmount;

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: AppStrings.transactionsCaps,
      body: Consumer<TransactionProvider>(
        builder: (context, txProvider, child) {
          final transactions = txProvider.transactions.reversed.toList();

          final today = transactions
              .where((tx) =>
                  tx.createdAt.day == DateTime.now().day &&
                  tx.createdAt.month == DateTime.now().month &&
                  tx.createdAt.year == DateTime.now().year)
              .toList();

          final yesterday = transactions
              .where((tx) =>
                  tx.createdAt.isAfter(
                      DateTime.now().subtract(const Duration(days: 1))) &&
                  !(tx.createdAt.day == DateTime.now().day &&
                      tx.createdAt.month == DateTime.now().month &&
                      tx.createdAt.year == DateTime.now().year))
              .toList();

          final last7days = transactions
              .where((tx) =>
                  tx.createdAt.isAfter(
                      DateTime.now().subtract(const Duration(days: 7))) &&
                  !(tx.createdAt.day == DateTime.now().day &&
                      tx.createdAt.month == DateTime.now().month &&
                      tx.createdAt.year == DateTime.now().year))
              .toList();

          return Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                if (today.isNotEmpty) ...[
                  const Text(
                    'Today',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  ...today.map((e) => transactionCard(e)),
                  const SizedBox(height: 16),
                ],
                if (yesterday.isNotEmpty) ...[
                  const Text(
                    'Yesterday',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  ...yesterday.map((e) => transactionCard(e)),
                ],
                if (last7days.isNotEmpty) ...[
                  const Text(
                    'Last 7 days',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  ...last7days.map((e) => transactionCard(e)),
                ],
                if (transactions.isEmpty)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'No transactions yet—',
                            style: TextStyle(
                                color: AppColors.darkBlueText,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigation.navigateToScreen(
                                  context: context,
                                  screen: const RequestPickupPage());
                            },
                            child: const Text(
                              'get started',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget transactionCard(TransactionModel transaction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          showAppBottomSheet(
            context: context,
            title: 'Waste Types Collected',
            child: TransactionDetailBottomSheet(
              selectedWasteTypes: transaction.selectedItemsWithQuantity,
              status: transaction.status,
              statusColor: transaction.statusColor()
            ),
          );
        },
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
                  // transactionDetail(
                  //     title: 'Bin Number', detail: transaction.binNumber),
                  // const SizedBox(height: 8),
                  transactionDetail(
                      title: 'Amount', detail: 'GH₵ ${transaction.amount}'),
                  const SizedBox(height: 8),
                  transactionDetail(
                      title: 'Created ',
                      detail: transaction.createdAt.transactionDateTime()),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  transactionDetail(
                      title: 'Method', detail: transaction.method),
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
      ),
    );
  }

  Widget transactionDetail(
      {required String title,
      required String detail,
      bool isStatus = false,
      TransactionModel? transaction}) {
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
