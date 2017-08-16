/*
	File: fn_morphine.sqf
	Author: BlackScaryZ

	Description:
	Nouvel fonction médic (Injecter de la morphine)
*/
closedialog 0;
private["_damage","_health","_player"];
disableUserInput true;
_player = player;
_player PlayMoveNow "stop";
_player action ["SwitchWeapon", player, player, 100];
_player PlayMove "AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon";
sleep 2;
"radialBlur" ppEffectEnable true;
enableCamShake true;
if(damage _player < 0.2) then {_player setDamage 0.3;};
hint "On se détend";
for "_i" from 0 to 75 do
{
    "radialBlur" ppEffectAdjust  [random 0.08,random 0.08,0.3,0.3];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    sleep (1 / 10);
};
for "_health" from 0 to 99 do
{
	while {damage player > 0.01} do {
		_damage = damage player;
		_damage = _damage - 0.01;
		player setDamage (_damage);
		[] call life_fnc_hudUpdate;
		sleep (1 / 10);
	};
};
disableUserInput false;
_player playMove "";
hint "Ca fait du bien non?";
sleep 60;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 2;
"radialBlur" ppEffectEnable false;
resetCamShake;
