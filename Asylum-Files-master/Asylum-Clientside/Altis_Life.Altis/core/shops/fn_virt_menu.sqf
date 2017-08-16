/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/

_unit = cursorTarget;
if (isNull _unit) then { _unit = _this select 0; };

if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if ((player distance _unit) > 10) exitWith { hint "You are too far away." };
if(lineIntersects[eyePos player, aimPos _unit,player,_unit]) exitWith {hint "It would be hard to buy things through the wall, don't you think?"};
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
if(playerSide == west && _shop in ["heroin","wongs"]) exitWith {};
life_shop_type = _shop;
if(_shop == "cop" && playerSide != west) exitWith {hint "You are not a cop."};
//if(_shop == "home" && life_donator < 1) exitWith {hint "You must be donator rank 1 ($10) to use home improvements."};
createDialog "shops_menu";

if (_shop == "heroin" && life_wanted > 0 && (time - life_last_wanted) > 240) then
{
	life_last_wanted = time;
	[[Str(life_wanted),name player,7],"life_fnc_clientMessage",west,false] spawn life_fnc_MP;
};

[] call life_fnc_virt_update;