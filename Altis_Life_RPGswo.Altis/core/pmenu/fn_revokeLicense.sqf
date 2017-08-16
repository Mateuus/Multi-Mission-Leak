/*
File: fn_revokeLicense.sqf
Author: Michael Francis
Description:
Allows cops to revoke individual licenses, or all licenses. Vehicle related only.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
createDialog "revokeLicense_Menu";
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {hint "Kein Ziel!"; closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {hint "Das geht nicht!"; closeDialog 0;}; //Bad side check?
if((player distance _curTarget > 3)) exitWith {};
_display = findDisplay 41000;
_Btn1 = _display displayCtrl 41002;
_Btn2 = _display displayCtrl 41003;
_Btn3 = _display displayCtrl 41004;
_Btn4 = _display displayCtrl 41005;
_Btn5 = _display DisplayCtrl 41006;
_Btn6 = _display DisplayCtrl 41007;
_Btn7 = _display DisplayCtrl 41008;
_Btn8 = _display DisplayCtrl 41009;
DWEV_pInact_curTarget = _curTarget;
//Führerschein Lizenz
_Btn1 ctrlSetText "PKW Lizenz";
_Btn1 buttonSetAction "[10] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;";
//LKW Führerschein Lizenz
_Btn2 ctrlSetText "LKW Lizenz";
_Btn2 buttonSetAction "[11] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;";
//Pilotenschein Lizenz
_Btn3 ctrlSetText "Flug Lizenz";
_Btn3 buttonSetAction "[12] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;";
//Bootsschein Lizenz
_Btn4 ctrlSetText "Boot Lizenz";
_Btn4 buttonSetAction "[13] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;";
//Deaktiviert
_Btn5 ctrlSetText "Deaktiviert";
_Btn5 buttonSetAction /*"[14] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;"*/"closeDialog 0;";
//Anwalt
_Btn6 ctrlSetText "Anwalt Lizenz";
_Btn6 buttonSetAction "[15] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;";
//Alle Scheine
_Btn7 ctrlSetText "Alle Fahr Lizenzen";
_Btn7 buttonSetAction "[16] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; closeDialog 0;";

_Btn5 ctrlShow false;
_Btn8 ctrlShow false;