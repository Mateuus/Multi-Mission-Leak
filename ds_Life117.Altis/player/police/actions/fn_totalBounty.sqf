/*
	File: fn_totalBounty.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays the total bounty of all players on the server
*/
private["_bounty","_str","_martialLaw"];

_bounty = 0;
_martialLaw = ((count(playableUnits))*8000);
{
	if(((side _x) != west)&&(!(_x getVariable ["security",false])))then
		{
		_bounty = _bounty + (_x getVariable ["bounty",0]);
		};
}forEach playableUnits;

if(_bounty < 1)exitwith{hint "There is currently no bounties"};

if(_martialLaw < 300000)exitWith
	{
	_str = parseText format ["<t color='#01DF01' size='1.5'>Total Bounties<br/><br/>$%1<br/><br/><br/><br/>The total bounty amount is not over $300k, therefore martial law cannot be set</t>",[_bounty] call DS_fnc_numberText];
	player say3D "dingDong";
	hint _str;
	};

if(_bounty < _martialLaw)then
	{
	_str = parseText format ["<t color='#01DF01' size='1.5'>Total Bounties<br/><br/>$%1<br/><br/><br/><br/>The amount needed for server wide martial law is $%2</t>",[_bounty] call DS_fnc_numberText,[_martialLaw] call DS_fnc_numberText];
	player say3D "dingDong";
	}
	else
	{
	_str = parseText format ["<t color='#FF0000' size='1.5'>Total Bounties<br/><br/>$%1<br/><br/><br/>Because this is over $%2, server wide martial law is now allowed to be declared for one hour to deal with all crimes</t>",[_bounty] call DS_fnc_numberText,[_martialLaw] call DS_fnc_numberText];
	player say3D "dingDong";
	};
hint _str;