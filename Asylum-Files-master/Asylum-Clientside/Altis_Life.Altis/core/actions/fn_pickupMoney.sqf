/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Picks up money
*/
private["_obj","_val"];

_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _obj) then { _obj = cursorObject; };

if((time - life_action_delay) < 1) exitWith {hint "You can't rapidly use action keys!"};
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 4) exitWith {};

if(!isNil {_val}) then
{
	deleteVehicle _obj;
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 1000000) : {_val = 10000;}; //VAL>20mil->100k
		//case (_val > 5000000) : {_val = 250000;}; //VAL>5mil->250k
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format["You have picked up $%1",[_val] call life_fnc_numberText],"PLAIN"];
	[[34, player, format["Picked up $%1", [_val] call life_fnc_numberText]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	["cash","add",_val] call life_fnc_uC;
	life_action_delay = time;
};