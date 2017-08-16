// Select a target position for the little boy
closeDialog 0;

nukeStrike =
{
	[[_this select 0,_this select 1],"lhm_fnc_littleBoy",true,false] call lhm_fnc_mp;
};

hintSilent parseText"<t size='1.1'>Select a target Area</t><br/><t size='1.1'>for Nuclear Strike</t>";
openMap [true,false];

if (visiblemap)then
{
	onMapSingleClick "[_pos,_alt] spawn nukeStrike;onMapSingleClick """";openMap [false,false]";
};

// Remove function if nothing was clicked!
waitUntil{!visibleMap};
onMapSingleClick "";

[["admin",(format["%1 with UID %2 activates the Nuke-Event",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;