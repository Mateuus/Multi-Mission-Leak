/*

    file: fn_showMsg.sqf
    Author: Silex

*/
private["_index","_data","_status"];
_index = _this select 0;

disableSerialization;
waitUntil {!isNull findDisplay 3900};
_display = findDisplay 3900;
_preview = _display displayCtrl 3902;
_nachricht = _display displayCtrl 3903;
_nachrichttitle = _display displayCtrl 3907;

_data = call compile (_preview lnbData[_index,0]);

_status = "Unerreichbar";
{
    if(getPlayerUID _x == _data select 0) then
    {
        _status = _x getvariable "phone";
        life_smsTarget = _x;
        ctrlEnable[3904,true];
    };
} forEach playableUnits;

_nachrichttitle ctrlSetText format["%1 [%2] schrieb:",_data select 3,_status];
_nachricht ctrlSetText format["%1",_data select 2];