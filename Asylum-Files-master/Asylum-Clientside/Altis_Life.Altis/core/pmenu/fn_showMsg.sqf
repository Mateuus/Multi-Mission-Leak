/*
fn_showMsg.sqf
Kevin Webb
Loads up message history, and displays data about past messages...
*/
private["_index","_data","_status"];
_isLoad = param[0];
_index = param [1];
disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cMessageList = _display displayCtrl 88882;
_cMessageShow = _display displayCtrl 88887;
_cMessageHeader = _display displayCtrl 88890;
(_display displayCtrl 88886) ctrlSetText "From:                 Message:";
if(_isLoad) exitWith {
	{
		_msg = _x select 1;
		_cMessageList lnbAddRow[_x select 0,format["%1 ...",_msg]];
		_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_x)];
	} forEach life_messages;
};
_data = call compile (_cMessageList lnbData[_index,0]);

_status = "[OFFLINE]";
{
    if(name _x == _data select 0) exitWith
    {
        _status = "[ONLINE]";
    };
}forEach allPlayers;

_cMessageHeader ctrlSetText format["%1 %2 wrote:",_data select 0,_status];
_cMessageShow ctrlSetText format["%1",_data select 1];