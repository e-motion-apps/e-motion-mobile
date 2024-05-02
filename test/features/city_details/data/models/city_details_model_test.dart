import 'package:emotion/src/features/city_details/data/models/city_details_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('city_details_model', () {
    test('fromJson should correctly parse JSON data', () {
      final Map<String, Object> json = <String, Object>{
        'city': <String, Object>{
          'id': 1,
          'name': 'City Name',
        },
        'providers': <Map<String, String>>[
          <String, String>{
            'name': 'Provider 1',
          },
          <String, String>{
            'name': 'Provider 2',
          },
        ],
        'cityOpinions': <Map<String, Object>>[
          <String, Object>{
            'id': 1,
            'rating': 5,
            'content': 'Great city!',
          },
          <String, Object>{
            'id': 2,
            'rating': 3,
            'content': 'Average city.',
          },
        ],
      };

      final CityDetailsModel model = CityDetailsModel.fromJson(json);

      expect(model.city, isNotNull);
      expect(model.city!.id, 1);
      expect(model.city!.name, 'City Name');
      expect(model.providers, isNotNull);
      expect(model.providers!.length, 2);
      expect(model.cityOpinions, isNotNull);
      expect(model.cityOpinions!.length, 2);
    });

    test('toJson should correctly convert model to JSON data', () {
      final CityDetailsModel model = CityDetailsModel(
        city: City(
          id: 1,
          name: 'City Name',
        ),
        providers: <Providers>[
          Providers(
            name: 'Provider 1',
          ),
          Providers(
            name: 'Provider 2',
          ),
        ],
        cityOpinions: <CityOpinions>[
          CityOpinions(
            id: 1,
            rating: 5,
            content: 'Great city!',
          ),
          CityOpinions(
            id: 2,
            rating: 3,
            content: 'Average city.',
          ),
        ],
      );

      final Map<String, dynamic> json = model.toJson();

      expect(json['city'], isNotNull);
      expect(json['city']['id'], 1);
      expect(json['city']['name'], 'City Name');
      expect(json['providers'], isNotNull);
      expect(json['providers'].length, 2);
      expect(json['cityOpinions'], isNotNull);
      expect(json['cityOpinions'].length, 2);
    });
  });
}
