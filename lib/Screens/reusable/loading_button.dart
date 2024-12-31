// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/utils/theme/theme.dart';


class LoadingButton extends StatefulWidget {
  final Widget child;
  final Future Function() onPressed;

  final double? width;
  final double circularSize;
  final double? height;
  final Color? buttonColor;

  const LoadingButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.circularSize = 0,
    this.width,
    this.height,
    this.buttonColor,
  });

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.buttonColor ?? context.theme.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color:
                widget.buttonColor == null ? Colors.black : widget.buttonColor!,
          ),
          borderRadius: widget.circularSize == 0
              ? BorderRadius.circular(10.0)
              : BorderRadius.circular(widget.circularSize),
        ),
        elevation: 0,
        minimumSize:
            Size(widget.width ?? double.infinity, widget.height ?? 55.0),
      ),
      onPressed: isLoading
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });
              await widget.onPressed();
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            },
      child: isLoading
          ? SizedBox(
              child: CircularProgressIndicator(
              color: PrimaryColors.white900,
            ))
          : widget.child,
    );
  }
}

class LoadingButtonWithIcon extends StatefulWidget {
  final Widget child;
  final Future Function() onPressed;

  final double? width;
  final double circularSize;
  final double? height;
  final Color? buttonColor;
  final Color? buttonBorderColor;

  final Icon? icon;

  const LoadingButtonWithIcon({
    super.key,
    required this.child,
    required this.onPressed,
    this.circularSize = 0,
    this.width,
    this.height,
    this.buttonColor,
    this.buttonBorderColor,
    this.icon,
  });

  @override
  _LoadingButtonWithIconState createState() => _LoadingButtonWithIconState();
}

class _LoadingButtonWithIconState extends State<LoadingButtonWithIcon> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.buttonColor ?? context.theme.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: widget.buttonBorderColor == null
                ? Colors.black
                : widget.buttonBorderColor!,
          ),
          borderRadius: widget.circularSize == 0
              ? BorderRadius.circular(8.0)
              : BorderRadius.circular(widget.circularSize),
        ),
        elevation: 0,
        minimumSize:
            Size(widget.width ?? double.infinity, widget.height ?? 55.0),
      ),
      onPressed: isLoading
          ? null
          : () async {
              setState(() {
                isLoading = true;
              });
              await widget.onPressed();
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            },
      child: isLoading
          ? SizedBox(
              child: CircularProgressIndicator(
              color: PrimaryColors.white900,
            ))
          : widget.child,
    );
  }
}
