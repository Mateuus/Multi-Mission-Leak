/*
Function to heat player by Koil
*/
private["_display","_curTarget"];
if (isNull objectParent player) then 
{
	closeDialog 0;
	player switchMove "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";
	waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
	player switchMove "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";
	waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
};

	 _koildebiiii = player getVariable ["diseaseon", 1];
	if(_koildebiiii == 5 ) then {
	player setVariable ["diseaseon",1,true]; 
	} else {
	[player,player] spawn life_fnc_onPlayerKilled;
	};



