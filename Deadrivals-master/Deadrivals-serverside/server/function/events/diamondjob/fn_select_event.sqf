private["_class","_selectclass"]; 
 
_class = getArray(missionconfigfile >> "CfgEvents" >> "diamondjob" >> "diamondjob_class"); 
_random = floor random(count _class); 
_selectclass = _class select _random; 
 
NOCRIS_DIAMONDJOB_SELECT = _selectclass; 
publicVariable "NOCRIS_DIAMONDJOB_SELECT";