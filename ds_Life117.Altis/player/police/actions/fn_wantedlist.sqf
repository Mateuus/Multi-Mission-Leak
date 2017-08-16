/*
	File: fn_wantedlist
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Opens the wanted list
	*/
private["_display","_list","_name","_crimes","_bounty","_units","_players","_wantedPlayers","_wantedUids"];
disableSerialization;
closeDialog 0;
createDialog "wantedlist";

_display = findDisplay 606606;
_list = _display displayCtrl 2666;

lbClear _list;

_wantedUids = [];
_wantedPlayers = [];

{
	_wantedUids pushBack (_x select 0);
}forEach DS_wantedList;

{
	if(((getPlayerUid _x) in _wantedUids)&&((side _x) != west)&&(!(_x getVariable ["security",false]))&&(!(_x getVariable ["medic",false]))&&(!(_x getVariable ["mechanic",false])))then
	{
		_wantedPlayers pushBack (name _x);
		};
}forEach playableUnits;

{
	//if((alive _x)&&(side _x != west)&&(name _x in _wantedPlayers)) then
	if((alive _x)&&(name _x in _wantedPlayers)) then
	{
		_list lbAdd format["%1",name _x];
		_list lbSetData [(lbSize _list)-1,str(_x)];
	};
} foreach playableUnits;
lbSort [_list, "ASC"];
lbSetCurSel [2666,0];