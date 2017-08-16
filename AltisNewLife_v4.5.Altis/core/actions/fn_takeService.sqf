#define GETC(var) (call var)
if(GETC(life_tafflevel) != 2) exitWith {};
player setVariable ["rsdep",true,true];
rsdep_setAsTowerAction = player addAction ["Définir comme Dépanneuse",rsdep_fnc_setAsTower,"",0,false,false,"",'
((vehicle player) != player) && ((typeOf (vehicle player)) IN rsdep_allowedVehicles) && ((vehicle player) != rsdep_towerVehic) && !rsdep_isTowing'];
rsdep_unTowAction = player addAction ["Detacher le Vehicule",rsdep_fnc_unTowVehic,"",0,false,false,"",'
!isNull cursorTarget && cursorTarget isKindOf "Car" && (!isNull (cursorTarget getVariable ["towedBy",objNull])) && rsdep_isTowing && ((player distance cursorTarget) < 4)'];
rsdep_towAction = player addAction ["Tracter ce Vehicule",rsdep_fnc_towVehic,"",0,false,false,"",'
!isNull cursorTarget && cursorTarget isKindOf "Car" && (!isNull rsdep_towerVehic) && ((cursorTarget getVariable ["towedBy",objNull]) != objNull) && ((vehicle player) == player) && !rsdep_isTowing && (cursorTarget != rsdep_towerVehic) && !(rsdep_towerVehic getVariable ["towing",false]) && ((player distance cursorTarget) < 4)'];
rsdep_deleteVehAction = player addAction ["Mettre en Fourrière",rsdep_fnc_deleteVeh,"",0,false,false,"",'
!isNull cursorTarget && cursorTarget isKindOf "Car" && (isNull (cursorTarget getVariable ["towedBy",objNull])) && ((player distance cursorTarget) < 4) && ((player distance (getMarkerPos "fourriere")) < 30)'];
rsdep_lightsAction = player addAction ["Allumer/Eteindre les Gyros",{[(vehicle player)] call life_fnc_rsLightsAction},"",0,false,false,"",'
((vehicle player) != player) && ((typeof (vehicle player) == "C_Offroad_01_repair_F"))'];
titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous avez pris votre service, achetez une dépanneuse pour commencer a travailler !","PLAIN"];