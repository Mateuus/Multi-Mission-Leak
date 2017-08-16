
if(life_SchrankeOn) exitWith {hint "Die Schranke wird jeden Augenblick geöffnet, bitte einen Moment Geduld!"}; 

_schranke = _this select 3;
life_SchrankeOn = true;

switch (_schranke) do {

	case "offenpyrgos":{
	
		if(life_beatgeld < 30000 && playerside == civilian) exitWith {hint "Du kannst dir die Maut in Höhe von 30.000€ nicht leisten."}; 
		if(playerside == civilian) then {life_beatgeld = life_beatgeld - 30000;};
		hint "Ihr Ticket wird gedruckt, bitte warten..."; 
		[true,"ticket",1] call life_fnc_handleinv;
		WaitUntil{sleep 0.1; life_inv_ticket >= 1};
		schranke_pyrgos_2 setVariable["gate",FALSE,TRUE];
		schranke_pyrgos_2 say3D "ticket";
		sleep 3;
		schranke_pyrgos_2 animate ["Door_1_rot",1];
		hint "Gute Fahrt!";
		waitUntil {sleep 0.1; vehicle player distance schranke_pyrgos_2 > 16};
		schranke_pyrgos_2 setVariable["gate",TRUE,TRUE];
	};

	case "offeninsel":{
	
		if(life_beatgeld < 15000 && playerside == civilian) exitWith {hint "Du kannst dir die Maut in Höhe von 15.000€ nicht leisten."}; 
		if(playerside == civilian) then {life_beatgeld = life_beatgeld - 15000;};
		hint "Ihr Ticket wird gedruckt, bitte warten..."; 
		[true,"ticket",1] call life_fnc_handleinv;
		WaitUntil{sleep 0.1; life_inv_ticket >= 1};
		schranke_insel_2 setVariable["gate",FALSE,TRUE];
		schranke_insel_2 say3D "ticket";
		sleep 3;
		schranke_insel_2 animate ["Door_1_rot",1];
		hint "Gute Fahrt!";
		waitUntil {sleep 0.1; vehicle player distance schranke_insel_2 > 16};
		schranke_insel_2 setVariable["gate",TRUE,TRUE];
	};
		
	case "offenkavala":{

		if(life_beatgeld < 30000 && playerside == civilian) exitWith {hint "Du kannst dir die Maut in Höhe von 30.000€ nicht leisten."}; 
		if(playerside == civilian) then {life_beatgeld = life_beatgeld - 30000;}; 
		hint "Ihr Ticket wird gedruckt, bitte warten..."; 
		[true,"ticket",1] call life_fnc_handleinv;
		WaitUntil{sleep 0.1; life_inv_ticket >= 1};
		schranke_kavala_2 setVariable["gate",FALSE,TRUE];
		schranke_kavala_2 say3D "ticket";
		sleep 3;
		schranke_kavala_2 animate ["Door_1_rot",1];
		hint "Gute Fahrt!";
		waitUntil {sleep 0.1; vehicle player distance schranke_kavala_2 > 16};
		schranke_kavala_2 setVariable["gate",TRUE,TRUE];
	};
		
	case "offenvikos":{

		if(life_beatgeld < 30000 && playerside == civilian) exitWith {hint "Du kannst dir die Maut in Höhe von 30.000€ nicht leisten."}; 
		if(playerside == civilian) then {life_beatgeld = life_beatgeld - 30000;}; 
		hint "Ihr Ticket wird gedruckt, bitte warten..."; 
		[true,"ticket",1] call life_fnc_handleinv;
		WaitUntil{sleep 0.1; life_inv_ticket >= 1};
		schranke_vikos_2 setVariable["gate",FALSE,TRUE];
		schranke_vikos_2 say3D "ticket";
		sleep 3;
		schranke_vikos_2 animate ["Door_1_rot",1];
		hint "Gute Fahrt!";
		waitUntil {sleep 0.1; vehicle player distance schranke_vikos_2 > 16};
		schranke_vikos_2 setVariable["gate",TRUE,TRUE];
	};
	
	case "offenparkplatzkavala":{

		if(life_beatgeld < 250) exitWith {hint "Du kannst dir das Parkticket in Höhe von 250€ nicht leisten."}; 
		life_beatgeld = life_beatgeld - 250; 
		hint "Ihr Ticket wird gedruckt, bitte warten..."; 
		[true,"parkschein",1] call life_fnc_handleinv;
		WaitUntil{sleep 0.1; life_inv_parkschein >= 1};
		parkplatz_kavala_2 setVariable["gate",FALSE,TRUE];
		parkplatz_kavala_2 say3D "ticket";
		sleep 3;
		parkplatz_kavala_2 animate ["Door_1_rot",1];
		hint "Gute Fahrt!";
		waitUntil {sleep 0.1; vehicle player distance parkplatz_kavala_2 > 16};
		parkplatz_kavala_2 setVariable["gate",TRUE,TRUE];
	};
	
	case "offenADAC":{

		if(life_beatgeld < 10000 && playerside != independent) exitWith {hint "Du kannst dir die Abschleppgebühr in Höhe von 10.000€ nicht leisten."};
		if(playerside != independent) then {
			life_beatgeld = life_beatgeld - 10000;
			[10000,name player,0,true] remoteExecCall ["life_fnc_moneytransfer",independent];
		};
		
		hint "Die Schranke wird geöffnet, bitte warten...";
		adac_schranke_1 setVariable["gate",FALSE,TRUE];
		adac_schranke_1 say3D "ticket";
		sleep 3;
		adac_schranke_1 animate ["Door_1_rot",1];
		waitUntil {sleep 0.1; vehicle player distance adac_schranke_1 > 16};
		adac_schranke_1 setVariable["gate",TRUE,TRUE];
	};

	case "offenADAC2":{

		if(life_beatgeld < 10000 && playerside != independent) exitWith {hint "Du kannst dir die Abschleppgebühr in Höhe von 10.000€ nicht leisten."};
		if(playerside != independent) then {
			life_beatgeld = life_beatgeld - 10000;
			[10000,name player,0,true] remoteExecCall ["life_fnc_moneytransfer",independent];
		};
		
		hint "Die Schranke wird geöffnet, bitte warten...";
		adac_schranke_2 setVariable["gate",FALSE,TRUE];
		adac_schranke_2 say3D "ticket";
		sleep 3;
		adac_schranke_2 animate ["Door_1_rot",1];
		waitUntil {sleep 0.1; vehicle player distance adac_schranke_2 > 16};
		adac_schranke_2 setVariable["gate",TRUE,TRUE];
	};
		
	case "geschlossenpyrgos":{
	
		hint "Ihr Ticket wird entwertet, bitte warten..."; 
		if!([false,"ticket",1] call life_fnc_handleinv) exitWith {hint "Du besitzt kein Mautticket!"}; 
		schranke_pyrgos_1 setVariable["gate",FALSE,TRUE];
		schranke_pyrgos_1 say3D "ticket"; 
		sleep 3; 
		schranke_pyrgos_1 animate ["Door_1_rot",1]; 
		hint "Gute Fahrt!"; 
		waitUntil {sleep 0.1; vehicle player distance schranke_pyrgos_1 > 16}; 
		schranke_pyrgos_1 setVariable["gate",TRUE,TRUE] 
	};
	
	case "geschlosseninsel":{
	
		hint "Ihr Ticket wird entwertet, bitte warten..."; 
		if!([false,"ticket",1] call life_fnc_handleinv) exitWith {hint "Du besitzt kein Mautticket!"}; 
		schranke_insel_1 setVariable["gate",FALSE,TRUE];
		schranke_insel_1 say3D "ticket";
		sleep 3; 
		schranke_insel_1 animate ["Door_1_rot",1]; 
		hint "Gute Fahrt!"; 
		waitUntil {sleep 0.1; vehicle player distance schranke_insel_1 > 16}; 
		schranke_insel_1 setVariable["gate",TRUE,TRUE] 
	};
	
	case "geschlossenkavala":{
	
		hint "Ihr Ticket wird entwertet, bitte warten..."; 
		if!([false,"ticket",1] call life_fnc_handleinv) exitWith {hint "Du besitzt kein Mautticket!"}; 
		schranke_kavala_1 setVariable["gate",FALSE,TRUE];
		schranke_kavala_1 say3D "ticket"; 
		sleep 3; 
		schranke_kavala_1 animate ["Door_1_rot",1]; 
		hint "Gute Fahrt!"; 
		waitUntil {sleep 0.1; vehicle player distance schranke_kavala_1 > 16}; 
		schranke_kavala_1 setVariable["gate",TRUE,TRUE] 
	};
	
	case "geschlossenvikos":{
	
		hint "Ihr Ticket wird entwertet, bitte warten..."; 
		if!([false,"ticket",1] call life_fnc_handleinv) exitWith {hint "Du besitzt kein Mautticket!"}; 
		schranke_vikos_1 setVariable["gate",FALSE,TRUE];
		schranke_vikos_1 say3D "ticket"; 
		sleep 3; 
		schranke_vikos_1 animate ["Door_1_rot",1]; 
		hint "Gute Fahrt!"; 
		waitUntil {sleep 0.1; vehicle player distance schranke_vikos_1 > 16}; 
		schranke_vikos_1 setVariable["gate",TRUE,TRUE] 
	};
	
	case "geschlossenparkplatzkavala":{
	
		hint "Ihr Ticket wird entwertet, bitte warten..."; 
		if!([false,"parkschein",1] call life_fnc_handleinv) exitWith {hint "Du besitzt keinen Parkschein!"}; 
		parkplatz_kavala_1 setVariable["gate",FALSE,TRUE];
		parkplatz_kavala_1 say3D "ticket"; 
		sleep 3;
		parkplatz_kavala_1 animate ["Door_1_rot",1]; 
		hint "Gute Fahrt!";
		waitUntil {sleep 0.1; vehicle player distance parkplatz_kavala_1 > 16}; 
		parkplatz_kavala_1 setVariable["gate",TRUE,TRUE] 
	};
};

if(_schranke in ["offenpyrgos","offeninsel","offenkavala","offenvikos"] && !erfolg_andreas) then {erfolg_andreas = true; ["erfolg_andreas"] spawn life_fnc_erfolgerhalten; playsound "Haltstopp"};

life_SchrankeOn = false;