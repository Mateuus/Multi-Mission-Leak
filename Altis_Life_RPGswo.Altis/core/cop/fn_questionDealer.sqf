/*
	File: fn_questionDealer.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Questions the drug dealer and sets the sellers wanted.
*/
private["_sellers","_names"];
_sellers = (_this select 0) getVariable["sellers",[]];
if(count _sellers == 0) exitWith {hint "Niemand hat hier in letzter Zeit etwas verkauft."}; //No data.
DWEV_action_inUse = true;
_names = "";
{
	if(_x select 2 > 100000) then
	{
		_val = round((_x select 2) / 16);
	};
	[_x select 0,_x select 1,"483",_val] remoteExec ["DWEV_fnc_wantedAdd",2];
	_names = _names + format["%1<br/>",_x select 1];
	false;
} count _sellers;

hint parseText format["Folgende Personen haben kürzlich bei diesem Dealer verkauft.<br/><br/>%1",_names];
(_this select 0) setVariable["sellers",[],true];
DWEV_action_inUse = false;