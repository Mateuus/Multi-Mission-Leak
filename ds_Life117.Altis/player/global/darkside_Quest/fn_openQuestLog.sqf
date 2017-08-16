/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens and updates the players quest Log
*/

private["_dialog","_questList","_questInfo","_questArray","_questInfoStr","_warningText","_focus"];
closeDialog 0;
_focus = _this select 0;
DS_questFocus = _focus;
//systemchat format ["Focus = %1",_focus];
sleep 0.05;
createDialog "questLog";
disableSerialization;
_dialog = findDisplay 866667;
_questList = _dialog displayCtrl 1500;
_questInfo = _dialog displayCtrl 1100;
_guestArray = [];
if(playerside == west)then
	{
	if(_focus == 3)then
		{
		[] call DS_fnc_copQuest;
		};
	};
_questArray = [_focus] call DS_fnc_returnQuestArray;
_questInfoStr = [];
if(_questArray isEqualTo [])exitwith{systemchat "Quest Array Was Empty"};//WTF
_warningText = "";
{
	_name = _x select 0;
	_tooltip = _x select 1;
	_questList lbAdd format ["%1",_name];
	_questList lbSetTooltip [(lbSize _questList)-1, _toolTip];
	_questList lbsetData [(lbSize _questList)-1,str(_x)];
	switch(_focus)do
		{
		case 0:
			{
			if((DS_infoArray select 13) < ((lbsize _questList)-1))then
				{
				_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
				}
				else
				{
				_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
				};
			};
		case 1:
			{
			if((DS_infoArray select 15) < ((lbsize _questList)-1))then
				{
				_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
				}
				else
				{
				_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
				};
			};
		case 2:
			{
			if((DS_infoArray select 17) < ((lbsize _questList)-1))then
				{
				_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
				}
				else
				{
				_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
				};
			};
		case 3:
			{
			if(playerside == west)then
				{
				if((DS_infoArray select 21) < ((lbsize _questList)-1))then
					{
					_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
					}
					else
					{
					_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
					};
				};
			if(player getVariable ["security",false])then
				{
				if((DS_infoArray select 19) < ((lbsize _questList)-1))then
					{
					_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
					}
					else
					{
					_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
					};
				};
			if(player getVariable ["mechanic",false])then
				{
				if((DS_infoArray select 23) < ((lbsize _questList)-1))then
					{
					_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
					}
					else
					{
					_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
					};
				};
			if(player getVariable ["medic",false])then
				{
				if((DS_infoArray select 10) < ((lbsize _questList)-1))then
					{
					_questList lbSetColor [(lbSize _questList)-1, [1, 0, 0, 0.5]]; 
					}
					else
					{
					_questList lbSetColor [(lbSize _questList)-1, [0, 1, 0, 0.5]];
					};
				};
			};
		};
}forEach _questArray;

_questInfoStr = [0,false] call DS_fnc_returnInfo;
if(_questInfoStr isEqualTo [])exitwith{};//WTF
//Text
_questInfo ctrlSetStructuredText parseText format ["<t>%1<br/><br/>%2<br/><br/>Reward: %3<br/><br/></t><t size='0.75' color='#848484'>%4</t>",_questInfoStr select 0,_questInfoStr select 1,_questInfoStr select 2,_questInfoStr select 3];
