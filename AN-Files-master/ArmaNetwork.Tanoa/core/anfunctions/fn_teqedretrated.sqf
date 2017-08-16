/*
    Author: ArmA.Network
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
private _allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
{
    private _vehicle = _x;
	private _owners = _vehicle getVariable ["vehicle_info_owners",[]];
    //diag_log format ["OWNERS ARRAY: %1 (%2)",_owners,_forEachIndex];
    private _index = [(getPlayerUID player),_owners] call life_fnc_uiudhfyqwtfkdsf;
    //diag_log format ["INDEX: %1 (%2)",_index,_forEachIndex];
    if !(_index isEqualTo -1) then 
    {
        private _data = _owners select _index;
        //diag_log format ["DATA %1 (%2)",_data,_forEachIndex];
        if ((_data select 2) isEqualTo playerSide) exitWith 
        {
            life_vehicles pushBack _vehicle;
        };
    };
} forEach _allVeh;
