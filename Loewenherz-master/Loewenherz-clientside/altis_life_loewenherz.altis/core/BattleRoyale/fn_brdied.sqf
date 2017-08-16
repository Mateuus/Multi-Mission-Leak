/*
	File: fn_brdied.sqf
	Author: Bloodwyn

	Description:
	When player dies or wins in BattleRoyale...
*/
sleep 5.5;

if(!(player getVariable["Revive",true]))then{
  [] call lhm_fnc_revivednoFee;
 };

player setposATL [23510.6,17820.5,10.6];

[] call lhm_fnc_stripDownPlayer;
lhm_gear = BR_old_gear;
[] call lhm_fnc_loadGear;
[] call lhm_fnc_saveGear;

player setDamage 0;
lhm_health = 100;
lhm_thirst = 100;
lhm_hunger = 100;
lhm_stamina = 100;
sleep 3;

[] call lhm_fnc_stripDownPlayer;
lhm_gear = BR_old_gear;
[] call lhm_fnc_loadGear;
[] call lhm_fnc_saveGear;
titleText ["BattleRoyal ist für dich vorbei, hier hast du dein Zeug wieder.","PLAIN"];