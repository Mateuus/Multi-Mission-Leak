closeDialog 0;
hint "Vous devriez appeler de l'aide, ou vous rendre a l'hopital vous faites une overdose !";
player say3D "overdose_son";
"radialBlur" ppEffectEnable true;
enableCamShake true;
for "_i" from 0 to 36 do
{
"radialBlur" ppEffectAdjust [random 1,random 0.5,1,0.5];
"radialBlur" ppEffectCommit 1;
addcamShake[random 10, 1, random 10];
uiSleep 1;
};
"radialBlur" ppEffectAdjust [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;
"radialBlur" ppEffectEnable false;
resetCamShake;
uiSleep 120;

if (random(100) < 50) then {
DrugedMarkers = ["druged1","druged2","druged3"] call BIS_fnc_selectRandom;
[[0,format["%1 semble faire un bad trip !",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 50],false] spawn life_fnc_MP;	
uiSleep 10;
titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
player playMoveNow "Incapacitated";
uiSleep 15;
vehicle player setDir 225;vehicle player setVelocity [0, 0, 0]; vehicle player setpos (getmarkerpos DrugedMarkers);
publicVariable "DrugedMarkers";
removeUniform player;removeVest player;
player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
uiSleep 10;
titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
player playMoveNow "amovppnemstpsraswrfldnon";
life_drink = 0;
life_drug = 0;
};