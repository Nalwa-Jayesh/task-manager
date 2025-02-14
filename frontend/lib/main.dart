import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/cubit/auth_cubit.dart';
import 'package:frontend/features/auth/pages/signup_page.dart';
import 'package:frontend/features/home/cubit/tasks_cubit.dart';
import 'package:frontend/features/home/pages/home_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => TasksCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896), // Base design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Task App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Cera Pro",
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.all(27.r), // Responsive padding
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 3.w, // Responsive border width
                ),
                borderRadius: BorderRadius.circular(10.r), // Responsive radius
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3.w),
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 3.w,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize:
                    Size(double.infinity, 60.h), // Responsive button size
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15.r), // Responsive radius
                ),
              ),
            ),
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoggedIn) {
                return const HomePage();
              }
              return const SignupPage();
            },
          ),
        );
      },
    );
  }
}
