
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/favorite_provider.dart';
import 'package:provider_practice/screens/myfavorite_screen.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
 // List<int> selectedItem=[];

  @override
  Widget build(BuildContext context) {
    debugPrint('Build');
    //final favouriteProvider=Provider.of<FavouriteItemProvider>(context,listen: false);
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
              itemCount: 16,
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
