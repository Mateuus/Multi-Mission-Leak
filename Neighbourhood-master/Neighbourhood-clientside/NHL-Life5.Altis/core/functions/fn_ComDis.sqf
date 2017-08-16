//::::::::::::  ::::::::::::\\
//	Filename: core/functions/fn_ComDis.sqf
//	Author: Distrikt41 - Dscha
//
//	Beschreibung: Ersetzt Funktionalität von #1 Circumflex (Command Menu) zum Alternativen Menü und Entfernt #2 NumPad Entf (Commander View)
//
//
//   HALLO PHIL UND LARGO. WIE IHR SEHEN KÖNNT IST DAS HIER VON DISTRIKT 41 UND NICHT VON SYNCED41!
//::::::::::::  ::::::::::::\\

//#1
[]spawn
{
	if (local player) then
	{
		waitUntil {not(isNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler
		[
			"KeyDown","if
				(
					((_this select 1) in actionKeys 'ForceCommandingMode')
				)
				then
				{
					true;
					
					[] call life_fnc_p_openMenu;
					[] call life_fnc_hudUpdate;
				};
		"];
	};
};

[]spawn
{
	if (local player) then
	{
		waitUntil {not(isNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler
		[
			"KeyDown","if
				(
					((_this select 1) in actionKeys 'SwitchCommand')
				)
				then
				{
					true;
					
					systemchat 'Hier wird nicht gefingert';
				};
		"];
	};
};
					//herauskopierter Block von then{}
					//if(player getVariable 'restrained') exitWith {hint 'Du hast Deine Hände nicht frei!'};
					//if(player getVariable 'D41_geknueppelt') exitWith {hint 'Du hast Deine Hände nicht frei!'};
					//if(player getVariable 'surrender') exitWith {hint 'Du hast Deine Hände nicht frei!'};

//#2
[]spawn
{
	if (local player) then
	{
		waitUntil {not(isNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler
		[
			"KeyDown","_Allowed = false; if((_this select 1) in actionKeys 'TacticalView')then
				{
					_Allowed = true;
					systemchat 'Netter Versuch, leider bist du kläglich gescheitert';
				};
				_Allowed;"
		];
	};
};