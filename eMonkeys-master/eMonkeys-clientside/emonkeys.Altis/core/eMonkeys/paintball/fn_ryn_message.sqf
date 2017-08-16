private["_titel","_message"];

_titel = [_this,0,"",[""]] call BIS_fnc_param;
_message = [_this,1,"",[""]] call BIS_fnc_param;

if(player distance (getMarkerPos "markt_1") > 250) exitwith {};

_hint = parseText format ["<t color='#ffff00'>%1</t><br/><br/><t color='#FFFFFF'>%2</t>", _titel,_message];

hint _hint; 