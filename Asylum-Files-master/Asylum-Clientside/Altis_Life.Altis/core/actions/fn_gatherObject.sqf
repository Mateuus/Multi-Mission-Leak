/*
	File: fn_gatherObject.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Get berries off that bush!
*/

private["_bush","_var","_item","_name"];

_bush = cursorObject;

_data = [_this,3,["",3],[[]]] call BIS_fnc_param;
_item = _data select 0;
_max = _data select 1;
_string = _data select 2;
if(!([str _bush,_string] call KRON_StrInStr)) exitWith {}; //recheck and exit to prevent malicious setdamage 1 - KW

if (_item == "") exitWith {};
if (isNull _bush) exitWith {};

if (_item == "cocaleaf" && 9 in life_gangtalents) then { _max = _max + 1; };
_count = ceil (random _max);

if(vehicle player != player) exitWith { hint "You cannot gather from within your vehicle." };
if(!([true,_item,_count] call life_fnc_handleInv)) exitWith { hint "You don't have room for that." };

_bush setDamage 1;

_var = [_item,0] call life_fnc_varHandle;
_name = [_var] call life_fnc_varToStr;

[[player,"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon","switch",0],"life_fnc_animSync",true,false] spawn life_fnc_MP;
titleText[format["You gathered %1 %2.",_count,_name],"PLAIN"];