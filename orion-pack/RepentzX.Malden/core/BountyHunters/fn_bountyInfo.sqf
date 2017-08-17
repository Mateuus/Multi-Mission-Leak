/*[localize "STR_Cop_wantedList_FailedToFetch",true,"slow"] call life_fnc_notificationSystem;
    File: fn_bountyInfo.sqf
    Author: !TS JORDAN
	Originally Made for: Underbelly ArmA 

    Description:
    Pulls back information about the person with the bounty. 
*/
disableSerialization;

private _data = param [0,[],[[]]];
private _display = findDisplay 66600;
private _list = _display displayCtrl 24020;
private _mylist = [];

if (isNil "_data") exitWith {[localize "STR_Cop_wantedList_FailedToFetch",true,"slow"] call life_fnc_notificationSystem;};
if !(_data isEqualType []) exitWith {[localize "STR_Cop_wantedList_FailedToFetch",true,"slow"] call life_fnc_notificationSystem;};
if (_data isEqualTo []) exitWith {[localize "STR_Cop_wantedList_FailedToFetch",true,"slow"] call life_fnc_notificationSystem;};

lbClear _list;

ctrlSetText[24030,format [localize "STR_Wanted_Bounty",[(_data select 0)] call life_fnc_numberText]];