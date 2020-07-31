/*
	File: fn_useMDMA.sqf
	Description:
	Use MDMA
*/

#include <macro.h>
 

if (vehicle player != player) then 
{
player playMove "AmovPercMstpSnonWnonDnon_Scared2";
waitUntil{animationState player != "AmovPercMstpSnonWnonDnon_Scared2";};
};

[0,format["%1 polknal nie ta pigulke co trzeba!",name player]] remoteExecCall ["life_fnc_broadcast", -2];
closeDialog 0;

"chromAberration" ppEffectAdjust [random 0.1,random 0.1,true];
"chromAberration" ppEffectCommit 4; 
life_redgull_effect = time;
[localize "O kurwa, to bylo dobre!", false] spawn domsg;
player enableFatigue false;
waitUntil {deadPlayer OR ((time - life_redgull_effect) > (15 * 60))};
player enableFatigue true;

["Masz dreszcze! Chce wziac jeszcze troche tych tableteczek..", false] spawn domsg;
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
