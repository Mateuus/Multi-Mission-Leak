/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Loads the admin menu functions
*/

DS_fnc_amUpdatePlayerList = {
    private ["_dialog","_list","_checkBox1","_checkBox2","_filterNLR","_showIcons","_players","_addToList","_gangName","_side","_index","_tooltip","_picture"];

    _dialog = findDisplay 2900;
    if(isNull _dialog)exitWith{};

    _list = _dialog displayCtrl 1500;
    _checkBox1 = _dialog displayCtrl 2800;
    _checkBox2 = _dialog displayCtrl 2801;
    _showIcons = cbChecked _checkBox1;
    _filterNLR = cbChecked _checkBox2;

    _filterGroup = lbCurSel 2100;

    switch(_filterGroup)do {
        case 0: {_players = allPlayers}; //All
        case 1: {_players = allPlayers select {(side _x) isEqualTo civilian}}; //Civilians
        case 2: {_players = allPlayers select {(side _x) isEqualTo independent}}; //WL Civilians
        case 3: {_players = allPlayers select {(side _x) isEqualTo west}}; //Police
        case 4: {_players = allPlayers select {_x getVariable ["DSAdmin",false]}}; //Staff
        default {_players = allPlayers}; //All
    };

    lbClear _list;

    {
        _addToList = true;

        if(!(DS_amSearchText isEqualTo ""))then {
            if (((toLower (name _x)) find DS_amSearchText) isEqualTo -1)then {
                _addToList = false;
            };
        };

        if(_filterNLR)then {
            if(!(_x getVariable ["breakingNLR",false]))then {
                _addToList = false;
            };
        };

        if(_addToList)then {
            _gangName = (group _x) getVariable ["gangName","No Gang"];
        	_side = switch(side _x)do {case west: {"Cop"}; case civilian: {"Civ"}; case independent: {"WL"}; default {"Unknown"};};
        	_index = _list lbAdd format ["%1 - %2  (%3)", _x getVariable ["name",name _x],_side,_gangName];
        	_tooltip = format ["Slot - %1  (%2)",_x,_gangName];
        	_list lbSetTooltip [_index,_tooltip];
            _list lbSetData [_index,(_x call BIS_fnc_objectVar)];

            if(_showIcons)then {
                if(!isNull objectParent _x)then {
        			_picture = getText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "picture");
        			_list lbSetPicture [_index,_picture];
        		} else {
        			if(!(primaryWeapon _x isEqualTo ""))then {
        				_picture = getText (configFile >> "CfgWeapons" >> (primaryWeapon _x) >> "picture");
        				_list lbSetPicture [_index,_picture];
        			};
        		};
            };
        };
    } forEach _players;

    lbSort [_list,"ASC"];
};

DS_fnc_amApplySearch = {
    DS_amSearchText = toLower (ctrlText (_this select 0));
    [] call DS_fnc_amUpdatePlayerList;
};

DS_amFncsLoaded = true;