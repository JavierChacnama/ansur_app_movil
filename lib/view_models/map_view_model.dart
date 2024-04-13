import 'package:ansur_app_movil/models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_address_from_latlng/flutter_address_from_latlng.dart';

class MapViewModel extends ChangeNotifier {
  final Set<Marker> _markers = {};
  LatLng _currentLocation = const LatLng(45.521563, -122.677433);
  String? _address;

  Set<Marker> get markers => _markers;
  LatLng get currentLocation => _currentLocation;
  String? get address => _address;
  MapModel get mapModel => MapModel(
        _currentLocation.latitude,
        _currentLocation.longitude,
        _address ?? '',
      );

  Future<Position> determineCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Future.error('location service is disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        await Future.error('location permission denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  setLocation(double latitude, double longitude) async {
    _currentLocation = LatLng(latitude, longitude);
    _address = await _getAddressFrom(latitude, longitude);
    _addMarker(latitude, longitude);
    notifyListeners();
  }

  _addMarker(double latitude, double longitude) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(
          latitude,
          longitude,
        ),
      ),
    );
  }

  Future<String?> _getAddressFrom(double latitude, double longitude) async {
    var address = await FlutterAddressFromLatLng().getDirectionAddress(
      latitude: latitude,
      longitude: longitude,
      googleApiKey: 'PEGAR AQUI LA API',
    );
    return address?.formattedAddress;
  }
}