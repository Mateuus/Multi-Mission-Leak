closeDialog 0;
hint "Je crois que j'ai touche le fond !";
[[0,format["%1 se defonce le crane avec de la meth pure !!!",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
[[0,format["ATTENTION: Des toxicos dans le caniveau se defonce à la meth sur notre ile... C'est normal ca ??? -Anonyme",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
_fish = "CatShark_F" createVehicle [0,0,0];
_mullet = "Mullet_F" createVehicle [0,0,0];
_turtle = "Turtle_F" createVehicle [0,0,0];
_tuna = "Tuna_F" createVehicle [0,0,0];
_mackerel = "Mackerel_F" createVehicle [0,0,0];
_salema = "Salema_F" createVehicle [0,0,0];
_mullet2= "Mullet_F" createVehicle [0,0,0];
_salem2 = "Salema_F" createVehicle [0,0,0];
_turtle2 = "Turtle_F" createVehicle [0,0,0];

DrugedMarkers = ["druged1","druged2","druged3"] call BIS_fnc_selectRandom;

player setVariable["Druged",true,true];
//[player,"meth_son", 36] call life_fnc_globalSound;
player say3D "meth_son";
for "_i" from 0 to 36 do
{
if(life_drug > 0) then {

_fish attachTo [player, [-0.1, 2, 0.15], "Pelvis"];
_tuna attachTo [player, [-1, 1, 0.15], "Pelvis"];
_mullet attachTo [player, [-2, 1.5, 0.30], "Pelvis"];
_mackerel attachTo [player, [2, 2, 0.15], "Pelvis"];
_turtle attachTo [player, [1, 1.5, 0.20], "Pelvis"];
_salema attachTo [player, [0, -1.5, - 0.30], "Pelvis"];
_mullet2 attachTo [player, [-2, 1.5, 0.60], "Pelvis"];
_salem2 attachTo [player, [0, -1.5, - 1.0], "Pelvis"];
_turtle2 attachTo [player, [1, 1.5, 0.70], "Pelvis"];

"colorCorrections" ppEffectEnable true;
player playMoveNow "AsswPercMstpSnonWnonDnon_goDown";
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
uiSleep 1;

} else {

_fish attachTo [player, [-0.1, 2, 0.15], "Pelvis"];
_tuna attachTo [player, [-1, 1, 0.15], "Pelvis"];
_mullet attachTo [player, [-2, 1.5, 0.30], "Pelvis"];
_mackerel attachTo [player, [2, 2, 0.15], "Pelvis"];
_turtle attachTo [player, [1, 1.5, 0.20], "Pelvis"];
_salema attachTo [player, [0, -1.5, - 0.30], "Pelvis"];
_mullet2 attachTo [player, [-2, 1.5, 0.60], "Pelvis"];
_salem2 attachTo [player, [0, -1.5, - 1.0], "Pelvis"];
_turtle2 attachTo [player, [1, 1.5, 0.70], "Pelvis"];

"colorCorrections" ppEffectEnable true;
player playMoveNow "AsswPercMstpSnonWnonDnon_goDown";
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
addcamShake[random 3, 1, random 3];
uiSleep 1;
};
};

//Stop effects
player setVariable["Druged",false,true];

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;

deleteVehicle _fish;
deleteVehicle _mullet;
deleteVehicle _turtle;
deleteVehicle _tuna;
deleteVehicle _mackerel;
deleteVehicle _salema;
deleteVehicle _mullet2;
deleteVehicle _salem2;
deleteVehicle _turtle2;
player switchmove ""; 

if(life_drug > 0.2) then {
[] spawn life_fnc_overdose;
};