/*
lockvault

cgbankvault is the variable name
*/

if (side player == west && cgbankvault animationPhase "d_l_Anim" == 1) then {
	["Zamykasz sejf.", false] spawn domsg;
	uiSleep 5;
	cgbankvault animate ["d_l_Anim",0];
	cgbankvault setVariable["hacked", nil, true];
	["Sejf zamkniety.", false] spawn domsg;
} else {
	["Nie masz kluczy do tego sejfu.", false] spawn domsg;
};