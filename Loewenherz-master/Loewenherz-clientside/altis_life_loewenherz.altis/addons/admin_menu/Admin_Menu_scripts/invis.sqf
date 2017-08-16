if (!isObjectHidden player) then
{
	cutText ["Player is invisible: " + str(isObjectHidden player), "PLAIN DOWN"];
	[[vehicle player],"lhm_fnc_invisibleOn",false,false] call lhm_fnc_mp;
}
else
{
	cutText ["Player is invisible: " + str(isObjectHidden player), "PLAIN DOWN"];
	[[vehicle player],"lhm_fnc_invisibleOff",false,false] call lhm_fnc_mp;
};

[["admin",(format["%1 with UID %2 has used Invisible Script",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;