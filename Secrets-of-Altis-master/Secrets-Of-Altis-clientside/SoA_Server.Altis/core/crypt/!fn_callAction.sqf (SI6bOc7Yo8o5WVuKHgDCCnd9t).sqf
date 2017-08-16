private["_unit","_action","_mode"];
_unit = _this select 0;
_mode = _this select 1;

if(player getvariable "life_callflug") exitWith {
	[1,format["%1 hat den Flugmodus eingeschaltet, Anruf nicht möglich!",name player]] remoteExecCall ["life_fnc_broadcast",_unit];
	"CallDenied" remoteExecCall ["playsound",_unit];
};

if((player getvariable "life_callactive1") OR (player getvariable "life_callactive2")) exitWith {
	[1,format["%1 führt bereits ein Gespräch!",name player]] remoteExecCall ["life_fnc_broadcast",_unit];
	"CallDenied" remoteExecCall ["playsound",_unit];
};

if(life_action_inUse) exitWith {
	[1,"Es ist bereits ein Gespräch im Gange!"] remoteExecCall ["life_fnc_broadcast",_unit];
	"CallDenied" remoteExecCall ["playsound",_unit];
};

life_action_inUse = true;

"CallDial" remoteExecCall ["playsound",_unit];
for "_i" from 0 to 1 do {
	playsound ringtone;
	sleep 5;
};

switch(_mode) do {

	case 0:{
		_action = [
			format["Eingehender Anruf: %1",name _unit],
			"Anruf annehmen",
			"Ja",
			"Nein"
		] call BIS_fnc_guiMessage;

		if(_action) then {
			[true,_mode] remoteExec ["life_fnc_dialCall",_unit];
					  player setvariable["life_smartphoneCaller",_unit];
					  life_action_inUse = false;
		} else {
			[false,_mode] remoteExec ["life_fnc_dialCall",_unit];
					  life_action_inUse = false;
		};
	};
	
	case 1:{
		_action = [
			format["Eingehender Anruf: Anonym"],
			"Anruf annehmen",
			"Ja",
			"Nein"
		] call BIS_fnc_guiMessage;

		if(_action) then {
			[true,_mode] remoteExec ["life_fnc_dialCall",_unit];
					  player setvariable["life_smartphoneCaller",_unit];
					  life_action_inUse = false;
		} else {
			[false,_mode] remoteExec ["life_fnc_dialCall",_unit];
					  life_action_inUse = false;
		};
	};
};