// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/material.dart';
//
// class MyContactsPage extends StatefulWidget {
//   @override
//   _MyContactsPageState createState() => _MyContactsPageState();
// }
//
// class _MyContactsPageState extends State<MyContactsPage> {
//   // late ScrollController controller;
//   // List<String> items = List.generate(100, (index) => 'Hello $index');
//
//   List<Contact> contacts = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // controller = ScrollController()..addListener(_scrollListener);
//     //
//     getAllContacts();
//   }
//
//   // @override
//   // void dispose() {
//   //   controller.removeListener(_scrollListener);
//   //   super.dispose();
//   // }
//
//   getAllContacts() async {
//     List<Contact> _contacts = (await ContactsService.getContacts()).toList();
//
//     setState(() {
//       contacts = _contacts;
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Contact syncing.."),
//       ),
//       body: SingleChildScrollView(
//         physics: ScrollPhysics(),
//          child: Container(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               children: <Widget>[
//                 Text("Let the fun begin"),
//                 ListView.builder(
//                   physics: const AlwaysScrollableScrollPhysics(), // new
//                   shrinkWrap: true,
//                   itemCount: contacts.length,
//                   itemBuilder: (context, index) {
//                     Contact contact = contacts[index];
//                     return ListTile(
//                       title: Text(contact.displayName.toString()),
//                       subtitle: Text(contact.phones.elementAt(0).value.toString()),
//
//                         leading: (contact.avatar != null && contact.avatar.length > 0)
//                       ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar))
//                       : CircleAvatar(child: Text(contact.initials())),
//                     );
//                   },
//                 ),
//
//               ],
//             ),
//           )
//       ),
//
//       // body: Scrollbar(
//       //   // child: ListView.builder(
//       //   //   controller: controller,
//       //   //   itemBuilder: (context, index) {
//       //   //     return Text(items[index]);
//       //   //   },
//       //   //   itemCount: items.length,
//       //   // ),
//       //   child: ListView.builder(
//       //     // controller: controller,
//       //     physics: const AlwaysScrollableScrollPhysics(),
//       //     // new
//       //     shrinkWrap: true,
//       //     itemCount: contacts.length,
//       //     itemBuilder: (context, index) {
//       //       Contact contact = contacts[index];
//       //       return ListTile(
//       //         title: Text(contact.displayName.toString()),
//       //         subtitle: Text(contact.phones!.elementAt(0).value.toString()),
//       //         leading: (contact.avatar != null && contact.avatar!.length > 0)
//       //             ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar!))
//       //             : CircleAvatar(child: Text(contact.initials())),
//       //       );
//       //     },
//       //   ),
//       // ),
//
//     );
//   }
//
//   // void _scrollListener() {
//   //   print(controller.position.extentAfter);
//   //   if (controller.position.extentAfter < 500) {
//   //     setState(() {
//   //       contacts.addAll(List.generate(42, (index) => 'Inserted $index'));
//   //     });
//   //   }
//   //
//   // }
//
// }
