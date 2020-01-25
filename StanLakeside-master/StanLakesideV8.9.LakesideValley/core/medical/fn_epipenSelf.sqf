/*
	fn_epipenSelf.sqf
*/
private["_display","_curTarget"];

if(!life_action_inUse) then {
life_action_inUse = true;

if (isNull objectParent player) then 
{
	player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
	
	waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
};
if(isPlayer player) then {
	player setVariable ["unconciouson",1,true]; 
}
else {
	_blah = "Target moved, procedure failed.";
	[format["%1", _blah], false] spawn domsg;
};


};
life_action_inUse = false;	