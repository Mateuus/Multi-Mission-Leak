/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes key parts for the Settings menu for View distance and other stuff.
*/
private["_whitelist"];

tawvd_foot = profileNamespace getVariable [format["%1_distantView_%2",missionName,getplayerUID player],viewdistance];
tawvd_car = profileNamespace getVariable [format["%1_distantView_%2",missionName,getplayerUID player],viewdistance];
tawvd_air = profileNamespace getVariable [format["%1_distantView_%2",missionName,getplayerUID player],viewdistance];
tawvd_addon_disable = true;

setViewDistance (profileNamespace getVariable [format["%1_distantView_%2",missionName,getplayerUID player],viewdistance]);

_agentslist = []; 
{_agentslist pushback (agent _x)} foreach agents;
{_x enableSimulation false} foreach allMissionObjects "";
_whitelist = entities "car" + entities "air" + entities "ship" + entities "test_EmptyObjectForSmoke" + entities "Land_FieldToilet_F" + ((getMarkerPos "helisim") nearEntities ["Man", 60]) + allMissionObjects "FlagCarrierCore" + allMissionObjects "EmptyDetector" + allmissionObjects "Land_Camping_Light_F" + allmissionobjects "Land_PlasticCase_01_large_F" + allMissionObjects "CargoNet_01_box_F" + _agentslist + playableUnits;
{if!(isNull _x) then {_x enableSimulation true}} foreach _whitelist;

{_x setObjectMaterial [0,"images\materials\wtafel.rvmat"];} foreach allMissionObjects "Land_Billboard_F";

showHUD [true,true,true,true,false,false,true,true];
0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
7 enableChannel [true,false];

[] call life_fnc_mapmarker;
[-1,-1] call life_fnc_marker;

disableSerialization;
_version = profileNamespace getVariable [format["%1_version_%2",missionName,getplayerUID player],""];

if(_version != "") then {
	if(life_version != _version) then {playsound "news"; createdialog "changelog"};
};

profileNamespace setVariable [format["%1_version_%2",missionName,getplayerUID player],life_version];
saveProfileNamespace;

//Radio
if(license_civ_radio) then {
	life_radio_radio radioChannelAdd [player];
};

//Items
life_itemInfo = [];
{
 _str = [_x] call life_fnc_varToStr; 
 _shrt = [_x,1] call life_fnc_varHandle; 
 _icon = [_x] call life_fnc_itemIcon; 
 _color = [_shrt] call life_fnc_classColors; 
 _tooltip = [_shrt] call life_fnc_tooltips;

life_itemInfo pushbackUnique [_x,_str,_shrt,_icon,_color,_tooltip];
} foreach life_inv_items;