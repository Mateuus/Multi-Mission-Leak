#include "..\script_macros.hpp"

/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private "_textures";
params [
	["_vehicle",objNull,[objNull]],
	["_index",-1,[0]]
];

if(isNull _vehicle OR !alive _vehicle OR EQUAL(_index,-1)) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

if(local _vehicle) then {
	switch (typeOf _vehicle) do {
		case "C_Offroad_01_F": {[_vehicle,"color",3,true] remoteExec ["ES_fnc_setObjVar",2];};
		case "C_Hatchback_01_F": {[_vehicle,"color",1,true] remoteExec ["ES_fnc_setObjVar",2];};
		case "C_Hatchback_01_sport_F": {[_vehicle,"color",1,true] remoteExec ["ES_fnc_setObjVar",2];};
		case "C_SUV_01_F": {[_vehicle,"color",1,true] remoteExec ["ES_fnc_setObjVar",2];};
		case "C_Van_01_box_F": {[_vehicle,"color",1,true] remoteExec ["ES_fnc_setObjVar",2];};
		case "C_Van_01_transport_F": {[_vehicle,"color",1,true] remoteExec ["ES_fnc_setObjVar",2];};
	};
};

_textures = SEL(SEL(M_CONFIG(getArray,"CfgVehicles",(typeOf _vehicle),"textures"),_index),2);
if(isNil "_textures" OR {EQUAL(count _textures,0)}) exitWith {};

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then {
	_textures = ((getArray(configFile >> "EisenschmiedeHighTexturesVehicles" >> (typeOf _vehicle) >> "textures") select _index) select 2);
};

//Local to us? Set it's color.
if(local _vehicle) then {
	_vehicle setVariable["ES_VEH_color",_index,true];
};

// waitUntil{!isNil {_vehicle getVariable "ES_VEH_color"}};
{_vehicle setObjectTexture [_forEachIndex,_x];} foreach _textures;