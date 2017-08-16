/*
	File: fn_killInfo.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Gives info about person you have killed
*/
private["_cop","_timesDied","_unit","_headShot","_unitPos","_distance","_headshotString","_unitGang","_str","_side","_tempNum"];

_unit = _this select 0;
_headshot = _this select 1;
_unitPos = _this select 2;
_cop = _this select 3;
_unitGang = (group _unit) getVariable "gangName";
_side = (side _unit);
if(isNil {_unitGang})then{_unitGang = "Not in gang"};

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
if((_cop)&&((DS_infoArray select 15) == 17))then
	{
	[1] call DS_fnc_questCompleted;
	};
if((_cop)&&((DS_infoArray select 17) == 10)&&(player distance kavAtm_1_2 < 500))then
	{
	[2] call DS_fnc_questCompleted;
	};
if((_cop)&&((DS_infoArray select 17) == 17)&&(player distance gasdesk10 < 500))then
	{
	[2] call DS_fnc_questCompleted;
	};
if((_cop)&&((DS_infoArray select 17) == 26)&&(player distance cleanupWrecks < 1000))then
	{
	[2] call DS_fnc_questCompleted;
	};
if((_cop)&&((DS_infoArray select 17) == 29)&&(player distance gasdesk1 < 200))then
	{
	[2] call DS_fnc_questCompleted;
	};