import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';

class CountryStateCity extends StatefulWidget {
  String? country,state,city;
  CountryStateCity({super.key, this.country,this.city,this.state});

  @override
  State<CountryStateCity> createState() => _CountryStateCityState();
}

class _CountryStateCityState extends State<CountryStateCity> {
  final  _country = TextEditingController();
  final  _state = TextEditingController();
  final  _city = TextEditingController();

  @override
  Widget build(BuildContext context) {

    CSCity(country: _country.text,state: _state.text,city: _city.text);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountryStateCityPicker(
              country: _country,
              state: _state,
              city: _city,
              dialogColor: Colors.grey.shade200,
              textFieldDecoration: const InputDecoration(
                  suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ))),

        ],
      ),
    );
  }
}

class CSCity{
  String? country,state,city;
  CSCity({this.state,this.city,this.country});


}