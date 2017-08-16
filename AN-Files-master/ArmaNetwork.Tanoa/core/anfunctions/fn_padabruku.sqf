/*
	Author: Bryan "Tonic" Boardwine
	Description:
	Deposits money into the players gang bank.
*/
private["_value"];
if((group player getVariable ["gbank_in_use_by",""]) != getPlayerUID player) exitWith {hintSilent "Gang Funds are currently being used!";};
_value = parseNumber(ctrlText 1401);
//Series of stupid checks
if(_value > 999999) exitWith {hintSilent localize "STR_ATM_GreaterThan";};
if(_value <= 0) exitWith {};
if(!([str(_value)] call life_fnc_spunetuwada)) exitWith {hintSilent localize "STR_ATM_notnumeric"};
if(_value > an_bank) exitWith {hintSilent localize "STR_NOTF_NotEnoughFunds"};
[_value,1,1] call life_fnc_sewawruk;
_gFund = (group player) getVariable ["gangBank",0];
_gfund = _gfund + _value;
(group player) setVariable ["gangBank",_gFund,true];
(findDisplay 2700) displayRemoveAllEventHandlers "KeyDown";
closeDialog 0;
_message = format["You've deposited $%1 into %2",[_value] call life_fnc_rupadudejat,(group player) getVariable ["gangName","Error"]];
[_message,true,[0,1,0,1]] call life_fnc_notificationHandler;
[1,(group player)] remoteExecCall ["life_fnc_gangUpdate",2];
group player setVariable ["gbank_in_use_by",""];
