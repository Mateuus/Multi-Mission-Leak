/*
	File: fn_vUseItem.sqf
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4"];
createDialog "vUseItem_Menu";
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Wrong target!"; closeDialog 0;};

_display = findDisplay 55555;
_Btn1 = _display displayCtrl 55557;
_Btn2 = _display displayCtrl 55558;
_Btn3 = _display displayCtrl 55559;
_Btn4 = _display displayCtrl 55560;
life_pInact_curTarget = _curTarget;




//Lockpick Action
_Btn1 ctrlSetText localize "STR_vInAct_Lockpick";
_Btn1 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_lockpick; closeDialog 0;";


if(life_inv_lockpick > 0) then
{
    _Btn1 ctrlEnable true;
} else {
    _Btn1 ctrlEnable false;
};

//Refuel Action
_Btn2 ctrlSetText localize "STR_vInAct_JerryRefuel";
_Btn2 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_jerryRefuel; closeDialog 0;";

if(life_inv_fuelF > 0) then
{
    _Btn2 ctrlEnable true;
} else {
    _Btn2 ctrlEnable false;
};


//Gps Tracker
_Btn3 ctrlSetText localize "STR_vInAct_GpsTracker";
_Btn3 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_gpstracker; closeDialog 0;";


if(life_inv_gpstracker > 0) then
{
    _Btn3 ctrlEnable true;
} else {
    _Btn3 ctrlEnable false;
};

//SpeedBomb
_Btn4 ctrlSetText localize "STR_vInAct_SpeedBomb";
_Btn4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_speedbomb; closeDialog 0;";


if(life_inv_speedbomb > 0) then
{
    _Btn4 ctrlEnable true;
} else {
    _Btn4 ctrlEnable false;
};

