#include <macro.h>
/*
	By CooliMC
*/



for "_a" from 0 to 2 do {
	if !(vehicle player == player) then {
		[player,"amovpsitmstpslowwrfldnon"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
	};
};		
	
if (life_thirst > 15) then {
	life_thirst = life_thirst - 15;
};	

_color = ppEffectCreate ["colorCorrections", 1];					
_color ppEffectEnable true;														
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 2;
sleep 6;
_color ppEffectAdjust [1,8,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	

if (vehicle player == player) then {
	[player,"AwopPercMstpSgthWnonDnon_throw"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};	

_color ppEffectCommit 1;
addCamShake [random 15, 5, random 100];
sleep 2;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
sleep 5;

sleep 7;
_color ppEffectAdjust [1,8,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;

for "_l" from 0 to 4 do {
	if !(vehicle player == player) then {vehicle player action ["useWeapon", vehicle player, player, 0];sleep 2};
};

addCamShake [random 15, 5, random 100];
sleep 5;

if (vehicle player == player) then {
	[player,"AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};

_chrom = ppEffectCreate ["chromAberration", 2];						
_chrom ppEffectEnable true;														
_chrom ppEffectAdjust [0.1,0.1,true];									
_chrom ppEffectCommit 10;

if (vehicle player == player) then {
	[player,"AwopPercMstpSgthWnonDnon_throw"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};	

_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
sleep 15;
addCamShake [4,200,20];
sleep 5;
_color ppEffectAdjust [1,8,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
sleep random 5;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
sleep 5;
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	

if (vehicle player == player) then {
	[player,"AwopPercMstpSgthWnonDnon_throw"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};							

_color ppEffectCommit 1;														
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
_color ppEffectAdjust [1,8,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
addCamShake [random 10, 5, random 100];
sleep random 5;

if (vehicle player == player) then {
	[player,"AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};

_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;

for "_l" from 0 to 4 do {
	if !(vehicle player == player) then {
		vehicle player action ["useWeapon", vehicle player, player, 0];
		sleep 2
	};
};

_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];							
_color ppEffectCommit 1;														
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
	
if (vehicle player == player) then {
	[player,"AwopPercMstpSgthWnonDnon_throw"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};	

sleep 5; 
addCamShake [random 10, 5, random 100];
sleep 10;
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];							
_color ppEffectCommit 1;														
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];							
_color ppEffectCommit 1;														
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
_radial = ppeffectCreate ["radialBlur", 3];
_radial ppEffectEnable true;
_radial ppEffectAdjust [0.02,0.02,0.15,0.15];
_radial ppEffectCommit 5;
sleep 2;
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];							
_color ppEffectCommit 1;														
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
sleep 15;
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];							
_color ppEffectCommit 1;
							
if (vehicle player == player) then {
	[player,"AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};
	
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
_radial ppEffectAdjust [0,0,0,0];
_radial ppEffectCommit 2;

for "_l" from 0 to 4 do {
	if !(vehicle player == player) then {
		vehicle player action ["useWeapon", vehicle player, player, 0];
		sleep 2
	};
};

sleep 5;
_color ppEffectAdjust [1,0,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];							
_color ppEffectCommit 1;														
sleep random 4;
_color ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];	
_color ppEffectCommit 1;
addCamShake [2,5,20];
sleep 7;

if (vehicle player == player) then {
	[player,"AwopPercMstpSgthWnonDnon_throw"] remoteExec ["tanoarpg_fnc_animSync", -2, false];
};	

_color ppEffectAdjust [1,1,0,[0,0,0,0],[0,0,0,0],[0,0,0,0]];							
_color ppEffectCommit 4; 
sleep 5;
ppEffectDestroy _color;
ppEffectDestroy _chrom;
ppEffectDestroy _radial;	
sleep 50 + round(random(300));
_chrom = ppEffectCreate ["chromAberration", 2];						
_chrom ppEffectEnable true;														
_chrom ppEffectAdjust [0.1,0.1,true];									
_chrom ppEffectCommit 10;
sleep 15;
ppEffectDestroy _chrom;
hint "Oh mein Kopf ich glaub es lässt nach !!!";	