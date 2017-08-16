/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Picks up money
*/

if((time - DWEV_action_delay) < 1.5) exitWith 
{
	hint "Du kannst diese Taste nicht Spammen.";
	if(!isNil {(_this select 0) getVariable "inUse"}) then 
	{
		_this select 0 setVariable["inUse",false,true];
	};
};

private["_obj","_val"];
_obj = param [0,ObjNull,[ObjNull]];
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith 
{
	if(!isNull _obj) then 
	{
		_obj setVariable["inUse",false,true];
	};
};

if((_obj getVariable["PickedUp",false])) exitWith 
{
	deleteVehicle _obj;
}; //Object was already picked up.

_obj setVariable["PickedUp",TRUE,TRUE];

if(!isNil {_val}) then
{
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 9999999) : {_val = 99999;}; //VAL>10mil->100k
		case (_val > 2000000) : {_val = 250000;}; //VAL>2mil->250k
		default {};
	};
	
	if (_val > 499998) then 
{
	[6,player,format ["%1 € - Bargeld. %2 € Bankkonto. %3 €",[_val] call DWEV_fnc_numberText,[dwf_cash] call DWEV_fnc_numberText,[dwf_atmcash] call DWEV_fnc_numberText]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
};

	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format["Du hast %1€ aufgesammelt.",[_val] call DWEV_fnc_numberText],"PLAIN"];
	player say3D "bag";
	dwf_cash = dwf_cash + _val;
	[] call SOCK_fnc_updateRequest;
	DWEV_action_delay = time;
};