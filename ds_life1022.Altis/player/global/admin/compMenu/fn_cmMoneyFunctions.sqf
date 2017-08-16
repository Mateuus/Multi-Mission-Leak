/*
	Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Functions for the money compensation menu
*/

DS_fnc_cmMoneyCompPlayer = {
    private ["_action","_dialog","_combo1","_value","_player","_uid","_note"];

    if((DS_adminLevel < 2)||(!((getPlayerUID player) in DS_adminlist1)))exitWith{hint "You aren't allowed to use this menu";};

    _action = [
    		format ["Are you sure you want to compensate %1 with the entered amount?",(name DS_cmUnit)],
    		"Confirm Compensation",
    		"Yes",
    		"No"
    	] call BIS_fnc_guiMessage;
    if(!_action)exitWith{};

    if((isNil "DS_cmUnit")||(isNull DS_cmUnit))exitWith{hint "The compensation target is no longer valid. Did they logout?";};

    disableSerialization;

    _dialog = findDisplay 666645;
    if(isNull _dialog)exitWith{};

    _combo1 = _dialog displayCtrl 2100;
    _value = ctrlText 1400;
    _value = parseNumber _value;
    if(_value < 1)exitWith{hint "You must enter a number larger than 0";};
    if((_value > 999999)&&(DS_adminLevel < 3))exitWith{hint "You can't compensate more than $999,999 at your staff level";};
    _player = (name player);
    _uid = getPlayerUID player;

    switch(lbCurSel _combo1)do {
        case 0: { //Money
        	[0,_value] remoteExecCall ["DS_fnc_compRecieve",DS_cmUnit];

        	hint format ["You have compensated $%1 to %2",[_value] call DS_fnc_numberText,name DS_cmUnit];
            systemChat format ["You have compensated $%1 to %2.",_value,name DS_cmUnit];

            _note = format ["Compensated money ($%1)",_value];
            [(getPlayerUID DS_cmUnit),"4",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];
        };
        case 1: { //Tokens
        	[1,_value] remoteExecCall ["DS_fnc_compRecieve",DS_cmUnit];

            hint format ["You have compensated %1 tokens to %2",_value,name DS_cmUnit];
            systemChat format ["You have compensated %1 tokens to %2.",_value,name DS_cmUnit];

            _note = format ["Compensated tokens (%1)",_value];
            [(getPlayerUID DS_cmUnit),"4",_note,(getPlayerUID player)] remoteExec ["HUNT_fnc_adminNotes",2];
        };
    };

    closeDialog 0;
    DS_cmUnit = nil;
};

DS_cmMoneyFncsLoaded = true;