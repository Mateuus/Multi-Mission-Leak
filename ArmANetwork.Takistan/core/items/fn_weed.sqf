/*

File: fn_weed

*/
private["_hndl_color","_hndl_chrom","_OBJ","_PS","_tStart","_count","_smoke_action"];

life_drugged_weed = 1;
player setVariable ["smoke_weed", true, true];
player setVariable ["drug_weed", true, true];
_tStart = time;

_hndl_color = ppEffectCreate ["colorCorrections",1500002];
_hndl_chrom = ppEffectCreate ["chromAberration",100];

_OBJ = player;
_PS = "#particlesource" createVehicle getpos _OBJ;

[[_PS,_OBJ],"life_fnc_weedSmoke",true] spawn life_fnc_MP;

_hndl_color ppEffectEnable true;
_hndl_color ppEffectAdjust [1.175, 1.175, 0, [0, 0, 0.0, 0],[0, 0, 0, 1.0],[0, 0, 0, 0]];
_hndl_color ppEffectCommit 90;
_hndl_chrom ppEffectEnable true;
_hndl_chrom ppEffectAdjust [0.027,0.027,true];
_hndl_chrom ppEffectCommit 90;

titleText["You're smoking some weed! You could get very thirsty!","PLAIN"];
player say3D "mari";
_smoke_action = player addAction["<t color='#FF0000'>Extinguish Joint</t>",life_fnc_extinguishJoint,"",6, false, true, "", ' (player getVariable ["smoke_weed",false]) '];

_count = 0;
while{life_drugged_weed == 1 && Alive player && player getVariable ["smoke_weed",false] && (time - _tStart) < life_drugged_weed_duration * 60} do
{
    if(_count % 10 == 0) then
    {
        if(getFatigue player < 0.5) then { player setFatigue 0.5; };
        if(damage player > 0) then { player setDamage (damage player - 0.01);};
    };

    if(_count % 20 == 0) then { life_thirst = life_thirst - 5; [] spawn life_fnc_hudUpdate;};
    sleep 1;
    _count = _count + 1;
};

player setVariable ["smoke_weed", false, true];
life_drugged_weed = 0;
player removeAction _smoke_action;

if(life_drugged_cocaine == 0 && (time - _tStart) > life_drugged_weed_duration * 50) then { life_drugged_cocaine = -1; };

deleteVehicle _PS;

_hndl_color ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0],[1.0, 1.0, 1.0, 1.0],[0.199, 0.587, 0.114, 0.0]];
_hndl_color ppEffectCommit 180;
_hndl_chrom ppEffectAdjust [0.0,0.0,true];
_hndl_chrom ppEffectCommit 180;

_tStart = time;
waitUntil{sleep 5; (!Alive player || (time - _tStart) > 300 || player getVariable ["smoke_weed",false])};

if(!(player getVariable ["smoke_weed",false]) || !Alive player) then { player setVariable ["drug_weed", false, true]; life_drugged_weed = -1; };

ppEffectDestroy _hndl_color;
ppEffectDestroy _hndl_chrom;
