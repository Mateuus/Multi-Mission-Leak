/* 
	
	Author: Sebi
	http://www.lostofparadise.de/
	
*/
/* 
	
	Author: Sebi
	http://www.lostofparadise.de/
	
*/
titleText ["••• ESP DEAKTIVIERT •••","PLAIN",1];
onEachFrame {};
sleep 1;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
/* 
{if(alive _x && isplayer _x) then {
							deleteMarkerLocal str _x;
						};
					} forEach allUnits; 
sleep 1;		
{if((_x iskindof "Air" ) || (_x iskindof "Tank") || (_x isKindOf "Land")) then {
							deleteMarkerLocal str _x;
						};	 
					} forEach vehicles;
sleep 1;					
{if(alive _x && isplayer _x) then {
							deleteMarkerLocal str _x;
						};
					} forEach AH_PrevMarkers; 
sleep 1;					
{if((_x iskindof "Air" ) || (_x iskindof "Tank") || (_x isKindOf "Land")) then {
							deleteMarkerLocal str _x;
						};	 
					} forEach AH_PrevMarkers1;
sleep 1;	
{if !(_x in allUnits) then {
							deleteMarkerLocal str _x;
						};
					} forEach AH_PrevMarkers;
*/