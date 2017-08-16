/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Pays an officer the bounty of a wanted criminal
*/

private ["_type","_civ","_bounty"];

_type = _this select 0;
_civ = _this select 1;
_bounty = _this select 2;

_civ = (name _civ);

if(_type == 0)then
	{
	if((player getVariable ["security",false])&&((DS_infoArray select 19) > 24))then{_bounty = _bounty*1.5};
	if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 6))then{_bounty = (_bounty*1.5)};
	if((playerSide isEqualTo west)&&((DS_infoArray select 21) > 10))then{_bounty = (_bounty*2)};
	hint format ["You have received a bounty of $%1 for arresting %2",([_bounty] call DS_fnc_numberText),_civ];
	systemchat format ["You have received a bounty of $%1 for arresting %2",([_bounty] call DS_fnc_numberText),_civ];
	DS_atmCoin = DS_atmCoin + _bounty;
	[_bounty,true,true] call DS_fnc_handleMoney;
	[50,true] spawn DS_fnc_moralAlter;
	[(_bounty/2),true] remoteExec ["HUNT_fnc_policeBank",2];
	};

if(_type == 1)then
	{
	[_bounty,_civ] spawn {
		private ["_bounty","_civ"];
		_bounty = _this select 0;
		_civ = _this select 1;
		sleep 10;
		if(_bounty > 50000)then{[100,true] spawn DS_fnc_moralAlter};
		if((_bounty > 25000)&&(_bounty < 50001))then{[50,true] spawn DS_fnc_moralAlter};
		_bounty = (round(_bounty/4));
		hint format ["You have received a bounty of $%1 for killing %2",([(_this select 0)] call DS_fnc_numberText),_civ];
		systemchat format ["You have received a bounty of $%1 for killing %2",([(_this select 0)] call DS_fnc_numberText),_civ];
		[_bounty,true,true] call DS_fnc_handleMoney;
		[50,true] spawn DS_fnc_moralAlter;
		[(_bounty/8),true] remoteExec ["HUNT_fnc_policeBank",2];
	};
	};

