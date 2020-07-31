/*
	File: fn_postBail.sqf
	
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
_myposy = getPos _unit;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 1000000;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(cash_in_bank < life_bail_amount) exitWith {[format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount], false] spawn domsg;};

_nearestPlayer = nearestObjects[getPosATL _unit,["man"],6] select 1; 

if(isNil "_nearestPlayer") exitwith {["Potrzebujesz policjanta obok siebie aby zaplacic kaucje", false] spawn domsg;};

_timer = 60;
while {_timer > 0} do {
		hintsilent format ["Pozostalo %1 sekund az zostaniesz wypuszczony - nie ruszaj sie!",_timer];
		uiSleep 1;
		_timer = _timer - 1;
};

if( _unit distance _myposy > 3 ) exitwith {
	["Za bardzo sie oddaliles", false] spawn domsg;
};



if ( side _nearestPlayer == west ) then {
	["bank","take", life_bail_amount] call life_fnc_handleCash;
	player setPos (getMarkerPos "jail_release");
	life_bail_paid = true;
	[0,format[localize "STR_NOTF_Bail_Bailed", _unit getVariable ["realname",name _unit]]] remoteExecCall ["life_fnc_broadcast", -2];
};

