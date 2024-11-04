import 'package:crud/firebase_options.dart';
import 'package:crud/pages/add_new_user.dart';
import 'package:crud/pages/detailed_view.dart';
import 'package:crud/pages/edit_page.dart';
import 'package:crud/pages/login_page.dart';
import 'package:crud/pages/main_page.dart';
import 'package:crud/services/check_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // home: CheckPage(),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/checkPage",
  routes: <GoRoute>[
    GoRoute(
      // name: "/checkPage",
      path: "/checkPage",
      builder: (context, state) {
        return const CheckPage();
      },
    ),
    GoRoute(
      // name: "/loginPage",
      path: "/loginPage",
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      // name: "/mainPage",
      path: "/mainPage",
      builder: (context, state) {
        return const MainPage();
      },
      routes: [
        GoRoute(
          // name: "addNewUserPage",
          path: "addNewUserPage",
          builder: (context, state) {
            return const AddNewUser();
          },
        ),
        GoRoute(
          // name: "detailedViewPage",
          path: "detailedViewPage",
          builder: (context, state) {
            return true as Widget;
          },
        ),
        GoRoute(
          // name: "/editPage",
          path: "editPage",
          builder: (context, state) {
            return const EditPage(
              docID: '',
              selectedSlider: 1,
            );
          },
        ),
      ],
    ),
  ],
);











// final GoRouter _router = GoRouter(
//   initialLocation: "/checkPage",
//   routes: <RouteBase>[
//     GoRoute(
//       // name: "/checkPage",
//       path: "/checkPage",
//       builder: (context, state) {
//         return const CheckPage();
//       },
//       routes: [
//         GoRoute(
//           // name: "loginPage",
//           path: "loginPage",
//           builder: (context, state) {
//             return const LoginPage();
//           },
//         ),
//         GoRoute(
//           // name: "mainPage",
//           path: "mainPage",
//           builder: (context, state) {
//             return const MainPage();
//           },
//         ),
//         GoRoute(
//           // name: "addNewUserPage",
//           path: "addNewUserPage",
//           builder: (context, state) {
//             return const AddNewUser();
//           },
//         ),
//         GoRoute(
//           // name: "detailedViewPage",
//           path: "detailedViewPage",
//           builder: (context, state) {
//             return true as Widget;
//           },
//         ),
//         GoRoute(
//           // name: "editPage",
//           path: "editPage",
//           builder: (context, state) {
//             return const EditPage(
//               docID: '',
//               selectedSlider: 1,
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );
