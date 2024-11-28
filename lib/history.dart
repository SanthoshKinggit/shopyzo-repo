// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  int selectedTabIndex = 0;

  DateTime? _selectedDate;

  final List<String> tabs = ['History', 'Scheduled', 'Requested'];

  final List<PaymentItem> paymentItems = [
    PaymentItem(
      icon: 'M',
      name: "McDonald's Orders",
      dateTime: 'Dec 24, 2024 | 10:25 PM',
      amount: -25,
      backgroundColor: Colors.red,
      isCompanyIcon: true,
    ),
    PaymentItem(
      icon: 'A',
      name: 'Airbnb Royalty',
      dateTime: 'Dec 24, 2024 | 09:37 AM',
      amount: 225,
      backgroundColor: Colors.orange,
      isCompanyIcon: true,
    ),
    PaymentItem(
      icon: 'N',
      name: 'Netflix Subscription',
      dateTime: 'Dec 24, 2024 | 09:30 AM',
      amount: -15,
      backgroundColor: Colors.redAccent,
      isCompanyIcon: true,
    ),
    PaymentItem(
      icon: 'H',
      name: 'Hannah Burress',
      dateTime: 'Dec 23, 2024 | 08:45 AM',
      amount: 60,
      backgroundColor: Colors.teal,
      isCompanyIcon: true,
    ),
  ];

  Future<void> _openCalendar(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'In & Out Payment',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () => _openCalendar(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabs(),
          const SizedBox(height: 10),
          Expanded(child: _buildPaymentList()),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabs.asMap().entries.map((entry) {
          final isSelected = entry.key == selectedTabIndex;
          return GestureDetector(
            onTap: () => setState(() => selectedTabIndex = entry.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? null
                    : Border.all(color: Colors.grey[300]!, width: 1),
              ),
              child: Text(
                entry.value,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPaymentList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: paymentItems.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = paymentItems[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              _buildIcon(item),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.dateTime,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${item.amount < 0 ? '-' : ''}\$${item.amount.abs()}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: item.amount < 0 ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIcon(PaymentItem item) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: item.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          item.icon,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PaymentItem {
  final String icon;
  final String name;
  final String dateTime;
  final double amount;
  final Color backgroundColor;
  final bool isCompanyIcon;

  PaymentItem({
    required this.icon,
    required this.name,
    required this.dateTime,
    required this.amount,
    required this.backgroundColor,
    required this.isCompanyIcon,
  });
}
