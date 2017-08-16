private["_random","_unit","_marker"];  
_marker = ["schatz_1","schatz_2","schatz_3","schatz_4","schatz_5"]; 
_random = _marker select random count _marker; 
boat1 setposATL (getmarkerpos _random);