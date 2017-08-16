/*
	File: fn_ueberfallNachricht.sqf
	Author:
	Stig && CooliMC
	
	Description:
	Das ist ein Überfall.
*/
private["_targets"];

if(format["|%1|",life_ueb_cooldown] == "|any|") then {life_ueb_cooldown = 0;};
if(getPos player distance2D getMarkerPos "civ_spawn_1" < 400 || getPos player distance2D getMarkerPos "reb_spawn_1" < 400) exitWith {hint "Du musst mindestens 400m von einer Safezone entfernt sein."};
if(life_ueb_cooldown >= time) exitWith {hint "Du musst 5 Minuten warten, nachdem du eine Ueberfallnachricht verwendet hast."};
if(life_battery == 0) exitWith {hint "Deine Batterie ist leer. Du brauchst eine Ersatzbatterie."};
_targets = 0;

{
	if(isPlayer _x && _x != vehicle player) then
	{
		
		[profileName] remoteExec ["tanoarpg_fnc_zeigeUeberfallNachricht",_x,false];
		_targets = _targets + 1;
		[player, _X, 3, "[UEBERFALL-NACHRICHT]", "Hat eine Ueberfallnachricht gesendet an"] remoteExec ["TEX_FNC_LOGIT", 2];
	};
} foreach ((getPos player) nearEntities 50);

hint parseText format ["Du hast eine Ueberfallnachricht versendet.<br/><br/><br/>Empfaenger:<br/><t size='2'>%1 Handy(s)</t><br/><br/><t color='A8A8A8'>Eine Bluetoothnachricht zieht deiner Handybatterie bis zu 50 Prozent Energie ab und wird im Falle eines Fahrzeugs nur von dem Fahrer und nicht von den Insassen empfangen.<br/><br/>Bitte achte stets auf dein Roleplay.</t>",_targets];
titleText [format ["Bluetoothnachricht an %1 Handys gesendet.",_targets], "PLAIN"];
systemChat format ["Bluetoothnachricht an %1 Handys gesendet.",_targets];

if(_targets == 0) then
{
	hint "Keine Handys in Reichweite! Der Cooldown wurde zurueckgesetzt.";
	systemChat "Keine Handys in Reichweite! Der Cooldown wurde zurueckgesetzt.";
}
else
{
	life_ueb_cooldown = time + 300;
	life_battery = life_battery - 50;
	if(life_battery < 0) then {life_battery = 0;};
};

[] call tanoarpg_fnc_hudUpdate;