closeDialog 0;

hint "Je crois que je pars en sucette...";
[[0,format["%1 se pique à l'heroine comme un toxico !!!",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
[[0,format["ATTENTION: Des toxicomanes se piquent en pleine rue ! Mais que fais la police ? -Anonyme",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

DrugedMarkers = ["druged1","druged2","druged3"] call BIS_fnc_selectRandom;
player setVariable["Druged",true,true];
player allowDamage false;

//[player,"heroin_son", 46] call life_fnc_globalSound;
player say3D "heroin_son";
_posold = getPos player;

if(life_drug > 0) then {

player setPos [getPos player select 0, getPos player select 1, 20000];
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
uiSleep 2.25;

for "_i" from 0 to 23 do {
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 10 - random 10,random 10 - random 10,random 10 - random 10,random 1], [random 10 - random 10,random 10 - random 10,random 10 - random 10, random 1]];
"colorCorrections" ppEffectCommit 1;
uiSleep 2.25;
};

"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;

hint "Oh putain sacre trip ! WOUUAHHHH";
player setPos _posold;
uiSleep 5;
};

player setVariable["Druged",false,true];
player allowDamage true;

if(life_drug > 0.2) then {
[] spawn life_fnc_overdose;
};