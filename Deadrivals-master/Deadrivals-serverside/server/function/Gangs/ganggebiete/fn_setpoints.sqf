_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param; 
_flag = [_this,1,Objnull,[Objnull]] call BIS_fnc_param; 
_oldgangname = [_this,2,"",[""]] call BIS_fnc_param; 
_gangtalente = _group getVariable"gang_talente"; 
 
_waitTime = getNumber(missionConfigFile >> "CfgActions" >> "ActionTime" >> "ganggebiet") / (1 / 0.006); 
 
if (7 in _gangtalente) then { 
_waitTime = getNumber(missionConfigFile >> "CfgActions" >> "ActionTimeGangskilled" >> "ganggebiet1") / (1 / 0.006); 
}; 
 
if (8 in _gangtalente) then { 
_waitTime = getNumber(missionConfigFile >> "CfgActions" >> "ActionTimeGangskilled" >> "ganggebiet2") / (1 / 0.006); 
}; 
 
_interrupted = false; 
for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do 
{ 
sleep _waitTime; 
if(_flag getVariable"unterbrochen") exitWith {_interrupted = true;}; 
}; 
 
if (_interrupted) then { 
_flagid = _flag getVariable "ganggebiet_id"; 
_flaggebietname = _flag getVariable "ganggebiet_gebietname"; 
 
_markername = format["ganggebiet_%1",_flagid]; 
deleteMarker _markername; 
 
_marker = createMarker [format["ganggebiet_%1",_flagid],_flag]; 
 
_mullname = format["%1 in Besitz von %2",_flaggebietname,_oldgangname]; 
 
_marker setMarkerText _mullname; 
_marker setMarkerColor "ColorRed"; 
_marker setMarkerType "hd_flag"; 
_marker setMarkerSize [1,1]; 
 
_markerareaname = format["ganggebietarea_%1",_flagid]; 
deleteMarker _markerareaname; 
 
_areaName = createMarker [format["ganggebietarea_%1",_flagid],_flag]; 
 
_areaName setMarkerColor "ColorWhite"; 
_areaName setMarkerShape "ELLIPSE"; 
_areaName setMarkerBrush "SolidBorder"; 
_areaName setMarkerSize [500, 500]; 
} else { 
[_flag] remoteExec ["SERVER_fnc_ganggebietcooldown",2]; 
["gebiet",_group] remoteExec ["CLIENT_fnc_pgangaddxp",-2]; 
 
_flagid = _flag getVariable "ganggebiet_id"; 
_flaggebietname = _flag getVariable "ganggebiet_gebietname"; 
_gangname = _group getVariable "gang_name"; 
 
_markername = format["ganggebiet_%1",_flagid]; 
deleteMarker _markername; 
 
_marker = createMarker [format["ganggebiet_%1",_flagid],_flag]; 
 
_mullname = format["%1 in Besitz von %2",_flaggebietname,_gangname]; 
 
_marker setMarkerText _mullname; 
_marker setMarkerColor "ColorRed"; 
_marker setMarkerType "hd_flag"; 
_marker setMarkerSize [1,1]; 
 
_markerareaname = format["ganggebietarea_%1",_flagid]; 
deleteMarker _markerareaname; 
 
_areaName = createMarker [format["ganggebietarea_%1",_flagid],_flag]; 
 
_areaName setMarkerColor "ColorWhite"; 
_areaName setMarkerShape "ELLIPSE"; 
_areaName setMarkerBrush "SolidBorder"; 
_areaName setMarkerSize [500, 500]; 
 
if (worldName == "Tanoa") then { 
_query = format ["UPDATE gangebiet_tanoa SET gang = '%1' WHERE id = '%2'",_gangname,_flagid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
sleep 1; 
_containers = format["SELECT id, classname, pos, gang, gebiet FROM gangebiet_tanoa WHERE aktiv = '%1'",1]; 
_containers = [_containers,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_GANGGEBIETE = _containers; 
publicVariable "NOCRIS_GANGGEBIETE"; 
} else { 
_query = format ["UPDATE gangebiet_altis SET gang = '%1' WHERE id = '%2'",_gangname,_flagid]; 
_queryResult = [_query,1] call SERVERDATABASE_fnc_asyncCall; 
 
sleep 1; 
_containers = format["SELECT id, classname, pos, gang, gebiet FROM gangebiet_altis WHERE aktiv = '%1'",1]; 
_containers = [_containers,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_GANGGEBIETE = _containers; 
publicVariable "NOCRIS_GANGGEBIETE"; 
}; 
}; 
 
