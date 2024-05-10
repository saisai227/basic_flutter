import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldWidgets extends StatefulWidget {
  const TextFieldWidgets({super.key});

  @override
  State<TextFieldWidgets> createState() => _TextFieldWidgetsState();
}

class _TextFieldWidgetsState extends State<TextFieldWidgets> {
  bool _numberInputIsValid  = true;

  // Function to build number TextField
  Widget _buildNumberTextField(){
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline4,
      decoration: InputDecoration(
        icon: const Icon(Icons.attach_money_outlined),
        labelText: 'Enter an Integer:',
        errorText: _numberInputIsValid ? null : 'Please enter an integer',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
        )
      ),
      onSubmitted: (val)=> Fluttertoast.showToast(msg: 'You entered: ${int.parse(val)}'),
      onChanged: (String val){
        final v = int.parse(val);
        if( v == null){
          setState(() {
            _numberInputIsValid = false;
          });
        }else{
          setState(() {
            _numberInputIsValid = true;
          });
        }
      },
    );
  }

  // Function to build Multiline TextField
  final _controller = TextEditingController();
  // Function to build Multiline TextField
  Widget _buildMultilineTextField(){
    return TextField(
      controller: _controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '${_countWords(text: _controller.text)} words',
        labelText: 'Enter Multiline Text:',
        alignLabelWithHint: true,
        hintText: 'Type Something...',
        border: const OutlineInputBorder()
      ),
      onChanged: (text)=> setState(() {}),
    );
  }

  // Function to count Words
  int _countWords({required String text}){
    final trimmedText = text.trim();

    if (trimmedText.isEmpty){
      return 0;
    }else {
      return trimmedText.split(RegExp("\\s+")).length;
    }
  }

  // Function to build password field
  bool _showPassword = false;
  // Function to build password fiel
  Widget _buildPasswordTextField(){
    return TextField(
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.security_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye_outlined,
            color: _showPassword ? Colors.blue : Colors.grey,
          ),
          onPressed: (){
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        //  onPressed Action
        )
      ),
    );
  }
  
  
  // Function to build borderless textField
  Widget _buildBorderlessTextField(){
    return const TextField(
      maxLines: 3,
      decoration: InputDecoration.collapsed(hintText: 'borderless input'),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const ListTile(title: Text('1. Number Input Field')),
          _buildNumberTextField(),
          const ListTile(title: Text('1. Number Input Field')),
          _buildNumberTextField(),

          const ListTile(title: Text('2. Multiline Text Field')),
          _buildMultilineTextField(),
          const ListTile(title: Text('3. Password Text Field')),
          _buildPasswordTextField(),
          const ListTile(title: Text('4. Borderless Text Field')),
          _buildBorderlessTextField(),
        ],
      ),
    );
  }
}
