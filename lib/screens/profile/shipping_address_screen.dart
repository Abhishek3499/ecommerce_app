import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/settings/country_selection_screen.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  String selectedCountry = 'Choose your country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 APP BAR
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

      // 🔹 BODY
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            const Text(
              'Shipping Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "raleway",
                color: Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 30),

            // 🔹 COUNTRY SELECT
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top small label text
                const Text(
                  'Country',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "raleway",
                    color: Color(0xFF202020),
                  ),
                ),
                const SizedBox(height: 8),
                // Tappable container row
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountrySelectionScreen(),
                      ),
                    );

                    if (result != null) {
                      setState(() {
                        selectedCountry = result;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4FE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedCountry,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "raleway",
                              color: Color(0xFF666666),
                            ),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Color(0xFF004CFF),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 ADDRESS
            _label('Address'),
            _inputField(),

            const SizedBox(height: 20),

            // 🔹 TOWN / CITY
            _label('Town / City'),
            _inputField(),

            const SizedBox(height: 20),

            // 🔹 POSTCODE
            _label('Postcode'),
            _inputField(),

            const SizedBox(height: 20),

            // 🔹 PHONE NUMBER
            _label('Phone Number'),
            _inputField(),

            const Spacer(),

            // 🔹 SAVE BUTTON
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004CFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "raleway",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔹 LABEL WIDGET
  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: "raleway",
        color: Color(0xFF202020),
      ),
    );
  }

  // 🔹 INPUT FIELD WIDGET
  Widget _inputField() {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Required',
          hintStyle: TextStyle(
            fontSize: 16,
            fontFamily: "raleway",
            color: Color(0xFF666666),
          ),
          filled: true,
          fillColor: Color(0xFFF1F4FE),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(
          fontSize: 16,
          fontFamily: "raleway",
          color: Color(0xFF666666),
        ),
      ),
    );
  }
}
