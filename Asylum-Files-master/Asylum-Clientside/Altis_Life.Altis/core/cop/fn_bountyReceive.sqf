/*
	File: fn_bountyReceive.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Notifies the player he has received a bounty and gives him the cash.
*/
private["_val","_origVal","_total","_cops"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;
_arrester = param[2,ObjNull];
_origVal = _val;
if(playerSide == civilian && player == _arrester) then {
	_original = param[3];
	life_honor = life_honor + (_original / 50);
	if(count units player > 1) then {
		["life_honor",_original / 100] remoteExecCall ["life_fnc_netSetVar",units player - [player]];
	};
};
switch (true) do
{
	case (103 in life_talents || playerSide == civilian): { _val = _val * 1; _total = _total * 1; };
	case (102 in life_talents): { _val = _val * 0.85; _total = _total * 0.85; };
	case (101 in life_talents): { _val = _val * 0.75; _total = _total * 0.75; };
	default { _val = _val * 0.6; _total = _total * 0.6; };
};

if (_val > 150000) then { _val = 150000; };
if (_total > 150000) then { _total = 150000; };

if (playerSide == west) then
{
	[floor (_val / 50)] spawn life_fnc_earnPrestige;
	[player, _val] spawn life_fnc_copSplit;

	if(_val == _total) then
	{
		titleText[format["You and your fellow officers have been rewarded for this arrest.",[_val] call life_fnc_numberText],"PLAIN"];
	}
	else
	{
		titleText[format["You and your fellow officers have been rewarded for killing this criminal, if you had arrested him you would have received much more.",[_val] call life_fnc_numberText,[_total] call life_fnc_numberText],"PLAIN"];
	};
	
	if (_origVal > 5000) then
	{
		if (!(13 in life_achievements)) then { [13] call life_fnc_achievementGrant };
		[3,1] call life_fnc_addStatistic;
	};
	if (_origVal > 75000 && !(14 in life_achievements)) then { [14] call life_fnc_achievementGrant };
	if (_origVal > 250000 && !(15 in life_achievements)) then { [15] call life_fnc_achievementGrant };
}
else
{
	["atm","add",_val] call life_fnc_uC;
	if (_origVal > 5000) then {	[4,1] call life_fnc_addStatistic; };
	systemChat format["You've been awarded $%1 for your part in an arrest. Good work.", [_val] call life_fnc_numberText];
};