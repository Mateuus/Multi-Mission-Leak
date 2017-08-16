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
if(isNull _curTarget) exitWith {closeDialog 0;};
if(!isPlayer _curTarget) exitWith {closeDialog 0;};
_isArrested = _curTarget getVariable "arrested";
life_pInact_curTarget = _curTarget;
{
	ctrlShow [_x,false];
} forEach [37461,37462,37463,37464,37465,37466];

//Set Unrestrain Button

//Set Unrestrain Button
if(_curTarget getVariable "restrained") then {(_display displayCtrl 37450) ctrlSetText localize "STR_pInAct_Unrestrain"} else {ctrlEnable [37450,false];};
(_display displayCtrl 37451) ctrlSetText localize "STR_pInAct_checkLicenses";
(_display displayCtrl 37452) ctrlSetText localize "STR_pInAct_SearchPlayer";
(_display displayCtrl 37454) ctrlSetText localize "STR_pInAct_TicketBtn";
//(_display displayCtrl 37455) ctrlSetText localize "STR_pInAct_Arrest";
if(_curTarget getVariable "restrained") then {(_display displayCtrl 37455) ctrlSetText localize "STR_pInAct_Arrest"} else {ctrlEnable [37455,false];};
if(_curTarget getVariable "restrained") then {(_display displayCtrl 37456) ctrlSetText localize "STR_pInAct_PutInCar"} else {ctrlEnable [37456,false];};
//(_display displayCtrl 37456) ctrlSetText localize "STR_pInAct_PutInCar";
//(_display displayCtrl 37457) ctrlSetText localize "STR_pInAct_RemoveWeapons";
if(_curTarget getVariable "restrained") then {(_display displayCtrl 37457) ctrlSetText localize "STR_pInAct_RemoveWeapons"} else {ctrlEnable [37457,false];};
//(_display displayCtrl 37458) ctrlSetText localize "STR_pInAct_stripSearch";
if(_curTarget getVariable "restrained") then {(_display displayCtrl 37458) ctrlSetText localize "STR_pInAct_stripSearch"} else {ctrlEnable [37458,false];};
(_display displayCtrl 37459) ctrlSetText "Breathalyze";
(_display displayCtrl 37460) ctrlSetText "Drug Test";

if(_curTarget getVariable ["Escorting",false]) then {
	ctrlEnable [37450,false];
} else {
	ctrlEnable [37450,true];
	buttonSetAction [37450,"[life_pInact_curTarget] call life_fnc_qeswutavucra; closeDialog 0;"];
};

buttonSetAction [37451,"closeDialog 0; [player] remoteExecCall [""life_fnc_licenseCopCheck"",life_pInact_curTarget]"];
buttonSetAction [37452,"[life_pInact_curTarget] call life_fnc_hephepawabre; closeDialog 0;"];

//Set Escort Button
if(_curTarget getVariable["Escorting",false]) then {
	(_display displayCtrl 37453) ctrlSetText localize "STR_pInAct_StopEscort";
	buttonSetAction [37453,"[life_pInact_curTarget] call life_fnc_pareregekesw; [life_pInact_curTarget] call life_fnc_copInteractionMenu;"];
} else {
	if(_curTarget getVariable "restrained") then {
	(_display displayCtrl 37453) ctrlSetText localize "STR_pInAct_Escort";
	buttonSetAction [37453,"[life_pInact_curTarget] call life_fnc_crehenefrevu; closeDialog 0;"];
	} else {ctrlShow [37453,false]};
};

buttonSetAction [37454,"[life_pInact_curTarget] call life_fnc_spesaveyazew;"];
buttonSetAction [37455,"closeDialog 0; [life_pInact_curTarget] call life_fnc_wunucheyebre;"];

if((player distance (getMarkerPos "prison_enter") < 5) && {isNil "_isArrested"}) then {
	ctrlEnable [37455,true];
} else {
 ctrlEnable [37455,false];};

buttonSetAction [37456,"[life_pInact_curTarget] call life_fnc_wrathachurat;"];
buttonSetAction [37457,"closeDialog 0; [] remoteExecCall [""life_fnc_sufuchugup"",life_pInact_curTarget];"];
buttonSetAction [37458,"closeDialog 0; [] remoteExecCall [""life_fnc_chuspephuc"",life_pInact_curTarget];"];
buttonSetAction [37459,"closeDialog 0; [life_pInact_curTarget] call life_fnc_dasechudufa;"];
buttonSetAction [37460,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_fepevestuspa;"];
