private["_unit","_coords","_Village","_random","_random2","_progress","_ui","_pgText","_cP"];
if(isNull (player getvariable "life_smartphoneCaller")) exitWith {hint "Anrufer nicht bekannt!"};
if(life_action_inUse) exitWith {hint "Du führst derzeitig eine Rückverfolgung durch!"};

_unit = player getvariable "life_smartphoneCaller";
_coords = mapGridPosition _unit;
_Village = (text (nearestLocations [(getpos _unit),["NameVillage","NameCity","NameCityCapital"],5000]select 0));
_random = round(random 2);

if(_random == 1) then {
life_action_inUse = true;

_sleep = 0.5;
_cP = 0.01;
_upp = "Rückverfolgung gestartet...";

_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};
	
if(isNull (player getvariable "life_smartphoneCaller")) exitWith {
	hint "Der Anrufer hat das Gespräch frühzeitig beendet. Es konnten keine Informationen gesammelt werden!"
};
	hint parsetext format["Rückverfolgung erfolgreich: Anruf erfolgte in der Nähe von <t color='#ff1000'>%1 (%2)</t>.",_Village,_coords];
	life_action_inUse = false;
} else {
	life_action_inUse = true;
		
	_sleep = 0.5;
	_cP = 0.01;
	_upp = "Rückverfolgung gestartet...";

	_handle = [_upp,_sleep,_cP,nil,nil] spawn life_fnc_processBar;
	WaitUntil{scriptDone _handle};
	if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
	if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};
	

	if(isNull (player getvariable "life_smartphoneCaller")) exitWith {
		hint "Der Anrufer hat das Gespräch frühzeitig beendet. Es konnten keine Informationen gesammelt werden!"
	};
	hint parsetext "<t color='#ff1000'>Rückverfolgung fehlgeschlagen!</t>";
life_action_inUse = false;
};