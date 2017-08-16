#include <macro.h>
private["_spawnPos","_playerPosition"];
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"],250];

waitUntil {!(isNull (findDisplay 46))};
		rulesok = false;
		if(!createDialog "agb") exitWith {};
		waitUntil{!isNull (findDisplay 32154)};
		waitUntil{isNull (findDisplay 32154)};
		if(!rulesok)then {        
				player enableSimulation false;
				["agb",false,true] call BIS_fnc_endMission;
				uiSleep 35;
		};
		rulesok = nil;	
_playerPosition = civ_position;
if((str(player) in ["civ_66","civ_67","civ_68","civ_69","civ_70","civ_71","civ_72","civ_73","civ_74","civ_75","civ_76"])) then {
	if(GETC(life_donator) == 0) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 35;
	};
};
if (!life_is_alive) then
{
	[0] call life_fnc_setPain;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)};
	waitUntil{isNull (findDisplay 38500)}; 
	life_is_alive = true;
}	
else
{
	if(life_is_arrested) then
				{
				life_is_arrested = false;
				[player,true] spawn life_fnc_jail;
				} 
					else 
						{
						hint format["Vous êtes toujours en vie. Vous vous trouvez à votre dernière position connue."];
						player setPos _playerPosition;
						};	
	life_is_alive = true;
}; 
player addRating 9999999;