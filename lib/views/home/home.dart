// lib/views/home/home.dart

import 'package:custom_date_picker/blocs/blocs.dart';
import 'package:custom_date_picker/constants/constants.dart';
import 'package:custom_date_picker/cubits/cubits.dart';
import 'package:custom_date_picker/keys/keys.dart';
import 'package:custom_date_picker/views/home/components/components.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'body.dart';

/// This screen renders a generic error page that will be displayed
/// if a specified page can not be found / does not exist

class HomePage extends StatelessWidget {
  /// Constructor of ``[HomePage]``
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(key: WidgetKeys.homeBody),
    );
  }
}
