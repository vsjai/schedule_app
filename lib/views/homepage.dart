import 'package:flutter/material.dart';
import 'package:schedule_app/viewmodel/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "SCHEDULE APP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  title: "Scheduled View",
                  onPressed: () {
                    viewModel.navigateToScheduleScreen(context);
                  },
                ),
                CustomButton(
                  onPressed: () {
                    viewModel.navigateToActivityScreen();
                  },
                  title: "Activity View",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: (constraints.maxWidth < 600) ? 50 : 60,
          padding: const EdgeInsets.all(10),
          width: (constraints.maxWidth < 600) ? constraints.maxWidth : 600,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                title,
                style:
                    TextStyle(fontSize: (constraints.maxWidth < 600) ? 14 : 18),
              )),
        );
      },
    );
  }
}
