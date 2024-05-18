import 'package:emotion/src/features/providers/data/models/cities_with_providers_model.dart';
import 'package:flutter/material.dart';

class CitySearchDelegate extends SearchDelegate {
  List<Cities>? cities;

  CitySearchDelegate({this.cities});

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildCityList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildCityList();
  }

  Widget _buildCityList() {
    final results = cities
        ?.where(
          (city) =>
              city.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .toList();

    return ListView.builder(
      itemCount: results?.length,
      itemBuilder: (context, index) {
        final city = results?[index];
        return ListTile(
          title: Text(city?.name ?? ''),
          subtitle: Text(city?.country?.name ?? ''),
          trailing: Text(
            city!.cityProviders!
                .map((providers) => providers.providerName)
                .join(', '),
          ),
        );
      },
    );
  }
}
