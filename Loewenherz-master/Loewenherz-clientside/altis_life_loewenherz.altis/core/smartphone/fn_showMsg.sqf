#include <macro.h>
/*

    file: fn_showMsg.sqf
    Author: Silex

*/
private["_index","_data","_status"];
_index = param [0,0];

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_cMessageHeader = _display displayCtrl 88890;

_data = call compile (_cMessageList lnbData[_index,0]);

_status = "[OFFLINE]";
{
    if(getPlayerUID _x == _data select 0) then
    {
        _status = "[ONLINE]";
        lhm_smartphoneTarget = _x;
        ctrlEnable[887892,true];
    };
}forEach playableUnits;

_cMessageHeader ctrlSetText format["%1 %2 wrotes:",_data select 3,_status];
_cMessageShow ctrlSetText format["%1",_data select 2];