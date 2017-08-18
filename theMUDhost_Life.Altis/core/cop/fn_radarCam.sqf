/* 
	File:fn_radarCam.sqf
	author: [midgetgrimm]
	Flash/Basic premise idea from preller, trigger function from shems and Yuka for the waitUntil <3
	Runs cams on map for speeders, if speed too many times diff shit happens
*/
waitUntil {(!isNil "life_fnc_moveIn") && !isNull (findDisplay 46)};
if((vehicle player isKindOf "Ship") OR (vehicle player isKindOf "Air")) exitWith {};//exit if not a freaking car
private ["_limit","_speed","_driver","_ticket","_ticketWL"];

_driver = _this select 0;
_speed = _this select 1;
_limit = _this select 2;
_ticket = (_speed - _limit) * 100;//variable ticket for licensed driver
_ticketWL = (_speed - _limit) * 200;//variable ticket for unlicensed driver

//Send messages to police when a player receives tickets from Cameras
_msg = format["Be advised. This person has just been caught by a speed camera and received a ticket of $%1 for doing %2 km/h in a %3 zone.",[_ticket] call life_fnc_numberText,round _speed,_limit];
_msg2 = format["Attention. This person has just been caught by a speed camera and received a ticket of $%1 for doing %2 km/h in a %3 zone and the camera reporting a failure to pay.",[_ticket] call life_fnc_numberText,round _speed,_limit];
_msg3 = format["This is an APB. This person has just been caught by a speed camera and received a ticket of $%1 for doing %2 km/h in a %3 zone and the registration scan says this driver has no license.",[_ticketWL] call life_fnc_numberText,round _speed,_limit];
_msg4 = "!!!ALERT!!! This person has been flagged for Felony Speeding. They are to be arrested on site. Please proceed with caution.";

if (_speed > _limit) then {
	if(side _driver == civilian && !(_driver getVariable["undercoverOfficer",false])) then 
	{
			if(isNil "life_speedTicket") then {life_speedTicket = 0;};
			if(isNil "life_speedCaught") then {life_speedCaught = 0;};
			diag_log format["Dr:%1 :: Sp:%2 :: Lmt:%3 ::Fine: %4",name _driver,round _speed,_limit,[_ticket] call life_fnc_numberText];
			player say3d "PhotoSound";//photosound and ppEffects from prellers radar script
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
		if(license_civ_driver OR license_civ_truck ) then {
			
			life_speedTicket = life_speedTicket + 1;
			if(life_speedTicket <= 3) then {systemChat format["This is ticket number %1 for you!",life_speedTicket];};
			if(life_speedTicket == 4) then {systemChat format["This is ticket number %1 for you, next one will take away your drivers license!",life_speedTicket];};
			if(life_speedTicket > 4 && life_speedTicket < 8) exitWith
			{
					[2,-1,_msg3] call life_fnc_newMsg;
					systemChat format["This is ticket number %1 for you!",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>You are a habitual speeder and will be stripped of your vehicle licenses and are now wanted!",round _speed,_limit,name _driver];
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[[getPlayerUID _driver,name _driver,"120H"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_speedTicket > 8) exitWith 
			{
					[2,-1,_msg4] call life_fnc_newMsg;
					vehicle _driver setFuel 0.1;
					systemChat format["THIS IS YOUR %1th TICKET!!!",life_speedTicket];
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site!",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120FS"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[[4],"life_fnc_removeLicenses",_driver,FALSE] spawn life_fnc_MP;
					[2] call SOCK_fnc_updatePartial;
			};
			if(life_cash <= _ticket) then
			{
				if(life_atmcash <= _ticket) exitWith 
				{
					[2,-1,_msg2] call life_fnc_newMsg;
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead!",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
					[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				};
				life_atmcash = life_atmcash - _ticket;
				[2,-1,_msg] call life_fnc_newMsg;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];
				[1] call SOCK_fnc_updatePartial;
			} else {
						
				life_cash = life_cash - _ticket;
				[2,-1,_msg] call life_fnc_newMsg;
				hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticket] call life_fnc_numberText];	
				[0] call SOCK_fnc_updatePartial;
			};
		} else {
			
					life_speedCaught = life_speedCaught + 1;
					if(life_speedCaught <= 5) then { systemChat format["You have been caught %1 times driving and speeding without a license!",life_speedCaught];};
					if(life_speedCaught == 6) then { systemChat format["You have been caught %1 times driving and speeding without a license!",life_speedCaught];};
					
					if(life_speedCaught > 6) exitWith {
							vehicle _driver setFuel 0.1;
							[2,-1,_msg4] call life_fnc_newMsg;
							systemChat format["THIS IS YOUR %1th TICKET!!!",life_speedCaught];
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/>You are now wanted for Felony Speeding and are arrest-on-site",round _speed,_limit,name _driver];
							[[getPlayerUID _driver,name _driver,"120FS"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
							
					};
					[2,-1,_msg3] call life_fnc_newMsg;
					hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>You are now wanted for driving without a license and are subject for arrest!",round _speed,_limit,name _driver];
					[[getPlayerUID _driver,name _driver,"120WL"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					if(life_cash <= _ticketWL) then
					{
						if(life_atmcash <= _ticketWL) exitWith 
						{
							[2,-1,_msg2] call life_fnc_newMsg;
							hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4<br/>Since you are broke and cannot pay, you now have a warrant out for you instead!",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
							[[getPlayerUID _driver,name _driver,"120S"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
						};
						life_atmcash = life_atmcash - _ticketWL;
						[2,-1,_msg] call life_fnc_newMsg;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];
						[1] call SOCK_fnc_updatePartial;
					} else {
						
						life_cash = life_cash - _ticketWL;
						[2,-1,_msg] call life_fnc_newMsg;
						hint parseText format ["<t color='#ffffff'><t size='2'><t align='center'>Speed Radar<br/><t color='#ff0000'><t align='center'><t size='1.5'>Speed: %1 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Speed Limit: %2 km/h<br/><t color='#ffffff'><t align='center'><t size='1'>Driver: %3<br/><t color='#ffffff'><t align='center'><t size='1'>Fine: $%4",round _speed,_limit,name _driver,[_ticketWL] call life_fnc_numberText];	
						[0] call SOCK_fnc_updatePartial;
					};
		};
	};
};
sleep 5;