//"debug_console" callExtension (typeOf _this + "#1110");  
_box = boundingBoxReal _this;  
{  
 _sel = []; _nsel = [];  
 for "_i" from (_box select 0 select 2) to (_box select 1 select 2) step 0.1 do {  
  for "_j" from (_box select 0 select 0) to (_box select 1 select 0) step 0.1 do {  
   {  
    _s = _x select 0;  
    if ( _this selectionPosition _s distance [0,0,0] > 0 ) then {  
     _sel = (_sel - [_s]) + [_s];  
    } else {  
     _nsel = (_nsel - [_s]) + [_s];  
    };  
   } forEach call {_p1 = _this modeltoWorld [_j,_box select 0 select 1,_i]; _p2 = _this modelToWorld [_j,_box select 1 select 1,_i]; drawLine3D [_p1, _p2, [1,0,0,1]]; [_this, _x] intersect [_p1, _p2]};  
  };  
 };  
 //"debug_console" callExtension (_x + ": " + str _sel + "#0100");  
 //"debug_console" callExtension (_x + ": " + str _nsel + "#1000");  
 //diag_log format["%1 : %2",_x,_sel]; 
 //diag_log format["%1 : %2",_x,_nsel]; 
} forEach ["VIEW","GEOM","FIRE"];  
//"debug_console" callExtension "A";