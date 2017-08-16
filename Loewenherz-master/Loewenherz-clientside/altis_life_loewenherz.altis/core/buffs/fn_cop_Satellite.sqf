//[player] spawn lhm_fnc_cop_Satellite;

Private ["_dir","_pos","_lhm_satphone","_player","_side"];
_player = _this select 0;
_side = side _player;
_dir = getdir _player;
_pos = getposATL _player;
_pos = [(_pos select 0)+0.5*sin(_dir),(_pos select 1)+0.5*cos(_dir), (_pos select 2)];
_lhm_satphone = createVehicle ["Land_SatellitePhone_F", _pos, [], 0, "CAN_COLLIDE"];
_lhm_satphone setDir _dir;
_lhm_satphone setposATL _pos;
_lhm_satphone addAction["<t color='#ADFF2F'>Login</t>",lhm_fnc_cop_SatphoneLogin];
_lhm_satphone addAction["<t color='#2FADFF'>Take Uplink</t>",lhm_fnc_cop_SatphoneTake];
_lhm_satphone addAction["<t color='#FFAD2F'>Destroy Uplink</t>",lhm_fnc_cop_SatphoneKill];
closeDialog 0;