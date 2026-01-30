import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/profile/profile_settings_screen.dart';
import 'package:ecommerceapp/screens/profile/shipping_address_screen.dart';
import 'package:ecommerceapp/screens/settings/country_selection_screen.dart';
import 'package:ecommerceapp/screens/settings/language_selection_screen.dart';
import 'package:ecommerceapp/screens/settings/currency_selection_screen.dart';
import 'package:ecommerceapp/screens/settings/size_selection_screen.dart';
import 'package:ecommerceapp/widgets/account/delete_account_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontFamily: "raleway",
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Personal Section
          _buildSectionHeader('Personal'),
          _buildSettingsItem(
            title: 'Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileSettingsScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Shipping Address',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShippingAddressScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(title: 'Payment methods', onTap: () {}),

          const SizedBox(height: 30),

          // Shop Section
          _buildSectionHeader('Shop'),
          _buildSettingsItem(
            title: 'Country',
            value: 'India',
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountrySelectionScreen(),
                ),
              );
              // Handle selected country if needed
            },
          ),
          _buildSettingsItem(
            title: 'Currency',
            value: '\$ USD',
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrencySelectionScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(
            title: 'Sizes',
            value: 'UK',
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SizeSelectionScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(title: 'Terms and Conditions', onTap: () {}),

          const SizedBox(height: 30),

          // Account Section
          _buildSectionHeader('Account'),
          _buildSettingsItem(
            title: 'Language',
            value: 'English',
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguageSelectionScreen(),
                ),
              );
            },
          ),
          _buildSettingsItem(title: 'About Slada', onTap: () {}),
          const SizedBox(height: 20),
          _buildSettingsItem(
            title: 'Delete My Account',
            onTap: () => DeleteAccountDialog.show(context),
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          fontFamily: "raleway",
          color: Color(0xFF202020),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required String title,
    String? value,
    required VoidCallback onTap,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFE5E5E5), width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "raleway",
                  fontWeight: FontWeight.w600,
                  color: textColor ?? const Color(0xFF202020),
                ),
              ),
            ),
            if (value != null) ...[
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "raleway",
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF000000),
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (textColor == null)
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF666666),
              ),
          ],
        ),
      ),
    );
  }
}
