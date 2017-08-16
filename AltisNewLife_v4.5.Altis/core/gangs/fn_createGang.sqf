#include <macro.h>
private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;
_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if(_length > 32) exitWith {hint "Vous ne pouvez pas avoir un nom de gang de plus de 32 caractères."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} foreach _chrByte;
if(_badChar) exitWith {hint "Vous avez des caractères non valides dans le nom de votre gang. Il ne peut se composer que de chiffres et de lettres avec un underscore";};
if(compte_banque < 50000) exitWith {hint format["Vous n'avez pas assez d'argent sur votre compte.\n\nIl vous manque : %1€",[(50000-compte_banque)] call life_fnc_numberText];};
[[player,steamid,_gangName],"TON_fnc_insertGang",false,false] spawn life_fnc_MP;
hint "Envoi d'informations en cours, merci de patienter...";
closeDialog 0;
life_action_gangInUse = true;
closeDialog 0; 