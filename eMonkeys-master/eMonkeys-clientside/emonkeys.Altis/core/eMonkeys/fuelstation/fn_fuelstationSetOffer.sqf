/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Fuelstation Auction Menu
*/
private["_gebot","_selection","_name","_fuelstationPos","_fuelstation","_playerID","_vordefinieren","_check"];
disableSerialization;

_display = findDisplay 9000;
_listbox = _display displayCtrl 9001;
_id = _listbox lbData (lbCurSel _listbox);
_selection = lbCurSel _listbox;
_gebot = ctrlText 9002;

if(!([_gebot] call fnc_isnumber)) exitWith {hint "Falsches Nummernformat. Nur Werte ohne Komma verwenden!"};
if(_gebot == "") exitWith {hint "Du musst ein Gebot angeben."};
if(_selection == -1) exitWith {hint "Du hast keine Tankstelle ausgewählt!"};
if(parseNumber _gebot > EMonkeys_a164) exitWith {hint "Du hast nicht soviel Geld auf deinem Konto!"};

[[_id,_gebot,getplayerUID player],"TON_fnc_addFuelstationBid",false,false] spawn EMonkeys_fnc_MP;
hint format ["Du hast dein Gebot in Höhe von %1€ erfolgreich eingereicht. Viel Glück!",_gebot];

_text = format ["*** Neues Gebot | Spieler: %1 | Tankstellen ID: %2 | Gebot: %3 |",name player,_id,_gebot];
[[6,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;