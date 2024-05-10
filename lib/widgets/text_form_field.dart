import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});

  @override
  State<TextFormFieldExample> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormFieldState<String>> _passwordKey =
      GlobalKey<FormFieldState<String>>();

  // nullable
  String? _name;
  String? _phonenumber;
  String? _email;
  String? _password;

  // validator function or validator method
  String? _validateName(String? value){
    if(value?.isEmpty ?? false){
      return 'Name is required.';
    }

    final RegExp nameExp =RegExp(r'^[A-Za-z ]+$');
    if(!nameExp.hasMatch(value!)){
      return 'Please enter only alphabetical characters';
    }

    return null;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
          // *Name Form*
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person_2_rounded),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),

              onSaved: (String? value){
                _name = value;
                print('name = $_name');
              },

              validator: _validateName,
            ),

            // Phone Number Section
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.phone),
                  hintText: 'How can we catch up?',
                  labelText: 'Phone Number *',
                  prefixText: '+95'
              ),
              keyboardType: TextInputType.phone,
              onSaved: (String? value){
                _phonenumber = value;
                print('phonenumber = $_phonenumber');
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),

          const SizedBox(height: 24.0),
          //  Email Form*
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: false,
                icon: Icon(Icons.email),
                hintText: 'fill your email address',
                labelText: 'E-mail *',
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value){
                _email = value;
                print('email = $_email');
              },
            ),

            const SizedBox(height: 24.0),
          //  "Life Story " form
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short, this is just demo',
                labelText: 'Life story',
              ),
              maxLines: 3,
            ),

          //   Salary form
            const SizedBox(height: 24.0),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Salary',
                prefixText: '\$',
                suffixText: 'USD',
                suffixStyle: TextStyle(color: Colors.green)
              ),
            ),

          //   Password form
            const SizedBox(height: 24.0),
            PasswordField(
              fieldKey: _passwordKey,
              helperText: 'no more than 8 character',
              labelText: 'Password *',
              onFieldSubmitted: (String value){
                setState(() {
                  _password = value;
                });
              },
            ),

          //   Retype password
            const SizedBox(height: 24.0),
            TextFormField(
              enabled: _password != null && _password!.isNotEmpty,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                labelText: 'Reset Password'
              ),
              maxLength: 8,
              obscureText: true,
            )
          ],
        ),
      ),
    );
  }
}

// for password field
class PasswordField extends StatefulWidget {
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

    const PasswordField({
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
        maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        )
      ),
    );
  }
}

