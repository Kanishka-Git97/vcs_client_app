import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vcs_client_app/Models/lat_long.dart';

class MapBox extends StatefulWidget {
  MapBox({super.key, this.locations});
  List<LatLong>? locations;

  @override
  State<MapBox> createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {
  final List<Marker> markers = [];

  // make Marker
  _makeMarker() {
    print(widget.locations!.length);
    if (widget.locations!.length > 0) {
      List<Marker> _temp = [];
      for (var location in widget.locations!) {
        print("loop run");
        _temp.add(new Marker(
            width: 100.0,
            height: 100.0,
            point: LatLng(double.parse(location.latitude.toString()),
                double.parse(location.longitude.toString())),
            builder: (ctx) => Container(
                  child: Icon(
                    Icons.pets,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                )));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _makeMarker();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(5.95492, 80.554956),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/purna97/clcof8psh001i14qhcvixrtna/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicHVybmE5NyIsImEiOiJjbGM3aGFzcnAyb2NtM3dwOXZjbXludzh2In0.Crzzm-eo_GfPDne-ibrlAQ",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoicHVybmE5NyIsImEiOiJjbGM3aGFzcnAyb2NtM3dwOXZjbXludzh2In0.Crzzm-eo_GfPDne-ibrlAQ',
              'id': 'mapbox.mapbox-streets-v8'
            }),
        MarkerLayerOptions(markers: markers)
      ],
    );
  }
}
