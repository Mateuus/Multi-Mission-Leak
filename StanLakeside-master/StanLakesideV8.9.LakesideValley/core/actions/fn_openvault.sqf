/*
open vault

cgbankvault is the variable name
*/

if (cgbankvault animationPhase "d_o_Anim" == 0 && cgbankvault animationPhase "d_l_Anim" == 1) then {
	["Otwieram sejf.", false] spawn domsg;
	uiSleep 5;
	["Proces otwieranie sejfu rozpoczety.", false] spawn domsg;
	cgbankvault animate ["d_o_Anim",1];
} else {
	["Sejf wyglada na zablokowany/zamkniety..", false] spawn domsg;
};