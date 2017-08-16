/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(EMonkeys_c164 > 0) then
{
	[[EMonkeys_c164],"EMonkeys_fnc_robReceive",_robber,false] call EMonkeys_fnc_mp;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
	[[0,format["%1 hat %3€ von %2 gestohlen",_robber getVariable["realname",name _robber],profileName,[EMonkeys_c164] call EMonkeys_fnc_numberText]],"EMonkeys_fnc_broadcast",nil,false] call EMonkeys_fnc_mp;
	EMonkeys_c164 = 0;
	[0] call SOCK_fnc_updatePartial;	
	
	_text = format ["*** Ausgeraubt | SpielerID Räuber: %1 | Name Räuber: %2 | Beute: %3 | SpielerID Opfer: %4 | Name Opfer: %5 |",getPlayerUID _robber,name _robber,EMonkeys_c164,getPlayerUID player,name player];
	[[5,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
}
	else
{
	[[2,format["%1 hatte kein Geld dabei!",profileName]],"EMonkeys_fnc_broadcast",_robber,false] call EMonkeys_fnc_mp;
};
