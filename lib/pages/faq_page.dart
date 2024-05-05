import 'package:e_klinik_pens/utils/color.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back_ios_new_rounded)
              ),
            title: Text("kontol"),
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/atom.png",
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: 
             ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Do something
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Do something
                  },
                ),
              ],
            ),
            
          ),
           SliverToBoxAdapter(
            child: 
             ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Do something
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Do something
                  },
                ),
              ],
            ),
            
          ),
           SliverToBoxAdapter(
            child: 
             ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Do something
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Do something
                  },
                ),
              ],
            ),
            
          ),
                    SliverToBoxAdapter(
            child: 
             ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Do something
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Do something
                  },
                ),
              ],
            ),
            
          ),
           SliverToBoxAdapter(
            child: 
             ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Do something
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Do something
                  },
                ),
              ],
            ),
            
          ),
           SliverToBoxAdapter(
            child: 
             ExpansionTile(
              title: Text('Expansion Tile 1'),
              children: <Widget>[
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Do something
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Do something
                  },
                ),
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}