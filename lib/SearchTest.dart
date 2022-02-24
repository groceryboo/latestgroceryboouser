import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Authentication/SignUp/controller/UpdatedSignupController.dart';
import 'Screens/Authentication/SignUp/model/CountryListModel.dart';

class SearchPageMine extends StatefulWidget {
  @override
  _SearchPageMineState createState() => _SearchPageMineState();
}

class _SearchPageMineState extends State<SearchPageMine> {

  String _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Text')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_result ?? '', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () async {
                var result = await showSearch<String>(
                  context: context,
                  delegate: CustomDelegate(),
                );
                setState(() => _result = result);
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDelegate extends SearchDelegate<String> {
  UpdatedSignupController controller = Get.put(UpdatedSignupController());

  @override
  List<Widget> buildActions(BuildContext context) => [SizedBox()];
  // List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.search), onPressed: () => {});
  // Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow;
    List<String> data=[];

    for (int i=0; i<controller.countrylist.length; i++) {
      CountryDatum model = controller.countrylist[i];
      data.add(model.name);
    }

    if (query.isNotEmpty)
      listToShow = data.where((e) => e.toString().toLowerCase().contains(query.toLowerCase()) && e.toString().toLowerCase().startsWith(query.toLowerCase())).toList();
    else
      listToShow = data;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun+i.toString()),
          onTap: () => close(context, noun),
        );
      },

    );
  }

}