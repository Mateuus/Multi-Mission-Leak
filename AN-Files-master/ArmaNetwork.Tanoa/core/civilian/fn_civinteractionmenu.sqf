/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_display = findDisplay 37400;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;};
if(!isPlayer _curTarget) exitWith {closeDialog 0;};
life_pInact_curTarget = _curTarget;

{
	ctrlShow[_x,false];
} forEach [37455,37456,37457,37458,37459,37460,37461,37462,37463,37464,37465,37466];

//Set Unrestrain Button
if(_curTarget getVariable "restrained") then {(_display displayCtrl 37450) ctrlSetText localize "STR_pInAct_Unrestrain"} else {ctrlEnable [37450,false];};
(_display displayCtrl 37452) ctrlSetText localize "STR_pInAct_PutInCar";
(_display displayCtrl 37453) ctrlSetText "Pat Down";
(_display displayCtrl 37454) ctrlSetText "Rob Player";

if(_curTarget getVariable ["Escorting",false]) then {
	ctrlEnable [37450,false];
} else {
	ctrlEnable [37450,true];
	buttonSetAction [37450,"closeDialog 0; [life_pInact_curTarget] call life_fnc_qeswutavucra;"];
};

//Set Escort Button
if(_curTarget getVariable["Escorting",false]) then {
	(_display displayCtrl 37451) ctrlSetText localize "STR_pInAct_StopEscort";
	buttonSetAction [37451,"closeDialog 0; [life_pInact_curTarget] call life_fnc_pareregekesw;"];
} else {
		if(_curTarget getVariable "restrained") then {
		(_display displayCtrl 37451) ctrlSetText localize "STR_pInAct_Escort";
		buttonSetAction [37451,"[life_pInact_curTarget] call life_fnc_crehenefrevu; closeDialog 0;"];
		} else {hintSilent "You must restrain them before escorting!"};
};

buttonSetAction [37452,"[life_pInact_curTarget] call life_fnc_wrathachurat;"];
buttonSetAction [37453,"closeDialog 0; [] remoteExecCall [""life_fnc_dubrenusef"",life_pInact_curTarget];"];
buttonSetAction [37454,"closeDialog 0; [life_pInact_curTarget] call life_fnc_praphaprab;"];
