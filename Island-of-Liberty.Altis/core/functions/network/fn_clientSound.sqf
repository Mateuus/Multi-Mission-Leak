private["_source","_sound","_is2D"];
_source = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;
_is2D = [_this,2,false,[false]] call BIS_fnc_param;

if(_sound == "") exitWith {};
if(isNull _source) then {_source = player;};

if (_is2D) then {
    _source say2D _sound;
} else {
    _source say3D _sound;
}