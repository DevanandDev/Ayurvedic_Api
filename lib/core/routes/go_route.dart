import 'package:ayurved/feature/auth/view/login_screen.dart';
import 'package:ayurved/feature/auth/view/splash_screen.dart';
import 'package:ayurved/feature/user/view/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
 GoRoute(path: '/splash',builder: (context, state) => MySplsh(),),   
 GoRoute(path: '/login' ,builder: (context, state) => MyLogin(),),
 GoRoute(path: '/home',builder: (context, state) => MyHome(),)
]);