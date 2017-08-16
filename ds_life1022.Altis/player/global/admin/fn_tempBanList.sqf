/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the temp ban list
*/

private ["_dialog","_list","_btn","_btn2","_btn3"];

closeDialog 0;
createDialog "tempBanList";

_dialog = findDisplay 2901;
if(isNull _dialog)exitWith{};

_list = _dialog displayCtrl 1500;

_btn1 = _dialog displayCtrl 2400; //Unban
_btn2 = _dialog displayCtrl 2401; //Refresh List
_btn3 = _dialog displayCtrl 2402; //Close

DS_fnc_tblFillList = {
    private ["_dialog","_list","_index"];

    _dialog = findDisplay 2901;
    if(isNull _dialog)exitWith{};

    _list = _dialog displayCtrl 1500;
    lbClear _list;

    {
        _index = _list lbAdd _x;
        _list lbSetData [_index,_x];
    } forEach DS_tempBans;
};

DS_fnc_tblUnban = {
    private ["_dialog","_list","_uid","_index"];

    _dialog = findDisplay 2901;
    if(isNull _dialog)exitWith{};

    _list = _dialog displayCtrl 1500;
    if((lbCurSel _list) == -1)exitWith{hint "You have not selected a UID to unban"};

    _uid = lbData [1500,lbCurSel 1500];

    _index = DS_tempBans find _uid;
    if(_index isEqualTo -1)exitWith{hint "This UID is not currently banned"};

    DS_tempBans deleteAt _index;
	publicVariable "DS_tempBans";

    hint format ["Unbanned UID %1",_uid];

    [] call DS_fnc_tblFillList;
};

[] call DS_fnc_tblFillList;

//Unban button
_btn1 ctrlSetText "Unban";
_btn1 ctrlSetTooltip "Unbans the selected UID";
_btn1 buttonSetAction "[] call DS_fnc_tblUnban;";

//Refresh list button
_btn2 ctrlSetText "Refresh List";
_btn2 ctrlSetTooltip "Refreshes the temp ban list";
_btn2 buttonSetAction "[] call DS_fnc_tblFillList;";

//Close button
_btn3 ctrlSetText "Close";
_btn3 ctrlSetTooltip "Closes the temp ban list";
_btn3 buttonSetAction "closeDialog 0;";