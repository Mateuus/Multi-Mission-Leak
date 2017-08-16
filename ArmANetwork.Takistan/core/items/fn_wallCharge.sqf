/*
	Author: Bryan "Tonic" Boardwine
	life_fnc_safeGold
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
if((west countSide playableUnits) < 1) exitWith {hint "There needs to be at least one member of NATO/TSF on to break into the Prison";};
private["_prisonvault","_handle","_bomb","_marker"];
_prisonvault = prison_safe;
if(cursorTarget != prison_safe) exitWith {hint "You aren't looking at the Prison Wall!"};
if(isNull _prisonvault) exitWith {}; //Bad object
if(typeOf _prisonvault != "Land_CncWall4_F") exitWith {hint "This isn't the Prison Wall!"};
if(_prisonvault getVariable["pchargeplaced",false]) exitWith {hint "A charge has already been placed. Back off!"};
if(_prisonvault getVariable["prison_open",false]) exitWith {hint "The wall has already been destroyed!"};
if(!([false,"demolitioncharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

prison_safe setVariable["pchargeplaced",true,true];
_handle = [] spawn life_fnc_prisonWallTimer;
[] remoteExec ["life_fnc_prisonWallTimer",west];
[_prisonvault,"ticktock",10] call life_fnc_globalSound;
waitUntil {scriptDone _handle};
sleep 0.9;
if(!(prison_safe getVariable["pchargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL prison_safe select 0, getPosATL prison_safe select 1, (getPosATL prison_safe select 2)+0.5];
prison_safe setVariable["pchargeplaced",false,true];
prison_safe setVariable["prison_open",true,true];
prison_safe attachTo [prison_holder,[3,4,-0.4]];
prison_safe1 attachTo [prison_holder,[3,4,-0.4]];
prison_safe2 attachTo[prison_wallholder,[3.9,0.85,1.75]];
_marker = createMarker ["MarkerJailbreak", prison_safe2];
_marker setMarkerColor "ColorRed";
_marker setMarkerType "Empty";
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [100,100];
_markerText = createMarker ["MarkerTextJailbreak", prison_safe2];
_markerText setMarkerColor "ColorBlack";
_markerText setMarkerText "!!JAILBREAK!!";
_markerText setMarkerType "KIA";
//[getPlayerUID player,player getVariable["realname",name player],"667"] remoteExecCall ["life_fnc_wantedAdd",2]; TODO WHEN FIXING WANTED SYSTEM
systemChat "You have been added to the wanted list for breaking into the prison...";
[5,"JAILBREAK - Rebels have seized the Prison in an escape attempt! Authorities are claiming it's another attack from one of the self-claimed Rebel groups"] remoteExecCall ["life_fnc_broadcast",-2];
hint localize "STR_ISTR_Blast_OpenedPrison";

/*
prison_safe attachTo[prison_wallholder,[-0.1,3,0.8]];
_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL prison_safe select 0, getPosATL prison_safe select 1, (getPosATL prison_safe select 2)+0.5];  prison_safe attachTo [prison_holder,[3,4,-0.4]];

Land_New_WiredFence_5m_F
Land_Mil_WiredFence_F
prison_safe attachTo[prison_wallholder,[3.7,0.85,1.4]];
prison_safe1 attachTo [prison_wallholder,[3.7,1.8,0.57]];

*/
