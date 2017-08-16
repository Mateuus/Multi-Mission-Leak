private["_unit","_bool","_side"]; 
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; 
_bool = [_this,1,false,[false]] call BIS_fnc_param; 
_side = [_this,2,civilian,[west]] call BIS_fnc_param; 
 
if(isNull _unit) exitWith {}; 
 
switch (_side) do { 
case west: { 
if(_bool) then { 
NOCRIS_radio_west radioChannelAdd [_unit]; 
} else { 
NOCRIS_radio_west radioChannelRemove [_unit]; 
}; 
}; 
 
case east: { 
if(_bool) then { 
NOCRIS_radio_east radioChannelAdd [_unit]; 
} else { 
NOCRIS_radio_east radioChannelRemove [_unit]; 
}; 
}; 
 
case civilian: { 
if(_bool) then { 
NOCRIS_radio_civ radioChannelAdd [_unit]; 
} else { 
NOCRIS_radio_civ radioChannelRemove [_unit]; 
}; 
}; 
 
case independent: { 
if(_bool) then { 
NOCRIS_radio_civ radioChannelAdd [_unit]; 
} else { 
NOCRIS_radio_civ radioChannelRemove [_unit]; 
}; 
}; 
};