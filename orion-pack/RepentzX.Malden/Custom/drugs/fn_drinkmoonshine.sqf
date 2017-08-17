#include "..\..\script_macros.hpp"
/*
	File: fn_drinkmoonshine.sqf
	author:[midgetgrimm] drinkypoo
*/
closeDialog 0;
hintSilent parseText format["BAC is now<br/> <t size='1.4'><t color='#FF0000'>%1</t></t> Percent",[life_drink] call life_fnc_numberText];
sleep 4;
"chromAbberation" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;
player setVariable["inDrink",true,true];

for "_i" from 0 to 89 do{
    if(life_drink > 0.15) then {
		"chromAberration" ppEffectAdjust [random 0.07,random 0.07,true];
		"chromAberration" ppEffectCommit 1;
   		"radialBlur" ppEffectAdjust[0.04, 0.09, 0.25, 0.29];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		sleep 1;
	} else {
		"chromAberration" ppEffectAdjust [random 0.03,random 0.03,true];		"chromAberration" ppEffectCommit 1;
   		"radialBlur" ppEffectAdjust  [random 0.03,random 0.03,0.43,0.43];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 4, 2, random 4];
		sleep 1;
	};
};
if (life_drink > 0.22) then {
	titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
	player playMoveNow "Incapacitated";
	titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
	sleep 15;
	player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
	sleep 10;
	life_drink = 0;
	titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
	player playMoveNow "amovppnemstpsraswrfldnon";
	[0,format[localize "STR_MISC_StPubIntox",profileName]] remoteExecCall ["life_fnc_broadcast",nil];
	[getPlayerUID player,profileName,"390"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
};

player setVariable["inDrink",false,true];
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
if(life_drink != 0) then {life_drink = life_drink - 0.02;};
