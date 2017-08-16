private ["_radius", "_dir", "_angle", "_pos", "_px", "_py"]; 
 
_radius = _this select 0; 
_pos = _this select 1; 
_dir = _this select 2; 
_angle = _this select 3; 
 
_px = (_pos select 0) + _radius * (cos (_angle + _dir - 90)); 
_py = (_pos select 1) + _radius * (sin (_angle + _dir - 90) * -1); 
 
[_px, _py, (_pos select 2)];