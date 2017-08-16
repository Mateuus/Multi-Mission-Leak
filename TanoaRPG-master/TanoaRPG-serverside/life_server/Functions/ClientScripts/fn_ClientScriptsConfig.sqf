/* 
 File: fn_ClientScriptsConfig.sqf 
 Author: CooliMC 
  
 Description: Version 1.0 DONT STEEL MY SCRIPTS ANYMORE FUCKING EISENSCHMIEDE ;( 
*/ 
private["_scripts","_path"]; 
 
_scripts = []; 
_path = "\life_server\Functions\ClientScripts\Scripts\"; 
//_scripts pushBack [SCRIPTNAME, FILENAME, PATH]; 
 
//Cop HEMTT 
_scripts pushBack ["tanoarpg_fnc_MobileCopStationLocal", "fn_MobileCopStationLocal.sqf", (_path + "Cop_Hemmit\")]; 
_scripts pushBack ["tanoarpg_fnc_MobileCopStationPillar", "fn_MobileCopStationPillar.sqf", (_path + "Cop_Hemmit\")]; 
//Items 
_scripts pushBack ["tanoarpg_fnc_einsatzschild", "fn_einsatzschild.sqf", (_path + "Items\")]; 
_scripts pushBack ["tanoarpg_fnc_useDefibrilator", "fn_useDefibrilator.sqf", (_path + "Items\")]; 
//PimpYourSkin 
_scripts pushBack ["tanoarpg_fnc_colorClothesMenu", "fn_colorClothesMenu.sqf", (_path + "PimpYourSkin\")]; 
 
_scripts;