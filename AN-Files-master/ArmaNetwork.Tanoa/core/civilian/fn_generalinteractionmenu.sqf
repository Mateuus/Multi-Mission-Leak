/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_display = findDisplay 37400;
_curTarget = param [0,objNull,[objNull]];
if (isNull _curTarget) exitWith {closeDialog 0;};
if (!isPlayer _curTarget) exitWith {closeDialog 0;};
private _legBroken = _curTarget getVariable "LegBroken";
life_pInact_curTarget = _curTarget;

{
	ctrlShow[_x,false];
} forEach [37462,37463,37464,37465,37466];

(_display displayCtrl 37450) ctrlSetText "Show ID";
(_display displayCtrl 37451) ctrlSetText "Give Items";
(_display displayCtrl 37452) ctrlSetText "Give Money";
(_display displayCtrl 37453) ctrlSetText "Give Keys";
(_display displayCtrl 37454) ctrlSetText "Check Player State";
(_display displayCtrl 37455) ctrlSetText "Bandage Player";
(_display displayCtrl 37456) ctrlSetText "Inject Morphine";
(_display displayCtrl 37457) ctrlSetText "Inject Adrenaline";
(_display displayCtrl 37458) ctrlSetText "Transfuse Blood";
(_display displayCtrl 37459) ctrlSetText "Use Tourniquet";
(_display displayCtrl 37460) ctrlSetText "Invite To Gang";
(_display displayCtrl 37461) ctrlSetText "Hire as Bodyguard";

{
	ctrlEnable [_x,false];
} forEach [37450,37452,37453,37454,37455,37456,37457,37458,37459,37460,37461];

if((playerSide isEqualTo civilian && {"id" in AN_Licenses} && {count PlayerIDArray > 0}) OR (playerSide in [west,independent])) then {
	ctrlEnable [37450,true];
	buttonSetAction [37450,"closeDialog 0; [life_pInact_curTarget] call life_fnc_praju;"];
};

buttonSetAction [37451,"closeDialog 0; [life_pInact_curTarget] call life_fnc_cexec;"];

if(an_cash > 0) then {
	ctrlEnable [37452,true];
	buttonSetAction [37452,"closeDialog 0; [life_pInact_curTarget] call life_fnc_befru;"];
};

if(playerSide isEqualTo west && count life_vehicles > 0 && {side life_pInact_curTarget isEqualTo playerSide}) then {
	ctrlEnable [37453,true];
	buttonSetAction [37453,"closeDialog 0; [life_pInact_curTarget] call life_fnc_staye;"];
};

if(playerSide isEqualTo civilian && count life_vehicles > 0 OR (call life_detective) > 0 && count life_vehicles > 0) then {
	ctrlEnable [37453,true];
	buttonSetAction [37453,"closeDialog 0; [life_pInact_curTarget] call life_fnc_staye;"];
};

if(alive life_pInact_curTarget) then {
	ctrlEnable [37454,true];
	buttonSetAction [37454,"closeDialog 0;[life_pInact_curTarget] call life_fnc_nouwoekiacroep;"];
};

if("AN_Bandage" in (magazines player) && {(life_pInact_curTarget getVariable["BleedRate",0]) > 1}) then {
	ctrlEnable [37455,true];
	buttonSetAction [37455,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_petutuswedrew;"];
};

if("AN_Morphine" in (magazines player) && {life_pInact_curTarget getVariable "LegBroken";}) then {
	ctrlEnable [37456,true];
	buttonSetAction [37456,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_wecustusachaz;"];
};

if("AN_Adrenaline" in (magazines player) && {!((life_pInact_curTarget getVariable["LifeState",0]) isEqualTo 0)}) then {
	ctrlEnable [37457,true];
	buttonSetAction [37457,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_pruspufracrub;"];
};

if("AN_Bloodbag" in (magazines player) && {(life_pInact_curTarget getVariable["BleedRate",0]) isEqualTo 0} && {(life_pInact_curTarget getVariable["BloodLevel",0]) < 3000}) then {
	ctrlEnable [37458,true];
	buttonSetAction [37458,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_cuwrawreprequ;"];
};

if("AN_Tourniquet" in (magazines player) && {(life_pInact_curTarget getVariable["BleedRate",0]) > 1}) then {
	ctrlEnable [37459,true];
	buttonSetAction [37459,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_suswethuzaspe;"];
};

if(playerSide isEqualTo civilian && {!(life_pInact_curTarget in units player)} && {side life_pInact_curTarget isEqualTo civilian}) then 
{
	if ((group player getVariable ["gangLeader",""]) != getPlayerUID player) then 
	{
		private _rank = life_gangData select 1;
		if !(_rank isEqualTo 0) then 
		{
			if ((getNumber (missionConfigFile >> "CfgGangs">> format ["gangrank_%1",_rank] >> "invite")) isEqualTo 1) then 
			{
				ctrlEnable [37460,true];
				buttonSetAction [37460,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_kaneswad;"];
			};
		};
	} 
	else 
	{
		ctrlEnable [37460,true];
		buttonSetAction [37460,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_kaneswad;"];
	};

	if(life_isGov) then 
	{
		ctrlEnable [37461,true];
		buttonSetAction [37461,"closeDialog 0; [player,life_pInact_curTarget] remoteExecCall [""life_fnc_requestNewPersonal"",2];"];
	};
} 
else 
{
	{
		ctrlShow[_x,false];
	} forEach [37460,37461];
};
