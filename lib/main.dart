import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'Helper/get_routes.dart';
import 'base/Getx_bindings/getx_bindings.dart';
import 'utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  runApp(const GetTest());
}

class GetTest extends StatelessWidget {
  const GetTest({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Project GetX',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialBinding: AppBindings(),
      initialRoute: Routes.chatScreen,
      getPages: Routes.routes,
    );
  }
}
