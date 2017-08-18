/*
	File: fn_dogWhistle.sqf
	Author: ishi
	Rewrite of |TG-355th| Yink's dog PoC
	
	Description:
	Get the dog out
*/
private ["_unit","_tempPos","_side","_group1","_dog","_dogType"];
_unit = _this select 0;

["dog_whistle",_unit] spawn life_fnc_dogPlaySound;
hint "Come here Rex!";
sleep 1;
_unit setvariable ["follow",'false'];
_tempPos = [(getpos _unit) select 0,((getpos _unit) select 1) + 1,0];
_side = side (group _unit);
_group1 = createGroup _side;

_dogType = random(100);
if( _dogType > 50) then
{
	_dog = "Alsatian_Sandblack_F" createUnit [_tempPos,_group1,"dog = this", 1.0, "private"];
}
else
{
	_dog = "Alsatian_Black_F" createUnit [_tempPos,_group1,"dog = this", 1.0, "private"];
};

_unit setvariable ["order","idle"];
_unit setvariable ["step","go"];
_unit setvariable ["dog", dog];
(_unit getvariable "dog") setvariable ["player",_unit];

[_unit] spawn life_fnc_dogVehicle;
[_unit] spawn life_fnc_dogReturnIdle;
[_unit] spawn life_fnc_dogGrowl;

(_unit getvariable "dog") addeventhandler ["killed",{ [_unit] call life_fnc_dogKilled; }];
(_unit getvariable "dog") addeventhandler ["FiredNear",{ [_unit] call life_fnc_dogShotAt; }];