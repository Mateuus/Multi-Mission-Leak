/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name]
*/
private["_side","_ret"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;
_ret = [];

switch (worldName) do
{
	case "Altis":
	{
		switch (_side) do
		{
			case west:
			{
				_ret = [["cop_spawn_1","Kavala HQ"],["cop_spawn_2","Pyrgos HQ"],["cop_spawn_3","Athira HQ"],["cop_spawn_4","Air HQ"],["cop_spawn_5","HW Patrol"]];
			};
			
			case independent:
			{
				_ret = [["med_spawn_1","Kavala"],["med_spawn_2","Pyrgos"],["med_spawn_3","Athira"],["med_spawn_4","Sofia"]];
			};
			
			case civilian:
			{
				_ret = [["civ_spawn_1","Kavala"],["civ_spawn_2","Pyrgos"],["civ_spawn_3","Athira"],["civ_spawn_4","Sofia"],["donor_town","Donor"]];
				for "_i" from 1 to (count life_houses) do
				{
					_ret set [count _ret, [format["house_%1",_i],format["House %1",_i]]];
				};
				{
					if (life_gang != "0" && life_gang == (_x select 1) && life_active_turf != _forEachIndex) then
					{
						_ret set [count _ret, [format["turf_label_%1",_forEachIndex + 1],_x select 0]];
					};
				} forEach life_turf_list;
			};
		};
	};
	case "Tanoa":
	{
		switch (_side) do
		{
			case west:
			{
				_ret = [["cop_spawn_1","Georgetown HQ"],["cop_spawn_2","Lijnhaven HQ"],["cop_spawn_3","La Rochelle HQ"],["cop_spawn_4","Katkoula HQ"],["cop_spawn_5","Vagalala CP"]];
			};
			
			case independent:
			{
				_ret = [["med_spawn_1","Georgetown"],["med_spawn_2","Lijnhaven"],["med_spawn_3","La Rochelle"],["med_spawn_4","Katkoula"]];
			};
			
			case civilian:
			{
				_ret = [["civ_spawn_1","Georgetown"],["civ_spawn_2","Lijnhaven"],["civ_spawn_3","La Rochelle"],["civ_spawn_4","Katkoula"]];
				for "_i" from 1 to (count life_houses) do
				{
					_ret set [count _ret, [format["house_%1",_i],format["House %1",_i]]];
				};
				{
					if (life_gang != "0" && life_gang == (_x select 1) && life_active_turf != _forEachIndex) then
					{
						_ret set [count _ret, [format["turf_label_%1",_forEachIndex + 1],_x select 0]];
					};
				} forEach life_turf_list;
			};
		};
	};
	case "Australia":
	{
		switch (_side) do
		{
			case west:
			{
				_ret = [["cop_spawn_1","Sydney HQ"],["cop_spawn_2","Melbourne HQ"],["cop_spawn_3","Brisbane HQ"],["cop_spawn_4","Max Prison"],["cop_spawn_5","Alice Springs"],["cop_spawn_6","Perth HQ"]];
			};
			
			case independent:
			{
				_ret = [["med_spawn_1","Sydney"],["med_spawn_2","Melbourne"],["med_spawn_3","Brisbane"],["med_spawn_4","Alice Springs"]];
			};
			
			case civilian:
			{
				_ret = [["civ_spawn_1","Sydney"],["civ_spawn_2","Melbourne"],["civ_spawn_3","Brisbane"],["civ_spawn_4","Alice Springs"],["civ_spawn_5","Perth"]];
				for "_i" from 1 to (count life_houses) do
				{
					_ret set [count _ret, [format["house_%1",_i],format["House %1",_i]]];
				};
				{
					if (life_gang != "0" && life_gang == (_x select 1) && life_active_turf != _forEachIndex) then
					{
						_ret set [count _ret, [format["turf_label_%1",_forEachIndex + 1],_x select 0]];
					};
				} forEach life_turf_list;
			};
		};
	};
	default
	{
		switch (_side) do
		{
			case west:
			{
				_ret = [["cop_spawn_1","Police HQ"],["cop_spawn_2","Police Station"]];
			};
			
			case independent:
			{
				_ret = [["med_spawn_1","Agia Clinic"]];
			};
			
			case civilian:
			{
				_ret = [["civ_spawn_1","Agia Marina"],["civ_spawn_2","Girna"]];
				for "_i" from 1 to (count life_houses) do
				{
					_ret pushBack [format["house_%1",_i],format["House %1",_i]];
				};		
			};
		};
	};
};

_ret;