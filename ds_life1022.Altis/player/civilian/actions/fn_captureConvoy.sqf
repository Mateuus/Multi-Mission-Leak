/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	For civs to capture police convoy
*/

private ["_value","_veh"];

_value = 1000000;
_veh = cursorTarget;
if(!police_convoy)exitWith{};
if(playerSide isEqualTo west)exitWith{};
if(DS_doingStuff)exitWith{};
if([player,50,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this with police so nearby","PLAIN"];};
if(_veh getVariable ["gettingCaptured",false])exitWith{hint "Someone is already doing this"};
_veh setVariable ["gettingCaptured",true,true];
DS_doingStuff = true;
_upp = "Capturing Convoy";
disableSerialization;
"progressBar" cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true}do {
	sleep 0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _veh > 20) exitWith {};
	if(!isNull objectParent player) exitWith {};
	if(!alive _veh)exitWith{};
	if(DS_tazed) exitWith {};
	if(!alive player) exitWith {};
};

"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";

if([player,50,west] call DS_fnc_nearbyPlayers) exitWith {_veh setVariable ["gettingCaptured",false,true];titleText["You can not do this with police so nearby","PLAIN"];};
if(!alive player) exitWith {_veh setVariable ["gettingCaptured",false,true];};
if(player distance _veh > 20) exitWith {hint "You moved too far from the convoy truck";DS_doingStuff = false;_veh setVariable ["gettingCaptured",false,true];};
if(!isNull objectParent player) exitWith {hint "You can't do this while inside a vehicle";DS_doingStuff = false;_veh setVariable ["gettingCaptured",false,true];};
if(!alive _veh) exitWith {hint "The truck was destroyed, along with it contents";DS_doingStuff = false;_veh setVariable ["gettingCaptured",false,true];};
if(DS_tazed) exitWith {DS_doingStuff = false;_veh setVariable ["gettingCaptured",false,true];};

[1,"A Rebel has captured the police convoy",true,0] remoteExecCall ["DS_fnc_globalMessage",-2];

systemchat format ["Success, you have been paid $%1 and the trucks weapons have been unlocked",[(_value)] call DS_fnc_numberText];
hint format ["Success, you have been paid $%1 and the trucks weapons have been unlocked",[(_value)] call DS_fnc_numberText];
player say3D "success";

_amount = [] call DS_fnc_getCopScore;
_amount = (_amount*100000);
[_amount] spawn DS_civ_payGangAccount;

[(_value),false,true] call DS_fnc_handleMoney;
_veh addWeaponCargoGlobal["srifle_GM6_camo_F",8];
_veh addMagazineCargoGlobal["5Rnd_127x108_APDS_Mag",60];
_veh addWeaponCargoGlobal["launch_RPG32_F",5];
_veh addMagazineCargoGlobal["RPG32_F",26];
_veh addItemCargoGlobal["optic_Nightstalker",8];
_veh addWeaponCargoGlobal["MMG_02_camo_F",4];
_veh addMagazineCargoGlobal["130Rnd_338_Mag",60];
_veh addWeaponCargoGlobal["arifle_MX_GL_F",8];
_veh addMagazineCargoGlobal["30Rnd_65x39_caseless_mag_Tracer",40];
_veh addMagazineCargoGlobal["3Rnd_HE_Grenade_shell",60];
server_batteryArray set [1,8];
publicVariable "server_batteryArray";

_veh setVariable ["captured",true,true];
DS_doingStuff = false;

[250,false] call DS_fnc_moralAlter;