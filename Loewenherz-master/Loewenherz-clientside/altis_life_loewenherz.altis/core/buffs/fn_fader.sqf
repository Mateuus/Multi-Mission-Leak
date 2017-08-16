//[1,[0.5,0.0,0.5]] spawn lhm_fnc_fader;

Private ["_delayFade","_colorRGB","_damage","_colorAlpha","_partDamage","_sizeCoef","_offsetX","_offsetY","_sizeX","_sizeY","_adjust"];
_delayFade = _this select 0;
_colorRGB = _this select 1;
_damage = 0.1;
_colorAlpha = param [2,0.1,[0]];

if (isNil {BIS_pp_burnDamage}) then {BIS_pp_burnDamage = [_damage,(time - 30)]};
_partDamage = 0.1;		
_sizeCoef = 0.55;
_offsetX = 0;
_offsetY = 0;
_sizeX = 1 * _sizeCoef;
_sizeY = 1 * _sizeCoef;

_adjust = [
	1,
	1,
	0,
	_colorRGB + [_colorAlpha],
	[1,1,1,1],
	[0.3,0.3,0.3,0],
	[
		_sizeX * 0.85,		
		_sizeY * 0.85,		
		0,		
		_offsetX,	
		_offsetY,	
		0.5,		
		1		
	]
];
		
BIS_HitCC ppeffectadjust _adjust;
BIS_HitCC ppEffectEnable TRUE;
BIS_HitCC ppEffectForceInNVG TRUE;
BIS_HitCC ppeffectcommit (_delayFade * 0.5);
sleep (_delayFade * 0.5);
_adjust set [3,_colorRGB + [0.0]];
_adjust set [6,[_sizeX,_sizeY,0,_offsetX,_offsetY,0.5,1]];
BIS_HitCC ppeffectadjust _adjust;
BIS_HitCC ppeffectcommit (_delayFade * 0.5);