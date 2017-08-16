
disableSerialization;

private _data = param [0,[],[[]]];
private _display = findDisplay 69690;
private _list = _display displayCtrl 24020;
private _mylist = [];

if (isNil "_data") exitWith {[localize "STR_Cop_wantedList_FailedToFetch",5,"gray"] call RPG_Fnc_Msg;};
if !(_data isEqualType []) exitWith {[localize "STR_Cop_wantedList_FailedToFetch",5,"gray"] call RPG_Fnc_Msg;};
if (_data isEqualTo []) exitWith {[localize "STR_Cop_wantedList_FailedToFetch",5,"gray"] call RPG_Fnc_Msg;};

lbClear _list;

ctrlSetText[24030,format [localize "STR_Wanted_Bounty",[(_data select 0)] call life_fnc_numberText]];