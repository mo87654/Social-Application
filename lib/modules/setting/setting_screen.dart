import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_application/layout/cubit/cubit.dart';
import 'package:social_application/layout/cubit/states.dart';
import 'package:social_application/modules/edite%20profile/edite_profile_screen.dart';
import 'package:social_application/shared/components/components.dart';
import 'package:social_application/shared/styles/icon_broken.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SocialCubit model = SocialCubit.get(context);
        return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        image: DecorationImage(
                          image: NetworkImage('${model.userModel?.cover}'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: CircleAvatar(
                      radius: 63,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage('${model.userModel?.image}'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '${model.userModel?.name}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${model.userModel?.bio}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '68',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Post',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '45',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Photo',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '34K',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Followers',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Text(
                          '132',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Following',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
              child: OutlinedButton(
                style: const ButtonStyle(
                  // shape: WidgetStatePropertyAll(BeveledRectangleBorder)
                ),
                onPressed: () {},
                 child: const Text(
                  'Add Photo'
                 )
                ),
            ),
            const SizedBox(
              width: 7,
            ),
            OutlinedButton(
              onPressed: (){
                navigateTo(context, EditeProfileScreen());
              },
               child: const Icon(
                IconBroken.Edit,
                size: 20,
               )
              )
              ],
            )
          ],
        ));
      },
    );
  }
}
