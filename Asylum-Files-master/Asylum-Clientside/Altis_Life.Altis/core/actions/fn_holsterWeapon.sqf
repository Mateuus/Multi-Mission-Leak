private["_state","_text"];
_state = [_this,3,true,[true]] call BIS_fnc_param;
if (vehicle player != player) exitWith {};
if (!_state && !isNull life_object_inhand) exitWith {};
if (_state) then
{
	//["in"] call life_fnc_fireMode;
	player action ["hideWeapon",player,player,100];
}
else
{
	player action ["hideWeapon",player,player,0];
	//[] spawn { sleep 1; ["out"] call life_fnc_fireMode; };
};
life_holstered = _state;