#include <macro.h> 
/*
	File: fn_welcome.sqf
	Author: TheTotenkopf (SealDrop.de)
	
	Description:
	Erstellt ein schönen Regel Screen
*/

//Start erst nach Spawn
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

private ["_text","_intro"];

_intro = [];
_text = [];

switch (playerSide) do
{
	case west: 
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>WIR LIEBEN ROLEPLAY! Und deswegen bitten wir auch Dich nicht zu trollen und gutes RP zu machen.</t>"],
			format ["<t align='left'>Bitte lies dir die Regeln genau durch unter tanoarpg.de</t>"],
			format ["<t align='left'>Wie funktionniert die Steuerung der Polizei Tools? Frage deinen Ausbilder!</t>"],
			format ["<t align='left'><t color='#ff1111'>Desyncs: Du hast Gear verloren? Du wurdest Opfer von RDM? Du wurdest getrollt? Dann komm in den Support Channel im TS3!</t>"],
			format ["<t align='left'>Du möchtest einen EIGENEN Teamspeakchannel? Dann melde dich bei den Admins oder Mods!</t>"],
			format ["<t align='left'><t color='#FF8000'>Und jetzt viel Spaß beim Kontrollieren und Aufpassen :) Dein Tanoa RPG Team!</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : ts.tanoarpg.de</t>"],
			format ["<t align='left' color='#428BCA'>Forum : tanoarpg.de</t>"]
		];
	};
	case independent:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>WIR LIEBEN ROLEPLAY! Und deswegen bitten wir auch Dich nicht zu trollen und gutes RP zu machen.</t>"],
			format ["<t align='left'>Bitte lies dir die Regeln genau durch unter tanoarpg.de</t>"],
			format ["<t align='left'>Wie funktionniert die Steuerung der Medic Tools? Frage deinen Ausbilder!</t>"],
			format ["<t align='left'><t color='#ff1111'>Desyncs: Du hast Gear verloren? Du wurdest Opfer von RDM? Du wurdest getrollt? Dann komm in den Support Channel im TS3!</t>"],
			format ["<t align='left'>Du möchtest einen EIGENEN Teamspeakchannel? Dann melde dich bei den Admins oder Mods!</t>"],
			format ["<t align='left'><t color='#FF8000'>Und jetzt viel spaß beim Reviven, Heilen oder Reparieren :) Dein Tanoa RPG Team!</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : ts.tanoarpg.de</t>"],
			format ["<t align='left' color='#428BCA'>Forum : tanoarpg.de</t>"]
		];	
	};
	case civilian:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>WIR LIEBEN ROLEPLAY! Und deswegen bitten wir auch Dich nicht zu trollen und gutes RP zu machen.</t>"],
			format ["<t align='left'>Bitte lies dir die Regeln genau durch unter tanoarpg.de</t>"],
			format ["<t align='left'>Solltest du dich nun fragen welcher Rohstoff dir am schnellsten und meisten Geld bringt, drücke <t color='#FF8000'>Z</t> und klicke auf Börse. Die Börse hat immer die aktuellsten Informationen zu den Rohstoffpreisen für dich.</t>"],
			format ["<t align='left'><t color='#ff1111'>Desyncs: Du hast Gear verloren? Du wurdest Opfer von RDM? Du wurdest getrollt? Dann komm in den Support Channel im TS3!</t>"],
			format ["<t align='left'>Du möchtest einen EIGENEN Teamspeakchannel? Dann melde dich bei den Admins oder Mods!</t>"],
			format ["<t align='left'><t color='#FF8000'>Und jetzt viel spaß beim Farmen, Überfallen oder sonstigem :) Dein Tanoa RPG Team!</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : ts.tanoarpg.de</t>"],
			format ["<t align='left' color='#428BCA'>Forum : tanoarpg.de</t>"]
		];
	};
};

{
	_intro set [count _intro, (parseText _x)];
} forEach _text;
        
format ["Hallo %1, Willkommen auf Tanoa RPG!", name player] hintC _intro;