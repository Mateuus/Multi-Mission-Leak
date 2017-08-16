     
#include <macro.h>
   openMap true; hint "Click where you would like Teleport"; ["TelID", "onMapSingleClick", "[_pos] call ADP_fnc_Teleport1"] call BIS_fnc_addStackedEventHandler; 