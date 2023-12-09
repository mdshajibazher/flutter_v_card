import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v_card/models/contact_model.dart';

import '../constant.dart';

class FormPage extends StatefulWidget {
  static const String routeName = '/form';

  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final designationController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [IconButton(onPressed: _saveContact, icon: Icon(Icons.save))],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.person),
                labelText: 'Contact Name *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Contact name must not be empty';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              controller: mobileController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.phone),
                labelText: 'Mobile Number *',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Mobile Number must not be empty';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.email),
                labelText: 'Email Address',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: companyController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.label),
                labelText: 'Company Name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: designationController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.badge),
                labelText: 'Designation',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.streetview),
                labelText: 'Street Address',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.url,
              controller: websiteController,
              decoration: const InputDecoration(
                border: textFieldBorder,
                prefixIcon: Icon(Icons.web),
                labelText: 'Website',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveContact() async {
    if (formKey.currentState!.validate()) {
      //AlertDialog(title: Text('Error'),);

      final contact = ContactModel(
        name: nameController.text,
        mobile: mobileController.text,
        email: emailController.text,
        company: companyController.text,
        designation: designationController.text,
        address: addressController.text,
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    designationController.dispose();
    companyController.dispose();
    addressController.dispose();
    websiteController.dispose();
    super.dispose();
  }
}
