if(isNil "life_markers_Vehicles") then {life_markers_Vehicles = [];};
if(isNil "life_markers_Players") then {life_markers_Players = [];};
if (!life_markers) then {
  life_markers = true;
  hintSilent "Admin Markers Enabled";
} else {
  life_markers = false;
  hintSilent "Admin Markers Disabled";
};
while {life_markers} do {
  {
    if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then {
      if (count(crew vehicle _x) > 0) then {
        {
          if (!(_x in life_markers_Vehicles) && (alive _x) && (getPlayerUID _x != "")) then {
            private["_pos", "_Markers", "_Vehicle"];
            _Vehicle = vehicle _x;
            _pos = visiblePosition _x;
            _Markers = createMarkerLocal[format["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
            _TypeVehicle = (getText(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
            _Markers setMarkerTextLocal format["%1---%2---%3m", name _x, _TypeVehicle, round(_x distance player)];
            _Markers setMarkerTypeLocal "mil_dot";
            if (side _x isEqualTo independent) then {
              _Markers setMarkerColorLocal ("ColorIndependent");
            };
            if (side _x isEqualTo civilian) then {
              _Markers setMarkerColorLocal ("ColorCivilian");
            };
            if (side _x isEqualTo west) then {
              _Markers setMarkerColorLocal ("ColorBLUFOR");
            };
            _Markers setMarkerSizeLocal[1, 1];
            life_markers_Vehicles pushback _x;
            [_x, _Markers, _Vehicle, _TypeVehicle] spawn {
              private["_PlayersOrVehicles", "_Marker", "_CrewVehicle"];
              _PlayersOrVehicles = _this select 0;
              _Marker = _this select 1;
							_TypeVehicle = _this select 3;
              while {life_markers && (alive _PlayersOrVehicles) && (vehicle _PlayersOrVehicles != _PlayersOrVehicles) && (getPlayerUID _PlayersOrVehicles != "")} do {
                _CrewVehicle = ((crew vehicle _PlayersOrVehicles) find _PlayersOrVehicles);
                _Marker setMarkerPosLocal([(visiblePosition _PlayersOrVehicles select 0) + 20, (visiblePosition _PlayersOrVehicles select 1) - (25 + _CrewVehicle * 20), 0]);
								_Marker setMarkerTextLocal format["%1---%2---%3m", name _PlayersOrVehicles, _TypeVehicle, round(_PlayersOrVehicles distance player)];
                sleep 0.01;
              };
              deleteMarkerLocal _Marker;
              if (_PlayersOrVehicles in life_markers_Vehicles) then {
                life_markers_Vehicles set[(life_markers_Vehicles find _PlayersOrVehicles), -1];
                life_markers_Vehicles = life_markers_Vehicles - [-1];
              };
              true;
            };
          };
        } forEach crew vehicle _x;
      };
    } else {
      if (!(_x in life_markers_Players) && (vehicle _x isEqualTo _x) && (getPlayerUID _x != "")) then {
        private["_pos", "_Markers"];
        _pos = visiblePosition _x;
        _Markers = createMarkerLocal[format["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
        _Markers setMarkerTypeLocal "mil_dot";
        _Markers setMarkerSizeLocal[1, 1];
        if (side _x isEqualTo independent) then {
          _Markers setMarkerColorLocal ("ColorIndependent");
        };
        if (side _x isEqualTo civilian) then {
          _Markers setMarkerColorLocal ("ColorCivilian");
        };
        if (side _x isEqualTo west) then {
          _Markers setMarkerColorLocal ("ColorBLUFOR");
        };
        _Markers setMarkerTextLocal format["%1---%2", name _x, round(_x distance player)];
        if (_x isEqualTo player) then {
          _Markers setMarkerColorLocal "ColorGreen";
        };
        life_markers_Players pushback _x;
        [_x, _Markers] spawn {
          private["_PlayersOrVehicles", "_Marker"];
          _PlayersOrVehicles = _this select 0;
          _Marker = _this select 1;
          while {life_markers && (alive _PlayersOrVehicles) && (vehicle _PlayersOrVehicles isEqualTo _PlayersOrVehicles) && (getPlayerUID _PlayersOrVehicles != "")} do {
            _Marker setMarkerPosLocal([visiblePosition _PlayersOrVehicles select 0, visiblePosition _PlayersOrVehicles select 1, 0]);
            _Marker setMarkerTextLocal format["%1---%2", name _PlayersOrVehicles, round(_PlayersOrVehicles distance player)];
            sleep 0.01;
          };
          deleteMarkerLocal _Marker;
          if (!isNil "life_markers_Players") then {
            if(_PlayersOrVehicles in life_markers_Players) then {
            life_markers_Players set[(life_markers_Players find _PlayersOrVehicles), -1];
            life_markers_Players = life_markers_Players - [-1];
            };
          };
          true;
        };
      };
    };
  } forEach playableUnits;
  sleep 0.5;
};
{
  _Markers = str _x;
  life_markers_Vehicles = nil;
  life_markers_Players = nil;
  deleteMarkerLocal _Markers;
} forEach playableUnits;
