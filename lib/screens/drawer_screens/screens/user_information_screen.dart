import 'package:flutter/material.dart';
import 'package:graduation/components/appBar/reusablseAppBar.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';
import '../../../components/user_widget/user_widget.dart';

class UserInformationScreen extends StatelessWidget {
  static String userInformationScreenRoute = 'user information screen';

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ModelProvider>(context).getUserData();
    return Consumer<ModelProvider>(
      builder: (context, classInstance, child) {
        return Scaffold(
          appBar: ReusableAppBar(
            leadingFunction: () {
              Navigator.pop(context);
            },
            title: 'User Information',
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (userData != null)
                    Column(
                      children: [
                        userWidget(
                          requiredInformation: 'User name',
                          userInformation: '${userData['name']}',
                        ),
                        userWidget(
                          requiredInformation: 'User ID',
                          userInformation: '${userData['user_id']}',
                        ),
                        userWidget(
                          requiredInformation: 'Email',
                          userInformation: '${userData['email']}',
                        ),
                        userWidget(
                          requiredInformation: 'Phone number',
                          userInformation: '${userData['phone_number']}',
                        ),
                        userWidget(
                          requiredInformation: 'Address',
                          userInformation: '${userData['address']}',
                        ),
                        userWidget(
                          requiredInformation: 'Privilege type',
                          userInformation: '${userData['previlage_type']}',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class UserInformationScreen extends StatelessWidget {
//   const UserInformationScreen({
//     Key? key,
//   }) : super(key: key);
//   static String userInformationScreenRoute = 'user information screen';
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ModelProvider>(
//       builder: ((context, classInstance, child) {
//         return Scaffold(
//           appBar: ReusableAppBar(
//             leadingFunction: () {
//               Navigator.pop(context);
//             },
//             title: 'User Information',
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 userWidget(
//                   requiredInformation: 'First name',
//                   userInformation: classInstance.user?.firstName ?? 'empty',
//                 ),
//                 userWidget(
//                   requiredInformation: 'Last name',
//                   userInformation: classInstance.user?.lastName ?? 'empty',
//                 ),
//                 userWidget(
//                   requiredInformation: 'Address',
//                   userInformation: classInstance.user?.address ?? 'empty',
//                 ),
//                 userWidget(
//                   requiredInformation: 'Phone number',
//                   userInformation: classInstance.user?.phoneNumber ?? 'empty',
//                 ),
//                 userWidget(
//                   requiredInformation: 'Email',
//                   userInformation: classInstance.user?.email ?? 'empty',
//                 ),
//                 userWidget(
//                   requiredInformation: 'Password',
//                   userInformation: classInstance.user?.password ?? 'empty',
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

/*

 userWidget(
                          requiredInformation: 'First name',
                          userInformation: '${userData['first name']}',
                        ),

 */
