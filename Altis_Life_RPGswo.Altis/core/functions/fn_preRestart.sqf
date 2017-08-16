/*
	File: fn_preRestart.sqf
	Autor: MarkusSR1984
	Description:
	Erledigt Cleanups und andere Sachen die kurz VOR dem Restart erforderlich sind.
*/

// Combatlogger Variable entfernen (Bei Toten und Festgenommenen Spielern)

[getPlayerUID player,0, side player] remoteExec ["DWF_fnc_saveCombatlog",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})]; // Den Flag aus der Datenbank Löschen	

// Den restart an die Skripte Publizieren
DWEV_restart_cleanup = true;

hint format ["Da du bis kurz vor dem Restart auf dem Server geblieben bist, hast du eine Belohnung von %1€ bekommen.\n\n Bitte noch ans speichern denken!.",PreRestartMoney];
dwf_atmcash = dwf_atmcash + PreRestartMoney;
[1] call SOCK_fnc_updatePartial;