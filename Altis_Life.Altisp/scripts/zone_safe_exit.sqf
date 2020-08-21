/*
    File: zone_safe_exit.sqf
    Author: jogo2015

    Description:
    Script that is run when the player leaves a safe zone
*/

hint parseText format ["<t color='#5C87C7'><t size='2'><t align='center'>SafeZone<br/><br/><t color='#FFFFFF'><t align='center'><t size='1'> Uwaga opuściłeś bezpieczną strefe"];

SAW_zone_safe = false;
life_safe_warnings = 0;
life_safe_vdm_warnings = 0;

player setVariable ["vdm_warnings", 0, true];
player allowDamage true;

