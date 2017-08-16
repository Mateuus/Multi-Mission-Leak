/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Punishes rebels for things (Rebel KOS being capped) ALso pays those who hold it.
*/
private["_group","_tokens","_numInGroup"];

sleep random 30;
_tokens = 0;

_group = shawn1 getVariable ["gangOwner",grpNull];
if(isNull _group)exitwith{};

if((group player) == _group)then
	{
	_totalPlayers = count playableUnits;
	if(_totalPlayers > 20)then{_tokens = 3};
	if(_totalPlayers > 30)then{_tokens = 6};
	if(_totalPlayers > 40)then{_tokens = 12};
	if(_totalPlayers > 50)then{_tokens = 25};
	if(_totalPlayers > 60)then{_tokens = 35};
	if(_totalPlayers > 70)then{_tokens = 45};
	if(_totalPlayers > 80)then{_tokens = 60};
	_numInGroup = (count units(group player));
	_tokens = (ceil(_tokens/_numInGroup));
	player say3D "success";
	systemchat format ["As a reward for holding the Rebel KOS zone, you have been rewarded with %1 Rebel Tokens",_tokens];
	hint format ["As a reward for holding the Rebel KOS zone, you have been rewarded with %1 Rebel Tokens",_tokens];
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + _tokens;
	DS_realEstateArray set [6,_tempNum];
	[] call DS_fnc_compileData;
	if((DS_infoArray select 15) == 27)then
		{
		[1] call DS_fnc_questCompleted;
		};
	if((DS_infoArray select 15) == 29)then
		{
		_tempNum = DS_infoArray select 16;
		_tempNum = _tempNum + 1;
		DS_infoArray set [16,_tempNum];
		if((DS_infoArray select 16) > 3)then
			{
			[1] call DS_fnc_questCompleted;
			};
		};
	}
	else
	{
	if((DSL_rebelAdv)&&(player distance shawn1 > 3000))then
		{
		_tempNum = (DS_realEstateArray select 6);
		if(_tempNum > 0)then
			{
			_random = random 10;
			if(_random > 5)then
				{
				_tempNum = _tempNum - 1;
				DS_realEstateArray set [6,_tempNum];
				player say3D "fail";
				hint "You have had 1 Rebel Token removed for allowing another gang to hold the KOS Capture point";
				systemchat "You have had 1 Rebel Token removed for allowing another gang to hold the KOS Capture point";
				};
			};
		};
	};