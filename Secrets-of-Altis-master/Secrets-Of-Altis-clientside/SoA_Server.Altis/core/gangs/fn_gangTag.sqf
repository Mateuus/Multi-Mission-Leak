#include <macro.h>
private["_tag","_newtag","_price"];
_tag = grpPlayer getVariable ["gang_tag","NEU"];
_price = 250000;
if(_tag == "NEU") then {_price = 0} else {_price = 250000};

_newtag = ctrlText (getControl(2620,2634));
_length = count (toArray(_newtag));
_chrByte = toArray (_newtag);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
if(_length > 4) exitWith {hint "Du kannst nicht mehr als 4 Zeichen verwenden!"};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true}} foreach _chrByte;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar"};
if(_newtag == "NEU") exitWith {hint "Dieser Tag ist standardmäßig nicht verfügbar, da müsst ihr euch schon etwas eigenes einfallen lassen."};
if(_newtag == "") exitWith {hint "Du hast keinen Tag eingegeben!"};

_action = [
	format["Du bist dabei den Gang-Tag zu [%1] umzuändern. Dies kostet dich %2€ von deinem Bankkonto!",_newtag,[_price] call life_fnc_numberText],
	"Gang-Tag übernehmen",
	"Ändern",
	"Abbrechen"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_beatbankgeld < _price) exitWith {
		hint parseText format[
			"Du hast nicht genügend Geld auf deinem Bankkonto"+ "<br/><br/>" +(localize "STR_GNOTF_Current")+ " <t color='#8cff9b'>%1€</t><br/>" +(localize "STR_GNOTF_Lacking")+ " <t color='#FF0000'>%2€</t>",
			[life_beatbankgeld] call life_fnc_numberText,
			[_price - life_beatbankgeld] call life_fnc_numberText
		];
	};
	life_beatbankgeld = life_beatbankgeld - _price;
	
	grpPlayer setVariable["gang_tag",_newtag,true];
	hint format["Dein Gang-Tag wurde zu [%1] geändert! Bitte erinnere deine Mitglieder daran, ihren Gang-Tag mit eckigen Klammern vor den Profilnamen zu setzen!",_newtag];
	[5,grpPlayer] remoteExecCall ["SOA_fnc_updateGang",2];
} else {
	hint "Änderung des Gang-Tags abgebrochen.";
};