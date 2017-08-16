private ["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
closeDialog 0;
player setVariable["Druged",true,true];
player playMoveNow "AmovPsitMstpslowWrflDnon_smoking";
player say3D "weed_son";
life_drug = life_drug + 0.06;
if (life_drug < 0.00) exitWith {};
if (_item == "marijuana") then {
hint "Ouais... un beau gros spiff ca va me detendre un peu !";
[nil,nil,nil,player] call life_fnc_painkillers;
[[0,format["%1 a eclaté un gros joint d'herbe !!!",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
[[0,format["ATTENTION: Beaucoup de fumeurs de joint dans nos rues. Il serait temps d'intervenir ? -Anonyme",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};
if (_item == "marijuanam") then {
life_drug = life_drug - 0.03;
player setFatigue 0;
hint "AAAAhhhhh... J'adore la medecine douce !";
[[0,format["%1 se soigne un peu avec de la medecine douce",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
};
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
for "_i" from 0 to 39 do
{
    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
    "chromAberration" ppEffectCommit 1;   
    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
    "radialBlur" ppEffectCommit 1;
    addcamShake[random 3, 1, random 3];
    uiSleep 1;
};
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
uiSleep 6;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
life_thirst = 60;
life_hunger = 50;
player setVariable["Druged",false,true];
if(life_drug > 0.2) then { [] spawn life_fnc_overdose;};