/*
		fn_halloweenstory.sqf
		Author: G00golplexian
		
		Description: Plays stories.
*/

_story = _this select 3;

switch(_story) do {
	case 0:
		{
			if(playerside != civilian) exitWith {hint "Du befindest dich im Dienst."};
			if(quest_halloween) exitwith {hint "Du hast die Quest bereits gestartet!"};
		
			dimitri say3D "halloweenstory1";
			sleep 82;
			[[["Quest 1:","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
			["Dimitris Legende","<t align = 'center' shadow = '1' size = '0.7' color='#ff1000'>%1</t><br/>"],
			["Gehe den Informationen des Russen Dimitri nach und setze der Geheimnistuerei ein Ende!","<t align = 'center' shadow = '1' size = '0.5'>%1</t>"]]] spawn BIS_fnc_typeText;
			
			[true,"quest1",1] call life_fnc_handleinv;
		};

	case 1:
		{
			if(quest_halloween) exitwith {hint "Du hast die Quest bereits gestartet!"};
			if!([false,"quest1",1] call life_fnc_handleinv) exitWith {hint "Du benötigst erst den ersten Hinweis um diese Quest entschlüsseln zu können!"};
			
			hollander say3D "halloweenstory2";
			sleep 40;
			[[["Quest 2:","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
			["Der fliegende Holländer","<t align = 'center' shadow = '1' size = '0.7' color='#ff1000'>%1</t><br/>"],
			["Ein ertrunkenes Mädchen? Ich sollte den Hinweisen des fliegenden Holländers folgen!","<t align = 'center' shadow = '1' size = '0.5'>%1</t>"]]] spawn BIS_fnc_typeText;
			
			[true,"quest2",1] call life_fnc_handleinv;
		};
		
	case 2:
		{
			if(quest_halloween) exitwith {hint "Du hast die Quest bereits gestartet!"};
			if!([false,"quest2",1] call life_fnc_handleinv) exitWith {hint "Du benötigst erst den zweiten Hinweis um diese Quest entschlüsseln zu können!"};
	
			[] call life_fnc_markercfg;
			[[["Quest 3:","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
			["Das ertrunkene Mädchen","<t align = 'center' shadow = '1' size = '0.7' color='#ff1000'>%1</t><br/>"],
			["Auf dieser Karte ist ein Kreuz markiert! Ich sollte die Karte öffnen!","<t align = 'center' shadow = '1' size = '0.5'>%1</t>"]]] spawn BIS_fnc_typeText;
			
			[true,"quest3",1] call life_fnc_handleinv;
	};
};