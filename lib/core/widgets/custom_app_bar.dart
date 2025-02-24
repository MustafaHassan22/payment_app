import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset('assets/images/Arrow 1.svg'),
    ),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: Styles.style25,
    ),
  );
}
