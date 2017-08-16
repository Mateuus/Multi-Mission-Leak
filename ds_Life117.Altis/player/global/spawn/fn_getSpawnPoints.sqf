/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns information regarding possible spawn points for a player
*/
private["_side","_return","_medLevel","_baseOpened"];

_side = (side player);
DS_blockEsc = (findDisplay 666671) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
switch (_side) do
	{
	case west:
		{
			if(str(player) in ["cop_4","cop_1","cop_3","cop_5"]) then 
			{
			_return = 	[
				["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa","kavala","Kavala is home to the public cops, check point 2 and the starting location of large police convoys"],
				["cop_spawn_5","Sofia HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","sofia","With a hospital nearby and a checkpoint just down the road. Sofia is quickly becoming a major police station"]
						];	
			}
			else
			{
			_return = 	[
				["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa","kavala","Patrol Kavala and keep checkpoint 2 under police control, Kavala has a high crime rate of petty crime"],
				["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa","pyrgos","Pyrgos is the home of our jail, stop break outs and keep the city and the nearby checkpoint safe"],
				["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","athira","Athira is a hub for crime, high profile criminals are always spotted in this area"],
				["cop_spawn_4","Air HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa","airHq","Built in a military zone, this is the central most police station. This station is used to retrieve air vehicles and protect the air field"],
				["cop_spawn_5","Sofia HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","sofia","With a hospital nearby and a checkpoint just down the road. Sofia is quickly becoming a major police station"]
						];
			};
		};
	case civilian:
		{
			if((!DSL_rebel)&&(!DSL_rebelAdv)) then
			{
				_return = 	[
					["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa","kavala","Kavala is a safe zone, a great place to start your journey in Altis"],
					["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa","pyrgos","Pyrgos is the capital of Altis, centrally located it has everything you need. A police check point and the jail keeps the area populated with police"],
					["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa","athira","Athira is the closes city to the main air field, the nearby police station keeps Athira safe"],
					["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa","sofia","Sofia is a city seldom visited by the police, a good place to visit when wanting to stay under cover"],
					["civ_spawn_5","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa","zaros","Zaros is an isolated southern city on the border of the infamous Rebel held lands"]
							];
			}
			else
			{
				_return = 	[
					["reb_spawn_2","Rebel Selakano","\a3\ui_f\data\map\MapControl\bunker_ca.paa","rebelSouth","A great place to arm up and get into some action, located south of the jail this is a great rebel area. Remember, this is not a KOS zone"],
					["reb_spawn_3","Rebel North","\a3\ui_f\data\map\MapControl\bunker_ca.paa","rebelNorth","The most isolated of rebel camps, this spawn is in the far north, closest to Athira, Kavala and Cocaine processor"],
					["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa","pyrgos","Pyrgos is the capital of Altis, centrally located it has everything you need. A police check point and the jail keeps the area populated with police"],
					["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa","athira","Athira is the closes city to the main air field, the nearby police station keeps Athira safe"],
					["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa","sofia","Sofia is a city seldom visited by the police, a good place to visit when wanting to stay under cover"],
					["civ_spawn_5","Zaros","\a3\ui_f\data\map\MapControl\watertower_ca.paa","zaros","Zaros is an isolated southern city on the border of the infamous Rebel held lands"]
							];
			};
		
		if(count DS_houses > 0) then 
			{
				{
					_pos = call compile format["%1",_x];
					_house = nearestBuilding _pos;
					if((_house distance _pos) > 5)then
					{
						_house = nearestObjects [_pos, [], 30] select 0;
					};
					if(alive _house)then
						{
						_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
						_return pushBack [format["Property_%1",_house getVariable "markerID"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa","altis","Player owned building"];
						};
				} foreach DS_houses;
			};
		if(getPlayerUID player in DS_clanBase6)then
			{
			_baseOpened = [1,"adminSpawn1"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["adminSpawn1","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase1)then
			{
			_baseOpened = [1,"clanBaseSpawn1"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn1","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase2)then
			{
			_baseOpened = [1,"clanBaseSpawn2"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn2","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase3)then
			{
			_baseOpened = [1,"clanBaseSpawn3"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn3","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase4)then
			{
			_baseOpened = [1,"clanBaseSpawn4"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn4","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase5)then
			{
			_baseOpened = [1,"clanBaseSpawn5"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn5","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase7)then
			{
			_baseOpened = [1,"clanBaseSpawn7"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn7","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		if(getPlayerUID player in DS_clanBase8)then
			{
			_baseOpened = [1,"clanBaseSpawn8"] call DS_fnc_checkBaseClosed;
			if(_baseOpened)then
				{
				_return pushBack ["clanBaseSpawn8","Clan Base","\a3\ui_f\data\map\MapControl\bunker_ca.paa","altis","Clan bases are KOS zones, and police need to raid to enter the area"];
				};
			};
		};
	case independent: 
		{
		_return = 	[	
					["medic_spawn1","(EMT) Kavala Hospital","extras\icons\medic.jpg","kavala","Kavala is a safe zone, though human remains and casualties are always close by"],
					["medic_spawn2","(EMT) Telos Regional","extras\icons\medic.jpg","altis","The center of Altis, always a busy area for medics"],
					["medic_spawn3","(EMT) Sofia Hospital","extras\icons\medic.jpg","sofia","Far in the east, human remains pile up at the nearby checkpoint and city of Sofia"],
					["mechanic_spawn_1","(Mechanic) Kavala Depot","extras\icons\mechanic.jpg","kavala","Kavala is the home to many young people, abandoned vehicles are always found in this area"],
					["mechanic_spawn_2","(Mechanic) Athira Depot","extras\icons\mechanic.jpg","athira","With the air field nearby and much crime happening, Athira is always a busy area for mechanics"],
					["mechanic_spawn_3","(Mechanic) Molos Depot","extras\icons\mechanic.jpg","altis","One of the quieter areas, this area is seldom visited but vehicles and stranded people are still to be found"],
					["mechanic_spawn_4","(Mechanic) Pyrgos Depot","extras\icons\mechanic.jpg","pyrgos","Covering the land from Pyrgos all the way south, this depot has a vast area to monitor"],
					["secSpawn1","(Security) Agios Station","extras\icons\gunAdv.jpg","altis","This station in centrally located between Kavala and Athira, able to respond to crime scenes quickly in that area"],
					["secSpawn2","(Security) Paros Station","extras\icons\gunAdv.jpg","altis","This station in centrally located between Sofia and Athira, able to respond to crime scenes quickly in that area"]
					];
		};
	};

_return;