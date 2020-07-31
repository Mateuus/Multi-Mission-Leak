/*
Function to cool player by Koil
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
if(isPlayer cursorTarget) then {
	 _koildebiiii = cursorTarget getVariable ["diseaseon", 1];
	if(_koildebiiii == 3 || _koildebiiii == 6) then {
	cursorTarget setVariable ["diseaseon",1,true]; 
	} else {
	player setVariable ["diseaseon",_koildebiiii,true]; 
	};
}
else {
	_blah = "Target moved, procedure failed.";
	[format["%1", _blah], false] spawn domsg;
};

