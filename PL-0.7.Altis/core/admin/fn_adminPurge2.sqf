#include "..\..\script_macros.hpp"
/*
	File: fn_adminPurge.sqf
	Author: Skrow #ProjetLife
*/
[parseText "Ceci n'est pas un exercice", parseText "																								Ce message est votre systeme de diffusion d'urgence annonçant le Commencement de la Purge annuelle sanctionnée par le gouvernement de Projet Life. Au commencement de la sirène, toutes criminalités, y compris tout assasinats, sera légal jusqu'a la fin du monde. Toutes les armes sont autorisés pendant la Purge. La Gendarmerie, la Police Municipale ainsi que le Samu ne seront pas disponible. Béni soit nos pères fondateurs, une nation libéré. Que Dieu soit avec vous tous."] spawn BIS_fnc_AAN;
[] call life_fnc_purge;
uisleep 60;
(uinamespace getvariable "BIS_AAN") closedisplay 1;
deleteMarker "safezone"; //Kavala
deleteMarker "safe_zone"; //Casino
deleteMarker "safezone_1_1"; //Athira
deleteMarker "safezone_1_2"; //Pyrgos
deleteMarker "rebelzone"; //Sofia
deleteMarker "rebelzone1_1"; //Camp Rebelle
