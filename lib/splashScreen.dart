import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/task_cubit.dart';
import 'package:untitled1/task_state.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EXCubit, EX>(
      listener: (context, state) {
        if (state is Background) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Changed successfully')));
        }
      },
      child: BlocBuilder<EXCubit, EX>(
        builder: (context, state) {
          final cubit = context.read<EXCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.tealAccent,
              title: Text('My Task'),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cubit.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Text('${context.read<EXCubit>().counter}'),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.changeBackground(
                            'images/Mine.jpg',
                            'Changed successfully',
                          );
                        },
                        child: Image.asset(
                          'images/Mine.jpg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeBackground(
                            'images/img1.png',
                            'Changed successfully',
                          );
                        },
                        child: Image.asset(
                          'images/img1.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeBackground(
                            'images/img2.png',
                            'Changed successfully',
                          );
                        },
                        child: Image.asset(
                          'images/img2.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          cubit.changeBackground(
                            'images/img3.png',
                            'Changed successfully',
                          );
                        },
                        child: Image.asset(
                          'images/img3.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.plus();
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () {
                          cubit.reset();
                        },
                        icon: Icon(
                          Icons.refresh,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
