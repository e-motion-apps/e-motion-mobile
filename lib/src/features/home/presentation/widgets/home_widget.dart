import 'package:emotion/src/core/change_language.dart';
import 'package:emotion/src/features/auth/data/data_sources/auth_source.dart';
import 'package:emotion/src/features/city_details/data/data_sources/favorite_city_data.dart';
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
  final AuthSource authSource = AuthSource(client: http.Client(), token: ' ');
  Future<CityDetailsModel>? futureCityDetails;
  FavoriteCityData favoriteCityData = FavoriteCityData(
    client: http.Client(),
  );

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
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Sign In'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BlocProvider(
                          create: (context) => HomeBloc(),
                          child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
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
                                              context.read<HomeBloc>().add(
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
                                    onPressed: () async {
                                      await authSource
                                          .signInWithEmailAndPassword(
                                        state.email,
                                        state.password,
                                      );
                                      if (authSource.isSignedInSync()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Successful Sign In.'),
                                            duration: Duration(seconds: 5),
                                          ),
                                        );
                                        context.read<HomeBloc>().add(
                                              UserLoggedIn(
                                                isUserLoggedIn: true,
                                              ),
                                            );
                                      }
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Sign Up'),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BlocProvider(
                                            create: (context) => HomeBloc(),
                                            child: BlocBuilder<HomeBloc,
                                                HomeState>(
                                              builder: (context, state) {
                                                return AlertDialog(
                                                  title: const Text('Sign Up'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Column(
                                                          children: [
                                                            TextField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Name',
                                                              ),
                                                              onChanged: (value) =>
                                                                  context
                                                                      .read<
                                                                          HomeBloc>()
                                                                      .add(
                                                                        NameChanged(
                                                                          name:
                                                                              value,
                                                                        ),
                                                                      ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            TextField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Email',
                                                              ),
                                                              onChanged: (value) =>
                                                                  context
                                                                      .read<
                                                                          HomeBloc>()
                                                                      .add(
                                                                        EmailChanged(
                                                                          email:
                                                                              value,
                                                                        ),
                                                                      ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            TextField(
                                                              decoration:
                                                                  const InputDecoration(
                                                                labelText:
                                                                    'Password',
                                                              ),
                                                              onChanged: (value) =>
                                                                  context
                                                                      .read<
                                                                          HomeBloc>()
                                                                      .add(
                                                                        PasswordChanged(
                                                                          password:
                                                                              value,
                                                                        ),
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
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child:
                                                          const Text('Sign Up'),
                                                      onPressed: () async {
                                                        if (await authSource
                                                            .signUpWithEmailAndPassword(
                                                          state.name,
                                                          state.email,
                                                          state.password,
                                                        )) {
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          ).showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                'Successful Sign Up.',
                                                              ),
                                                              duration:
                                                                  Duration(
                                                                seconds: 5,
                                                              ),
                                                            ),
                                                          );
                                                          Navigator.of(context)
                                                              .pop();
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text('View all cities'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text('All Cities'),
                          ),
                          body: const Center(
                            child: Text('All Cities'),
                          ),
                        ),
                      ),
                    );
                    // TODO(Leeoz): Handle all cities list
                  },
                ),
                ListTile(
                  title: const Text(
                    'Change Language',
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Change Language'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            ChangeLanguage(language: 'en')
                                                .changeLanguage('en');
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('🇬🇧'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            ChangeLanguage(language: 'pl')
                                                .changeLanguage('pl');
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('🇵🇱'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text('Sign Out'),
                  onTap: () {
                    if (authSource.getToken() != ' ') {
                      authSource.signOut();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Signed out successfully.'),
                        ),
                      );
                      context.read<HomeBloc>().add(
                            UserLoggedIn(isUserLoggedIn: false),
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('You were not signed in.'),
                        ),
                      );
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Builder(
              builder: (context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration:
                              const InputDecoration(labelText: 'City Name'),
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
                              futureCityDetails?.then((value) async {
                                if (await favoriteCityData.isFavoriteCity(
                                  value.city!.id!,
                                  http.Client(),
                                  authSource.getToken(),
                                )) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('City is favorite.'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('City is not favorite.'),
                                    ),
                                  );
                                }
                              });
                            });
                          },
                          child: const Text('Get City Details'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            futureCityDetails?.then((value) async {
                              favoriteCityData.addFavoriteCity(
                                value.city!.id!,
                                http.Client(),
                                authSource.getToken(),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('City favorite status toggled.'),
                                ),
                              );
                            });
                          },
                          child: const Text('Toggle favorite'),
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
                                backgroundColor: Colors.blue[100],
                                shadowColor: Colors.blue,
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
          ),
        );
      },
    );
  }
}
