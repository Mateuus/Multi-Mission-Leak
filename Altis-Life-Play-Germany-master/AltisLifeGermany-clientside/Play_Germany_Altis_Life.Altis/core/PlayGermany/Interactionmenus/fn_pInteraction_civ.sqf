/*

	Shows pInteraction Menu
	for all civ players

*/
private["_display","_curTarget","_bUnrestrain","_bArrest","_bTicket","_bEscort","_bPutInCar","_bSearch","_bShowLicenses","_bTorture"];
if(!dialog) then 
{
    createDialog "d_pInteraction_civ";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target

if(!isPlayer _curTarget) exitWith {hint "Ziel ist kein Spieler"; closeDialog 0; };

_display = findDisplay 37400;
_bEscort = _display displayCtrl 2404;
_bPutInCar = _display displayCtrl 2405;
_bUnrestrain = _display displayCtrl 2401;
_bUnrestrainP = _display displayCtrl 1200;
_bUnrestrain ctrlShow false;
_bUnrestrainP ctrlShow false;

life_pInact_curTarget = _curTarget;

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then 
{
	_bEscort ctrlSetText "STOP";
	_bEscort ctrlSetTooltip localize "STR_pInAct_StopEscort";
	_bEscort buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_stopEscorting;";
} 
else 
{
	_bEscort ctrlSetTooltip localize "STR_pInAct_Escort";
	_bEscort buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_escortAction;";
};

//put in car
_bPutInCar ctrlSetTooltip localize "STR_pInAct_PutInCar";
_bPutInCar buttonSetAction "closeDialog 0; [life_pInact_curTarget] call life_fnc_putInCar;";


