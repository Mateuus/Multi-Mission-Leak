
_veh = _this select 0;

If(_veh getVariable "life_get_rar") exitWith {hint "Dieses extrem geile, goldene, teure Fahrzeug wurde schon geklaut. Dies tut uns leid."};
if(life_action_inUse) exitWith {hint "Du bist gerade schon dabei das Fahrzeug zu klauen!"};
life_action_inUse = true;
_veh setVariable ["life_get_rar",true,true];

_sleep = 0.5;
_cP = 0.01;
_upp = "Klaue seltenes Fahrzeug...";

_handle = [_upp,_sleep,_cP,"Acts_carFixingWheel",_veh,4] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;life_schatzsuche = false;};
if(life_process_bad) exitWith {life_process_bad = false;life_schatzsuche = false;};

switch(true) do {
	case(_veh == rarzeug1): {_veh removeaction rarzeugaction1; if(!erfolg_rarzeug1) then {erfolg_rarzeug1 = true; ["erfolg_rarzeug1"] spawn life_fnc_erfolgerhalten; sleep 5;}};
	case(_veh == rarzeug2): {_veh removeaction rarzeugaction2; if(!erfolg_rarzeug2) then {erfolg_rarzeug2 = true; ["erfolg_rarzeug2"] spawn life_fnc_erfolgerhalten; sleep 5;}};
	case(_veh == rarzeug3): {_veh removeaction rarzeugaction3; if(!erfolg_rarzeug3) then {erfolg_rarzeug3 = true; ["erfolg_rarzeug3"] spawn life_fnc_erfolgerhalten; sleep 5;}};
	case(_veh == rarzeug4): {_veh removeaction rarzeugaction4; if(!erfolg_rarzeug4) then {erfolg_rarzeug4 = true; ["erfolg_rarzeug4"] spawn life_fnc_erfolgerhalten; sleep 5;}};
};

player reveal _veh;
life_vehicles pushBack _veh;
[getPlayerUID player,playerSide,_veh,1] remoteExecCall ["SOA_fnc_keyManagement",2];
sleep 0.5;
_veh setVariable ["trunk_in_use",false,true];
_veh setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
sleep 0.5;
[_veh,(_veh getVariable "life_VEH_color")] remoteExec ["life_fnc_colorVehicle",0];
sleep 0.5;
[(getPlayerUID player),playerSide,_veh,(_veh getVariable "life_VEH_color")] remoteExecCall ["SOA_fnc_vehicleCreate",2];
hint "Parke dieses Fahrzeug umgehend ein, damit es nicht erneut geklaut werden kann!";

life_action_inUse = false;