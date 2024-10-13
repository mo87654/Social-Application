import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/shared/styles/icon_broken.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SocialCubit cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 20,
              title: Text(
                '${cubit.titles[cubit.currentIndex]}'
              ),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    IconBroken.Notification
                  )
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(
                        IconBroken.Search
                    )
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeButtonNavBar(index, context);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Home,
                    ),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Chat,
                    ),
                    label: 'Chats'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Plus,
                    ),
                    label: 'Add post'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Location,
                    ),
                    label: 'Users'
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      IconBroken.Setting,
                    ),
                    label: 'Setting'
                ),
              ],
              currentIndex: cubit.currentIndex,
            ),

          );
        },
      );
      
  }
}
