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
_curTarget = param [0,ObjNull,[ObjNull]];
/*
_canAct = (_curTarget getVariable ["CanAct",1]);
if(_canAct isEqualTo 0) exitWith {closeDialog 0; hintSilent "Patient already being looked at!";};
_curTarget setVariable ["CanAct",0,true];
*/
_declaredDead = _curTarget getVariable "DeclaredDead";
_brokenLeg = _curTarget getVariable "LegBroken";
life_pInact_curTarget = _curTarget;
{
	ctrlShow[_x,false];
} forEach [37462,37463,37464,37465,37466];

(_display displayCtrl 37450) ctrlSetText "Diagnose Patient";
(_display displayCtrl 37451) ctrlSetText "Patient File";
(_display displayCtrl 37452) ctrlSetText "Transfuse Blood";
(_display displayCtrl 37453) ctrlSetText "Inject Morphine";
(_display displayCtrl 37454) ctrlSetText "Inject Adrenaline";
(_display displayCtrl 37455) ctrlSetText "Use Bandage";
(_display displayCtrl 37456) ctrlSetText "Use Tourniquet";
(_display displayCtrl 37457) ctrlSetText "Revive Victim";
(_display displayCtrl 37458) ctrlSetText "Show ID";
(_display displayCtrl 37459) ctrlSetText "Give Items";
(_display displayCtrl 37460) ctrlSetText "Hand over Cash";
(_display displayCtrl 37461) ctrlSetText "Give Keys";

{
	ctrlEnable [_x,false];
} forEach [37450,37452,37453,37454,37455,37456,37457,37458,37459,37460,37461];

if(alive life_pInact_curTarget) then {
	ctrlEnable [37450,true];
	buttonSetAction [37450,"closeDialog 0; [life_pInact_curTarget] call life_fnc_nouwoekiacroep"];
};

buttonSetAction [37451,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_drlanlekianoup"];

if((alive life_pInact_curTarget) && {"AN_Bloodbag" in (magazines player)} && {(life_pInact_curTarget getVariable["BleedRate",0]) isEqualTo 0} && {(life_pInact_curTarget getVariable["BloodLevel",0]) < 3000}) then {
	ctrlEnable [37452,true];
	buttonSetAction [37452,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_cuwrawreprequ"];
};

if((alive life_pInact_curTarget) && {"AN_Morphine" in (magazines player)} && {life_pInact_curTarget getVariable "LegBroken";}) then {
	ctrlEnable [37453,true];
	buttonSetAction [37453,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_wecustusachaz"];
};

if((alive life_pInact_curTarget) && {"AN_Adrenaline" in (magazines player)} && {!((life_pInact_curTarget getVariable["LifeState",0]) isEqualTo 0)}) then {
	ctrlEnable [37454,true];
	buttonSetAction [37454,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_pruspufracrub"];
};

if((alive life_pInact_curTarget) && {"AN_Bandage" in (magazines player)} && {(life_pInact_curTarget getVariable["BleedRate",0]) >= 1}) then {
	ctrlEnable [37455,true];
	buttonSetAction [37455,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_petutuswedrew;"];
};

if((alive life_pInact_curTarget) && {"AN_Tourniquet" in (magazines player)} && {(life_pInact_curTarget getVariable["BleedRate",0]) >= 1}) then {
	ctrlEnable [37456,true];
	buttonSetAction [37456,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_suswethuzaspe;"];
};

if(!alive life_pInact_curTarget && {isNil "_declaredDead"} && {"AN_Defibrillator" in (magazines player)}) then {
	ctrlEnable [37457,true];
	buttonSetAction [37457,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_triepluwleqlep"];
};
if(alive life_pInact_curTarget) then {
		ctrlEnable [37458,true];
	buttonSetAction [37458,"closeDialog 0; [life_pInact_curTarget] call life_fnc_praju;"];
};
if(alive life_pInact_curTarget) then {
	ctrlEnable [37459,true];
	buttonSetAction [37459,"closeDialog 0; [life_pInact_curTarget] call life_fnc_cexec;"];
};

if((alive life_pInact_curTarget) && an_cash > 0) then {
	ctrlEnable [37460,true];
	buttonSetAction [37460,"closeDialog 0; [life_pInact_curTarget] call life_fnc_befru;"];
};

if(count life_vehicles > 0 && {side life_pInact_curTarget isEqualTo playerSide} && (alive life_pInact_curTarget)) then {
	ctrlEnable [37461,true];
	buttonSetAction [37461,"closeDialog 0; [life_pInact_curTarget] call life_fnc_staye;"];
};
