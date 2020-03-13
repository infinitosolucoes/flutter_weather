import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_weather/blocs/blocs.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuração')),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return ListTile(
                title: Text(
                  'Unidade de temperatura',
                ),
                isThreeLine: true,
                subtitle:
                    Text('Use medições métricas para unidades de temperatura.'),
                trailing: Switch(
                  value: state.temperatureUnits == TemperatureUnits.celsius,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context)
                      .add(TemperatureUnitsToggled()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
