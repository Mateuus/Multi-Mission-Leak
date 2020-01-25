/*
	Function to stitch self by Koil
	fn_stitchSelf.sqf
*/
private["_display","_curTarget"];

if(!life_action_inUse) then {
life_action_inUse = true;

if (isNull objectParent player) then 
{
	player switchMove "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";
	
	waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
};
if(isPlayer player) then {
	player setVariable ["woundedon",1,true]; 
}
else {
	_blah = "Target moved, procedure failed.";
	[format["%1", _blah], false] spawn domsg;
};


};
life_action_inUse = false;	