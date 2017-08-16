/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Unrestrain a civilian
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if((isNull _unit)||((!(_unit getVariable["cuffed",FALSE]))&&(!(_unit getVariable["ziptied",FALSE]))))exitWith {};
//if([getPos player,15,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this with a cop so nearby","PLAIN"];};
_unit setVariable["cuffed",FALSE,TRUE];
_unit setVariable["Escorted",FALSE,TRUE];
_unit setVariable["cuffedVeh",FALSE,TRUE];
_unit setVariable["ziptied",FALSE,TRUE];
detach _unit;
hint format ["You have unrestrained %1",(name _unit)];

{
	_group = (_x select 0);
	_groupUIDS = (_group getVariable ["gangMembers",[""]]);
	if((getPlayerUID player) in (_groupUIDS))then
		{
		[player] joinSilent _group;
		};
} forEach DS_gangList;