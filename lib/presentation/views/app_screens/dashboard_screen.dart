import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:sunofa_map/core/utils/screen_size.dart';
import 'package:sunofa_map/themes/app_themes.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Sunofa Map',
          style: AppTheme().stylish1(20, AppTheme.white, isBold: true),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppTheme.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: AppTheme.primaryColor,
      ),
      drawer: const NavigationDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/dash.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: context.widthPercent(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppTheme.primaryColor,
                      ),
                      child: InkWell(
                        onTap: () {
                           Navigator.pushNamed(context, '/AddMapFormScreen');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add',
                                style: AppTheme()
                                    .stylish1(15, AppTheme.white, isBold: true),
                              ),
                              const Icon(Icons.add, color: AppTheme.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: context.widthPercent(2)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search.....",
                          hintStyle: AppTheme().stylish1(15, AppTheme.black),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}

// Drawer personnalisé
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           SizedBox( height: context.heightPercent(3),),
           Padding(
              padding: const EdgeInsets.only(left: 10, right: 2),
             child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sunofa Map',
                      style:
                          AppTheme().stylish1(24, AppTheme.black, isBold: true),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const HeroIcon(
                        HeroIcons.xMark,
                        size: 30,
                      ),
                    )
                  ],
                ),
           ),
              SizedBox( height: context.heightPercent(3),),
                const Divider(),
                SizedBox( height: context.heightPercent(3),),
               Padding(
                 padding: const EdgeInsets.only(left: 15, right: 90),
                 child: Container(
                       
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppTheme.primaryColor,
                        ),
                        child: InkWell(
                          onTap: () {
                             Navigator.pushNamed(context, '/AddMapFormScreen');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add',
                                  style: AppTheme()
                                      .stylish1(15, AppTheme.white, isBold: true),
                                ),
                                const Icon(Icons.add, color: AppTheme.white),
                              ],
                            ),
                          ),
                        ),
                      ),
               ),
               SizedBox( height: context.heightPercent(3),),
                const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title:  Text('Home',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title:  Text('Search',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {
              Navigator.pop(context); // Fermer le Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title:  Text('Notes',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {},
          ),
          ListTile(
            leading: const HeroIcon(HeroIcons.bookOpen),
            title:  Text('Address book',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title:  Text('Favorites',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title:  Text('Language',  style: AppTheme().stylish1(15, AppTheme.black),),
            trailing: const Icon(Icons.arrow_drop_down),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title:  Text('About',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {},
          ),
         SizedBox( height: context.heightPercent(15),),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title:  Text('Se connecter',  style: AppTheme().stylish1(15, AppTheme.black),),
            onTap: () {
                Navigator.pushNamed(context, '/Loginscreen');
            },
          ),
        ],
      ),
    );
  }
}
