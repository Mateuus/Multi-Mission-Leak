/*
	File: fn_colorFilter.sqf
	Author: Barney

	Description:
	Really, do I need one?
	case 0: Sommer
	case 1: Mediteran
	case 2: HCC
	case 3: Schwarz/Weiß
	case 4: Dark-CC
	case 5: L-Dark-CC
	case 6: Movie N-Style
	case 7: Wasteland
	case 8: High Contrast
	case 9: LOL
	case 10: Roehre
	case 11: Blue
	case 12: Grey
	case 13: Green
	case 14: Arma 2
	case 15: aus

	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

private["_number"];
_number = param [0,-1,[0]];
if(_number == -1) exitWith {};
"ColorCorrections" ppEffectEnable false; "filmGrain" ppEffectEnable false; "radialBlur" ppEffectEnable false; "chromAberration" ppEffectEnable false;
switch(_number) do {
	case 0: {  "colorCorrections" ppEffectEnable true; "colorCorrections" ppEffectAdjust [1.01, 1.18, -0.04, [1.0, 1.4, 0.8, -0.04], [0.55, 0.55, 0.72, 1.35],  [0.699, 1.787, 0.314, 20.03]]; "colorCorrections" ppEffectCommit 1;};
	case 1: {  "ColorCorrections" ppEffectEnable true; "ColorCorrections" ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]]; "ColorCorrections" ppEffectCommit 0;};
	case 2: {  "ColorCorrections" ppEffectEnable true; "colorCorrections" ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 0.8, 0.6, 1.9], [-0.28, 0.71, 0.47, 0]]; "colorCorrections" ppEffectCommit 0;};
	case 3: {  "ColorCorrections" ppEffectEnable true;"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.72],[5, 5, 5, -0.48],[0.2, 0.59, 0.11, 0]]; "ColorCorrections" ppEffectCommit 0;};
	case 4: {  "ColorCorrections" ppEffectEnable true;"colorCorrections" ppEffectAdjust [1, 1.2, -0.00, [0.0, 0.0, 0.0, 0.0], [0.6, 0.6, 1.0, 0.4],  [0.199, 0.587, 0.114, 0.0]]; "colorCorrections" ppEffectCommit 0;  };
	case 5: {  "ColorCorrections" ppEffectEnable true;"filmGrain" ppEffectEnable true; "filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];"filmGrain" ppEffectCommit 0; "colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 0.9, 0.8, 0.65],  [0.199, 0.587, 0.114, 0.0]];  "colorCorrections" ppEffectCommit 0; };
	case 6: {  "ColorCorrections" ppEffectEnable true; "colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 0.6, 1.8, 0.7],  [0.199, 0.587, 0.114, 0.0]];  "colorCorrections" ppEffectCommit 1; };
	case 7: {  "ColorCorrections" ppEffectEnable true; "colorCorrections" ppEffectAdjust [1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]];  "colorCorrections" ppEffectCommit 0;  };
	case 8: {  "colorCorrections" ppEffectEnable true; "filmGrain" ppEffectEnable true;"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  "filmGrain" ppEffectCommit 1;  "colorCorrections" ppEffectAdjust [1, 0.75, 0, [0.8,0.9,1,-0.1], [1,1,1,2], [-0.5,0,-1,5]]; "colorCorrections" ppEffectCommit 1; };
	case 9: { "colorCorrections" ppEffectEnable true; "colorCorrections" ppEffectAdjust [1, 1, 0, [1.5,-1,-1.5,0.5], [5,3.5,-5,-0.5], [-3,5,-5,-0.5]]; "colorCorrections" ppEffectCommit 1; };
	case 10: {  "colorCorrections" ppEffectAdjust [1, 1.04, -0.004, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.0],  [0.5, 0.5, 0.5, 0.0]]; "colorCorrections" ppEffectCommit 0; "colorCorrections" ppEffectEnable true;"filmGrain" ppEffectEnable true; "filmGrain" ppEffectAdjust [0.2, 0.1, 0.1, 0.1, 1, false]; "filmGrain" ppEffectCommit 0; };
	case 11: { "colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 0.6, 1.8, 0.7],  [0.199, 0.587, 0.114, 0.0]];  "colorCorrections" ppEffectCommit 1;  "colorCorrections" ppEffectEnable true;};
	case 12: { "colorCorrections" ppEffectAdjust [1, 0.8, -0.002, [0.0, 0.0, 0.0, 0.0], [0.6, 0.7, 0.8, 0.65],  [0.199, 0.587, 0.114, 0.0]];  "colorCorrections" ppEffectCommit 0;  "colorCorrections" ppEffectEnable true;};
	case 13: {"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.6, 1.4, 0.6, 0.7],  [0.199, 0.587, 0.114, 0.0]];  "colorCorrections" ppEffectCommit 1;  "colorCorrections" ppEffectEnable true;};
	case 14: {"colorCorrections" ppEffectAdjust [1, 0.4, 0, [0.8,0.9,1,-0.1], [1,1,1,1.66], [-0.5,0,-1,5]]; "colorCorrections" ppEffectCommit 0;  "colorCorrections" ppEffectEnable true;};
	case 15: {"ColorCorrections" ppEffectEnable false; "filmGrain" ppEffectEnable false; "radialBlur" ppEffectEnable false; "chromAberration" ppEffectEnable false;};
	default {"ColorCorrections" ppEffectEnable false; "filmGrain" ppEffectEnable false; "radialBlur" ppEffectEnable false; "chromAberration" ppEffectEnable false;};
};


profileNamespace setVariable["LHM_Color_Correction",_number];
LHM_Color_Correction = _number;