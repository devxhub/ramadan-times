import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslimtimespro/src/auth/presentation/bloc/sign_in_bloc/sign_in_bloc.dart';

class CustomPinCodeField extends StatefulWidget {
  const CustomPinCodeField({Key? key}) : super(key: key);

  @override
  _CustomPinCodeFieldState createState() => _CustomPinCodeFieldState();
}

class _CustomPinCodeFieldState extends State<CustomPinCodeField> {
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
  List.generate(6, (_) => TextEditingController());
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // Request focus on the first field when the widget is first rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    });

    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          setState(() {
            _selectedIndex = i;
          });
        }
      });
    }
  }

  String getPinCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(6, (index) {
          final bool isSelected = _selectedIndex == index;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
            child: Container(
              width: 46.w,
              height: 46.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17.sp),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
                    : null,
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.transparent,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: KeyboardListener(
                  focusNode: FocusNode(),
                  onKeyEvent: (event) {
                    if (event is KeyDownEvent &&
                        event.logicalKey == LogicalKeyboardKey.backspace) {
                      if (_controllers[index].text.isEmpty && index > 0) {
                        _controllers[index - 1].clear();
                        FocusScope.of(context)
                            .requestFocus(_focusNodes[index - 1]);
                      }
                      // Emit state after backspace
                      context.read<SignInBloc>().add(
                        SignInEvent.forgetPasswordOtpOnChanged(
                          forgetPasswordOtp: getPinCode(),
                          context: context,
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: TextFormField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      showCursor: true,
                      decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintText: _controllers[index].text.isEmpty && !isSelected
                            ? "-" // Dash when the field is empty and not focused
                            : "", // No hint text if the field is focused or filled
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          // Automatically move to the next field if input is provided
                          if (index < 5) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index + 1]);
                          }
                        }
                        // Emit state after input
                        context.read<SignInBloc>().add(
                          SignInEvent.forgetPasswordOtpOnChanged(
                            forgetPasswordOtp: getPinCode(),
                            context: context,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
