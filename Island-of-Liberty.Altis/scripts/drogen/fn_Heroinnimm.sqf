closeDialog 0;
DrugedMarkers = ["druged1","druged2","druged3","druged4","druged5"] call BIS_fnc_selectRandom;
player setVariable["Druged",true,true];
player allowDamage false;
//player say3D "Heroin_sound";
[player,"Heroin_sound", 46] call life_fnc_globalSound;
_posold = getPos player;

if(life_drug > 0) then {

player setPos [getPos player select 0, getPos player select 1, 20000];
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
sleep 2.25;

for "_i" from 0 to 23 do {
"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 10 - random 10,random 10 - random 10,random 10 - random 10,random 1], [random 10 - random 10,random 10 - random 10,random 10 - random 10, random 1]];
"colorCorrections" ppEffectCommit 1;
sleep 2.25;
};

"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;

hint "Das war vielleicht mal ein Tripp, BUJAHH";
player setPos _posold;
sleep 5;
};
//3 mal nehmen
if (life_drug > 0.22) then {
titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
player playMoveNow "Incapacitated";
//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
sleep 15;
vehicle player setDir 225;vehicle player setVelocity [0, 0, 0]; vehicle player setpos (getmarkerpos DrugedMarkers);
publicVariable "DrugedMarkers";
removeUniform player;removeVest player;
player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
sleep 10;
titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
player playMoveNow "amovppnemstpsraswrfldnon";

};

player setVariable["Druged",false,true];
player allowDamage true;