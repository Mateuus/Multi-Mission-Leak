private["_unit","_group"];

	_unit = _this select 0;
	_group = _this select 1;
	
	if(isNil "_unit" OR isNil "_group") exitWith {};
	
	if(player == _unit && (group player) == _group) then
	{
		player setRank "COLONEL";
		_group selectLeader _unit;
		hint "Du bist nun der derzeit höchstrangige der Gang und bist damit jetzt der Anführer der Truppe.";
	};