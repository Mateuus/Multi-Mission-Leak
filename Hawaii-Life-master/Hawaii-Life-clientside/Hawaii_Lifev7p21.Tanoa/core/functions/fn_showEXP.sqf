/*
File: fn_showEXP.sqf
Author: Larry
*/
 
createDialog "prof_dialog";
disableSerialization;
 
_dialog = findDisplay 7730;
_Erfa = _dialog displayCtrl 7734;
_Erfa ctrlSetStructuredText parseText format["<t color='#000000'><t size='1.5'><t color='#61aeaf'>Level:</t> %4</t><br/><br/><t color='#61aeaf'>Spielzeit:</t> %1 Stunden<br/><t color='#61aeaf'>Kills:</t> %2<br/><t color='#61aeaf'>Tode:</t> %3<br/><br/><t color='#61aeaf'>Punkte:</t> %5EXP<br/><t color='#61aeaf'>Level Up mit:</t> %6EXP<br/><t color='#61aeaf'>Fehlend:</t> %7EXP</t>",(life_civTime / 6),life_EXPKills,life_EXPDeaths,life_EXPLevel,life_EXPCount,life_EXPnext,(life_EXPnext-life_EXPCount)];