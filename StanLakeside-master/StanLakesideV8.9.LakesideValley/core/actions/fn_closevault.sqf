/*
close vault

cgbankvault is the variable name
*/

if ( cgbankvault animationPhase "d_o_Anim" == 1 ) then {
	["Zamykam sejf..", false] spawn domsg;
	uiSleep 5;
	cgbankvault animate ["d_o_Anim",0];
	["Rozpoczeto zamykanie sejfu..", false] spawn domsg;
} else {
	["Sejf wyglada na zablokowany/zamkniety..", false] spawn domsg;
};