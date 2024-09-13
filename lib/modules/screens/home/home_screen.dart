
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/state.dart';
import 'package:news_app/core/widgets/bg_widget/custom_bg.dart';
import 'package:news_app/core/widgets/custom/custom_container.dart';
import 'package:news_app/models/categories_model.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/modules/Manager/home_connector.dart';
import 'package:news_app/modules/screens/news_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/search_tap.dart';
import '../../Manager/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";


  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeViewModel viewModel=HomeViewModel();
  @override
  @override
  Widget build(BuildContext context) {
    return Custom_Bg(
        child: BlocProvider(create: (context) => HomeCubit(),
        child: BlocConsumer<HomeCubit,HomeState>(builder: (context, state) {
          var cubit=HomeCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                    showSearch(

                        context: context, delegate: CustomSearch(cubit));
                  }, icon:Icon(Icons.search) )
                ],
                elevation: 0,
                centerTitle: true,
                title: Text(
                  cubit.selectedCategory==null?"News App":cubit.selectedCategory!.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
              ),
              drawer: Drawer(
                child: Column(
                  children: [
                    DrawerHeader(
                        decoration: BoxDecoration(color: Colors.green),
                        child: Center(
                          child: Text(
                            "News App!",
                            style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        )),
                    ListTile(
                      onTap: () {
                        cubit.selectedCategory=null;
                        Navigator.pop(context);
                        cubit.resetData();
                        setState(() {

                        });


                      },
                      leading: Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Categories",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    )
                  ],
                ),
              ),
              body: cubit.selectedCategory==null?Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Pick your Category\n of interest",
                      style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),

                    Expanded(
                      child: GridView.builder(
                        itemCount: CategoriesData.categories.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 176/210
                        ), itemBuilder: (context, index) {
                        return CustomContainerCategories(onClick:cubit.onSelectedCategory ,categorie: CategoriesData.categories[index],isRight: index%2==0,);
                      },),
                    )
                  ],
                ),
              ):NewsScreen( cubit: cubit,)
          );
        },
          listener:(context, state) {
          if(state is getSourcesLoadingState || state is getNewsLoadingState){
             showDialog(context: context, builder: (context) {
              return AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Center(child: CircularProgressIndicator(),),
              );
            },);
          }
          if(state is getSourcesSuccesState|| state is getNewsSuccesState){
            Navigator.pop(context);
          }
          if(state is getSourcesErrorState){
             Text(state.error);
          }if(state is getNewsErrorState){
             Text(state.error);
          }
        },
        ),
        )


    );
  }
}
