import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdg_app/config/index.dart';
import 'package:gdg_app/universal/dev_scaffold.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  static const String routeName = "/map";
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController _controller;
  bool isMapCreated = false;
  static final LatLng myLocation = LatLng(33.541694, -7.673548);
  final Map<String, Marker> _markers = {};

  @override
  void initState() {
    super.initState();
  }

 final CameraPosition _kGooglePlex = CameraPosition(
    target: myLocation,
    zoom: 14.4746,
  );
    Set<Marker> _createMarker() {
    _markers["event_location"]=
      Marker(
          markerId: MarkerId("event_position"),
          position: myLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )
    );
  }
  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    setState(() {
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers["current_locaion"] = marker;
    });
  }
  changeMapMode() {
    if (ConfigBloc().darkModeOn) {
      getJsonFile("assets/nightmode.json").then(setMapStyle);
    } else {
      getJsonFile("assets/daymode.json").then(setMapStyle);
    }
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
      this._createMarker();
    if (isMapCreated) {
      changeMapMode();
    }
    return DevScaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: _markers.values.toSet(),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                isMapCreated = true;
                changeMapMode();
                setState(() {});
              },
            ),
            IgnorePointer(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "DevFest 2019\n",
                        style: Theme.of(context).textTheme.title.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: "EMSI les Oranges, Casablanca",
                              style: Theme.of(context).textTheme.subtitle,
                              children: []),
                        ]),
                  )),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        tooltip: 'Get Location',
        child: Icon(Icons.flag),
      ),
      title: "Locate the event",
    );
  }
}