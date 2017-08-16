#include "..\..\macros.hpp"
private["_allVeh","_pUID"];
     
    sleep 5;
     
    _allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
    _name = getMyName;
     
    {
		_owners = _x getVariable ["vehicle_info_owners",[]];
		_index = [_name,_owners] call DWF_fnc_index;
		if(!(_index == -1)) then 
		{
			DWEV_vehicles pushBack _x;
		};	
    } foreach _allVeh;