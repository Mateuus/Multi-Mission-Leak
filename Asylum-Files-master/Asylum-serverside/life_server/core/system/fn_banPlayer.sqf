 
 
 
 
 
 
 
 
private ["_name","_return"]; 
 
_name = [_this,0,"",[""]] call BIS_fnc_param; 
if (_name == "") exitWith {}; 
 
_return = "Arma2Net.Unmanaged" callExtension format["ExecProcess C:\Users\admin\Desktop\AntiCheat\ban.exe %1", _name];