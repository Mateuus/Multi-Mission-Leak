/*
File: fn_showEXP.sqf
Author: Larry
*/
 
createDialog "prof_dialog";
disableSerialization;
 
_dialog = findDisplay 7730;
_Erfa = _dialog displayCtrl 7734;
_Erfa ctrlSetStructuredText parseText format["<br/><t size='1.5'><t color='#FFB124'>Level:</t> %5<br/><br/></t><t align='left'><t align='left' color='#FFB124'>Spielzeit:</t> %1 Stunden<br/><t align='left' color='#FFB124'>Kills:</t> %2<br/><t align='left' color='#FFB124'>Tode:</t> %3<br/><t align='left' color='#FFB124'>Zombie Kills:</t> %4<br/><br/><t align='left' color='#FFB124'>Punkte:</t> %6EXP<br/><t align='left' color='#FFB124'>Level Up mit:</t> %7EXP<br/><t align='left' color='#FFB124'>Fehlend:</t> %8EXP</t>",(life_civTime / 6),life_EXPKills,life_EXPDeaths,life_EXPZombiekills,life_EXPLevel,life_EXPCount,life_EXPnext,(life_EXPnext-life_EXPCount)];