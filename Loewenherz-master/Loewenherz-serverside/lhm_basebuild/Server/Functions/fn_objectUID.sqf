private["_position","_dir","_key"]; 
_dir = _this select 0; 
_key = ""; 
_position = _this select 1; 
{ 
 _x = _x * 10; 
 if ( _x < 0 ) then { _x = _x * -10 }; 
 _key = _key + str(round(_x)); 
} forEach _position; 
_key = _key + str(round(_dir)); 
_key; 
