// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 1;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      wind: fields[4] as Wind?,
      visibility: fields[5] as int?,
      name: fields[3] as String?,
      weather: (fields[2] as List?)?.cast<Weather>(),
      main: fields[0] as Main?,
      description: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.main)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.visibility);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindAdapter extends TypeAdapter<Wind> {
  @override
  final int typeId = 2;

  @override
  Wind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wind(
      deg: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Wind obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.deg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 2;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      id: fields[0] as int?,
      main: fields[1] as String?,
      description: fields[2] as String?,
      icon: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.main)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainAdapter extends TypeAdapter<Main> {
  @override
  final int typeId = 3;

  @override
  Main read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Main(
      temp: fields[0] as double?,
      humidity: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Main obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
