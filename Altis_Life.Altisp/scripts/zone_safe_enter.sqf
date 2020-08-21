/*
    File: zone_safe_enter.sqf
    Author: jogo2015

    Description:
    Script that is run when the player enters a safe zone
*/

hint parseText format ["<t color='#80FF00'><t size='2'><t align='center'>SafeZone<br/><br/><t color='#FFFFFF'><t align='center'><t size='1'>Wchodzisz na safezone zakaz jakiejkolwiek przemocy!"];

SAW_zone_safe = true;
life_safe_warnings = 0;
life_safe_vdm_warnings = 0;

player setVariable ["vdm_warnings", 0, true];
player allowDamage false;
