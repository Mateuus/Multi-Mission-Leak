/*
	File: fn_compRequest.sqf
	Author: Kevin Webb

	Description:
	Sorts out what needs to be done to a player's cash, then adjusts it.
*/
private["_amount","_type"];
_type = [_this,0,0,[0]] call BIS_fnc_param;
_amount = ctrlText 7331;
_reason = ctrlText 7332;
_msg = "";

if(_type == 0) then {
	_msg = format["The admin %1 has given $%2 to %3 for reason: %4",profileName,_amount,name life_compTarget,_reason];
} else {
	_msg = format["The admin %1 has taken $%2 from the bank of %3 for reason: %4",profileName,_amount,name life_compTarget,_reason];
};

if(!([_amount] call fnc_isnumber)) exitWith {hint "You didn't enter an actual number.";};
if(parseNumber(_amount) <= 0) exitWith { hint "Invalid number";};
if(parseNumber(_amount) > 500000) exitWith { hint "You can not send/take more than $500,000 in a single instance."; };

[[_type,parseNumber(_amount),profileName],"life_fnc_compAction",life_compTarget,false] spawn life_fnc_MP;
if(_type == 0) then {
	titleText[format["You gave $%1 to %2",_amount,name life_compTarget],"PLAIN"];
} else {
	titleText[format["You took $%1 from %2",_amount,name life_compTarget],"PLAIN"];
};
closeDialog 0;
[3,-1,_msg] call life_fnc_newMsg;