import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Marker StationMarker({
  required BuildContext context,
  required String stationLabel,
  Function()? onPressed,
  IconData? icon,
  Color? iconColor,
  bool? markerOnOffState = false,
  required double lat,
  required double lng,
}) {
  return Marker(
    width: 100,
    height: 100,
    point: LatLng(lat, lng),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: IconButton(
            onPressed: onPressed ??
                () => Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: {
                        'stationLabel': stationLabel,
                        'lat': lat,
                        'lng': lng
                      },
                    ),
            icon: Icon(
              icon ?? Icons.pin_drop,
              color:
                  iconColor ?? (markerOnOffState! ? Colors.white : Colors.red),
              shadows: const [
                Shadow(
                  color: Colors.black,
                  blurRadius: 20,
                )
              ],
              size: 50,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 100,
          child: Text(
            stationLabel,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
