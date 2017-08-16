private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(name player == name _unit) exitwith {};

(vehicle _unit) switchCamera "EXTERNAL";
hint "Drücke Numpad 5 um den Beobachtermodus zu beenden";
titleText ["Zuschauen...","PLAIN DOWN"];titleFadeOut 4;
AH_TEMPBIND = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 76) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AH_TEMPBIND];player switchCamera 'INTERNAL';hint 'Beobachten beendet!';};false"];