private["_source","_sound","_is2D"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;
_is2D = [_this,2,false,[false]] call BIS_fnc_param;

// if _source is null then the local player is used
if(_sound == "") exitWith {};

[_source,_sound,_is2D] remoteExec ["life_fnc_clientSound",0];
