/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Gives info about person you have killed
*/

private["_tempNum","_cop","_timesDied","_unit","_headShot","_unitPos","_distance","_headshotString","_unitGang","_str","_side","_tempNum"];

_unit = _this select 0;
_headshot = _this select 1;
_unitPos = _this select 2;
_cop = _this select 3;
_unitGang = (group _unit) getVariable "gangName";
_side = (side _unit);
if(isNil "_unitGang")then{_unitGang = "Not in gang"};

if(_headshot)then{_headshotString = "YES"}else{_headshotString = "NO"};
_distance = ((position player) distance _unitPos);

_str = parseText format ["<t color='#4CCF00' size='2'>Kill Info</t><br/><br/>

		<t color='#00BFFF' size='1'>Victim:</t> %1<br/>
		<t color='#00BFFF' size='1'>Distance:</t> %2m<br/>
		<t color='#00BFFF' size='1'>Gang:</t> %3<br/>
		<t color='#00BFFF' size='1'>Head Shot:</t> %4<br/><br/><br/>
		"
		,(name _unit)
		,(round(_distance))
		,_unitGang
		,_headshotString
		];

hint _str;
if((_cop)&&(DS_tokenMission == 16)&&(player distance fortknoxweapons4 < 500))then
	{
	DS_tokenMission = -1;
	[140,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};
if((_cop)&&(DS_tokenMission == 17)&&(player distance fed_bank < 500))then
	{
	DS_tokenMission = -1;
	[110,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};
if((_cop)&&(DS_tokenMission == 20)&&(player distance safe_research < 500))then
	{
	DS_tokenMission = -1;
	[130,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};
if((_cop)&&(DS_tokenMission == 22)&&(player distance safe_research < 500))then
	{
	DS_tokenMission = -1;
	[130,name player,false] spawn DS_civ_payTokens;
	DS_rebelMissionToken = false;
	};
if((_cop)&&((DS_infoArray select 15) == 18))then { [1] call DS_fnc_questCompleted };
if((_cop)&&((DS_infoArray select 15) == 29)&&((player distance gangflag1 < 300)||(player distance gangflag2 < 300)||(player distance gangflag3 < 300)||(player distance gangflag4 < 300)))then { [1] call DS_fnc_questCompleted };
if((_cop)&&((DS_infoArray select 15) == 45)&&((player distance hosp2 < 300)||(player distance hosp1 < 300)))then { 
	_tempNum = (DS_infoArray select 16) + 1;
	if(_tempNum > 9)then {
		[1] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [16,_tempNum];
	};
};
if((_cop)&&((DS_infoArray select 17) == 10)&&(player distance hosp1_1_3_1_1 < 500))then { [2] call DS_fnc_questCompleted };
if((_cop)&&((DS_infoArray select 17) == 17)&&(player distance repairBank2 < 500))then { [2] call DS_fnc_questCompleted };
if((_cop)&&((DS_infoArray select 17) == 26)&&(player distance knox_safe1 < 500))then { [2] call DS_fnc_questCompleted };
if((_cop)&&((DS_infoArray select 17) == 29)&&(player distance repairJail < 400))then { [2] call DS_fnc_questCompleted };
