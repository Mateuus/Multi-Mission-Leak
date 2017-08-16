/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private ["_dir","_bloodLevel"];
if(!life_killed) exitWith {};
player setUnitLoadout rb_dead_gear;
rb_dead_gear = [];
player setAmmo [primaryWeapon player, 0];
if(life_BrokenLeg) then {[false] call life_fnc_mlehleproexieb;};
life_corpse setVariable ["realname",nil,true];
//[life_corpse] remoteExecCall ["life_fnc_corpse",0];
_dir = getDir life_corpse;
hintSilent format["You were revived. You had to pay $%1 in Medical Fees!",[(getNumber (missionConfigFile >> "Life_Settings" >> "revive_fee"))] call life_fnc_rupadudejat];
player setVariable ["tf_unable_to_use_radio", false];
closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
//Take fee for services.
if(an_bank > getNumber (missionConfigFile >> "Life_Settings" >> "revive_fee")) then {
	[(getNumber (missionConfigFile >> "Life_Settings" >> "revive_fee")),1,1] call life_fnc_sewawruk;
} else {
	[an_bank,1,1] call life_fnc_sewawruk;
};
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable ["Revive",nil,true];
life_corpse setVariable ["name",nil,true];
deleteVehicle life_corpse;
life_corpse = nil;
_bloodLevel = random [500,1000,1500];
_pleb = round(random (10));
if(_pleb < 3) then {[true] spawn life_fnc_mlehleproexieb;};
player setVariable ["tf_unable_to_use_radio", false];
player setVariable ["Revive",nil,true];
player setVariable ["DeclaredDead",nil,true];
player setVariable ["name",nil,true];
player setVariable ["Reviving",nil,true];
player setVariable ["BleedRate",0,true];
player setVariable ["BloodLevel",_bloodLevel,true];
player setVariable ["BAC",0,true];
player setVariable ["timeofdeath",nil,true];
player setVariable ["tf_voiceVolume", 1, true];
profileNamespace setVariable["swuyecamar",nil];
saveProfileNamespace;

showChat true;
life_action_inUse = false;
life_killed = false;
if(life_arrested_time > 0) exitWith {
	hintSilent localize "STR_Jail_Suicide";
	[life_arrested_time,life_arrested_reason] spawn life_fnc_fruphumethum;
	player setvariable ["bloodlevel",5550,true];
	[false] spawn life_fnc_mlehleproexieb;
	player setVariable ["BleedRate",0,true];
	call life_fnc_kecedretr;
};
[0] call life_fnc_cruswutaq;
life_gear = [] call life_fnc_hewudefr;

if(UpdateThread isEqualTo -1) then
{
	UpdateThread = [150,life_fnc_kecedretr,[],true] call life_fnc_phefakefe;
};

if(FullThread isEqualTo -1) then
{
	FullThread = [1,life_fnc_phoaroefroegoe,[],true] call life_fnc_phefakefe;
};

if(MedicThread isEqualTo -1) then
{
	MedicThread = [1,life_fnc_houklamoustiup,[],true] call life_fnc_phefakefe;
};

if(PayCheckThread isEqualTo -1) then
{
	PayCheckThread = [300,life_fnc_hazephap,[],true] call life_fnc_phefakefe;
};

breakout "DeathLoop";
