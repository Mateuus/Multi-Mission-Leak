/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
updates the players quest Log
*/

private["_dialog","_display","_questList","_questInfo","_questArray","_questInfoStr","_warningText","_index"];

disableSerialization;

_dialog = findDisplay 866667;
_questList = _dialog displayCtrl 1500;
_questInfo = _dialog displayCtrl 1100;
_display = _this select 0;
_index = _this select 1;
_questInfoStr = [];
_questInfoStr = [_index,true] call DS_fnc_returnInfo;
if(_questInfoStr isEqualTo [])exitwith{};//WTF
//Text
_questInfo ctrlSetStructuredText parseText format ["<t>%1<br/><br/>%2<br/><br/>Reward: %3<br/><br/></t><t size='0.75' color='#848484'>%4</t>",_questInfoStr select 0,_questInfoStr select 1,_questInfoStr select 2,_questInfoStr select 3];
