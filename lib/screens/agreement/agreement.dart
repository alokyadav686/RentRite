import 'package:flutter/material.dart';
import 'package:rentrite/contants/colors.dart';
import 'package:rentrite/screens/home/widget/custom_header.dart';

class Agreement extends StatefulWidget {
  const Agreement({super.key});

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();
  final TextEditingController ownerEmailController = TextEditingController();
  final TextEditingController tenantNameController = TextEditingController();
  final TextEditingController tenantPhoneController = TextEditingController();
  final TextEditingController tenantEmailController = TextEditingController();
  final TextEditingController rentAmountController = TextEditingController();
  final TextEditingController securityDepositController =
      TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: CustomHeader(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    _buildSectionTitle("Owner Details"),
                    SizedBox(height: 8),
                    _buildTextField("Full Name", ownerNameController),
                    _buildTextField("Phone Number", ownerPhoneController),
                    _buildTextField("Email", ownerEmailController),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    _buildSectionTitle("Tenants Details"),
                    SizedBox(height: 8),
                    _buildTextField("Full Name", tenantNameController),
                    _buildTextField("Phone Number", tenantPhoneController),
                    _buildTextField("Email", tenantEmailController),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    _buildSectionTitle("Agreement Duration"),
                    SizedBox(height: 8),
                    _buildDateField("From", fromDateController, context),
                    _buildDateField("To", toDateController, context),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    _buildSectionTitle("Financial Details"),
                    SizedBox(height: 8),
                    _buildTextField("Rent Amount (₹)", rentAmountController),
                    _buildTextField(
                      "Security Deposit (₹)",
                      securityDepositController,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: _clearForm,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: Text(
                    "Clear Form",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: Text(
                    "Download PDF",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            width: title.length * 12.0,
            height: 1.5,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(
    String label,
    TextEditingController controller,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                controller.text = "${pickedDate.toLocal()}".split(' ')[0];
              }
            },
          ),
        ),
        readOnly: true,
      ),
    );
  }

  void _clearForm() {
    ownerNameController.clear();
    ownerPhoneController.clear();
    ownerEmailController.clear();
    tenantNameController.clear();
    tenantPhoneController.clear();
    tenantEmailController.clear();
    rentAmountController.clear();
    securityDepositController.clear();
    fromDateController.clear();
    toDateController.clear();
  }
}
