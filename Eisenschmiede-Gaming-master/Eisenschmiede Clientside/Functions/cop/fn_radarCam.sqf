/* 
	File:fn_radarCam.sqf
*/
waitUntil {(!isNil "ES_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];
_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver
if (_speed > _limit) then {
	if (side _driver == civilian) then {
			if(isNil "ES_speedTicket") then {ES_speedTicket = 0;};
			if(isNil "ES_speedCaught") then {ES_speedCaught = 0;};
			diag_log format["Dr:%1 :: Sp:%2 :: Lmt:%3 ::Fine: %4",name _driver,round _speed,_limit,[_ticket] call ES_fnc_numberText];
			player say3d "camera_shot";//photosound and ppEffects from prellers radar script
			sleep 0.05;
			"colorCorrections" ppEffectEnable true;   
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
			"colorCorrections" ppEffectCommit 0;  
			sleep 0;   
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
			"colorCorrections" ppEffectCommit 0.05;   
			sleep 0.05;   
			"colorCorrections" ppEffectEnable false;
			sleep 0.1;
			"colorCorrections" ppEffectEnable true;   
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
			"colorCorrections" ppEffectCommit 0;  
			sleep 0;   
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
			"colorCorrections" ppEffectCommit 0.05;   
			sleep 0.05;   
			"colorCorrections" ppEffectEnable false;
		if(license_civ_driver OR license_civ_trucking ) then {
			
			ES_speedTicket = ES_speedTicket + 1;
			if(ES_speedTicket <= 3) then {systemChat format["Das ist Ticket-Nummer %1 für Sie, weiter so , und Sie werden mehr als nur Geld verlieren",ES_speedTicket];};
			if(ES_speedTicket == 4) then {systemChat format["Dies ist Ticketnummer %1 für Sie, noch einmal und sie verlieren Ihrer Lizenz",ES_speedTicket];};
			if(ES_speedTicket > 4 && ES_speedTicket < 8) exitWith {
					
					systemChat format["This is ticket number %1 for you",ES_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Strafzettel<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Sie sind ein  Raser ihre Fahrzeug Lizenz wurde entzogen, Sie werden jetzt Polizeilich gesucht",round _speed,_limit,name _driver];
					[[4],"ES_fnc_removeLicenses",_driver,FALSE] spawn ES_fnc_MP;
					[[getPlayerUID _driver,name _driver,"120H"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
					[] call SOCK_fnc_updateRequest;
			};
			if(ES_speedTicket > 8) exitWith {
					
					vehicle _driver setFuel 0.1;
					systemChat format["THIS IS YOUR %1th TICKET --- STAHP!!!",ES_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120FS"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
					[[4],"ES_fnc_removeLicenses",_driver,FALSE] spawn ES_fnc_MP;
					[] call SOCK_fnc_updateRequest;
			};
			if(ES_cash <= _ticket) then
			{
				if(ES_atmbank <= _ticket) exitWith 
				{
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Da Sie pleite sind und nicht bezahlen können , wurde ein Haftbefehl auf sie aus gestellt",round _speed,_limit,name _driver,[_ticket] call ES_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"120S"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
				};
				ES_atmbank = ES_atmbank - _ticket;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call ES_fnc_numberText];
				[] call SOCK_fnc_updateRequest;
			} else {
						
				ES_cash = ES_cash - _ticket;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call ES_fnc_numberText];	
				[] call SOCK_fnc_updateRequest;
			};
		} else {
			
					ES_speedCaught = ES_speedCaught + 1;
					if(ES_speedCaught <= 5) then { systemChat format["Sie wurden ohne Führerschein erwischt zum % 1 mal fahren ohne Führerschein Lizenz",ES_speedCaught];};
					if(ES_speedCaught == 6) then { systemChat format["Sie wurden ohne Führerschein erwischt zum % 1 mal fahren ohne Führerschein Lizenz",ES_speedCaught];};
					
					if(ES_speedCaught > 6) exitWith {
					
							vehicle _driver setFuel 0.1;
							systemChat format["THIS IS YOUR %1th TICKET --- STAHP!!!",ES_speedCaught];
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
							[[getPlayerUID _driver,name _driver,"120FSWL"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
							
					};
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>You are now wanted for driving without a license and are subject for arrest",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120WL"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
					if(ES_cash <= _ticketWL) then
					{
						if(ES_atmbank <= _ticketWL) exitWith 
						{
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _driver,[_ticketWL] call ES_fnc_numberText];
							[[getPlayerUID _driver,name _driver,"120S"],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;
						};
						ES_atmbank = ES_atmbank - _ticketWL;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call ES_fnc_numberText];
						[1] call SOCK_fnc_updatePartial;
					} else {
						
						ES_cash = ES_cash - _ticketWL;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call ES_fnc_numberText];	
						[0] call SOCK_fnc_updatePartial;
					};
		};
	};
};
sleep 5;