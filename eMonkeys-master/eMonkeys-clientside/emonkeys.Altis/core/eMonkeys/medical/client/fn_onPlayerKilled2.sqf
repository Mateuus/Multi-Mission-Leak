
closeDialog 0;

if (eM_tot) exitWith {};
emonkey_timeover = false;
eM_on_kill = true;
[player] call emonkeys_fnc_setdefveriable;
[] call SOCK_fnc_updateRequest;
eM_tot = false;

if(player getVariable "gagged") then {[[2],"EMonkeys_fnc_bagUseAction",player,FALSE] spawn EMonkeys_fnc_MP;};

[] spawn emonkeys_fnc_death_effect;
EMonkeys_deathCamera  = "CAMERA" camCreate (getPosATL player);
showCinemaBorder TRUE;
EMonkeys_deathCamera cameraEffect ["Internal","Back"];
EMonkeys_deathCamera camSetTarget player;
EMonkeys_deathCamera camSetRelPos [0,3.5,7.5];
EMonkeys_deathCamera camSetFOV .5;
EMonkeys_deathCamera camSetFocus [50,0];
EMonkeys_deathCamera camCommit 0;

player setVariable ["medRequested",false, true];


createDialog "DeathScreen";

player spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;

	_Timer = ((findDisplay 7300) displayCtrl 7301);
	jhmedsys_maxTime = time + (getNumber(missionConfigFile >> "Cfgmaster" >> "respawntime") * 60);

	waitUntil {_Timer ctrlSetText format["Respawn möglich in: %1",[(jhmedsys_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(jhmedsys_maxTime - time) <= 0};

	_Timer ctrlSetText "Du wurdest gerettet und aus dem Krankenhaus entlassen!";
	emonkey_timeover = true;
	
};


systemChat format ["%1 hat dich schwer verletzt",name Emonkeys_killer];

[player] execFSM "core\fsm\medical.fsm";
(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"];



//Make the killer wanted
if(!isNull Emonkeys_killer && {Emonkeys_killer != player} && {side Emonkeys_killer in [east,civilian]}) then {
	
		[[getPlayerUID Emonkeys_killer,Emonkeys_killer getVariable["realname",name Emonkeys_killer],"187"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
		
		if(!local Emonkeys_killer) then {
			[[3],"EMonkeys_fnc_removeLicenses",Emonkeys_killer,FALSE] call EMonkeys_fnc_mp;
		};

};

if(!isNull Emonkeys_killer && {Emonkeys_killer != player}) then {
	eM_removeWanted = true;
};