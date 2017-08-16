/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens the vehicle key menu
*/

//private[""];

closeDialog 0;
createDialog "keyMenu";

disableSerialization;

_dialog = findDisplay 666676;
_list = _dialog displayCtrl 1500;
_combo = _dialog displayCtrl 2100; 
_btnGive = _dialog displayCtrl 2400; 
_btnDrop = _dialog displayCtrl 2401; 
_nearplayers = [];
{ 
	if(player distance _x < 20) then 
		{
		_nearplayers pushBack _x;
		};
} foreach playableUnits;

for "_i" from 0 to (count DS_keyRing)-1 do
{
	_veh = DS_keyRing select _i;
	if(!isNull _veh && alive _veh) then
	{
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_list lbAdd format["%1 - [Distance: %2m]",_name,round(player distance _veh)];
		if(_pic != "pictureStaticObject") then {
			_list lbSetPicture [(lbSize _list)-1,_pic];
		};
		_list lbSetData [(lbSize _list)-1,str(_i)];
	};
};

{
	if((!isNull _x)&&(alive _x)&&(player distance _x < 20)&&(_x != player)) then
	{
		_combo lbAdd format["%1 - %2",_x getVariable["name",name _x], side _x];
		_combo lbSetData [(lbSize _combo)-1,str(_x)];
	};
} foreach _nearplayers;

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "None of your owned vehicles are active";
	_list lbSetData [(lbSize _list)-1,str(ObjNull)];
};

_btnGive ctrlSetTooltip "Give a copy of your vehicles key to the selected player";
_btnGive ctrlSetText "  Give Key";
_btnGive buttonSetAction "[false] spawn DS_fnc_keyGive;";

_btnDrop ctrlSetTooltip "Drop your currently selected key";
_btnDrop ctrlSetText " Drop Key";
_btnDrop buttonSetAction "[true] spawn DS_fnc_keyGive;";




