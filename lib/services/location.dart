import 'package:geolocator/geolocator.dart';

class Location{

  double latitude=22.22;
  double longitude=22.22; // by default

  Future<void> getLocation() async
  {
    try{
      Position position = await Geolocator.getCurrentPosition();
      print(position);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }


}