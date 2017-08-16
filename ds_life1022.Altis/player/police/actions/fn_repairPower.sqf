private ["_type","_powerStation","_copsNeeded","_position","_counter","_pass","_defused"];

_type = _this select 3;
_position = (position player);
_counter = 120;
_pass = false;
_defused = false;

if([player,15,west] call DS_fnc_nearbyPlayers) exitWith {hint "You can't do this with another officer so close by"};
if(powerStation1 getVariable ["closed",FALSE])exitWith{hint "This power plant does not need repaired";};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

_upp = "Repairing Power Plant";
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
	{
	sleep 0.3;
	_cP = _cP + 0.01;
	if((_cP == 0.25)||(_cP == 0.50)||(_cP == 0.75)) then {player playMove "AinvPknlMstpSnonWnonDnon_medic_1";};
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player distance _position > 15) exitWith {};
	};

	"progressBar" cutText ["","PLAIN"];
	player playActionNow "stop";

	if(!alive player) exitWith{hint "Failure due to being killed";DS_doingStuff = false;};
	if(player distance _position > 15)exitWith{hint "Failure due to moving while reparing";DS_doingStuff = false;};
	[75,true] spawn DS_fnc_moralAlter;
	[0,format["%1 from the APD has repaired the Altis Power Station", name player],false,0] remoteExecCall ["DS_fnc_globalMessage",west];
	[0] remoteExec ["HUNT_fnc_power",2];
	[15000,"has repaired the power station",(name player)] remoteExec ["DS_fnc_copRewards",west];
	DS_doingStuff = false;