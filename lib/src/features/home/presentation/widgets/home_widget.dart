import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_bloc.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_event.dart';
import 'package:emotion/src/features/home/presentation/bloc/home_state.dart';
import 'package:emotion/src/features/city_details/data/data_sources/remote_data_source.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 70,),
            Image.asset(
              'assets/images/emotion-76.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 8,),
            const Text('E-Motion'),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer:  Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Sign In'),
              onTap: () {
                // TODO(Leeoz): Handle Authentication
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
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'City Name',
                    ),
                    onChanged: (value) {
                      context.read<HomeBloc>().add(CityNameChanged(cityName: value));
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Country Name',
                    ),
                    onChanged: (value) {
                      context.read<HomeBloc>().add(CountryNameChanged(countryName: value));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      CityDetailsRemoteDataSourceImpl dataSource = CityDetailsRemoteDataSourceImpl(client: http.Client());
                      await dataSource.getCityDetails(state.cityName, state.countryName);
                    },
                    child: const Text('Get City Details'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}