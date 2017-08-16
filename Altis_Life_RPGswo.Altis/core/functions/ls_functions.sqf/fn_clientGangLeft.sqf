private["_unit","_group"];

_unit = _this select 0;
_group = _this select 1;

if(isNil "_unit" OR isNil "_group") exitWith {};
sleep 2;
if(player == _unit && (group player) == _group) then
{
	DWEV_my_gang = ObjNull;
	[player] joinSilent (createGroup civilian);
	hint "Du hast deine Gang verlassen";
};