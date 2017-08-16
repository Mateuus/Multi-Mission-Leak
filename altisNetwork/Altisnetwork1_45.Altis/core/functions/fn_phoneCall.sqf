private ["_init","_unit","_callStart"];
_init = [_this,0,true,[true]] call BIS_fnc_param;
_unit = [_this,1,objNull,[objNull]] call BIS_fnc_param;
life_phone_target = _unit;
life_phone_caller = player;

if (isNull _unit) exitWith
{
	_to = objNull;
	_toString = format["%1",(lbData[5004,(lbCurSel 5004)])];
	if (_toString isEqualTo "911" && isNull life_dispatcher) exitWith { hint "Police dispatch is currently unavailable. Please try again later or send an emergency text message." };
	if (_toString isEqualTo "911") then { _to = life_dispatcher }
	else { _to = call compile _toString; };
	if (isNull _to) exitWith {};
	[true,_to] spawn life_fnc_phoneCall;
};

if (life_phone_status != 0) exitWith {};

_callStart = time;

if (_init) then
{
	if("ItemRadio" in (assignedItems life_phone_target)) then {
		if (life_phone_channel > -1) exitWith {};
		life_phone_status = 2;
		[[0,2], format["Calling %1...", name _unit]] call life_fnc_broadcast;
		[[false,player],"life_fnc_phoneCall",_unit,false] spawn BIS_fnc_MP;
		while {life_phone_status isEqualTo 2} do
		{
			if (life_phone_channel > -1) exitWith { life_phone_status = 3 };
			if (time - _callStart > 60) exitWith { life_phone_status = 0 };
			playSound "PhoneDial";
			sleep 4;
		};
		if (life_phone_status isEqualTo 0) then { [[0,2], format["%1 did not answer their phone.", name _unit]] call life_fnc_broadcast; };
		if (life_phone_status isEqualTo 3 || life_phone_channel > -1) then { [[0,2], format["%1 added to phone session.", name _unit]] call life_fnc_broadcast; };
	}
	else
	{
		[[0,2], format["Calling %1...", name _unit]] call life_fnc_broadcast;
		playSound "PhoneDial";
		sleep 4;
		[[0,2], format["%1's cell phone does not have service.", name _unit]] call life_fnc_broadcast;
		playSound "PhoneNoService";
	};
}
else
{
	life_phone_status = 1;
	[[0,2], format["Incoming call from %1. Press 9 to answer or 8 to ignore.", name _unit]] call life_fnc_broadcast;
	while {life_phone_status isEqualTo 1} do
	{
		if (time - _callStart > 55) exitWith { life_phone_status = 0 };
		if (life_ringer) then { playSound "PhoneRing"; };
		sleep 3;
	};
	if (life_phone_status isEqualTo 3) then
	{
		if(player isEqualTo life_dispatcher) then {[name _unit, getPos _unit, "911 CALL"] spawn life_fnc_createMarker};
		[[_unit,player,false],"TON_fnc_managePhone",false,false] spawn BIS_fnc_MP;
	};
};