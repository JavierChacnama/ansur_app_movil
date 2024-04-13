import 'package:ansur_app_movil/models/map_model.dart';
import 'package:ansur_app_movil/view_models/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  final MapModel mapModel;
  const MapScreen({
    super.key,
    required this.mapModel,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var mapViewModel = Provider.of<MapViewModel>(context, listen: false);
      mapViewModel.setLocation(
          widget.mapModel.latitude, widget.mapModel.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    MapViewModel mapViewModel = context.watch<MapViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
      ),
      body: _ui(mapViewModel),
    );
  }

  _ui(MapViewModel mapViewModel) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          markers: mapViewModel.markers,
          mapType: MapType.normal,
          myLocationEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.mapModel.latitude, widget.mapModel.longitude),
            zoom: 11.0,
          ),
          onTap: (argument) async {
            mapViewModel.setLocation(argument.latitude, argument.longitude);
            _animateCamera(argument.latitude, argument.longitude);
            setState(() {});
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, mapViewModel.mapModel);
              },
              child: const Icon(Icons.save),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () async {
                var position = await mapViewModel.determineCurrentPosition();
                _animateCamera(
                  position.latitude,
                  position.longitude,
                );
              },
              child: const Icon(Icons.location_on),
            ),
          ),
        ),
      ],
    );
  }

  _animateCamera(
    double latitude,
    double longitude,
  ) {
    final cameraUpdate = CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(
          latitude,
          longitude,
        ),
        zoom: 14,
      ),
    );
    mapController.animateCamera(cameraUpdate);
  }

}