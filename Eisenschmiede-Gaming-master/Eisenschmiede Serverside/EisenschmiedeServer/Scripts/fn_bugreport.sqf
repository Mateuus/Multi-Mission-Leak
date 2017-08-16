_text = ctrlText ((findDisplay 232323) displayCtrl 252525);

if(_text == "") exitWith { hint "Kein Text!" };
if(_text == "Nutze dieses Feld, um uns Bugs mitzuteilen.") exitWith { hint "Den Text ändern!" };

if(!Bugreport) exitWith {hint "Du kanst nur alle 10 Minuten ein bug melden!"; closeDialog 0;};
if(Bugreport) then {
	Bugreport = false;
	[] spawn {
		sleep 600;
		Bugreport = true;
	};
};

call {

	_toLog = format ["Name: %1 (%2) Sein Bugreport: %3", profilename, getPlayerUID player, _text];
	["BUGREPORT_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

	closeDialog 0;

    InfoText = "Dein Bugreport wurde erfolgreich gesendet!";
    [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP;

    sleep 5;

    InfoText = "www.Eisenschmiede-Gaming.de";
    [[],"ES_fnc_Status_Bar",true,true] spawn ES_fnc_MP; 

};

["BugReport"] call ES_fnc_xp_add;