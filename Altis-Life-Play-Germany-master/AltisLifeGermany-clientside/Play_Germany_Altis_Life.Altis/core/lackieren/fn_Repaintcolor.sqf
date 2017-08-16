#include <macro.h>
/*
File: fn_Repaintcolor.sqf
Author: Play-Germany

Description: Opens the display to recolor the vehicle

*/
private["_index","_className","_c_arr","_id","_colorcost","_i","_text"];

if(isNull (findDisplay 2300)) exitWith {};
_index = lbCurSel 2302;
_className = lbData[2302,_index];
_ctrl = CONTROL(2300,2303);
lbClear _ctrl;
_colorArray = M_CONFIG(getArray,CONFIG_VEHICLES,_className,"textures");
_side = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; default {"civ"};};

{
	_flag = SEL(_x,1);
	_textureName = SEL(_x,0);
	if(_textureName == "Taxi" && !license_civ_taxi) then {_flag = "nope"};
	if(_textureName == "Twitch" && !license_civ_twitch) then {_flag = "nope"};
	if((productVersion select 3 <= 136134) && {_className in ["O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","O_Truck_03_fuel_F"]} && {_textureName != "Hex-Tarn"}) then {_flag = "nope"};
	if((count _x >= 4) && {(_x select 3) == 1} && {FETCH_CONST(life_donatorlevel) < 1}) then {_flag = "nope"};
	if((_className in (LIFE_SETTINGS(getArray,"vehicleShop_donColorOnly"))) && {FETCH_CONST(life_donatorlevel) < 1}) then {_flag = "nope"};
	if(EQUAL(_side,_flag)) then {
		_ctrl lbAdd _textureName;
		_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
	} else {
		if(EQUAL(_flag,"reb") && license_civ_rebel) then {
			_ctrl lbAdd _textureName;
			_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
		};
	};
} foreach _colorArray;

lbSetCurSel [2303,0];
if((lbSize 2303)-1 != -1) then {
	ctrlShow[2303,true];
} else {
	ctrlShow[2303,false];
};