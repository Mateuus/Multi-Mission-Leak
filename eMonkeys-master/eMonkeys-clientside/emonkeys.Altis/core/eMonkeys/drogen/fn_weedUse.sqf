/*
	File: fn_weedUse.sqf
	Author: Mario
	
	Description:
	Weed makes you HAPPY and lower the sideeffects of Cocaine.
*/

private["_hndl_color","_hndl_chrom","_OBJ","_PS","_tStart","_count","_smoke_action"];

EMonkeys_drugged_weed = 1;
player setVariable ["smoke_weed", true, true];
player setVariable ["drug_weed", true, true];
_tStart = time;

_OBJ = player;
_PS = "#particlesource" createVehicle getpos _OBJ;

[[_PS,_OBJ],"EMonkeys_fnc_weedSmoke",true] call EMonkeys_fnc_MP;

[] spawn {
	_hndl_film = ppEffectCreate ["FilmGrain", 15421];
	_hndl_chrom = ppEffectCreate ["ChromAberration", 15632];
	_hndl_film ppEffectEnable true;
	_hndl_chrom ppEffectEnable true;
	_hndl_film ppEffectAdjust [1, 4.31, 10, 10, 10, false];
	_hndl_chrom ppEffectAdjust [0.2, 0.1, true];
	_hndl_film ppEffectCommit 6;
	_hndl_chrom ppEffectCommit 6;
	waitUntil {ppEffectCommitted _hndl_film};
	waitUntil {ppEffectCommitted _hndl_chrom};
	addCamShake [30, 30, 2];
		
	uisleep 30;	
	
	addCamShake [14, 14, 2];
	uisleep 15;
	
	_hndl_film ppEffectAdjust [0, 0, 0, 0, 0, false];
	_hndl_chrom ppEffectAdjust [0, 0, true];
	_hndl_film ppEffectCommit 6;
	_hndl_chrom ppEffectCommit 6;
	waitUntil {ppEffectCommitted _hndl_film};
	waitUntil {ppEffectCommitted _hndl_chrom};
		
	ppEffectDestroy _hndl_film;
	ppEffectDestroy _hndl_chrom;
};

titleText["Sie rauchen etwas Grass! du könntest durstig werden!","PLAIN"];

_smoke_action = player addAction["<t color='#FF0000'>Joint ausmachen</t>",EMonkeys_fnc_extinguishJoint,"",6, false, true, "", ' (player getVariable ["smoke_weed",false]) '];

_count = 0;
while{EMonkeys_drugged_weed == 1 && Alive player && player getVariable ["smoke_weed",false] && (time - _tStart) < EMonkeys_drugged_weed_duration * 60} do 
{
	if(_count % 10 == 0) then 
	{
		if(getFatigue player < 0.5) then { player setFatigue 0.5; };
		if(damage player > 0) then { player setDamage (damage player - 0.01);};
	};
	
	if(_count % 20 == 0) then { EMonkeys_thi164 = EMonkeys_thi164 - 5; [] spawn EMonkeys_fnc_hudUpdate;};
	uisleep 1;
	_count = _count + 1;
}; 

player setVariable ["smoke_weed", false, true];
EMonkeys_drugged_weed = 0;
player removeAction _smoke_action;

if(EMonkeys_drugged_cocaine == 0 && (time - _tStart) > EMonkeys_drugged_weed_duration * 50) then { EMonkeys_drugged_cocaine = -1; };

deleteVehicle _PS;

_tStart = time;
waitUntil{uisleep 5; (((!alive player) || (player getVariable["onkill",FALSE])) || (time - _tStart) > 300 || player getVariable ["smoke_weed",false])};

if(!(player getVariable ["smoke_weed",false]) || ((!alive player) || (player getVariable["onkill",FALSE]))) then { player setVariable ["drug_weed", false, true]; EMonkeys_drugged_weed = -1; };