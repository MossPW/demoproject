import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? _selectedGender;
  String? _selectedProvince;
  bool _acceptTerms = false;

  final List<String> _provinces = [
    'Bangkok',
    'Chiang Mai',
    'Phuket',
    'Khon Kaen'
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedGender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select your gender")),
        );
        return;
      }
      if (_selectedProvince == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select your province")),
        );
        return;
      }
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("You must accept the terms and conditions")),
        );
        return;
      }

      // ถ้าผ่านทุกเงื่อนไข แสดงผลข้อมูลที่กรอก
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Registration Successful"),
          content: Text("Name: ${nameController.text}\n"
              "Email: ${emailController.text}\n"
              "Gender: $_selectedGender\n"
              "Province: $_selectedProvince\n"
              "Accepted Terms: Yes"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form (620720028)")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ชื่อ-นามสกุล
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // อีเมล
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // เพศ (Radio Button)
              Text("Gender"),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text("Male"),
                      leading: Radio<String>(
                        value: "Male",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("Female"),
                      leading: Radio<String>(
                        value: "Female",
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // จังหวัด (Dropdown)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Province"),
                value: _selectedProvince,
                items: _provinces.map((province) {
                  return DropdownMenuItem(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProvince = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select a province" : null,
              ),
              SizedBox(height: 10),

              // ยอมรับเงื่อนไข (Checkbox)
              CheckboxListTile(
                title: const Text('Accept Terms & Conditions'),
                value: _acceptTerms,
                onChanged: (value) {
                  setState(() {
                    _acceptTerms = value!;
                  });
                },
              ),

              SizedBox(height: 20),

              // ปุ่ม Submit
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
