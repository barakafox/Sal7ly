import 'package:flutter/material.dart';
import 'package:sal7ly/Registeration/login.dart';

class SignUpPageWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _phoneController = TextEditingController();
    final _nationalIdController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _emailController = TextEditingController(); // New controller
    String _selectedService = 'Electrical';
    String _selectedUserType = 'User';

    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Sign Up'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Name Text Field
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                // Email Text Field
                TextFormField(
                  controller: _emailController, // New email controller
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    // Simple email validation
                    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    final regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                // Password Text Field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                // Phone Text Field
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                // National ID Text Field
                TextFormField(
                  controller: _nationalIdController,
                  decoration: InputDecoration(
                    labelText: 'National ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your National ID';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                // User Type Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedUserType,
                  decoration: InputDecoration(
                    labelText: 'User Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  items: ['User','Technician']
                      .map((type) => DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  ))
                      .toList(),
                  onChanged: (value) {
                    _selectedUserType = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a User Type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),

                // Service Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedService,
                  decoration: InputDecoration(
                    labelText: 'Select Service',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                  items: ['Electrical', 'Painter', 'Plumbing', 'Conditioning', 'Carpentry']
                      .map((service) => DropdownMenuItem<String>(
                    value: service,
                    child: Text(service),
                  ))
                      .toList(),
                  onChanged: (value) {
                    _selectedService = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a Service';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0,),

                // Description Text Field
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.purple.shade700),
                    ),
                  ),
                  maxLines: 3, // Allow multiple lines for the description
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),

                ElevatedButton(
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {
                      // Process data
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (contex) => LoginPage()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}