import 'package:emotion/src/features/providers/data/data_sources/cities_with_providers_source.dart';
import 'package:emotion/src/features/providers/data/models/cities_with_providers_model.dart';
import 'package:emotion/src/features/providers/presentation/widgets/city_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListCitiesWidget extends StatelessWidget {
  const ListCitiesWidget({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final http.Client client = http.Client();
    final CitiesWithProvidersSourceImpl citiesWithProvidersSourceImpl =
        CitiesWithProvidersSourceImpl(client: client);
    Future<CitiesWithProvidersModel> futureCitiesWithProvidersModel;
    futureCitiesWithProvidersModel =
        citiesWithProvidersSourceImpl.getCitiesWithProviders();
    final CitySearchDelegate citySearchDelegate = CitySearchDelegate();

    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Cities'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: citySearchDelegate,
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: futureCitiesWithProvidersModel,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final response = snapshot.data;
              citySearchDelegate.cities = response.cities;
              return ListView.builder(
                itemCount: response.cities.length,
                itemBuilder: (BuildContext context, int index) {
                  final city = response.cities[index];
                  return ListTile(
                    title: Text(city.name),
                    subtitle: Text(city.country.name),
                    trailing: Text(
                      'Providers available: ${city.cityProviders.length}',
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
