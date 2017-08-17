#include "..\..\script_macros.hpp"
disableSerialization; 

//Define idc's for controls for easy access 
_comboAmmo = 2100;
_comboPlane = 2101; 

//store display, passed from onLoad 
_display = _this select 0; 

//Add to our lb and combo lists 
{ 
    _index = lbAdd [_comboAmmo, _x]; 
} forEach ["Guns Only","Rockets Only"]; 
{ 
    _index = lbAdd [_comboPlane, _x]; 
} forEach ["NATO WIPEOUT","CSAT NEOPHRON","AAF BUZZARD"]; 

//set an event to fire when a selection is made in combo
(_display displayCtrl _comboAmmo)  ctrlAddEventHandler ["LBSelChanged","_this execVM 'Custom\CAS\switchout.sqf'"];  
(_display displayCtrl _comboPlane)  ctrlAddEventHandler ["LBSelChanged","_this execVM 'Custom\CAS\switchout.sqf'"];