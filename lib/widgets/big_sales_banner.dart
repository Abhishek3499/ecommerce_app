import 'package:flutter/material.dart';

class BigSalesBanner extends StatelessWidget {
  const BigSalesBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 150,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFFF7B500),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/big_sales_banner/Big Sale Banner (1).png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
