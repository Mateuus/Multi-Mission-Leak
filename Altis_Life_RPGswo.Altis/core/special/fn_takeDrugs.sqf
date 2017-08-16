/*
	File: fn_takeDrugs.sqf
	Author: © 2016 Division Wolf e.V. (MarkusSR1984) / Some little parts are from Exile Team (ppEffect adjustment)

	Description: Gives Drugs a nice effect
*/
private["_item"];

if (isNil "DWEV_var_alcoholLevel") then {DWEV_var_alcoholLevel = 0;};
if (isNil "DWEV_var_drugLevel") then {DWEV_var_drugLevel = 0;};
if (isNil "DWEV_var_takeDrugsThread") then {DWEV_var_takeDrugsThread = false;};

_item = param [0,"",[""]];

if (_item == "") exitWith {};

switch (_item) do
{
	case "beer": 
	{ 
		DWEV_var_alcoholLevel = (DWEV_var_alcoholLevel + 0.15);
		switch (true) do
		{
			case (DWEV_var_alcoholLevel < 0.6): {systemChat "So ein Bier ist einfach was leckeres!";};
			case ((DWEV_var_alcoholLevel >= 0.6) && (DWEV_var_alcoholLevel < 1)): {systemChat "Ich hab so das Gefühl, als wenn die mir da ein Alcoholfreies Bier angedreht haben!";};
			case ((DWEV_var_alcoholLevel >= 1) && (DWEV_var_alcoholLevel < 1.3)): {systemChat "Langzam fangtttt ds zeug zuuuuu wiiirkkken an.";};
			case ((DWEV_var_alcoholLevel >= 1.3) && (DWEV_var_alcoholLevel < 2)): {systemChat "watt na nu los? isch kahn fast nischt mehr gucke";};
			case (DWEV_var_alcoholLevel >= 2): {systemChat "iiiiccchhh gub ich broch nen Saaaannnniiiii";};
		};
	};
	
	case "vodka":
	{ 
		DWEV_var_alcoholLevel = (DWEV_var_alcoholLevel + 0.25);
		switch (true) do
		{
			case (DWEV_var_alcoholLevel < 0.6): {systemChat "Wein ist sooooo gut! Ich will mehr davon!";};
			case ((DWEV_var_alcoholLevel >= 0.6) && (DWEV_var_alcoholLevel < 1)): {systemChat "Ich hab so das Gefühl, als wenn die mir da Traubensaft angedreht haben!";};
			case ((DWEV_var_alcoholLevel >= 1) && (DWEV_var_alcoholLevel < 1.3)): {systemChat "Langzam fangtttt ds zeug zuuuuu wiiirkkken an.";};
			case ((DWEV_var_alcoholLevel >= 1.3) && (DWEV_var_alcoholLevel < 2)): {systemChat "watt na nu los? isch kahn fast nischt mehr gucke";};
			case (DWEV_var_alcoholLevel >= 2): {systemChat "iiiiccchhh gub ich broch nen Saaaannnniiiii";};
		};
	};

	case "moonshine":
	{ 
		DWEV_var_alcoholLevel = (DWEV_var_alcoholLevel + 0.35);
		switch (true) do
		{
			case (DWEV_var_alcoholLevel < 0.6): {systemChat "Schwarzgebranntes ist einfach das beste";};
			case ((DWEV_var_alcoholLevel >= 0.6) && (DWEV_var_alcoholLevel < 1)): {systemChat "Ich hab so das Gefühl, als wenn die mir da einen billigen Fusel angedreht haben!";};
			case ((DWEV_var_alcoholLevel >= 1) && (DWEV_var_alcoholLevel < 1.3)): {systemChat "Langzam fangtttt ds zeug zuuuuu wiiirkkken an.";};
			case ((DWEV_var_alcoholLevel >= 1.3) && (DWEV_var_alcoholLevel < 2)): {systemChat "watt na nu los? isch kahn fast nischt mehr gucke";};
			case (DWEV_var_alcoholLevel >= 2): {systemChat "iiiiccchhh gub ich broch nen Saaaannnniiiii";};
		};
	};

	default 
	{ 
		DWEV_var_drugLevel = (DWEV_var_drugLevel + 0.3);
		switch (true) do
		{
			case ((DWEV_var_drugLevel >= 0.3) && (DWEV_var_drugLevel < 0.6)): {systemChat "Einmal ist keinmal, ich merk ja noch nicht mal wirklich was";};
			case ((DWEV_var_drugLevel >= 0.6) && (DWEV_var_drugLevel < 1)): {systemChat "Joa, mein Freund. wieso laufen da weiße Mäuse rum ?";};
			case ((DWEV_var_drugLevel >= 1) && (DWEV_var_drugLevel < 1.3)): {systemChat "Langzam fangtttt ds zeug zuuuuu wiiirkkken an.";};
			case ((DWEV_var_drugLevel >= 1.3) && (DWEV_var_drugLevel < 2)): {systemChat "watt na nu los? isch kahn fast nischt mehr gucke";};
			case (DWEV_var_drugLevel >= 2): {systemChat "iiiiccchhh gub ich broch nen Saaaannnniiiii";};
		};
		
		
	};
};

if (!DWEV_var_takeDrugsThread) then
{
	DWEV_var_takeDrugsThread = true;
	[] spawn
	{
		_sleepTime = 10;
		_reducePerMinute = 0.10;
		_reducePerMinuteDrugs = 0.08;
		while {(DWEV_var_alcoholLevel + DWEV_var_drugLevel) > 0} do
		{
			_level = (DWEV_var_alcoholLevel + DWEV_var_drugLevel);
			DWEV_var_DeliriumEffect ppEffectAdjust 
			[
				linearConversion [0, 3, (_level * 2), 2, 		5, 		true],	
				linearConversion [0, 3, (_level * 2), 0.1, 	0.2, 	true],	
				linearConversion [0, 3, (_level * 2), 0.1, 	0.2, 	true],	
				linearConversion [0, 3, (_level * 2), 0.2, 	1.5, 	true],	
				linearConversion [0, 3, (_level * 2), 0.2, 	2, 		true],	
				linearConversion [0, 3, (_level * 2), 2, 		4, 		true],	
				linearConversion [0, 3, (_level * 2), 2, 		3, 		true],	
				linearConversion [0, 3, (_level * 2), 0.01, 	0.02, 	true],	
				linearConversion [0, 3, (_level * 2), 0.01, 	0.02, 	true],	
				linearConversion [0, 3, (_level * 2), 0.01, 	0.01, 	true],	
				linearConversion [0, 3, (_level * 2), 0.01, 	0.02, 	true],	
				linearConversion [0, 3, (_level * 2), 0.01, 	0.05, 	true],	
				linearConversion [0, 3, (_level * 2), 0.1,	0.25, 	true],	
				linearConversion [0, 3, (_level * 2), 2, 		10, 	true],
				linearConversion [0, 3, (_level * 2), 2, 		5, 		true]
			];
			DWEV_var_DeliriumEffect ppEffectEnable true;
			DWEV_var_DeliriumEffect ppEffectCommit 0; 
			
			if (DWEV_var_alcoholLevel > 0) then
			{
			    DWEV_var_radialBlurEffect ppEffectAdjust  [((random (DWEV_var_alcoholLevel * 0.01)) min 0.02),((random (DWEV_var_alcoholLevel * 0.01)) min 0.02),0.15,0.15];
				DWEV_var_radialBlurEffect ppEffectCommit 5;
				DWEV_var_radialBlurEffect ppEffectEnable true;
			};
			
			if (DWEV_var_drugLevel > 0) then
			{
			    DWEV_var_chromAberrationEffect ppEffectAdjust  [((random (DWEV_var_drugLevel * 0.1)) min 0.25),((random (DWEV_var_drugLevel * 0.1)) min 0.25),true];
				DWEV_var_chromAberrationEffect ppEffectCommit 5;
				DWEV_var_chromAberrationEffect ppEffectEnable true;
			};
			
			addCamShake	[linearConversion [0, 3, _level, 0, 30, true], 15.9, linearConversion [0, 3, _level, 0.1, 0.3, true]];
						
			if (_level > 1) then
			{
				_moveChance = (random 100); 
				if (_moveChance <= (20 * _level)) then
				{
					_possibleMoves = ["PlayerWalkB", "PlayerWalkF", "PlayerWalkL", "PlayerWalkLB", "PlayerWalkLF", "PlayerWalkR", "PlayerWalkRB", "PlayerWalkRF"];
					_moveIndex = floor (random (count _possibleMoves));
					player playActionNow (_possibleMoves select _moveIndex);
				};
			};
			
			sleep _sleepTime;
			
			if (_level >= 3.5) then {player setDamage ((damage player) + (_level * 0.01 * _sleepTime * 0.1));};
			
			DWEV_var_alcoholLevel = ((DWEV_var_alcoholLevel - (_reducePerMinute / 60 * _sleepTime * _level)) max 0);
			DWEV_var_drugLevel = ((DWEV_var_drugLevel - (_reducePerMinuteDrugs / 60 * _sleepTime * _level)) max 0);
			
		};
		
		DWEV_var_DeliriumEffect ppEffectEnable false; 	// Effekt ausschalten
		DWEV_var_radialBlurEffect ppEffectEnable false;
		DWEV_var_chromAberrationEffect ppEffectEnable false;
		DWEV_var_alcoholLevel = nil; 					// Variable Löschen
		DWEV_var_drugLevel = nil;						// Variable Löschen
		DWEV_var_takeDrugsThread = false; 				// Zur Sicherheit auf false setzen
		DWEV_var_takeDrugsThread = nil;					// Variable löschen
		systemChat "Du bist nun wieder Nüchtern";
	};
};

