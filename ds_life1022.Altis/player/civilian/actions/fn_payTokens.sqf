/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Rewards rebels for w/e reason
*/

private ["_tempNum","_amount","_reward","_tempNum","_player","_toGang"];
_reward = _this select 0;
_player = _this select 1;
_toGang = _this select 2;

if(_toGang)then	{
	if((DS_infoArray select 15) > 47)then {
		_reward = round(_reward*2);
	};
	player say3D "success";
	hint format ["You have received %1 rebel tokens because %2 has completed his token mission",_reward,_player];
	systemchat format ["You have received %1 rebel tokens because %2 has completed his token mission",_reward,_player];
	_tempNum = (DS_realEstateArray select 6);
	_tempNum = _tempNum + _reward;
	DS_realEstateArray set [6,_tempNum];
	if((DS_infoArray select 15) == 47)then {
		_tempNum = (DS_infoArray select 16) + 1;
		if(_tempNum > 19)then {
			[1] call DS_fnc_questCompleted;
		} else {
			DS_infoArray set [16,_tempNum];
		};
	};
} else {
	DS_rebelMissionToken = false;
	DS_currentTask1 = "";
	_amount = [] call DS_fnc_getCopScore;
	_amount = (_amount*10000);
	if(_amount > 0)then {
		[_amount] spawn DS_civ_payGangAccount;
	};
	if((count(units group player)) > 1)then {
		if(((DS_tokenGroup select 0) != (group player))&&(count(units (DS_tokenGroup select 0)) > 0)&&(((DS_tokenGroup select 0) getVariable ["gangName",""]) == (DS_tokenGroup select 1)))then {
		_reward = floor(_reward/2);
			{
				[_reward,_player,true] remoteExec ["DS_civ_payTokens",_x];
			}forEach (units (DS_tokenGroup select 0));
		};
		{
			[_reward,_player,true] remoteExec ["DS_civ_payTokens",_x];
		}forEach (units group player);
		if((DS_infoArray select 15) == 31)then { [1] call DS_fnc_questCompleted };
		if((DS_infoArray select 15) == 35)then {
			_tempNum = (DS_infoArray select 16) + 1;
			if(_tempNum > 3)then {
				[1] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [16,_tempNum];
			};
		};
	} else {
		if(((DS_tokenGroup select 0) != (group player))&&(count(units (DS_tokenGroup select 0)) > 0)&&(((DS_tokenGroup select 0) getVariable ["gangName",""]) == (DS_tokenGroup select 1)))then {
		_reward = floor(_reward/2);
			{
				[_reward,_player,true] remoteExec ["DS_civ_payTokens",_x];
			}forEach (units (DS_tokenGroup select 0));
		};
		[_reward,"You",true] spawn DS_civ_payTokens;
		if((DS_infoArray select 15) == 31)then { [1] call DS_fnc_questCompleted };
		if((DS_infoArray select 15) == 35)then {
			_tempNum = (DS_infoArray select 16) + 1;
			if(_tempNum > 3)then {
				[1] call DS_fnc_questCompleted;
			} else {
				DS_infoArray set [16,_tempNum];
			};
		};
	};
};

