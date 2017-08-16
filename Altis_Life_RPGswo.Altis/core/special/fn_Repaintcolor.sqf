#include "..\..\macros.hpp"
/*
File: fn_Repaintcolor.sqf
Author: MooN-Gaming

Description: Opens the display to recolor the vehicle

*/
private["_index","_veh","_c_arr","_id","_colorcost","_i","_text","_types"];
if(!isNull (findDisplay 2300)) then 
{
	if ((side player) == west) then {hint "Ein Staatlich gefördertes Fahrzeug darf nicht umlackiert werden";};
	if ((side player) == independent) then {hint "Ein Staatlich gefördertes Fahrzeug darf nicht umlackiert werden";};
	if ((side player) == east) then {hint "Ein Staatlich gefördertes Fahrzeug darf nicht umlackiert werden";};

	_index = lbCurSel 2302;

	lbClear 2303;

	_veh = lbData[2302,_index];

	_types = [];
	
	if ((side player) == civilian) then {_types pushBack "civ";};
	if (lc_rebel) then {_types pushBack "reb";};
	if (__GETC__(DWEV_donator) > 0) then {_types pushBack "donate";};
	if (__GETC__(DWEV_adminlevel) >= 4) then {_types pushBack "admin";};

	_colorcost = 100;

	
	_colorArray = M_CONFIG(getArray,"LifeCfgVehicles",_veh,"textures");
	{
		_flag = (_x select 1);
		_textureName = (_x select 0);
		if(_flag in _types) then {
			_x params ["_texture"];
			lbAdd[2303,format["%1",_textureName]];
           	lbSetValue [2303,(lbSize 2303)-1,_forEachIndex];
		};
	} forEach _colorArray;

	lbSetCurSel [2303,0];

	if((lbSize 2303)-1 != -1) then
	{
		ctrlShow[2303,true];
	}
	else
	{
		ctrlShow[2303,false];
	};

};

_haha = typeOf _x;

_vehicles lbSetData [(lbSize _vehicles)-1,_haha];