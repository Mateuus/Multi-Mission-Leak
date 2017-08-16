/*
File: fn_lizenzgeben.sqf
Author: Michael Francis edit by Sandmann www.division-wolf.de
Description:
Allows cops to revoke individual licenses, or all licenses. Vehicle related only.
And give licenses to other cops
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
// lizenzen hinzufügen
_Btn1 ctrlSetText "Flug Lizenz";
_Btn1 buttonSetAction "[17] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm eine Fluglizenz gegeben.""; closeDialog 0;";

_Btn2 ctrlSetText "Begleitschutz";
_Btn2 buttonSetAction "[25] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm eine Begleitschutz gegeben.""; closeDialog 0;";

_Btn3 ctrlSetText "Zivil Lizenz";
_Btn3 buttonSetAction "[19] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm eine Zivilstreifen lizenz gegeben.""; closeDialog 0;";

_Btn4 ctrlSetText "SEK Lizenz";
_Btn4 buttonSetAction "[20] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm eine SEK-Lizenz gegeben.""; closeDialog 0;";

// lizenzen löschen

_Btn5 ctrlSetText "Entferne Flug";
_Btn5 buttonSetAction "[21] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm seine Fluglizenz entzogen.""; closeDialog 0;";

_Btn6 ctrlSetText "Entferne BEG";
_Btn6 buttonSetAction "[26] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm seine Begleitschutz entzogen.""; closeDialog 0;";

_Btn7 ctrlSetText "Entferne Zivil";
_Btn7 buttonSetAction "[23] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm seine Zivilstreifenlizenz entzogen.""; closeDialog 0;";

_Btn8 ctrlSetText "Entferne SEK";
_Btn8 buttonSetAction "[24] remoteExec [""DWEV_fnc_removeLicenses"",DWEV_pInact_curTarget]; hint ""Du hast Ihm seine SEK lizenz entzogen.""; closeDialog 0;";