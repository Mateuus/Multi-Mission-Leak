#include "..\..\script_macros.hpp"
/*
	File: fn_adminPurge.sqf
	Author: Skrow #ProjetLife
*/
_time = 60;
hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>La purge démare dans une heure!</t>"];
for "_i" from 0 to 59 do
{
    if(_time < 5) then {
      hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>%1 minutes avant la purge!</t>",_time];
    } else {
      if(_time == 50) then {hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>%1 minutes avant la purge!</t>",_time];};
      if(_time == 40) then {hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>%1 minutes avant la purge!</t>",_time];};
      if(_time == 30) then {hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>%1 minutes avant la purge!</t>",_time];};
      if(_time == 20) then {hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>%1 minutes avant la purge!</t>",_time];};
      if(_time == 10) then {hint parseText format ["<t size='1.2'><t color='#FF0000'>Attention!</t></t><br/><br/><t size='1'>%1 minutes avant la purge!</t>",_time];};
    };
    _time = _time - 1;
    sleep 60;
};
hint "";
[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};
[player] remoteExec ["life_fnc_adminPurge2",-2];
