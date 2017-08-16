/*
	File: fn_convertArmaRank.sqf
	Author: Division Wolf e.V. (MarkusSR1984)
	
	Description: 
	Converts between Arma 3 Ranks "CORPORAL" and Num Valus "1"
	
	Use: 
	
	["CORPORAL"] call DWEV_fnc_convertArmaRank // 1
	[1] call DWEV_fnc_convertArmaRank // CORPORAL
*/
private["_obj","_bool"];
_rank = param [0,"",["",0]];
_return = "ERROR:UNKNOWN RANK";

if (typeName _rank == "STRING") then
{
	_return = switch (_rank) do
	{
		case "PRIVATE": {0};
		case "CORPORAL": {1};
		case "SERGEANT": {2};
		case "LIEUTENANT": {3};
		case "CAPTAIN": {4};
		case "MAJOR": {5};
		case "COLONEL": {6};
	};
};

if (typeName _rank == "SCALAR") then
{
	_return = switch (_rank) do
	{
		case 0: {"PRIVATE"};
		case 1: {"CORPORAL"};
		case 2: {"SERGEANT"};
		case 3: {"LIEUTENANT"};
		case 4: {"CAPTAIN"};
		case 5: {"MAJOR"};
		case 6: {"COLONEL"};
	};
};

_return;