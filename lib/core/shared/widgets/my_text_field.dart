import 'package:flutter/material.dart';

import '../styles/my_colors.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Function(String?)? validator;
  final Function(String?)? onTyping;
  const MyTextField({Key? key, required this.controller,this.onTyping,
    required this.label,this.textInputType = TextInputType.text,this.validator}) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.textInputType == TextInputType.visiblePassword;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:16.0,bottom: 4),
          child: Text(widget.label,style: TextStyle(color: Colors.white),),
        ),
        TextFormField(
          keyboardType: widget.textInputType,
          obscureText: isObscure,
          onChanged: widget.onTyping,
          validator:widget.validator == null ? null : (value)=> widget.validator!(value),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 50,vertical: 21),
            fillColor: Color.fromRGBO(189, 189, 189, 1.0),
            floatingLabelStyle: const TextStyle(color: MyColors.primaryColor),
            suffixIcon:widget.textInputType != TextInputType.visiblePassword ?
            null : IconButton(
                onPressed: (){
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(isObscure ? Icons.visibility_off: Icons.visibility)),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white
              )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                    color: MyColors.primaryColor
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                    color: Colors.white
                )
            ),
          ),
          controller: widget.controller,

        ),
      ],
    );
  }
}
