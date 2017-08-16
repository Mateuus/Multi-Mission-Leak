/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

[] execVM "briefing.sqf"; //Load Briefing

[] execVM "KRON_Strings.sqf";

[] execVM "core\functions\zlt_fastrope.sqf";

[] execVM "core\actions\gate.sqf";

[] execVM "core\medical\injured_system.sqf";
 
_igiload = execVM "core\IgiLoad\IgiLoadInit.sqf";

emergLight_vehicles = []; 
{
 emergLight_vehicles pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "emergLightVehicles"));

{
 _x params [["_chan",-1,[0]], ["_noText","false",[""]], ["_noVoice","false",[""]]];
 _noText = [false,true] select ((["false","true"] find toLower _noText) max 0);
 _noVoice = [false,true] select ((["false","true"] find toLower _noVoice) max 0);
 _chan enableChannel [!_noText, !_noVoice];
} forEach getArray (missionConfigFile >> "disableChannels");


StartProgress = true;
