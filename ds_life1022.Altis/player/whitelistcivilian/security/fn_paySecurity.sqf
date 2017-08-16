/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Pays a security contractor who is defending a recently robbed shop
*/

private["_payment"];

_level = 100;//Increases with sec level
if((DS_infoArray select 19) > 3)then{_level = 120};
if((DS_infoArray select 19) > 13)then{_level = 150};
if((DS_infoArray select 19) > 19)then{_level = 200};

if(!alive player)exitwith{};
_payment = ((count(allPlayers))*_level);
player say3D "dingDong";
hint format ["You have been paid $%1 for protecting this area during high crime",_payment];
systemChat format ["You have been paid $%1 for protecting this area during high crime",_payment];
[_payment,false,true] call DS_fnc_handleMoney;

if((DS_infoArray select 19) == 8)then {
	_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if((DS_infoArray select 19) == 16)then {
	_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 19)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if((DS_infoArray select 19) == 21)then {
	_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 29)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if((DS_infoArray select 19) == 29)then {
	_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 39)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};

if((DS_infoArray select 19) == 35)then {
	_tempNum = (DS_infoArray select 20) + 1;
	if(_tempNum > 49)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [20,_tempNum];
	};
};