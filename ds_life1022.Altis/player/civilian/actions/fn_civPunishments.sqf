/*
	Author: Shawn "Huntah" Macgillivray

	Description:
	Punishes rebels for things (Rebel KOS being capped) ALso pays those who hold it.
*/

private["_group","_tokens","_numInGroup"];

sleep random 30;
_tokens = 0;

_group = shawn1 getVariable ["gangOwner",grpNull];
if(isNull _group)exitwith{};

if((playerSide isEqualTo civilian)&&((count (units (group player)) > 10)))then
	{
	hint "Your gang was over its member limit, therefore you were kicked";
	[player] joinSilent (createGroup civilian);
	};

_group = shawn1 getVariable ["gangOwner",grpNull];
if(isNull _group)exitwith{};

if((group player) == _group)then
	{
	_totalPlayers = count allPlayers;
	if(_totalPlayers > 20)then{_tokens = 6};
	if(_totalPlayers > 30)then{_tokens = 12};
	if(_totalPlayers > 40)then{_tokens = 18};
	if(_totalPlayers > 50)then{_tokens = 30};
	if(_totalPlayers > 60)then{_tokens = 40};
	if(_totalPlayers > 70)then{_tokens = 50};
	if(_totalPlayers > 80)then{_tokens = 60};
	if(_totalPlayers > 90)then{_tokens = 70};
	if(_totalPlayers > 100)then{_tokens = 80};
	if(_totalPlayers > 120)then{_tokens = 100};
	_numInGroup = (count units(group player));
	_tokens = (ceil(_tokens/_numInGroup));
	player say3D "success";
	systemchat format ["As a reward for holding the Rebel KOS zone, you have been rewarded with %1 Rebel Tokens",_tokens];
	hint format ["As a reward for holding the Rebel KOS zone, you have been rewarded with %1 Rebel Tokens",_tokens];
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + _tokens;
	DS_realEstateArray set [6,_tempNum];
	[] call DS_fnc_compileData;
	}
	else
	{
	if(isNil "DSL_rebelAdv")then{DSL_rebelAdv = false;};
	if((DSL_rebelAdv)&&(player distance shawn1 > 2000))then {
		_tempNum = (DS_realEstateArray select 6);
		if(_tempNum > 0)then {
			_random = random 10;
			if(_random > 5)then {
				if(_tempNum > 5000)then {
					_tempNum = _tempNum - 5;
					hint "You have had 5 Rebel Tokens removed for allowing another gang to hold the KOS Capture point";
					systemchat "You have had 5 Rebel Tokens removed for allowing another gang to hold the KOS Capture point";
				} else {
					if(_tempNum > 2000)then {
						_tempNum = _tempNum - 3;
						hint "You have had 3 Rebel Tokens removed for allowing another gang to hold the KOS Capture point";
						systemchat "You have had 3 Rebel Tokens removed for allowing another gang to hold the KOS Capture point";
					} else {
						_tempNum = _tempNum - 1;
						hint "You have had 1 Rebel Token removed for allowing another gang to hold the KOS Capture point";
						systemchat "You have had 1 Rebel Token removed for allowing another gang to hold the KOS Capture point";
					};
				};
				DS_realEstateArray set [6,_tempNum];
				player say3D "fail";
				};
			};
		};
	};