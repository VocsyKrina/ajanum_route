import 'package:ajanum_route/ajanuw_route.dart';
import 'package:ajanum_route/flutter_ajanuw_router.dart';
import 'package:ajanum_route_example/pages/home.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//   final _ajanumRoutePlugin = AjanumRoute();
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     // We also handle the message potentially returning null.
//     try {
//       platformVersion = await _ajanumRoutePlugin.getPlatformVersion() ?? 'Unknown platform version';
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Text('Running on: $_platformVersion\n'),
//         ),
//       ),
//     );
//   }
// }

AjanuwRouter router = AjanuwRouter(printHistory: true);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<AjanuwRoute> routes = [
      // AjanuwRoute<ArgsPageArguments>(
      //   path: 'arg',
      //   builder: (c, r) {
      //     print("++++++++++++++++++++++");
      //     return const ArgsPage(
      //         // name: '/home',
      //         // id: 1,
      //         );
      //   },
      // ),
      AjanuwRoute(
        path: '',
        redirectTo: '/home',
      ),
      AjanuwRoute(
        path: 'aa',
        redirectTo: '/users/2',
      ),
      AjanuwRoute(
        path: 'home',
        title: 'home',
        builder: (context, r) => Home(),
      ),
      // AjanuwRoute(
      //   path: 'dog/:id',
      //   opaque: false,
      //   barrierDismissible: true,
      //   barrierColor: Colors.black54,
      //   // builder: (context, r) => Dog(id: r.paramMap['id']),
      //   transitionDurationBuilder: (_) => Duration(seconds: 2),
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
      //     final curvedAnimation = CurvedAnimation(
      //       parent: animation,
      //       curve: const ElasticInOutCurve(),
      //     );
      //     return SlideTransition(
      //       position: tween.animate(curvedAnimation),
      //       child: child,
      //     );
      //   },
      // ),
      // AjanuwRoute(
      //   path: 'login',
      //   title: 'Login',
      //   builder: (context, r) => Title(
      //     title: 'Login',
      //     color: Theme.of(context).primaryColor, child: Container(),
      //
      //     // child: Login(),
      //   ),
      //   transitionDuration: Duration(seconds: 2),
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     var begin = Offset(1.0, 1.0);
      //     var end = Offset.zero;
      //     var curve = Curves.ease;
      //
      //     var tween = Tween(begin: begin, end: end);
      //     var curvedAnimation = CurvedAnimation(
      //       parent: animation,
      //       curve: curve,
      //     );
      //     return SlideTransition(
      //       position: tween.animate(curvedAnimation),
      //       child: child,
      //     );
      //   },
      // ),
      // AjanuwRoute(
      //   path: 'admin',
      //   title: 'Admin',
      //   // builder: (context, r) => Admin(),
      //   canActivate: [
      //     (AjanuwRouting routing) {
      //       if (authService.islogin) return true;
      //       print("routing.url: " + routing.url);
      //       authService.redirectTo = routing.url;
      //       router.pushNamed('/login');
      //       return false;
      //     }
      //   ],
      //   children: [
      //     // AjanuwRoute(
      //     //   title: 'Add User',
      //     //   path: 'add-user',
      //     //   builder: (context, settings) => AddUser(),
      //     // ),
      //   ],
      // ),
      // AjanuwRoute(
      //   title: 'Users',
      //   path: 'users',
      //   // builder: (context, r) => Users(),
      //   children: [
      //     AjanuwRoute(
      //       title: 'User details',
      //       path: ':id',
      //       canActivate: [
      //         (AjanuwRouting routing) {
      //           // No id denied access
      //           final paramMap = routing.settings!.paramMap;
      //           if (paramMap!['id'] == null) {
      //             router.navigator!.pushReplacementNamed('/users');
      //             return false;
      //           }
      //
      //           try {
      //             int.parse(paramMap['id']!);
      //             return true;
      //           } catch (e) {
      //             return false;
      //           }
      //         }
      //       ],
      //       builder: (BuildContext context, r) {
      //         // In fact, it is better to parse the parameters on the [User] page, because it can prevent various problems
      //         int id = int.parse(r.paramMap!['id']!);
      //         return User(id: id);
      //       },
      //       children: [
      //         AjanuwRoute(
      //           title: 'settings',
      //           path: 'user-settings',
      //           // builder: (context, settings) => UserSettings(),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      // AjanuwRoute(
      //   title: 'Page Not Found',
      //   path: 'not-found',
      //   // builder: (context, r) => NotFound(),
      //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //     var begin = 0.0;
      //     var end = 1.0;
      //     var curve = Curves.ease;
      //     var tween = Tween<double>(begin: begin, end: end);
      //     var curvedAnimation = CurvedAnimation(
      //       parent: animation,
      //       curve: curve,
      //     );
      //
      //     return ScaleTransition(
      //       scale: tween.animate(curvedAnimation),
      //       child: child,
      //     );
      //   },
      // ),
      // AjanuwRoute(
      //   path: "**",
      //   redirectTo: '/not-found',
      // ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'users',
      navigatorObservers: [router.navigatorObserver],
      navigatorKey: router.navigatorKey,
      onGenerateRoute: router.forRoot(routes),

      /// If this is set, interception will not work
      // onUnknownRoute: (s) {
      //   return MaterialPageRoute(
      //     builder: (_) => Scaffold(
      //       body: Center(child: Text('data'),),
      //     ),
      //   );
      // },
    );
  }
}
