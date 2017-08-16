/*
	File: fn_trapped.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	speedtrap is a speedtrap ans sometimes a speedtrap
   
*/
private["_trapped_infos","_trap_object","_speed","_limit","_diff"];

_trapped_infos = [_this,0,[],[[]]] call BIS_fnc_param;
_trap_object   = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _trap_object) exitwith {};

_speed = _trapped_infos select 2;
_limit = _trapped_infos select 3;
_diff = round (_speed - _limit);
titleText[format["Vous avez dépassé la limitation de vitesse de %1km/h...",_diff],"PLAIN"];
[[_trap_object,"Speedtrap"],"life_fnc_say3d",nil,true] spawn life_fnc_MP;
[[_trap_object],"life_fnc_trappedFlash",true,false] spawn life_fnc_MP;

"dynamicBlur" ppEffectEnable true;  
"dynamicBlur" ppEffectAdjust [20];  
"dynamicBlur" ppEffectCommit 0.05;
sleep 0.01;
"dynamicBlur" ppEffectAdjust [0];  
"dynamicBlur" ppEffectCommit 0.05;


