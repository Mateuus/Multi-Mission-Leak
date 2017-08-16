/*
	File: fn_bountyReceive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;

if(_val == _total) then
{
	titleText[format["Dir wurde ein Kopfgeld in Höhe von %1€ ausgezahlt.",[_val] call EMonkeys_fnc_numberText],"PLAIN"];
}
	else
{
	titleText[format["Du hast %1€ bekommen, weil du einen Kriminellen getötet hast. Falls er überlebt hätte, wären es %2€ gewesen.",[_val] call EMonkeys_fnc_numberText,[_total] call EMonkeys_fnc_numberText],"PLAIN"];
};

[format ["%1",_val],"EMonkeys_fnc_copcash",west,false] call EMonkeys_fnc_MP;
