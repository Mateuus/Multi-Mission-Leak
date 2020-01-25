/*
	File: fn_pickupMoney.sqf
	
	
	Description:
	Picks up money
*/
if((time - life_action_delay) < 1.5) exitWith {
	["Nie mozesz spamowac klawiszem akcji!", false] spawn doquickmsg;
	if(!isNil {(_this select 0) getVariable "inUse"}) then {
		_this select 0 setVariable["inUse",false,true];
	};
};
private["_obj","_val"];
_obj = param [0,ObjNull,[ObjNull]];
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj setVariable["inUse",false,true];};};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
_obj setVariable["PickedUp",TRUE,TRUE];
if(!isNil {_val}) then
{
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 20000000) : {_val = 100000;}; //VAL>20mil->100k
		case (_val > 5000000) : {_val = 250000;}; //VAL>5mil->250k
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	_val = round(_val);
	[format[localize "STR_NOTF_PickedMoney",[_val] call life_fnc_numberText], false] spawn domsg;
	["cash","add",_val] call life_fnc_handleCash;
	life_action_delay = time;
};