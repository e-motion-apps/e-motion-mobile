import 'package:emotion/src/features/city_details/data/data_sources/remote_data_source.dart';
import 'package:emotion/src/features/city_details/data/models/city_details_model.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_event.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<CityDetailsModel>? futureCityDetails;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/emotion-76.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('E-Motion'),
                ],
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          drawer: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state){
              return Drawer(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Sign In'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Sign In'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Email',
                                          ),
                                          onChanged: (value) {
                                            context.read<HomeBloc>().add(
                                                  EmailChanged(email: value),
                                                );
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          decoration: const InputDecoration(
                                            labelText: 'Password',
                                          ),
                                          onChanged: (value) {
                                            context
                                            .read<HomeBloc>().add(
                                                  PasswordChanged(
                                                    password: value,
                                                  ),
                                                );
                                          },
                                          obscureText: true,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Sign In'),
                                  onPressed: () {
                                    context.read<HomeBloc>().add(
                                          SignInWithEmailAndPasswordPressed(
                                            email: state.email,
                                            password: state.password,
                                          ),
                                        );
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Sign Up'),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Sign Up'),
                                          content:
                                              const SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Column(
                                                  children: [
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Name',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Email',
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Password',
                                                      ),
                                                      obscureText: true,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Sign Up'),
                                              onPressed: () {
                                                // TODO(Leeoz): Handle Sign Up
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Settings'),
                      onTap: () {
                        // TODO(Leeoz): Handle Settings
                      },
                    ),
                    ListTile(
                      title: const Text('Change Language'),
                      onTap: () {
                        // TODO(Leeoz): Handle Language Change
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          body: Builder(
            builder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'City Name',
                        ),
                        onChanged: (value) {
                          context
                              .read<HomeBloc>()
                              .add(CityNameChanged(cityName: value));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Country Name',
                        ),
                        onChanged: (value) {
                          context
                              .read<HomeBloc>()
                              .add(CountryNameChanged(countryName: value));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final CityDetailsRemoteDataSourceImpl
                              remoteDataSource =
                              CityDetailsRemoteDataSourceImpl(
                            client: http.Client(),
                          );
                          setState(() {
                            futureCityDetails =
                                remoteDataSource.getCityDetails(
                              state.cityName,
                              state.countryName,
                            );
                          });
                        },
                        child: const Text('Get City Details'),
                      ),
                      FutureBuilder(
                        future: futureCityDetails,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator(
                              color: Colors.blue,
                            );
                          } else if (snapshot.hasError) {
                            return const Text('No city found.');
                          } else if (snapshot.hasData) {
                            return AlertDialog(
                              title: const Center(
                                child: Text('City Details'),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'City: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${snapshot.data!.city!.name}',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Country: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${snapshot.data!.country!.name}',
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Providers: ',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: snapshot
                                                  .data!.cityProviders!
                                                  .map((cityProvider) {
                                                return Text(
                                                  '${cityProvider.providerName!} ',
                                                );
                                              }).toList(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return const Text(
                              'Press the button to get city details.',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
