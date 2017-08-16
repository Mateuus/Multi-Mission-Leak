#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_textures"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR EQUAL(_index,-1)) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.
_vehicle setVariable ["BIS_enableRandomization", false];

_textures = SEL(SEL(M_CONFIG(getArray,CONFIG_VEHICLES,(typeOf _vehicle),"textures"),_index),2);
if(isNil "_textures" OR {EQUAL(count _textures,0)}) exitWith {};

//Local to us? Set it's color.
if(local _vehicle) then {
	_vehicle setVariable["Life_VEH_color",_index,true];
};

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};
{_vehicle setObjectTexture [_forEachIndex,_x];} foreach _textures;