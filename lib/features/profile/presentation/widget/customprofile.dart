// import 'package:boookia/core/function/dilogs.dart';
// import 'package:boookia/core/function/text_style_app.dart';
// import 'package:boookia/features/profile/presentation/bloc/profile_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class customprofile extends StatefulWidget {
//   const customprofile({
//     super.key,
//   });

//   @override
//   State<customprofile> createState() => _customprofileState();
// }

// class _customprofileState extends State<customprofile> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProfileBloc()..add(GetProfileEvent()),
//       child: BlocBuilder<ProfileBloc, ProfileState>(
//         buildWhen: (previous, current) => current is GetProfileLoadingState || current is GetProfileLoadingState,
//         builder: (context, state) {
//           if (state is GetProfileLoadedState) {
//             var profile = context.read<ProfileBloc>().profileResponse?.data;
//             return Row(
//               children: [
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundImage: NetworkImage("${profile?.image }"),
//                 ),
//                 SizedBox(
//                   width: 13,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       profile?.name ?? "",
//                       style: get20text(),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Text(
//                       profile?.email ?? "",
//                       style: get16text(),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 )
//               ],
//             );
//           } else {
//             return showLoadingDialog(context);
//           }
//         },
//       ),
//     );
//   }
// }
