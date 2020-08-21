/*
	Author: GetSomePanda / Panda
	SteamID: 76561198145366418
	File Name: fn_replyMessage.sqf
	Information: Reply to the message in my messages.
*/
private["_lbSelectedData","_name","_found"];
disableSerialization;
_lbSelectedData = lbData[98112,lbCurSel (98112)];
_lbSelectedData = call compile _lbSelectedData;
_name = _lbSelectedData select 0;
_found = "";

{
	if(_x getVariable "realname" isEqualTo _name) then 
	{
		_found = "True";
	}
} foreach playableUnits;

if(_found isEqualTo "") exitWith { hint "Ta osoba nie jest w tej chwili online!"};

closeDialog 0;

if(_found isEqualTo "True") then 
{
	[_name] call life_fnc_cellphone;
};




