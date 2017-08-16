
disableSerialization;

private _info = param [0,[],[[]]];
private _display = findDisplay 69690;
private _list = _display displayCtrl 6969;

{
    private _entry = _x;
    _list lbAdd format ["%1", _entry select 1];
    _list lbSetData [(lbSize _list)-1,str(_entry)];
} forEach _info;

//ctrlSetText[24040,"Connection Established"];

if (((lbSize _list)-1) isEqualTo -1) then {
    _list lbAdd "No bounty's set";
};