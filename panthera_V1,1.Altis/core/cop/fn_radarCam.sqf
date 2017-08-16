/* 
	File:fn_radarCam.sqf
*/
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];
_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
//_ticket = 1500;//perm set amount ticket
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver
//diag_log format["Ticket Fine: %1 - Sp: %2 -- Limit: %3",_ticket,_speed,_limit];
if (_speed > _limit) then {
	if (side _driver == civilian) then {
			if(isNil "life_speedTicket") then {life_speedTicket = 0;};
			if(isNil "life_speedCaught") then {life_speedCaught = 0;};
			diag_log format["Dr:%1 :: Sp:%2 :: Lmt:%3 ::Fine: %4",name _driver,round _speed,_limit,[_ticket] call life_fnc_numberText];
			player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
			uiSleep 0.05;
			"colorCorrections" ppEffectEnable true;   
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
			"colorCorrections" ppEffectCommit 0;  
			uiSleep 0;   
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
			"colorCorrections" ppEffectCommit 0.05;   
			uiSleep 0.05;   
			"colorCorrections" ppEffectEnable false;
			uiSleep 0.1;
			"colorCorrections" ppEffectEnable true;   
			"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 1],[0.3, 0.3, 0.3, 0.05]];    
			"colorCorrections" ppEffectCommit 0;  
			uiSleep 0;   
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];    
			"colorCorrections" ppEffectCommit 0.05;   
			uiSleep 0.05;   
			"colorCorrections" ppEffectEnable false;
		if(license_civ_driver OR license_civ_truck ) then {
			
			life_speedTicket = life_speedTicket + 1;
			if(life_speedTicket <= 3) then {systemChat format["This is ticket number %1 for you, keep it up and you'll lose more than money",life_speedTicket];};
			if(life_speedTicket == 4) then {systemChat format["This is ticket number %1 for you, next one will take away your licenses",life_speedTicket];};
			if(life_speedTicket > 4 && life_speedTicket < 8) exitWith {
					
					systemChat format["This is ticket number %1 for you",life_speedTicket];
					hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Strafzettel<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/><t color='#ffffff'><t align='center'><t size='1'>You are a habitual speeder and will be stripped of your vehicle licenses and are now wanted",round _speed,_limit,name _driver];
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[[getPlayerUID _driver,name _driver,"120H"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_speedTicket > 8) exitWith {
					
					vehicle _driver setFuel 0.1;
					systemChat format["THIS IS YOUR %1th TICKET --- STAHP!!!",life_speedTicket];
					hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Fahrer: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120FS"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_atmcash <= _ticket) then
			{
				if(life_atmcash <= _ticket) exitWith 
				{
					hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				};
				life_atmcash = life_atmcash - _ticket;
				hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
				diag_log "Ticket paid from player bank";
				[1] call SOCK_fnc_updatePartial;
			} else {
						
				life_atmcash = life_atmcash - _ticket;
				hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];	
				diag_log "Ticket paid from player cash";
				[0] call SOCK_fnc_updatePartial;
			};
		} else {
			
					life_speedCaught = life_speedCaught + 1;
					if(life_speedCaught <= 5) then { systemChat format["You have been caught %1 times driving and speeding without a license",life_speedCaught];};
					if(life_speedCaught == 6) then { systemChat format["You have been caught %1 times driving and speeding without a license",life_speedCaught];};
					
					if(life_speedCaught > 6) exitWith {
					
							vehicle _driver setFuel 0.1;
							systemChat format["THIS IS YOUR %1th TICKET --- STAHP!!!",life_speedCaught];
							hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
							[[getPlayerUID _driver,name _driver,"120FSWL"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
							
					};
					hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>You are now wanted for driving without a license and are subject for arrest",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120WL"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					if(life_atmcash <= _ticketWL) then
					{
						if(life_atmcash <= _ticketWL) exitWith 
						{
							hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
							[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
						};
						life_atmcash = life_atmcash - _ticketWL;
						hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
						//diag_log "Ticket paid from player bank";//for logging
						[1] call SOCK_fnc_updatePartial;
					} else {
						
						life_atmcash = life_atmcash - _ticketWL;
						hintSilent parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];	
						//diag_log "Ticket paid from player cash";//for logging
						[0] call SOCK_fnc_updatePartial;
					};
		};
	};
};
//diag_log "Speed cam script done";//for logging
uiSleep 5;