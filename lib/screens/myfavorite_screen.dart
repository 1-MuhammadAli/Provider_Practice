import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Build');
    final favouriteProvider=Provider.of<FavouriteItemProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite App"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteScreen(),));
              },
              child: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
              itemBuilder: (context, index) {
                return Consumer<FavouriteItemProvider>(builder: (context, provider, child) {
                  return ListTile(
                    onTap: (){
                      if(provider.selectedItem.contains(index)){
                        provider.removeItem(index);
                      }else{
                        provider.addItem(index);
                      }

                    },
                    title: Text('Item'+index.toString()),
                    trailing: Icon(
                      provider.selectedItem.contains(index)?Icons.favorite:Icons.favorite_border_outlined,
                    ),
                  );
                },);
              },
            ),
          ),
        ],
      ),
    );
  }
}
