/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Takes money from Fort Knox money safe
*/

private ["_tempNum","_newVal"];

if(player distance knox_safe1 > 6) exitwith {hint 'You are too far from the safe';};
if(playerSide isEqualTo west) exitwith {};
if(knox_safe1 getVariable ["closed",false])exitwith{hint 'You need to crack this safe before you can take the money'};

if(DS_doingStuff)exitwith{};
DS_doingStuff = true;

if(DS_policeBank < 2000) exitwith {_str = parseText "<t color='#FF0000' size='1.5'><br/>The safe is empty<br/></t>";
hint _str;systemchat "The safe is empty";DS_doingStuff = false;	};
if([player,5,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not take this when another player is so nearby","PLAIN"];DS_doingStuff = false;};

hint "Remain close to take some money";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;

_newVal = (round((DS_policeBank*3)/5));
[(_newVal/3),false] remoteExec ["HUNT_fnc_policeBank",2];
if(miscInfoArray select 8)then{_newVal = _newVal*2};
_str = parseText format ["<t color='#01DF01' size='1.5'><br/>You have taken $%1, keep taking more until it's empty<br/></t>",[_newVal] call DS_fnc_numberText];
hint _str;
systemchat format  ["You have taken $%1, keep taking more until it's empty",[_newVal] call DS_fnc_numberText];
[_newVal,false,true] call DS_fnc_handleMoney;
[20,false] spawn DS_fnc_moralAlter;
DS_doingStuff = false;

if(DS_tokenMission == 7)then
	{
	DS_tokenMission = -1;
	[250,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};

if((DS_infoArray select 17) == 19)then { [2] call DS_fnc_questCompleted };
if((DS_infoArray select 17) == 43)then {
	_tempNum = (DS_infoArray select 18) + _newVal;
	if(_tempNum > 999999)then {
		[2] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [18,_tempNum];
	};
};