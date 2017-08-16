/*
    File: fn_callBackup.sqf
    Author: Skrow & Skyfezzer
    Description:
      Action pour que les policiers puissent demander des renforts.
*/
if(life_Se_Renfort + 120 > time) exitWith {hint "Pas si vite! Tu dois attendre 2 minutes avant de demander du renfort nouveau.";};

if(!life_callBackup) exitWith {hint "Tu ne peux pas faire ca maintenant !"};
_backupTime = 60;
[[player,_backupTime],"life_fnc_backupCall",west,false] call life_fnc_MP;
life_callBackup = false;
sleep _backupTime + 320;
life_callBackup = true;
hint format ["%1, Tu peux de nouveau appeler des renforts !",name player];

life_Se_Renfort = time;
