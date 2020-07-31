
SUPER_fnc_RotSub = compile preprocessFile "Meteor_script\functions\RotSubmunition.sqf";
SUPER_fnc_meteor_normal = compile preprocessFile "Meteor_script\flight.sqf";
SUPER_fnc_meteor_submeteor = compile preprocessFile "Meteor_script\flight2.sqf";
SUPER_fnc_meteor_rain = compile preprocessFile "Meteor_script\flight3.sqf";
CHBN_adjustBrightness = 275;

[] spawn  {
	while{true} do
	{
		uiSleep 45;
		[] call fnc_water;
		if (life_eattotal > 9) then {
			life_eattotal = life_eattotal - 1;
		};


		uiSleep 45;
		[] call fnc_food;
		if (life_eattotal > 9) then {
			life_eattotal = life_eattotal - 1;
		};
	};
};

[] spawn  {
	while{true} do
	{
		uisleep 300;
		[8] call SOCK_fnc_updatePartial;
		[] call fnc_overtime_stats;
		uisleep 300;
		[] call fnc_overtime_stats;
	};
};

player addEventHandler ["Put", {[3] call SOCK_fnc_updatePartial}];
player addEventHandler ["Take", {[3] call SOCK_fnc_updatePartial}];
player addMPEventHandler ["MPKilled", {diag_log format ["%2 zabil %1",name (_this select 0),name (_this select 1)];}];
player addMPEventHandler ["MPHit", {diag_log format ["%2 postrzelil %1",name (_this select 0),name (_this select 1)];}];
	

[] spawn
{
	while {true} do
	{
		if(isNull objectParent player) then
		{
			if(life_seatwarn) then {
				life_seatwarn = false;
			};
			if(life_seatbelt) then {
				uiSleep 3;
				life_seatbelt = false;
			};
			uiSleep 5;
		};
		if(vehicle player != player && !(player getVariable ["Escorting", false]) && !(player getVariable ["restrained", false]) && (vehicle player isKindOf "LandVehicle")) then
		{
			if(speed vehicle player > 90 && !life_seatbelt) then
			{
				oldVehVelocity = velocity (vehicle player);
				uiSleep 0.3;
				if(speed vehicle player < 1) then
				{
					playSound "glassbreak";
					moveOut player;
					player setVelocity [(oldVehVelocity select 0) * 0.4,(oldVehVelocity select 1) * 0.4,((oldVehVelocity select 2) * 0.4) + 5];
					uiSleep 2;
					player switchmove "";
				};
			} else {
				if(!life_seatwarn) then {
					uiSleep 1;
					if(!life_seatwarn) then {
						["Pamietaj o pasach!", false] spawn domsg;
					};
					playSound "seatwarn";
					life_seatwarn = true;
				};
				uiSleep 1;
			};
		};
	};
};


[] spawn
{
	if(side player != civilian) exitWith {};
	while{true} do
	{
		_vehicle = vehicle player;
		if(vehicle player != player && driver (vehicle player) == player && ((_vehicle isKindOf "Car") || (_vehicle isKindOf "Motorcycle") || (_vehicle isKindOf "Bicycle") || (_vehicle isKindOf "Motorbike") || (_vehicle isKindOf "A3L_Tahoe_Base"))) then {

			if((player distance (getMarkerPos "speed_cam_1")) < 20 || (player distance (getMarkerPos "speed_cam_2")) < 20 || (player distance (getMarkerPos "speed_cam_3")) < 20 || (player distance (getMarkerPos "speed_cam_4")) < 20 || (player distance (getMarkerPos "speed_cam_10")) < 20 ) then {
				_vel = speed player;
				if(_vel > 90 && _vel < 140) then {
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;
					uiSleep 0.1;
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;

					["Otrzymales $1000 mandatu za przekraczanie predkosci w miescie", false] spawn domsg;
					if(cash_in_bank > 1000) then {
						["bank","take",1000] call life_fnc_handleCash;
					};
				};

				if(_vel > 139 && _vel < 200) then {
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;
					uiSleep 0.1;
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;

					["Otrzymales $2500 mandatu za nadmierna predkosc w miescie", false] spawn domsg;
					if(cash_in_bank > 2500) then {
						["bank","take",2500] call life_fnc_handleCash;
					};
				};
				if(_vel > 199) then {
					["Otrzymales mandat w wysokosci $10000 oraz odebrano Ci prawo jazdy za zapierdalanie po miescie", false] spawn domsg;
					if(cash_in_bank > 10000) then {
						["bank","take", 10000] call life_fnc_handleCash
					};
					player setVariable["defect_vehicle",true,true];

					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;
					uiSleep 0.1;
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;

					if(license_civ_driver OR license_civ_truck OR license_civ_boat) then {
						license_civ_driver = false;
						license_civ_truck = false;
						license_civ_boat = false;
						[2] call SOCK_fnc_updatePartial;
					};
				};
				uiSleep 30;
			};
			if((player distance (getMarkerPos "speed_cam_5")) < 30 || (player distance (getMarkerPos "speed_cam_6")) < 30 || (player distance (getMarkerPos "speed_cam_7")) < 30 || (player distance (getMarkerPos "speed_cam_8")) < 30 || (player distance (getMarkerPos "speed_cam_9")) < 30 || (player distance (getMarkerPos "speed_cam_11")) < 30 || (player distance (getMarkerPos "speed_cam_12")) < 30 || (player distance (getMarkerPos "speed_cam_13")) < 30 || (player distance (getMarkerPos "speed_cam_14")) < 30 || (player distance (getMarkerPos "speed_cam_15")) < 30 || (player distance (getMarkerPos "speed_cam_16")) < 30 || (player distance (getMarkerPos "speed_cam_17")) < 30 || (player distance (getMarkerPos "speed_cam_18")) < 30) then {
				_vel = speed player;
				if(_vel > 140 && _vel < 160) then {
					["Otrzymales $1000 mandatu za przekraczanie predkosci", false] spawn domsg;
					if(cash_in_bank > 1000) then {
						["bank","take", 1000] call life_fnc_handleCash;
					};

					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;
					uiSleep 0.1;
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;

				};
				if(_vel > 159 && _vel < 224) then {
					["Otrzymales $2500 mandatu za nadmierna predkosc.", false] spawn domsg;
					if(cash_in_bank > 2500) then {
						["bank","take", 2500] call life_fnc_handleCash;
					};

					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;
					uiSleep 0.1;
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;

				};
				if(_vel > 225) then {
					["Otrzymales $1000 mandatu oraz odebrano Ci prawo jazdy za zapierdalnie poza miastem.", false] spawn domsg;
					if(cash_in_bank > 5000) then {
						["bank","take", 5000] call life_fnc_handleCash
					};
					player setVariable["defect_vehicle",true,true];

					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;
					uiSleep 0.1;
					"colorCorrections" ppEffectEnable true;
					"colorCorrections" ppEffectAdjust [1, 15, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.5, 0.0, 0.6],[0.3, 0.3, 0.3, 0.05]];
					"colorCorrections" ppEffectCommit 0;
					uiSleep 0;
					"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.6],  [1, 1, 1, 0.6]];
					"colorCorrections" ppEffectCommit 0.05;
					uiSleep 0.05;
					"colorCorrections" ppEffectEnable false;

					if(license_civ_driver OR license_civ_truck OR license_civ_boat) then {
						license_civ_driver = false;
						license_civ_truck = false;
						license_civ_boat = false;
					};
				};
				uiSleep 30;
			};
			uiSleep 0.5;
		} else {
			uiSleep 5;
		};
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {uiSleep 1; (backpack player != _bp)};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
		//Medycy i policjanci moga przenosic wiecej barierek
		if(side player == west || side player == independent) then {
			life_maxWeight = life_maxWeight + 20;
		};
	};
};

	fnc_water = 
	{
		if(life_thirst < 2) exitwith { 
			["Remove",0.25] call fnc_doHealth; 
			playSound3D ["cg_sndimg\sounds\cough1.ogg", player, false, getPosASL player, 3, 1, 45];
		};
		if(life_thirst < 15) then { 
			[7] spawn life_fnc_HudElements;	
			playSound3D ["cg_sndimg\sounds\cough3.ogg", player, false, getPosASL player, 3, 1, 45];
		};	
		if(!life_is_arrested) then { 
			["Remove","Drink",1] call fnc_sustain;
		};
	};


	fnc_food = 
	{
		if(life_hunger < 2) exitwith { 
			["Remove",0.25] call fnc_doHealth;
			playSound3D ["cg_sndimg\sounds\cough4.ogg", player, false, getPosASL player, 3, 1, 45];
		};
		if(life_hunger < 15) then { 
			playSound3D ["cg_sndimg\sounds\cough3.ogg", player, false, getPosASL player, 3, 1, 45];
			[7] spawn life_fnc_HudElements;	
		};	
		if(!life_is_arrested) then { 
			["Remove","Food",1] call fnc_sustain;
		};
	};


	fnc_battery =
	{
		_adjust = param [0,"",[""]];
		_amount = param [1,0,[0]];
		if(_adjust == "Reset") then { life_battery = 0; };
		if(_adjust == "Set") then { life_battery = _amount; };
		if(_adjust == "Add") then { life_battery = life_battery + _amount; };	
		if(_adjust == "Remove") then { life_battery = life_battery - _amount; };
	};



	fnc_battery_adjust =   
	{
		if(life_battery < 2) exitwith {["Bateria w telefonie rozladowana.", false] spawn domsg;};

		_batloss = round (random 3);
		if(vehicle player == player) then {
			["Remove",_batloss] call fnc_battery;
		} else {
			if(life_battery < 100) then {
				["Add",_batloss] call fnc_battery;
				["Pojazd naladowal Twoja baterie.", false] spawn domsg;
			};
		};

		if(life_battery < 10) then {
			["Battery Low", false] spawn domsg; playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
		};

	};



	fnc_overtime_stats =   
	{
			if(!life_is_arrested) then { 
				_karma = round (random 5);
				["Add",_karma] call fnc_karma;
			};
			_karma = round (random 5);
			life_poop = life_poop + _karma;
			call fnc_poop;
	};

	fnc_poop =
	{
		if (life_poop > 80) then {
			_pooplord = getFatigue player;
			if (!deadPlayer && _pooplord < 1) then {
				player setFatigue _pooplord + 0.01; 
				_chance = round (random 95);
   			 	if(_chance == 19) then {
   				  	[player,"fart1"] spawn life_fnc_nearestSound;
   				};
   				if(_chance == 20) then {
   				  	[player,"fart2"] spawn life_fnc_nearestSound;
   				};
   				if(_chance == 21) then {
   				  	[player,"fart3"] spawn life_fnc_nearestSound;
   				};
   				if(_chance == 22 || _chance == 23) then {
   				  	[player,"fart4"] spawn life_fnc_nearestSound;
   				};
   				if(_chance == 24) then {
   				  	[player,"fart5"] spawn life_fnc_nearestSound;
   				};
   				if(_chance == 25) then {
   				  	[player,"fart6"] spawn life_fnc_nearestSound;
   				};
			};
		};
		if (life_poop > 90) then {
			_pooplord = getFatigue player;
			if(!deadPlayer && _pooplord < 1) then {
				player setFatigue _pooplord + 0.01; 
			};
		};
	};


	fnc_cruisecontrol = {
		start_speed = speed (vehicle player);
		cur_vehicle = vehicle player;
		koil_cruise = true;
		while {koil_cruise} do {
				if(!isEngineOn cur_vehicle) exitwith {};
				if (vehicle player == player) exitWith { };
				if (damage (vehicle player) > 0) exitWith { ["Vehicle is damaged.. Cruise Control is Disabled", false] spawn domsg; };
				if(!(isOnRoad player)) exitwith { ["Cruise Control Disabled on this type of Surface.", false] spawn domsg; };
				if(driver (vehicle player) != player) exitwith { };

				_curspeed = speed (vehicle player);
				if (_curspeed < start_speed) then {
 				_vel = velocity cur_vehicle;
				_dir = direction cur_vehicle;
				_speed = 0.0001;
				cur_vehicle setVelocity [
					(_vel select 0) + (sin _dir * _speed), 
					(_vel select 1) + (cos _dir * _speed), 
					(_vel select 2)
				];
			};
		};

		if(koil_cruise) then {
			koil_cruise = false;
		};
	};

	fnc_doHealth =
	{

		if(deadPlayer) exitwith {};	
		params [["_adjust", "", [""]], ["_amount", 0, [0]], ["_source", objNull, [objNull]]];

		if(_adjust == "Add") then { 
			myHealth = myHealth - _amount;
			if(_amount > 0.1) then {
				[6] spawn life_fnc_HudElements;	
			};	
		};

		if(_adjust == "Remove") then {	
			myHealth = myHealth + _amount; 
			if(_amount > 0.1) then {
				[5] spawn life_fnc_HudElements;
			};
		};

		if(_adjust == "Set") then { 
			[6] spawn life_fnc_HudElements; 
			myHealth = _amount; 
		};

		if(myHealth < 0) then { myHealth = 0; };

		if(myHealth > 0.99) then { 
			if(Myhealth > 1.8) then { myHealth = 1.8; };
			_damage = myHealth - 1;
			_damage = _damage * 10;
			[player,_source,_damage] spawn life_fnc_onPlayerKilled;
		};

		if((damage player) != 0.1 && myHealth > 0) then {
			player setdamage 0.1;
		};
		if((damage player) != 0 && myHealth == 0) then {
			player setdamage 0;
		};
	};

	fnc_sustain =
	{
		_adjust = param [0,"",[""]];
		_type = param [1,"",[""]];
		_amount = param [2,0,[0]];
		if(_type == "Food") then {
			if(_adjust == "Add") then { life_hunger = life_hunger + _amount; };
			if(_adjust == "Remove") then { life_hunger = life_hunger - _amount; };
			if(life_hunger > 100) then {life_hunger = 100;};
		};
		if(_type == "Drink") then {
			if(_adjust == "Add") then { life_thirst = life_thirst + _amount; };
			if(_adjust == "Remove") then { life_thirst = life_thirst - _amount; };
			if(life_thirst > 100) then {life_thirst = 100;};
		};
	};


	fnc_karma =
	{
		_adjust = param [0,"",[""]];
		_amount = param [1,0,[0]];
		if(_adjust == "Add") then { life_karma = life_karma + _amount; [format["Otrzymales %1 punktow reputacji! Lacznie: %2",_amount,life_karma], false] spawn domsg; };
		if(_adjust == "Remove") then { life_karma = life_karma - _amount; [format["Utraciles %1 punktow reputacji! Lacznie: %2",_amount,life_karma], false] spawn domsg; };
		_oldKarmaLevel = karma_level;

		if(life_karma > 999) then {
			karma_level = life_karma / 400;
			karma_level = floor (karma_level);
		} else {
			karma_level = 0;
		};

		if(life_karma < 0) then {
			life_rebelbadguyman = true;
		};

		if(karma_level > 80) then {
			karma_level = 80;
		};
		if(_oldKarmaLevel < karma_level) then { ["Gratulacje! Uzyskales nowy poziom reputacji!", false] spawn domsg; player say "levelup"; };
		if(_oldKarmaLevel > karma_level) then { ["Gratulacje? Twoj poziom reputacji spadl!", false] spawn domsg; player say "endbeep"; };	
	};

	fnc_dirt = 
	{
		if (life_dirt > 60) then {
			["Czujesz sie brudno i smierdzisz", false] spawn domsg;
		};
		if (life_dirt > 70) then {
				_koildebiiii = player getVariable ["diseaseon", 1];
				if(_koildebiiii == 1) then {
				_diseasechance =  round (random 100);

				if(_diseasechance > 99) then {
					player setVariable ["diseaseon",(round (random 7)),true];
				};
			};
		};	
		if (life_dirt == 100) then {
			_pooplord = getFatigue player;
			player setFatigue _pooplord + 0.01;
		};	
	};


	painIsActive = false;
	fnc_totalpain =	{
		if(painIsActive) exitWith {};
		painIsActive = true;
		while{ koildeb > 1 || koildebi > 1 || koildebii > 1 || koildebiii > 1 || koildebiiii > 1 } do
		{
			_totalpain = koildeb + koildebi + koildebii + koildebiii + koildebiiii;

			if(_totalpain < 12) then {
				"colorCorrections" ppEffectEnable true;			
				"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.5],  [0, 0, 0, 0.0]]; 
				"colorCorrections" ppEffectCommit 3;
				uiSleep 2;
				"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
				"colorCorrections" ppEffectCommit 3;
				uiSleep 2;
			};

			if(_totalpain > 11 && _totalpain < 18) then {
				"colorCorrections" ppEffectEnable true;			
				"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.33],  [0, 0, 0, 0.0]]; 
				"colorCorrections" ppEffectCommit 3;
				uiSleep 2;
				"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
				"colorCorrections" ppEffectCommit 3;
				uiSleep 2;
			};

			if(_totalpain > 17) then {
				"colorCorrections" ppEffectEnable true;			
				"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.1],  [0, 0, 0, 0.0]]; 
				"colorCorrections" ppEffectCommit 3;
				uiSleep 2;
				"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
				"colorCorrections" ppEffectCommit 3;
				uiSleep 2;
			};
			uiSleep 2;
		};
		painIsActive = false;
	};

	fnc_healTime = {
		disableSerialization;
		_message = _this select 0;
		_user = _this select 1;
		_myInjuries = _this select 2;
		_arrayCount = _this select 3;
		_item = _this select 4;
		_sleep = _this select 5;
		_timerM = 0;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_message];

		if(karma_level > 0) then {
			_timerM = karma_level / 100;
		};

		_progress progressSetPosition _timerM;
		while{true} do
		{
			if (isNull objectParent player && animationState player != "ainvpknlmstpslaywnondnon_medic") then  { player switchMove "ainvpknlmstpslaywnondnon_medic"; }; 
			uiSleep _sleep;
			_timerM = _timerM + 0.01;
			_progress progressSetPosition _timerM;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_timerM * 100),"%",_message];
			if(_timerM >= 1) exitWith {};
			if(deadPlayer) exitWith {};
		};
		player removeMagazine _item;
		5 cutText ["","PLAIN"];

		_myInjuries set [_arrayCount, 0]; 
		_user setVariable ["playerInjuries",_myInjuries,true]; 
		imHealing = false;
		[_user] spawn fnc_medicUpdater;
	};



	fnc_fixProblem = {

		if(imHealing) exitwith {};
		imHealing = true;
		_user = _this select 0;
		_arrayCount = _this select 1;
		_amount = _this select 2;
		_myInjuries = _user getVariable "playerInjuries";

		if(_arrayCount < 10) then {
			if(_amount == 1) then { if("CG_ATF_Bandage_i" in magazines player) then { ["Applying Bandage",_user,_myInjuries,_arrayCount,"CG_ATF_Bandage_i",0.05] spawn fnc_healTime; } else { hint "You dont have the required item!"; }; };
			if(_amount == 2) then { if("CG_ATF_First_Aid_Kit_i" in magazines player) then { ["Applying First Aid",_user,_myInjuries,_arrayCount,"CG_ATF_First_Aid_Kit_i",0.1] spawn fnc_healTime; } else { hint "You dont have the required items!"; }; };
			if(_amount == 3) then { if("CG_ATF_First_Aid_Kit_i" in magazines player) then { ["Applying First Aid",_user,_myInjuries,_arrayCount,"CG_ATF_First_Aid_Kit_i",0.1] spawn fnc_healTime; } else { hint "You dont have the required item!"; }; };	
			if(_amount == 4) then { if("CG_bloodbag_i" in magazines player) then { ["Applying Blood Bag",_user,_myInjuries,_arrayCount,"CG_bloodbag_i",0.15] spawn fnc_healTime; } else { hint "You dont have the required item!"; }; };	
		};

		if(_arrayCount == 10) then {
			if(_amount > 0) then { if("CG_antibiotics_i" in magazines player) then { ["Applying Blood Bag",_user,_myInjuries,_arrayCount,"CG_antibiotics_i",0.2] spawn fnc_healTime; } else { hint "You dont have the required item!"; }; };
		};	
		//failsafe
		sleep 3;
		imHealing = false;
	};

	fnc_chooseUser = {
		_status = lbData[1113,lbCurSel (1113)];
		_status = call compile format["%1", _status];
		closedialog 0;
		sleep 0.05;
		if(isNil "_status") then { _status = player; };
		[_status] spawn fnc_medicUpdater;
	};

	fnc_findPlayers = {
		if(!dialog) then {	createdialog "FindPlayer_Menu"; };
		disableSerialization;

		waitUntil {!isNull (findDisplay 1111)};
		_display = findDisplay 1111;
		_list = _display displayCtrl 1113;
		lbClear _list;
		_players = player nearEntities ["Man", 5];

		if(vehicle player != player) then { _players = _players + (crew (vehicle player)); };
		_nonUnits = [];

		{if(!isPlayer _x) then {_nonUnits pushBack _x}} forEach _players;

		_players = _players - _nonUnits;

		{
			_side = switch(side _x) do {case west: {"Cop"}; case east : {"Civ"}; case civilian : {"Civ"}; case independent : {"Medic"}; default {"Unknown"};};	
			_list lbAdd format["%1 - %2", name _x,_side];
			_list lbSetdata [(lbSize _list)-1,str(_x)];
		} foreach _players;
	};

	fnc_medicUpdater = {
		if(!dialog) then {	createdialog "medicHUD"; };
		_myInjuries = player getVariable "playerInjuries";
		_myInjuriesToUpdate = player getVariable "playerInjuriesToUpdate";

		if !(_myInjuries isEqualTo _myInjuriesToUpdate) then {
			player setVariable ["playerInjuriesToUpdate",_myInjuries,true];
		};
		user = _this select 0;
		if(isNil "user") then { user = player; };
		myInjuries = user getVariable "playerInjuries";
		_display = findDisplay 919191;

		_1DamageStates = ["Brak ran","Pocieta glowa (1x Bandaz)","Posiniaczona glowa (1x Apteczka)","Wstrzas mozgu (1x Apteczka)","Zlamana czaszka (Transfuzja)"];
		_2DamageStates = ["Brak ran","Pocieta szyi (1x Bandaz)","Nadwyrezony miesien szyi (1x Apteczka)","Uraz kregoslupu szyjnego (1x Apteczka)","Zlamany kark (Transfuzja)"];
		_3DamageStates = ["Brak ran","Rozdarta klatka piersiowa (1x Bandaz)","Potluczony mostek (1x Apteczka)","Pekniete zebro (1x Apteczka)","Zmiazdzone zebra (Transfuzja)"];
		_4DamageStates = ["Brak ran","Poszarpane plecy (1x Bandaz)","Bole plecow (1x Apteczka)","Rozerwane plecy (1x Apteczka)","Uraz kregoslupa (Transfuzja)"];
		_5DamageStates = ["Brak ran","Przetarta skora (1x Bandage)","Rozdarta reka (1x Apteczka)","Zlamanie kosci z przemieszczeniem (1x Apteczka)","Wielokrotne zlamania (Transfuzja)"];
		_6DamageStates = ["Brak ran","Skaleczona dlon (1x Bandaz)","Zlamany palec (1x Apteczka)","Odpadl palec (1x Apteczka + palec)","Zmiazdzona dlon (Transfuzja)"];
		_7DamageStates = ["Brak ran","Pociete biodro (1x Bandaz)","Posiniaczone Uda (1x Apteczka)","Nabrzmiale genitalia (1x Apteczka)","Zlamane biodro (Transfuzja)"];
		_8DamageStates = ["Brak ran","Krwawienie z uszu (1x Bandaz)","Zlamanie nosa z przemieszczeniem (1x Apteczka)","Wybity zab (1x Apteczka)","Zlamana szczeka (Transfuzja)"];
		_9DamageStates = ["Brak ran","Posiniaczona noga (1x Bandaz)","Rozdarte wiezla kolanowe (1x Apteczka)","Zerwany miesien nogi (1x Apteczka)","Zlamana kosc udowa (Transfuzja)"];
		_10DamageStates = ["Brak ran","Krwawienie wewnetrzne (1x Bandaz)","Uszkodzone nerki (1x Apteczka)","Kolotania serca (1x Apteczka)","Brak krwi (Transfuzja)"];
		_11DamageStates = ["Brak ran","Przewlekla grypa (1x Antybiotyki)","Reakcja alergiczna (1x Antybiotyki)","Infekcja (1x Antybiotyki)","Nieznana choroba (Antybiotyki)"];

		_Btn1 = _display displayCtrl 6;
		damageAmount = myInjuries select 0;
		_thisInjury = _1DamageStates select damageAmount;
		_Btn1 ctrlSetText format["%1",_thisInjury];
		_Btn1 buttonSetAction "[user,0,damageAmount] spawn fnc_fixProblem;";
		if( damageAmount != 0) then { _Btn1 ctrlEnable true; } else { _Btn1 ctrlEnable false; ctrlShow[105,false]; };

		_Btn2 = _display displayCtrl 8;
		damageAmount2 = myInjuries select 1;
		_thisInjury = _2DamageStates select damageAmount2;
		_Btn2 ctrlSetText format["%1",_thisInjury];
		_Btn2 buttonSetAction "[user,1,damageAmount2] spawn fnc_fixProblem;";
		if( damageAmount2 != 0) then { _Btn2 ctrlEnable true; } else { _Btn2 ctrlEnable false; ctrlShow[107,false]; };

		_Btn3 = _display displayCtrl 10;
		damageAmount3 = myInjuries select 2;
		_thisInjury = _3DamageStates select damageAmount3;
		_Btn3 ctrlSetText format["%1",_thisInjury];
		_Btn3 buttonSetAction "[user,2,damageAmount3] spawn fnc_fixProblem;";
		if( damageAmount3 != 0) then { _Btn3 ctrlEnable true; } else { _Btn3 ctrlEnable false; ctrlShow[106,false]; };

		_Btn4 = _display displayCtrl 12;
		damageAmount4 = myInjuries select 3;
		_thisInjury = _4DamageStates select damageAmount4;
		_Btn4 ctrlSetText format["%1",_thisInjury];
		_Btn4 buttonSetAction "[user,3,damageAmount4] spawn fnc_fixProblem;";
		if( damageAmount4 != 0) then { _Btn4 ctrlEnable true; } else { _Btn4 ctrlEnable false; ctrlShow[108,false]; };

		_Btn5 = _display displayCtrl 14;
		damageAmount5 = myInjuries select 4;
		_thisInjury = _5DamageStates select damageAmount5;
		_Btn5 ctrlSetText format["%1",_thisInjury];
		_Btn5 buttonSetAction "[user,4,damageAmount5] spawn fnc_fixProblem;";
		if( damageAmount5 != 0) then { _Btn5 ctrlEnable true; } else { _Btn5 ctrlEnable false; ctrlShow[109,false]; };

		_Btn6 = _display displayCtrl 16;
		damageAmount6 = myInjuries select 5;
		_thisInjury = _6DamageStates select damageAmount6;
		_Btn6 ctrlSetText format["%1",_thisInjury];
		_Btn6 buttonSetAction "[user,5,damageAmount6] spawn fnc_fixProblem;";
		if( damageAmount6 != 0) then { _Btn6 ctrlEnable true; } else { _Btn6 ctrlEnable false; ctrlShow[112,false]; };

		_Btn7 = _display displayCtrl 18;
		damageAmount7 = myInjuries select 6;
		_thisInjury = _7DamageStates select damageAmount7;
		_Btn7 ctrlSetText format["%1",_thisInjury];
		_Btn7 buttonSetAction "[user,6,damageAmount7] spawn fnc_fixProblem;";
		if( damageAmount7 != 0) then { _Btn7 ctrlEnable true; } else { _Btn7 ctrlEnable false; ctrlShow[110,false]; };

		_Btn8 = _display displayCtrl 20;
		damageAmount8 = myInjuries select 7;
		_thisInjury = _8DamageStates select damageAmount8;
		_Btn8 ctrlSetText format["%1",_thisInjury];
		_Btn8 buttonSetAction "[user,7,damageAmount8] spawn fnc_fixProblem;";
		if( damageAmount8 != 0) then { _Btn8 ctrlEnable true; } else { _Btn8 ctrlEnable false; ctrlShow[111,false]; };

		_Btn9 = _display displayCtrl 22;
		damageAmount9 = myInjuries select 8;
		_thisInjury = _9DamageStates select damageAmount9;
		_Btn9 ctrlSetText format["%1",_thisInjury];
		_Btn9 buttonSetAction "[user,8,damageAmount9] spawn fnc_fixProblem;";
		if( damageAmount9 != 0) then { _Btn9 ctrlEnable true; } else { _Btn9 ctrlEnable false; ctrlShow[113,false]; };

		_Btn10 = _display displayCtrl 24;
		damageAmount10 = myInjuries select 9;
		_thisInjury = _10DamageStates select damageAmount10;
		_Btn10 ctrlSetText format["%1",_thisInjury];
		_Btn10 buttonSetAction "[user,9,damageAmount10] spawn fnc_fixProblem;";
		if( damageAmount10 != 0) then { _Btn10 ctrlEnable true; } else { _Btn10 ctrlEnable false; ctrlShow[114,false]; };

		_Btn11 = _display displayCtrl 26;
		damageAmount11 = myInjuries select 10;
		_thisInjury = _11DamageStates select damageAmount11;
		_Btn11 ctrlSetText format["%1",_thisInjury];
		_Btn11 buttonSetAction "[user,10,damageAmount11] spawn fnc_fixProblem;";
		if( damageAmount11 != 0) then { _Btn11 ctrlEnable true; } else { _Btn11 ctrlEnable false; ctrlShow[115,false]; };

	};

	fnc_damageChance = {	
		_injuryArray = ["head","neck","body","spine1","arms","leg","pelvis","face_hub","hands"];
		_currentHitLocation = _this select 1;
		if(_currentHitLocation IN _injuryArray) then {
			_myInjuries = player getVariable "playerInjuries";
			_currentHitNumber = _injuryArray find _currentHitLocation;
			_mychance = round (random 2);
			_injuryLevel = (_myInjuries select _currentHitnumber) + _myChance;
			if(_injuryLevel > 4) then { _injuryLevel = 4; };
			_myInjuries set [_currentHitNumber, _injuryLevel];

			if(_currentHitLocation == "Body") then {
				_chance = round (random 50);
				if(_chance < 3) then {
					_organDamage = round (random 4);
					_myInjuries set [9, _organDamage];
				};
			};

			_chance = round (random 1000);
			if(_chance < 2) then {
				_disease = round (random 4);
				_myInjuries set [10, _disease];
			};


			player setVariable ["playerInjuriesToUpdate",_myInjuries,false];

			if(myUpdate) then {
				[] spawn fnc_doInjuriesUpdate;
			};
		};
	};

	fnc_doInjuriesUpdate = {
		myupdate = false;
		uisleep 2;
		_myInjuries = player getVariable "playerInjuries";
		_myInjuriesToUpdate = player getVariable "playerInjuriesToUpdate";
		player setVariable ["playerInjuries",_myInjuriesToUpdate,true];
		myUpdate = true;
	};



	fnc_quitjobs = {
		if(life_quitRecently) exitwith { ["Musisz odczekac 5 minut przed zrobieniem tego ponownie.", false] spawn domsg; };
		life_quitRecently = true;
		if(life_NewsJobs) exitwith { has_job = false; life_NewsJobs = false; };
		if(life_taxi) exitwith { has_job = false; fedex_on = false;	};
		if(life_bankteller) exitwith { has_job = false; life_bankteller = false; };
		if(life_carSalesman) exitwith { has_job = false; life_carSalesman = false; };
		if(maintenance_on) exitwith { has_job = false; maintenance_on = false; };
		if(trucking) exitwith { 
			has_job = false; 
			trucking = false;
			deleteVehicle vehspawned;
			deleteVehicle vehspawned2;
		};
		if(fedex_on) exitwith { 
			has_job = false; fedex_on = false;
			deleteVehicle vehspawned;
		};
		sleep 300;
		life_quitRecently = false;
	};

	fnc_totalatm =
	{
		if(paid_recently) exitwith {
	
		};
		myatmbonus = _this;
		paid_recently = true;

		if (myatmbonus > 1000) then {
			myatmbonus = 1000;
		};

		if (myatmbonus < 420) then {
			myatmbonus = 420;
		};

		["bank","add",round(myatmbonus)] call life_fnc_handleCash; 
		[format["Otrzymales wyplate w wysokosci $%1",myatmbonus], false] spawn domsg;
		uiSleep 180;
		paid_recently = false;
	};



	fnc_del_houses = {
		_n = 0;
		if(count target_houses > 0) then {

			{
				deleteMarkerLocal format["house_%1",_n];
				_n = _n + 1;
			} foreach target_houses;
			target_houses = 0;
		};
	};


	fnc_totalmobile =
	{
		if(buy_off) exitwith {};
		buy_off = true;
		mybonus = _this;
		if (mybonus > 1000) then {
			mybonus = 1000;
		};

		if (mybonus < 120) then {
			mybonus = 120;
		};

		["cash","add",round(mybonus)] call life_fnc_handleCash; 
		[format["Otrzymales wyplate w wysokosci $%1",mybonus], false] spawn domsg;
		uiSleep 180;
		buy_off = false;
	};

	fnc_draw3d = {
	marker_on = false;
	sleep 0.3;
	marker_on = true;
	drawmessage = param [0,"",[""]];
	posinext = param [1,[],[[]]];
		while{marker_on} do {
		   	if(player distance posinext < 10 && drawmessage != "Driving Test") exitwith { ["Dotarles do celu!",false] spawn domsg; };
		   	if(player distance posinext < 110 && drawmessage == "Oil") exitwith { };
		   	if(drawmessage == "Oil Maintenance" && !maintenance_on) exitwith { };	
		   	sleep 0.05;
	    };
	    marker_on = false;
	};

	fnc_fadephone = { 
			[] spawn {
			_fuck = ((uiNamespace getVariable "tabletmenu") displayCtrl 7017); 
			_fuck ctrlsetfade 1;
			_fuck ctrlcommit 1; 
			sleep 1;
			_fuck ctrlshow false;
		};
	};










	fnc_kearth = {
		closedialog 0;
		if(!allow_sat) exitwith { player say "satdisable"; ["SLEarth jest obecnie wylaczone!",false] spawn domsg; };
		allow_sat = false;
		["kEarth Imaging Currently ONLINE!",false] spawn domsg;
		life_kEarthCamera  = "CAMERA" camCreate (getPosATL player);  
		showCinemaBorder FALSE;  
		life_kEarthCamera cameraEffect ["Internal","Back"]; 
		life_kEarthCamera camSetTarget player; 
		life_kEarthCamera camSetFOV .9;  
		life_kEarthCamera camSetFocus [50,0];   
		life_kEarthCamera camSetRelPos [0,545,545];  
		life_kEarthCamera camCommit 0;
		player say "satmove";
		life_kEarthCamera camSetRelPos [0,1,445];  
		life_kEarthCamera camCommit 4.5;

		"colorCorrections" ppEffectEnable true; 
		"filmGrain" ppEffectEnable true;  
		"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 1, false];  
		"filmGrain" ppEffectCommit 2;    
		"colorCorrections" ppEffectAdjust [1, 0.75, 0, [0.3,0.4,1,-0.1], [1,1,1,1], [-0.5,0,-1,3]]; 
		"colorCorrections" ppEffectCommit 2;
		_total = 0;
		while{true} do {
			if(_total > 10 || life_battery < 0) exitwith {};
			sleep 1;
			["Remove",3] call fnc_battery;
			_total = _total + 1;
		};
		sleep 2;
		["SLEarth jest obecnie wylaczone!",false] spawn domsg; 
		player say "satdisable"; 
		life_kEarthCamera cameraEffect ["TERMINATE","BACK"];
		camDestroy life_kEarthCamera;
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 3;
		"colorCorrections" ppEffectEnable false;
		"filmGrain" ppEffectAdjust [0, 0, 0, 0, 1, false];
		"filmGrain" ppEffectCommit 2; 
		"filmGrain" ppEffectEnable false;  
		sleep 600;
		["SLEarth zostalo wlaczone!",false] spawn domsg;
		allow_sat = true;
	};

fnc_dispatch = {
	if(dispatch) exitwith {};
	if(dispatch2) exitwith {};
	dispatch = true;
	_sound2play = param [0,"",[""]];
	playSound _sound2play;
	sleep 7;
	dispatch = false;
};



	fnc_phone_settings = { 
		_todo = param [0,"",[""]];

		if(_todo == "tags") then {
			if(phone_s_1) then {
				phone_s_1 = false;
			} else {
				phone_s_1 = true;
			};
		};

		if(_todo == "HUD") then {
			if(phone_s_2) then {
				phone_s_2 = false;
				_one = _ui2 displayCtrl 1000;
				_one ctrlshow true;
				[] spawn life_fnc_hudSetup;
			} else {
				_ui = uiNameSpace getVariable ["playerHUD",displayNull];
				_idc = 2199;
				_idc2 = 23495;
				while{true} do {
					_todo1 = _ui displayctrl _idc;
					_todo2 = _ui displayCtrl _idc2;
					_todo1 ctrlshow false;
					_todo2 ctrlshow false;
					_idc = _idc + 1;
					_idc2 = _idc2 + 5;
					if(_idc == 2233) exitwith {};
				};
				_one = _ui2 displayCtrl 1000;
				_one ctrlshow false;
				_one = _ui displayCtrl 23915;
				_two = _ui displayCtrl 23905;
				_three = _ui displayCtrl 23910;
				_four = _ui displayCtrl 23920;
				_one ctrlshow false;
				_two ctrlshow false;
				_three ctrlshow false;
				_four ctrlshow false;
				phone_s_2 = true;
			};
		};
	};

fnc_delivery = {
	_mytype = _this;
	if(_mytype isEqualTo "standard") exitwith {
		_chance = round (random 7);
		if(_chance < 2) then {
			player addItemToBackpack "CG_Pro_Item_i";
			["Someone just sent you a Go Pro! Check your backpack!", false] spawn domsg;
			["Add",1] call fnc_karma;
		};
		if(_chance isEqualTo 2) then {
			["cash","add",1250] call life_fnc_handleCash; 
			["You just got $7250!", false] spawn domsg;
			["Add",3] call fnc_karma;
		};
		if(_chance isEqualTo 3) then {
			["cash","add",500] call life_fnc_handleCash; 
			["You just got $500!", false] spawn domsg;
			["Add",2] call fnc_karma;
		};
		if(_chance isEqualTo 6) then {
			player addItemToBackpack "CG_ATF_Drug_Bottle_01_i";
			player addItemToBackpack "CG_ATF_Drug_Bottle_01_i";
			["Someone just sent you medicine, you feeling okay? Check your backpack!", false] spawn domsg;
			["Add",5] call fnc_karma;
		};	
		if(_chance isEqualTo 7) then {
			player addItemToBackpack "CG_ATF_Drug_Bottle_01_i";
			["Someone just sent you medicine, you feeling okay? Check your backpack!", false] spawn domsg;
			["Add",5] call fnc_karma;
		};	
		if(_chance isEqualTo 4) then {
			["cash","add",2500] call life_fnc_handleCash; 
			["You just got $2500!", false] spawn domsg;
			["Add",15] call fnc_karma;
		};
		if(_chance isEqualTo 5) then {
			_lootArr = ["emerald","ruby","sapphire"];
			_loot = _lootArr select floor random count _lootArr;
			[true,_loot,3] call life_fnc_handleInv;
			["Someone just sent you some valuable jewels, check your Virtual Inventory!", false] spawn domsg;
			["Add",3] call fnc_karma;
		};
	};

	if(_mytype isEqualTo "fastfood") exitwith {
		player addItemToBackpack "CG_ATF_Pizza_Box_i";
		["Fastfood Delivery! Check your backpack!", false] spawn domsg;
		player addItemToBackpack "CG_ATF_Donut_Box_i";
		["Add",1] call fnc_karma;
	};

	if(_mytype isEqualTo "fixit") exitwith {
		//todo
	};

	if(_mytype isEqualTo "jail") exitwith {
		_chance = round (random 100);
		if(_chance < 20) then {
			player addItem "CG_ATF_Pizza_Box_i";
			player assignItem "CG_ATF_Pizza_Box_i";
			player addItem "CG_ATF_Donut_Box_i";
			player assignItem "CG_ATF_Donut_Box_i";
			player addweapon "A3L_Glock17";
			player addmagazine "A3L_Glock17mag";
			player addmagazine "A3L_Glock17mag";
			player addmagazine "A3L_Glock17mag";
			player addmagazine "A3L_Glock17mag";		
			["Someone just smuggled items into jail for you!", false] spawn domsg;
		};
	};				
};

[] spawn
{
	if(side player == civilian) then {
		while {true} do {
			uiSleep 2;
			_radios = player call TFAR_fnc_radiosList;
			if(count _radios < 2) then {

				if(count _radios > 0) then {
					if(!([(call TFAR_fnc_activeSwRadio),"cg_tabletd"] call TFAR_fnc_isSameRadio)) then {  
						[] call fnc_checkphone;
						[] call fnc_resetCall;
						hint "Your radio has been replaced with a phone!";
					};
				};

				_wtflol = call TFAR_fnc_haveLRRadio;
				if(_wtflol) then {
				_channel = (call TFAR_fnc_ActiveLRRadio) call TFAR_fnc_getLRChannel;
				_channel = _channel + 1;
					if (driver (vehicle player) == player && (vehicle player) != player) then {
						_curfreqlr = [(call TFAR_fnc_activeLrRadio), _channel] call TFAR_fnc_GetChannelFrequency;
						_curfreqlr = parseNumber _curfreqlr;
						if( _curfreqlr > 33 && _curfreqlr < 34 ) then {
							["33.1 - 33.9 are blocked frequencies.", false] spawn domsg;
							[(call TFAR_fnc_activeLrRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
						};
					};
				};

				_wtfno = call TFAR_fnc_haveSWRadio;
				if(_Wtfno) then {
					_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
					_channel = _channel + 1;
					_curfreqsr = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
					_curfreqsr = parseNumber _curfreqsr;
					if(!isNil "_curfreqsr") then {
						if( _curfreqsr > 33 && _curfreqsr < 34 ) then {
							["33.1 - 33.9 are blocked frequencies.", false] spawn domsg;
							[(call TFAR_fnc_activeSwRadio), _channel, "40"] call TFAR_fnc_SetChannelFrequency;
						};
					};
				};
			}
			else
			{
				["Wyrzuc jedno radio lub telefon.", false] spawn domsg;
				{
					if(_forEachIndex != 0) then
					{
						player unassignItem (_radios select (_forEachIndex - 1));
						player assignItem (_radios select (_forEachIndex));
					};
					_wtfno = call TFAR_fnc_haveSWRadio;
					if(_Wtfno) then {
						_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
						_channel = _channel + 1;
						_curfreqsr = [(call TFAR_fnc_activeSwRadio), _channel] call TFAR_fnc_GetChannelFrequency;
						if(!isNil "_curfreqsr") then {
							[(call TFAR_fnc_activeSwRadio), _channel, str (round(random 480)+30)] call TFAR_fnc_SetChannelFrequency;
						};
					};
					if((count _radios - 1) == _forEachIndex) then
					{
						player unassignItem (_radios select (_forEachIndex));
						player assignItem (_radios select 0);
					};
				} forEach _radios;
				uiSleep 3;
			};
		};
	};
};



fnc_airkit =
{
	if(!life_ApplyAir) then {
		life_ApplyAir = true;
		_buym = 1;
		while {_buym < 18} do {
			player setOxygenRemaining 1;
			uiSleep 10;
			_buym = _buym + 1;
		};
		life_ApplyAir = false;	
	};
};


[] spawn
{
	while {true} do
	{
		uiSleep 3;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			[localize "STR_NOTF_MaxWeight", false] spawn domsg;
		} else {
			if(isForcedWalk player && !(player getVariable["severeInjuries",FALSE])) then {
				player forceWalk false;
			};
		};
	};
};


[] spawn
{
	while {true} do
	{
		if(side player == west) exitwith {};
		uiSleep 5;
		if(!(rebelshipment getVariable["progress",FALSE])) then { uisleep 10; };
		if(player distance rebelshipment < 300 && (rebelshipment getVariable["progress",FALSE])) then { ["You have entered a red-zone, you can be shot if you have a weapon out.", false] spawn domsg; sleep 60;};
	};
};

	fnc_intox =
	{
		[] spawn {
			uiSleep 110;
			if(life_intox > 0) then 
			{
				if(life_intox <= 0.02) then {life_intox = 0.00;} else {life_intox = life_intox - 0.02;};
				switch(true) do {
					case (life_intox == 0.00): {["You are completely sober.", false] spawn domsg;};
					case (life_intox == 0.08): {["You can now legally drive.", false] spawn domsg;};
				};
			};
		};
		if(life_intox <= 0.08) exitWith {};
		if(player getVariable["intoxicated",false]) exitWith {};
		player setVariable["intoxicated",true,true];
		while{life_intox > 0.08} do 
		{
 		    "dynamicBlur" ppEffectEnable true;
    	    "dynamicBlur" ppEffectAdjust [0.5];
            "dynamicBlur" ppEffectCommit 1;
			uiSleep 5;
			if(life_intox > 0.15) then {
				_chance = round (random 100);
   			 	if(_chance < 5) then {
   				  		[] spawn KK_fnc_forceRagdoll;
   				};
			};
			if(life_intox > 0.25) then {
				_chance = round (random 100);
   			 	if(_chance < 7) then {
   				  		[] spawn KK_fnc_forceRagdoll;
   				};
			};
			if(life_intox > 0.35) then {
				_chance = round (random 100);
   			 	if(_chance < 8) then {
   				  		[] spawn KK_fnc_forceRagdoll;
   				};
			};
			if(life_intox > 0.45) then {
				_chance = round (random 100);
   			 	if(_chance < 11 && _chance > 4) then {
   				  		[] spawn KK_fnc_forceRagdoll;
   				};
			};

		};
		"dynamicBlur" ppEffectEnable false;
		player setVariable["intoxicated",false,true];
	};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		uiSleep 1;
		if(deadPlayer) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (isNull objectParent player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					["Remove","Food",10] spawn fnc_sustain;
					["Remove","Drink",10] spawn fnc_sustain;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};
[] spawn
{
	while{true} do
	{
		waitUntil {vehicle player != player};
		waitUntil {isNull objectParent player};

		_time = if (!life_seatbelt) then {time + 0.8} else {time + 1.5};
		[] spawn {
			uiSleep 0.1;
			if(handgunWeapon player isEqualTo "" && primaryWeapon player isEqualTo "") exitWith {};
			[player,"AmovPercMstpSnonWnonDnon"] remoteExecCall ["life_fnc_animSync"];
			player switchMove "AmovPercMstpSnonWnonDnon"; 
		};
		while {_time > time} do {
			if (currentWeapon player != "") then {
				player action ["SwitchWeapon", player, player, 100];
			};
		};
		uiSleep 1;
	};
};


fnc_testaids = { 
	uiSleep 0.05; 
	if(draggingm) then {
		closedialog 0; 
		["Przeciaganie przedmiotow wyciagniete w pojezdzie! Uzywaj prawego przycisku myszki!", false] spawn doquickmsg; 
	};
};

fnc_testdupe = {
	draggingm = false;
	waituntil {!(isnull (finddisplay 602)) || handle};
	nodrag1 = (findDisplay 602) DisplayAddEventHandler ["MouseButtonDown", "if(_this select 1 == 0) then { draggingm = true; };"];
	nodrag2 = (findDisplay 602) DisplayAddEventHandler ["MouseButtonUp", "if(_this select 1 == 0) then { draggingm = false; };"];
	nodrag3 = (findDisplay 602) DisplayAddEventHandler ["MouseMoving", " hint format[""%1"",_this]; if(draggingm) then { [] spawn fnc_testaids; };"];
	waituntil {(isnull (finddisplay 602)) || handle};
	(findDisplay 602) displayRemoveEventHandler ["MouseButtonDown",nodrag1];	
	(findDisplay 602) displayRemoveEventHandler ["MouseButtonUp",nodrag2];	
	(findDisplay 602) displayRemoveEventHandler ["MouseMoving",nodrag3];	
};

fnc_gut_animal = {
	private["_obj"];
	_obj = param [0,ObjNull,[ObjNull]];
	if(isNull _obj) exitWith {}; 
	if(alive _obj) exitWith {}; 

	if(([true,"Raw Meat",1] call life_fnc_handleInv)) then
	{
		deleteVehicle _obj;
		["Wyciales surowe mieso!", false] spawn domsg;
	};
};


	fnc_doorkick = {

		_doorkick = 45;
		_failed = false;
		while{_doorkick > 0} do {
			uisleep 1;
			_doorkick = _doorkick - 1;
			_locked = locked (vehicle player);
			if(_doorkick == 44 || _doorkick == 25 || _doorkick == 10) then {
				[player,"glassbreak"] spawn life_fnc_nearestSound;
			};

			if(_locked != 2) exitwith { _failed = true; };
			sleep 1;
			hint format["Wykopujesz drzwi pozostalo %1 sekund.",_doorkick];
			_vehspeed = speed (vehicle player);
			if(_vehspeed > 0) exitwith { _failed = true; };
		};
		hint "";
		if(!_failed) then { player action ["Eject", vehicle player]; (vehicle player) lock 0; };
	};

//double click functions
fnc_removeitem = {
	_remove = _this select 0;
	player unassignItem _remove;
	player removeitem _remove;
};
//GoPro Toggle
fnc_gopro = {
	if(life_gopro) then {
		life_gopro = false;
	} else {
		life_gopro = true;
	};
	[player,"endbeep"] spawn life_fnc_nearestSound;
};



fnc_joinPaintball = {

if(life_is_arrested || (player getVariable ["restrained", false]) || (player getVariable ["tied", false])) exitwith {};

if( life_koil_race2 == 1 || life_koil_race == 1 || joinmode == 0 ) exitWith { ["This is currently disabled.", false] spawn domsg; };

	if(cash_in_hand < 50) exitWith {hint "You do not have enough cash to join the game, you need $50!.";};

	if (joinmode isEqualTo 0) then {
		_PUID = getPlayerUID player;
		_spielerGeld = cash_in_hand;
		hint "A request has been sent to the server, please wait a moment.";
		[_PUID,_spielerGeld] remoteExec ["TON_fnc_paintball",2];
		joinmode = 1;
	} else {
		hint "You are already in the lobby..!";
	};

};






fnc_deletefire = { 
	thefire1 call fnc_deleteFire2;
	_status = _this select 0;
	if(_status == "cleaned") then {
		fire_loc1 = [0,0,0.1];
	};
};

//fire 
fnc_deletefire2 = {  
 	_unit = _this;
	{ if (typeOf _x == "#particlesource") then { _x setdamage 1; deleteVehicle _x; } } forEach (_unit nearObjects 10);  
};  

fnc_startfire = {    
	["standard"] spawn fnc_deletefire;
	sleep 1;
	thefire1 = "test_EmptyObjectForFireBig" createVehicleLocal fire_loc1;  
};

fnc_police_fire = {
	["WIADOMOSCI: Bank u grodzkiej pali sie!", false] spawn domsg; 
	fire_loc1 = [8731,7232,0.1];
	[] spawn fnc_startfire;
};

fnc_bank_fire = {
["WIADOMOSCI: Bank Lakeside pali sie!", false] spawn domsg; 
	fire_loc1 = [8531,6621,0.1];
	[] spawn fnc_startfire;
};

fnc_wheat_fire = {
["WIADOMOSCI: Pole pszenicy pali sie!", false] spawn domsg; 
	fire_loc1 = [8712,6595,0.1];
	[] spawn fnc_startfire;	
};

fnc_tiki_fire = {
["WIADOMOSCI: Bar Tiki Tiki pali sie!", false] spawn domsg; 
	fire_loc1 = [7121,5400,0.1];
	[] spawn fnc_startfire;	
};

fnc_donuts_fire = {
["WIADOMOSCI: Dunkin Donuts pali sie!", false] spawn domsg; 
	fire_loc1 = [8679,6747,0.1];
	[] spawn fnc_startfire;	
};

fnc_pizza_fire = {
["WIADOMOSCI: Pizzeria w Lakeside pali sie!", false] spawn domsg; 
	fire_loc1 = [8583,6613,0.1];
	[] spawn fnc_startfire;	
};

fnc_morrison_fire = {
["WIADOMOSCI: Wielobranzowy w Morisson pali sie!", false] spawn domsg; 
	fire_loc1 = [5221,2854,0.1];
	[] spawn fnc_startfire;	
};

fnc_prison_fire = {
["WIADOMOSCI: Wiezienie pali sie!", false] spawn domsg; 
	fire_loc1 = [9646,10041,0.1];
	[] spawn fnc_startfire;	
};

fnc_searched =
{
	_handle = [player,false] spawn life_fnc_dropItems;
	waitUntil {scriptDone _handle};
	life_carryWeight = 0;
};
	
fnc_spikeStrip_cg = {
	private["_nearVehicles","_spikeStrip","_Obj"];

	_mydir = (getdir player);
	_obj = [player, 3.4, _myDir ] call BIS_fnc_relPos; 	
	if(_myDir > 30 && _myDir < 181) then {
		_obj = [player, 4.4, _myDir ] call BIS_fnc_relPos; 
	};
	if(_myDir > 240 && _myDir < 341) then {
		_obj = [player, 2.2, _myDir ] call BIS_fnc_relPos; 	
	};
	_spikeStrip = createVehicle ["CG_Spikes_Extended", _obj,[], 0, "CAN_COLLIDE"];
	_spot = getPos _spikeStrip;
	_spikestrip setdir (_myDir - 180);
	_spikeStrip setVectorUp surfaceNormal _spot;

	waitUntil { uiSleep 0.05; _nearVehicles = nearestObjects[getPos _spikeStrip,["Car"],7]; ( count _nearVehicles > 0 || isNull _spikeStrip || player distance _spikestrip > 250 || deadPlayer ) };
	deletevehicle _spikestrip;
	if(count _nearVehicles > 0) then { _vehicle = _nearvehicles select 0; [_vehicle] remoteExecCall ["life_fnc_spikeStripEffect",_vehicle]; };
};


//Because fuck public variables and being tidy.
fnc_CurrentCallMenu = {
	if(!callInProgress) exitwith { ["Nie jestes w rozmowie!", false] spawn domsg;  };
	closedialog 0;
	private["_display","_list","_side"];
	disableSerialization;
	_myID = player getVariable "PhoneID";
	createdialog "Life_CurrentPhoneCall_Menu";
	waitUntil {!isNull (findDisplay 5337)};
	_display = findDisplay 5337;
	_list = _display displayCtrl 5338;
	lbClear _list;
	{
		_userID = _x getvariable "PhoneID";
		if( _userID == _myID && _x != player) then {
			_side = switch(side _x) do {case west: {"Cop"}; case east : {"Mafia"}; case civilian : {"Civ"}; case independent : {"Medic"}; default {"Unknown"}; };
			_list lbAdd format["%1 - %2", name _x,_side];
			_list lbSetdata [(lbSize _list)-1,str(_x)];
		};
	} foreach playableUnits;
};


fnc_CallMenu = {
	private["_display","_list","_side"];
	disableSerialization;
	createdialog "Life_PhoneCall_Menu";
	waitUntil {!isNull (findDisplay 5337)};
	_display = findDisplay 5337;
	_list = _display displayCtrl 5338;
	lbClear _list;
	{
		if(_x != player) then {
			_side = switch(side _x) do {case west: {"Cop"}; case east : {"Mafia"}; case civilian : {"Civ"}; case independent : {"Medic"}; default {"Unknown"}; };
			_list lbAdd format["%1 - %2", name _x,_side];
			_list lbSetdata [(lbSize _list)-1,str(_x)];
		};
	} foreach playableUnits;

	if(side player != civilian) then {
			player setvariable["PhoneCallNumber",0,true];
			player setvariable["PhoneID",0,true];
			callInProgress = false;
			myCallOwner = player;
			_mynumber = getPlayerUID player;
			_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
			_channel = _channel + 1;
			[(call TFAR_fnc_activeSwRadio), _channel, _mynumber] call TFAR_fnc_SetChannelFrequency;
			call TFAR_fnc_HideHint;
	};


};

fnc_callSomebody = {
	private["_unit"];
	_unit = lbData[5338,lbCurSel (5338)];
	_unit = call compile format["%1", _unit];
	closeDialog 0;
	if(isNil "_unit") exitwith {};
	if(isNull _unit) exitWith {};
	if(tryingcall) exitwith { ["Poczekaj zanim znowu dodasz kogos do rozmowy - ktos sie laczy z poleczeniem!", false] spawn domsg; };
	if(PhonesRinging) exitwith { ["Poczekaj zanim znowu dodasz kogos do rozmowy - ktos sie laczy z poleczeniem!", false] spawn domsg; };
	[] spawn fnc_checkCall;
	myCallOwner remoteExec ["fnc_ringPlayer",_unit];
};

fnc_checkCall = {
	tryingcall = true;
	private["_total","_endme","_newTotal"];
	_endme = 0;
	_total = myCallOwner getVariable "PhonecallNumber";
	_newTotal = _total + 1;
	if(_total == 0) then {
		while{tryingCall} do {
			playSound "cgphone_call";
			sleep 5;
			_endme = _endme + 5;
			_total = myCallOwner getVariable "PhonecallNumber";
			if(_total == 1) exitwith { [] call fnc_answered; player call fnc_answercall; playSound "cgphone_static"; };
			if(_endme > 20) exitwith { [] call fnc_noanswer; };
		};
	} else {
		while{tryingCall} do {
			playSound "cgphone_call";
			sleep 5;
			_endme = _endme + 5;
			_total = myCallOwner getVariable "PhonecallNumber";
			if(_total == _newTotal) exitwith { [] call fnc_answered; };
			if(_endme > 20) exitwith { [] call fnc_noanswer; };
		};	
	};
	tryingcall = false;
};
 
fnc_answered = {
	playSound "cgphone_click";
	["Ktos dolaczyl do Twojej rozmowy!", false] spawn domsg; 
};

fnc_noanswer = {
	playSound "cgphone_hangup";
	["Nie odebral od Ciebie polaczenia!", false] spawn domsg; 
};

fnc_busyAnswer = {
	tryingcall = false;
	playSound "cgphone_hangup";
	["Ta osoba jest zajeta - napisz SMSa!", false] spawn domsg; 
};


fnc_ringPlayer = {
	CurrentCaller = _this;
	_radios = player call TFAR_fnc_radiosList;
	if(count _radios > 0) then {
		if( phoneDisabled ) exitwith { currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["Polaczenie od %1 trafilo do rejestru polaczen (Wylaczony telefon)",name CurrentCaller], false] spawn domsg; };	
		if( callInProgress || PhonesRinging ) exitwith { currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["Polaczenie od %1 trafilo do rejestru polaczen (W rozmowie) ",name CurrentCaller], false] spawn domsg; };	
		if( life_battery < 5 ) exitwith { currentCaller remoteExec ["fnc_busyAnswer",currentCaller]; [format["Polaczenie od %1 trafilo do rejestru polaczen (Slaba bateria) ",name CurrentCaller], false] spawn domsg; };

		PhonesRinging = true;
		_endme = 0;
		while{PhonesRinging} do {
			playSound "cgphone_call";
			[format["Dzwoni do Ciebie %1!",name currentcaller], false] spawn domsg; 
			sleep 5;
			_endme = _endme + 5;
			if(_endme > 20) exitwith { ["Nie odebrales polaczenia!", false] spawn domsg;  };
		};

		PhonesRinging = false;		
	} else {
		currentCaller remoteExec ["fnc_busyAnswer",currentCaller];
		["Nie odebrales telefonu!", false] spawn domsg; 
	};
};

fnc_answercall = {
	PhonesRinging = false;	
	myCallOwner = _this;
	myPhoneCall = getPlayerUID myCallOwner;
	player setvariable["PhoneID",myPhoneCall,true];
	player setVariable ["tf_unable_to_use_radio", false];
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, myPhoneCall] call TFAR_fnc_SetChannelFrequency;
	call TFAR_fnc_HideHint;
	_total = myCallOwner getVariable "PhonecallNumber";
	_total = _total + 1;	
	myCallOwner setvariable["PhoneCallNumber",_total,true];
	[] spawn fnc_callProgress;
};

fnc_callProgress = {
	callInProgress = true;
	[] spawn {
		while{callInProgress} do {
			_total = myCallOwner getVariable "PhonecallNumber";
			playSound "cgphone_static";
			_total = _total / 2;
			["cash","take",_total] call life_fnc_handleCash;
			[format["Operator pobral $%1 za ta rozmowe!",_total], false] spawn domsg;
			sleep 140;
		};
	};
	[] spawn {
		sleep 7;
		while{callInProgress} do {
			if( isNull myCallOwner ) exitwith { [] call fnc_resetcall; };
			_total = myCallOwner getVariable "PhonecallNumber";	
			if( _total < 2 ) exitwith { [] call fnc_resetcall; };
			if( deadPlayer && myCallOwner != player ) exitwith { ["Polaczenie rozlaczone (Jestes nieprzytomny)", false] spawn domsg; [] call fnc_hangup };	
			if( life_battery < 5 ) exitwith { ["Polaczenie rozlaczone (Slaba bateria)", false] spawn domsg; [] call fnc_hangup };	
			sleep 5;
		};
	};
};

fnc_speakermode = {
	_stereo = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwSpeakers;
	if(_stereo) then {
		["Wylaczyles tryb glosny!", false] spawn doquickmsg;
	} else {
		["Wlaczyles tryb glosny!", false] spawn doquickmsg;
	};
	[call TFAR_fnc_ActiveSWRadio] call TFAR_fnc_setSwSpeakers;
};

fnc_iVol = {
	_volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
	_volume = _volume + 1;
	if(_volume > 10) then { _volume = 10; };
	[format["Glosnosc: %1",_volume], false] spawn doquickmsg;
	[(call TFAR_fnc_ActiveSWRadio), _volume] call TFAR_fnc_setSwVolume;
};

fnc_dVol = {
	_volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
	_volume = _volume - 1;
	if(_volume < 1) then { _volume = 1; };
	[format["Glosnosc: %1",_volume], false] spawn doquickmsg;
	[(call TFAR_fnc_ActiveSWRadio), _volume] call TFAR_fnc_setSwVolume;
};

fnc_resetCall = {
	if(side player == west) exitwith { [] call fnc_ChangePolice; };
	if(side player == independent) exitwith { [] call fnc_ChangeEMS; };
	playSound "cgphone_hangup";
	player setvariable["PhoneCallNumber",0,true];
	player setvariable["PhoneID",0,true];
	callInProgress = false;
	myCallOwner = player;
	_mynumber = getPlayerUID player;
	if(side player == civilian) then {
		player setVariable ["tf_unable_to_use_radio", true];
	};
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, _mynumber] call TFAR_fnc_SetChannelFrequency;
	call TFAR_fnc_HideHint;
};

fnc_hangup = {
	if(CallInProgress) then
	{
		playSound "cgphone_hangup";
		if(player == myCallOwner) exitwith {
			[] call fnc_resetcall;
			callInProgress = false;
		};
		_total = myCallOwner getVariable "PhonecallNumber";
		_total = _total - 1;
		myCallOwner setvariable["PhoneCallNumber",_total,true];
		[] call fnc_resetcall;
		callInProgress = false;
	};
};

fnc_phoneDisabled = {
	if(PhoneDisabled) then {
		PhoneDisabled = false;
		["Wlaczyles polaczenia z Twoim telefonem!", false] spawn domsg; 
	} else {
		PhoneDisabled = true;
		["Wylaczyles polaczenia z Twoim telefonem!", false] spawn domsg; 
	};	
};

fnc_trycall = {
	if(callInProgress) exitwith { 
		["Probujesz dodac kogos do obecnej rozmowy!", false] spawn domsg; 
		[] call fnc_callMenu; 
	};
	if(PhonesRinging) exitwith { 
		["Lacze z rozmowca..", false] spawn domsg; 
		CurrentCaller spawn fnc_answerCall;
	};
	if(TryingCall) exitwith { 
		["Prosze poczekac az obecne polaczenie skonczy sie!", false] spawn domsg; 
	};

	["Dzwonisz do kogos!", false] spawn domsg; 
	[] call fnc_callMenu; 

};


fnc_tryhangup = {
	if(PhonesRinging) exitwith { 
		PhonesRinging = false;
		["Wyslano sygnal zajety.", false] spawn domsg; 
		[] call fnc_hangup; 
	};

	if(tryingCall) exitwith {
		tryingcall = FALSE;
		["Rozlaczam polaczenie.", false] spawn domsg; 
		[] call fnc_resetcall;
	};

	if(myCallOwner == player) exitwith {
		["Rozlaczam polaczenie.", false] spawn domsg; 
		[] call fnc_resetcall;	
	};

	if(callInProgress) exitwith { 
		["Rozlaczam polaczenie.", false] spawn domsg; 
		[] call fnc_hangup; 
	};


	["Resetuje liste polaczen.", false] spawn domsg; 
	[] call fnc_resetcall; 

};

fnc_stereoRotation = {
	_stereo = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getCurrentSwStereo;
	_stereo = _stereo + 1;
	if(_stereo > 2) then { _stereo = 0; };
	[(call TFAR_fnc_ActiveSWRadio), _stereo] call TFAR_fnc_setSwStereo;
	if(_stereo == 0) exitwith { ["Stereo wlaczone.", false] spawn doquickmsg; };
	if(_stereo == 1) exitwith { ["Dzwiek tylko na lewe ucho.", false] spawn doquickmsg; };
	if(_stereo == 2) exitwith { ["Dzwiek tylko na prawe ucho.", false] spawn doquickmsg; };	
};

fnc_ChangeEMS = {
	if(side player == civilian || side player == east) exitwith {};
	player setvariable["PhoneCallNumber",33.1,true];
	player setvariable["PhoneID",33.1,true];
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, 33.1] call TFAR_fnc_SetChannelFrequency;
	callInProgress = false;
	myCallOwner = player;
	player setVariable ["tf_unable_to_use_radio", false];
	call TFAR_fnc_HideHint;
	["Jestes na czestotliwosci EMS!", false] spawn domsg;
};
fnc_ChangeDOC = {
	if(side player == civilian || side player == east) exitwith {};
	player setvariable["PhoneCallNumber",33.2,true];
	player setvariable["PhoneID",33.2,true];
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, 33.2] call TFAR_fnc_SetChannelFrequency;
	callInProgress = false;
	myCallOwner = player;
	player setVariable ["tf_unable_to_use_radio", false];
	call TFAR_fnc_HideHint;
	["Jestes na czestotliwosci DOC!", false] spawn domsg;
};
fnc_ChangePolice = {
	if(side player == civilian || side player == east) exitwith {};
	player setvariable["PhoneCallNumber",33.3,true];
	player setvariable["PhoneID",33.3,true];
	_channel = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwChannel;
	_channel = _channel + 1;
	[(call TFAR_fnc_activeSwRadio), _channel, 33.3] call TFAR_fnc_SetChannelFrequency;
	callInProgress = false;
	myCallOwner = player;
	player setVariable ["tf_unable_to_use_radio", false];
	call TFAR_fnc_HideHint;
	["Jestes na policyjnej czestotliwosci!", false] spawn domsg;
};


fnc_dynamiteScript = {
	private["_catch"];
	player playmove "AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthEnd";
	sleep 1;
	_dirAdd = (-30) + random(60);
	_speed = 20; 
	_Dir = (getdir player) + _dirAdd; 
	_vehicle = createVehicle ["vvv_anzuelo", [getpos player select 0, getpos player select 1, (getpos player select 2) + 3],[], 0, "CAN_COLLIDE"];
	_vel = velocity _vehicle;
	_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2) + 12];
	playSound3D ["CG_Jobs\sounds\exp\exp.ogg", player, false, getPosASL player, 11, 1, 35]; 


	sleep 2.5;

	if!(surfaceIsWater (getpos _vehicle)) exitwith {
		hint "You lost your dynamite!";
		deletevehicle _vehicle;
	};

	_catchPos = (getpos _vehicle);
	hint "Successful Throw - Stand Back!";


	sleep 8;
	"R_60mm_HE" createvehicle [(getpos _vehicle select 0)-2,(getpos _vehicle select 1)+1,(getpos _vehicle select 2)-3];
	"R_60mm_HE" createvehicle [(getpos _vehicle select 0),(getpos _vehicle select 1)+4,(getpos _vehicle select 2)-1];
	"R_60mm_HE" createvehicle [(getpos _vehicle select 0)+3,(getpos _vehicle select 1),(getpos _vehicle select 2)-1];

	deletevehicle _vehicle;


	hint "Get close to pick up your catch!";

	_timeout = 60; 
	while{true} do {
		_timeout = _timeout - 1;
		if(player distance _catchPos < 9) exitwith { _catch = true; };
		if(_timeout < 1) exitwith { _catch = false; };
		sleep 0.5;
	};
	if(_catch) then {
		playSound3D ["vvv_fishingrod\sounds\splash.ogg", player, false, getPosASL player, 51, 1, 45];
	hint "You picked up your catch!";
	_amount = 1 + random(25);
		while{_amount > 0} do {
			_type = floor (random(5));
			switch (_type) do
			{
				case 0 :
				{
					player additem "Fish_1_i"; 
				};
				case 1 :
				{
					player additem "Fish_1_i"; 
				};
				case 2 :
				{
					player additem "Fish_2_i"; 
				};
				case 3 :
				{
					player additem "Fish_3_i"; 
				};
				case 4 :
				{
					player additem "Fish_4_i"; 
				};
				case 5 :
				{
					player additem "Fish_5_i"; 
				};

				default
				{
				};
			};	
			_amount = _amount - 1;	
		};		
	} else { hint "You didnt pick up your fish in time!";};				
};

fnc_castScript = {
	player playmove "AwopPercMstpSgthWrflDnon_start1";
	sleep 1;
	_dirAdd = (-30) + random(60);
	_speed = 20; 
	_Dir = (getdir player) + _dirAdd; 
	_vehicle = createVehicle ["vvv_anzuelo", [getpos player select 0, getpos player select 1, (getpos player select 2) + 3],[], 0, "CAN_COLLIDE"];
	_vel = velocity _vehicle;
	_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2) + 12];
	playSound3D ["vvv_fishingrod\sounds\cast2.ogg", player, false, getPosASL player, 5, 1, 35]; 


	sleep 2.5;

	if!(surfaceIsWater (getpos _vehicle)) exitwith {
		hint "You lost your bait!";
		deletevehicle _vehicle;
	};

	hint "Pomyslnie zarzucono!";
	playSound3D ["vvv_fishingrod\sounds\splash.ogg", player, false, getPosASL _vehicle, 25, 1, 85];

	_timeOut = 0;
	_total = random(6);
	_myStartSpot = getpos player;
	_fail = false;

	while{true} do {
		sleep 3;
		_timeOut = _timeOut + 3;
		if(_timeOut > _total) exitwith {};
		if(_myStartSpot distance player > 25) exitwith { _fail = true; };
	};

	if(_fail) exitwith {
		hint "Zgubiles przynete poniewaz za bardzo sie oddaliles!";
		deletevehicle _vehicle;
	};

	_Dir = _Dir - 180; 
	_vel = velocity _vehicle;
	_speed = 22;

	_timeOut = 0;
	playSound3D ["vvv_fishingrod\sounds\splash.ogg", player, false, getPosASL _vehicle, 25, 1, 85];
	sleep 0.5;
	playSound3D ["vvv_fishingrod\sounds\wind2.ogg", player, false, getPosASL player, 5, 1, 35]; 

	player playmove "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon_gear";

	while{_timeOut < 12 && _vehicle distance player > 5} do {
		_vehicle setpos [getpos _vehicle select 0, getpos _vehicle select 1, (getpos _vehicle select 2) + 0.2];
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2) + random(2)];
		sleep 1;
		_timeOut = _timeOut + 1;
		player playaction "CRPTHSForwardStandLowered";
	};

	playSound3D ["vvv_fishingrod\sounds\splash.ogg", player, false, getPosASL player, 5, 1, 45];
	player addmagazine "cebos";
	deletevehicle _vehicle;

	_type = floor (random(25));

	switch (_type) do
	{
		case 0 :
		{
			player additem "Fish_1_i"; 
			hint "Zlowiles rybe!";
		};
		case 1 :
		{
			player additem "Fish_1_i"; 
			hint "Zlowiles rybe!";
		};
		case 2 :
		{
			player additem "Fish_2_i"; 
			hint "Zlowiles rybe!";
		};
		case 3 :
		{
			player additem "Fish_3_i"; 
			hint "Zlowiles rybe!";
		};
		case 4 :
		{
			player additem "Fish_4_i"; 
			hint "Zlowiles rybe!";
		};
		case 5 :
		{
			player additem "Fish_5_i"; 
			hint "Zlowiles rybe!";
		};
		case 6 :
		{
			player additem "Fish_1_i"; 
			hint "Zlowiles rybe!";
		};
		case 7 :
		{
			player additem "Fish_2_i"; 
			hint "Zlowiles rybe!";
		};
		case 8 :
		{
			player additem "Fish_3_i"; 
			hint "Zlowiles rybe!";
		};
		case 9 :
		{
			player additem "Fish_4_i"; 
			hint "Zlowiles rybe!";
		};
		case 10 :
		{
			player additem "Fish_5_i"; 
			hint "Zlowiles rybe!";
		};

		default
		{
			hint "Nie udalo Ci sie zlowic czegos!";
		};

	};										
};


fnc_cutWood = {
	 trees = [];      
		 { if (str _x find ": t_" > -1) then { trees pushBack _x; }; } forEach nearestObjects [player, [], 15];     

		 if(count trees > 0) then {   
		_sound = round(random 5);
		switch(_sound) do {
			case 0: {
				playSound3D ["CG_Jobs\sounds\woodchop\woodchop1.ogg", player, false, getPosasl (trees select 0), 3, 1, 45];
			};
			case 1: {
				playSound3D ["CG_Jobs\sounds\woodchop\woodchop2.ogg", player, false, getPosasl (trees select 0), 3, 1, 45];
			};
			case 2: {
				playSound3D ["CG_Jobs\sounds\woodchop\woodchop3.ogg", player, false, getPosasl (trees select 0), 3, 1, 45];
			};
			case 3: {
				playSound3D ["CG_Jobs\sounds\woodchop\woodchop4.ogg", player, false, getPosasl (trees select 0), 3, 1, 45];
			};
			case 4: {
				playSound3D ["CG_Jobs\sounds\woodchop\woodchop5.ogg", player, false, getPosasl (trees select 0), 3, 1, 45];
			};
			default {
				playSound3D ["CG_Jobs\sounds\woodchop\woodchop1.ogg", player, false, getPosasl (trees select 0), 3, 1, 45];
			};		 				 				 		
		};	

		 _treeCutChance = round(random 5);
		 if(_treeCutChance > 4) then {
		 	[] spawn {
			 	_sound = round(random 2);
			 	switch(_sound) do {
			 		case 0: {
			 			playSound3D ["CG_Jobs\sounds\treefall\treefall1.ogg", player, false, getPosasl (trees select 0), 11, 1, 45];
			 		};
			 		case 1: {
			 			playSound3D ["CG_Jobs\sounds\treefall\treefall2.ogg", player, false, getPosasl (trees select 0), 11, 1, 45];
			 		};
			 		default {
			 			playSound3D ["CG_Jobs\sounds\treefall\treefall1.ogg", player, false, getPosasl (trees select 0), 11, 1, 45];
			 		};	
			 	};		
			 	_tree = (trees select 0);
			 	sleep 3; 		
				//_tree setdamage 1; sleep 2; [_tree,true] remoteExecCall ["hideobjectglobal",2]; 
				//[] call fnc_packLogs;
		 	};
		};
	};	
};

fnc_refineWood = {
	if(vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { hint "Your truck is too far away!"; }; 
	{ 
		if(_x distance vehspawned < 11) then {
			deletevehicle _x; 
			_sound = round(random 5);
			playSound3D ["CG_Jobs\sounds\sawing\saw.ogg", player, false, getPosasl player, 7, 1, 25];
			player additem "CG_Refined_Wood";	
			sleep 1.5;
			hint "You are refining wood, stay still!"
		};
	} forEach attachedObjects vehspawned;
	hint "Wood refined & placed in inventory";  
	totalLogs = 0;
};

fnc_packLogs = {
	if( vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { hint "Your truck is too far away!"; }; 
	if(totalLogs == 23) exitwith { hint "Load is full!"; };
	mylog = createVehicle ["vvv_tronco", position player, [], 0, "NONE"];

	totalLogs = totalLogs + 1;

	if(totalLogs == 1) exitwith {
		mylog attachTo [vehspawned, [-1, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 2) exitwith {
		mylog attachTo [vehspawned, [-0.5, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 3) exitwith {	
		mylog attachTo [vehspawned, [0, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 4) exitwith {	
		mylog attachTo [vehspawned, [0.5, -3.5, 1.3] ]; mylog setdir 90;
	};
	if(totalLogs == 5) exitwith {
		mylog attachTo [vehspawned, [1, -3.5, 1.3] ];mylog setdir 90;
	};
	if(totalLogs == 6) exitwith {
		mylog attachTo [vehspawned, [-0.8, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 7) exitwith {
		mylog attachTo [vehspawned, [-0.3, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 8) exitwith {
		mylog attachTo [vehspawned, [0.3, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 9) exitwith {
		mylog attachTo [vehspawned, [0.8, -3.5, 1.6] ]; mylog setdir 90;
	};
	if(totalLogs == 10) exitwith {
		mylog attachTo [vehspawned, [-1, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 11) exitwith {
		mylog attachTo [vehspawned, [-0.5, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 12) exitwith {
		mylog attachTo [vehspawned, [0, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 13) exitwith {
		mylog attachTo [vehspawned, [0.5, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 14) exitwith {
		mylog attachTo [vehspawned, [1, -3.5, 1.9] ]; mylog setdir 90;
	};
	if(totalLogs == 15) exitwith {
		mylog attachTo [vehspawned, [-0.8, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 16) exitwith {
		mylog attachTo [vehspawned, [-0.3, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 17) exitwith {
		mylog attachTo [vehspawned, [0.3, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 18) exitwith {
		mylog attachTo [vehspawned, [0.8, -3.5, 2.2] ]; mylog setdir 90;
	};
	if(totalLogs == 19) exitwith {
		mylog attachTo [vehspawned, [-1, -3.5, 2.5] ]; mylog setdir 90;
	};
	if(totalLogs == 20) exitwith {
		mylog attachTo [vehspawned, [-0.5, -3.5, 2.5] ]; mylog setdir 90;
	};
	if(totalLogs == 21) exitwith {
		mylog attachTo [vehspawned, [0, -3.5, 2.5] ]; mylog setdir 90;
	};
	if(totalLogs == 22) exitwith {
		mylog attachTo [vehspawned, [0.5, -3.5, 2.5] ];mylog setdir 90;
	};
	if(totalLogs == 23) exitwith {
		mylog attachTo [vehspawned, [1, -3.5, 2.5] ]; mylog setdir 90;
	};
};



fnc_gatherOil = {
	if(life_spam_my_dick == 1) exitWith {};
	OilRigs = nearestObjects [player, ["oilrig_base"], 20];  
	if(count oilRigs > 0) then { 
		life_spam_my_dick = 1;
		_calcT = 0;
		while {true} do {
			_calcT = _calcT + 1;
			if(_calcT > 25) exitwith {};
			uisleep 1;
			hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>Waiting for Oil to be Loaded</t><br/> %1 of 25 seconds.",_calcT];
		};
		myOil = createVehicle ["Land_MetalBarrel_F", getpos player, [], 0, "NONE"];  
		myOil attachTo [vehspawned, [0, 0.8, 0.85] ]; 
		hint "You have received a load of oil, take it to the three cranes at the docks for transport.";
	};
	life_spam_my_dick = 0;
};


fnc_unloadOil = {
	Cranes = nearestObjects [player, ["land_reservoirtank_airport_f"], 150];
	if(count Cranes > 0) then { 
		deletevehicle vehspawned;
		deletevehicle myoil;
		vehspawned = createVehicle ["Jonzie_Tanker_Truck", getpos (cranes select 0), [], 0, "NONE"];
		player moveInDriver vehspawned;
	};
};


fnc_OilReceive = {
	deletevehicle vehspawned;
	player additem "CG_OilCanister";
	player additem "CG_OilCanister";
	player additem "CG_OilCanister";
};


fnc_mineMetal = {

	 metals = nearestObjects [player, ["a3l_Bits_Rock_L_Iron","a3l_Bits_Rock_L_Coal","a3l_Bits_Rock_L_Diamond"], 5];     
	 if(carryingOre > 0) exitwith { hint "You are already carrying Ore, take it to your truck." };

	if(count metals > 0) then {   

		_vehicle = metals select 0;

		 if (isNull attachedTo (metals select 0)) then {

		_sound = round(random 5);

			switch(_sound) do {
				case 0: {
					playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl (metals select 0), 11, 1, 33];
				};
				case 1: {
					playSound3D ["CG_Jobs\sounds\mining\mine2.ogg", player, false, getPosasl (metals select 0), 11, 1, 33];
				};
				case 2: {
					playSound3D ["CG_Jobs\sounds\mining\mine5.ogg", player, false, getPosasl (metals select 0), 11, 1, 33];
				};
				case 3: {
					playSound3D ["CG_Jobs\sounds\mining\mine2.ogg", player, false, getPosasl (metals select 0), 11, 1, 33];
				};
				case 4: {
					playSound3D ["CG_Jobs\sounds\mining\mine5.ogg", player, false, getPosasl (metals select 0), 11, 1, 33];
				};
				default {
					playSound3D ["CG_Jobs\sounds\mining\mine1.ogg", player, false, getPosasl (metals select 0), 11, 1, 33];
				};		 				 				 		
			};

			_cutChance = round(random 150);
			if(_cutChance > 140) then { [_vehicle,true] remoteExecCall ["hideobjectglobal",2];  };
			if(typeOf _vehicle == "a3l_Bits_Rock_L_Coal" && _cutChance > 120) then {
				carryingOre = 1;
				playSound3D ["CG_Jobs\sounds\mining\mineF2.ogg", player, false, getPosasl (metals select 0), 25, 1, 45];
				mybarrow = createVehicle ["land_wheelcart_f", [0,0,0], [], 0, "NONE"];
				mybarrow attachto [player, [0, 1.3, 0.5] ];
				myIron = createVehicle ["a3l_Bits_Rock_L_Coal", getpos player, [], 0, "NONE"];  
				myIron attachTo [myBarrow, [0, 0.8, 0.85] ]; 
			};

			if(typeOf _vehicle == "a3l_Bits_Rock_L_Iron" && _cutChance > 80) then {
				carryingOre = 3;
				playSound3D ["CG_Jobs\sounds\mining\mineF2.ogg", player, false, getPosasl (metals select 0), 25, 1, 45];
				mybarrow = createVehicle ["land_wheelcart_f", [0,0,0], [], 0, "NONE"];
				mybarrow attachto [player, [0, 1.3, 0.5] ];
				myIron = createVehicle ["a3l_Bits_Rock_L_Iron", getpos player, [], 0, "NONE"];  
				myIron attachTo [myBarrow, [0, 0.8, 0.85] ]; 
			};

			if(typeOf _vehicle == "a3l_Bits_Rock_L_Diamond" && _cutChance > 1) then {
				carryingOre = 6;
				playSound3D ["CG_Jobs\sounds\mining\mineF2.ogg", player, false, getPosasl (metals select 0), 25, 1, 45];
				mybarrow = createVehicle ["land_wheelcart_f", [0,0,0], [], 0, "NONE"];
				mybarrow attachto [player, [0, 1.3, 0.5] ];
				myIron = createVehicle ["a3l_Bits_Rock_L_Diamond", getpos player, [], 0, "NONE"];  
				myIron attachTo [myBarrow, [0, 0.8, 0.85] ]; 
			};

		};
	};	
};

fnc_refineMetal1 = {
	totalLogs = 0;
	if(vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { hint "Your truck is too far away!"; }; 
	{ 
		if(_x distance vehspawned < 11) then {
			deletevehicle _x; 
			_sound = round(random 5);
			playSound3D ["CG_Jobs\sounds\mining\mineF2.ogg", player, false, getPosasl player, 31, 1, 15];
			sleep 1.5;
			hint "You are refining Ore, stay still!";
			[] spawn fnc_packMetal2;
		};
	} forEach attachedObjects vehspawned;
};

fnc_refineMetal2 = {
	totalLogs = 0;
	if(vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { hint "Your truck is too far away!"; }; 
	{ 
		if(_x distance vehspawned < 11) then {
			deletevehicle _x; 
			_sound = round(random 5);
			playSound3D ["CG_Jobs\sounds\mining\mineF2.ogg", player, false, getPosasl player, 31, 1, 15];
			sleep 1.5;
			hint "You are refining Metal, stay still!";

			_chance = (floor random 2);
			switch (_chance) do
			{
			   case 2 : {
			  	 	player additem "CG_SilverBar";
			   };
			   case 1 : {
			   		player additem "CG_MetalBar";
			   };
			   case 0 : {
			   		player additem "CG_SteelBar";
			   };
			   default {
			   		player additem "CG_SteelBar";
			   };
		   };

		};
	} forEach attachedObjects vehspawned;
	hint "Refined Metal placed in inventory";  
};

fnc_packMetal1 = {
	if(carryingOre == 0) exitwith { hint "You have no ore"; };
	if(vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { hint "Your truck is too far away!"; }; 
	if(totalLogs == 6) exitwith { hint "Load is full!"; deletevehicle mybarrow; deletevehicle myIron; carryingOre = 0; };
	mylog = myIron;
	deletevehicle mybarrow;
	totalLogs = totalLogs + 1;
	carryingOre = 0;

	if(totalLogs == 1) exitwith {
		mylog attachTo [vehspawned, [-0.6, -3.8, 1.7] ]; mylog setdir 90;
	};
	if(totalLogs == 2) exitwith {
		mylog attachTo [vehspawned, [0.6, -3.8, 1.7] ]; mylog setdir 90;
	};
	if(totalLogs == 3) exitwith {	
		mylog attachTo [vehspawned, [-0.6, -2.8, 1.7] ]; mylog setdir 90;
	};
	if(totalLogs == 4) exitwith {	
		mylog attachTo [vehspawned, [0.6, -2.8, 1.7] ]; mylog setdir 90;
	};
	if(totalLogs == 5) exitwith {
		mylog attachTo [vehspawned, [-0.6, -1.8, 1.7] ];mylog setdir 90;
	};
	if(totalLogs == 6) exitwith {
		mylog attachTo [vehspawned, [0.6, -1.8, 1.7] ]; mylog setdir 90;
	};
};


fnc_packMetal2 = {
	if(vehSpawned distance player > 15 || isNil {vehSpawned} || isnull vehSpawned ) exitwith { hint "Your truck is too far away!"; }; 
	if(totalLogs == 6) exitwith { hint "Load is full!"; };
	mylog = createVehicle ["Land_Pipes_large_F", position player, [], 0, "NONE"];

	totalLogs = totalLogs + 1;

	if(totalLogs == 1) exitwith {
		mylog attachTo [vehspawned, [-0.6, -3.8, 1.1] ]; mylog setdir 90;
	};
	if(totalLogs == 2) exitwith {
		mylog attachTo [vehspawned, [0.6, -3.8, 1.1] ]; mylog setdir 90;
	};
	if(totalLogs == 3) exitwith {	
		mylog attachTo [vehspawned, [-0.6, -3.8, 1.7] ]; mylog setdir 90;
	};
	if(totalLogs == 4) exitwith {	
		mylog attachTo [vehspawned, [0.6, -3.8, 1.7] ]; mylog setdir 90;
	};
	if(totalLogs == 5) exitwith {
		mylog attachTo [vehspawned, [-0.6, -3.8, 2.3] ]; mylog setdir 90;
	};
	if(totalLogs == 6) exitwith {
		mylog attachTo [vehspawned, [0.6, -3.8, 2.3] ]; mylog setdir 90;
	};
};






//_weapon = [player, "launch_RPG32_F", 6] call BIS_fnc_addWeapon;

//USED TO OPEN NEAREST JAIL FENCING DOOR WITH HACKING TOOL / HACKDOOR
fnc_hackDoor = {
	if(jailHacking) exitwith {};
	jailHacking = true;
	fencing = nearestObjects [player, ["zac_prison_fence_gate","Land_SatellitePhone_F"],11];
	hint parsetext "<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>STARTING HACK SEQUENCE</t><br/> ACCESS POINT BEING BREACHED.";
	_fenceToOpen = (fencing select 0);
	if(count fencing > 0) then {

		if (_fenceToOpen getVariable ["sirenOn", false]) then {
			playSound3D ["CG_Jobs\sounds\jailbreak\jailAlarm.ogg", _fenceToOpen, false, (getposasl _fenceToOpen), 1.7, 1, 14235];
		} else {
			[_fenceToOpen] remoteExec ["TON_fnc_JailSiren",2];
		};

		totalfencing = totalfencing + 1;
		playSound3D ["CG_Jobs\sounds\jailbreak\hacking.ogg", player, false, (getposasl player), 1, 1, 25];
		_calcT = 0;
		while {true} do {
			_calcT = _calcT + 1;
			if(_calcT > 25) exitwith {};
			uisleep 1;
			hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>MODIFYING SECURITY CELL</t><br/> %1 of 25 seconds.",_calcT];
		};
		playSound3D ["CG_Jobs\sounds\jailbreak\hacking.ogg", player, false, (getposasl player), 3, 1, 55];
		
		if(typeOf _fenceToOpen == "zac_prison_fence_gate") then {
			hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>DATA MODIFIED</t><br/> ACCESS POINT BREACHED.",_calcT];
			_fenceToOpen animate ['Door_1',5];
		} else {
			if(totalfencing < 2) exitwith { hint "You must hack atleast 3 gates to modify this."; };
			hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>MAIN MODULE HACKED</t><br/> 5 MINUTE FULL ACCESS GRANTED.",_calcT];
			player setvariable["coplevel",1,true];
			_calcT = 0;
			while {true} do {
				_calcT = _calcT + 10;
				if(_calcT > 300) exitwith {};
				uisleep 10;
				hint parsetext format["<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>MODIFIED SECURITY CELL</t><br/> Used %1 of 300 seconds.",_calcT];
			};
			player setvariable["coplevel",0,true];
			hint parsetext "<img size='1' image='CG_Jobs\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'SECURITY REVERTED</t><br/> ALL ACCESS HAS BEEN REMOVED.";
			totalfencing = 0;
		};
	};
	jailHacking = false;
};



fnc_sendHook = {
	_height = getposATL player;
	if((_height select 2) > 15) exitwith { hint "You must be on the ground to latch this!"; };
	tower = nearestObjects [player, ["Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F"], 20];
	if(count tower > 0) then {
		godMode = true;
		_dick = (_this select 0);
		_vel = velocity _dick;
		_dir = direction _dick;
		deletevehicle _dick;
		_speed = 115;
		beginPoint = createVehicle ["vvv_anzuelo", player,[], 0, "CAN_COLLIDE"];
		_vehicle = createVehicle ["vvv_anzuelo", [getpos player select 0, getpos player select 1, (getpos player select 2) + 1],[], 0, "CAN_COLLIDE"];
		_vehicle setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)];	
		sleep 1;
		_endpos = getpos _vehicle;
		_endpos2 = getpos (tower select 0);
		endPoint = createVehicle ["vvv_anzuelo", [(_endpos2 select 0), (_endpos2 select 1), (_endpos2 select 2) + 22],[], 0, "CAN_COLLIDE"];

		myRope = ropeCreate [beginPoint, [0,0,0], endPoint, [0,0,0]]; 
		sleep 2;
		[] spawn fnc_climbrope;
	} else {
		hint "You are not close enough to latch on to a tower!";
	};
};



fnc_climbrope = {
	_targetpos = getpos (tower select 0);
	player playmove "AmovPpneMstpSnonWnonDnon";
	_timer = 50;
	_dir = [player, getpos endPoint] call BIS_fnc_dirTo;
	playSound3D ["CG_Jobs\sounds\jailbreak\zipline.ogg", player, false, player, 15, 1, 15];
	while{true} do {
		player setdir _dir;
		sleep 0.15;
		_vel = velocity player;
		_speed = 0.2;
		_height = getposATL player;

		player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2) + 4]; 

		if(player distance endPoint < 5 || _timer == 0 || (_height select 2) > 15) exitwith {};
		_timer = _timer - 1;
	};
	godmode = false;
	player setpos [_targetpos select 0, _targetpos select 1, (_targetpos select 2) + 20];
	deletevehicle endPoint;
	deletevehicle beginPoint;
	deletevehicle myRope;	
};









fnc_useDrugTable = {
	_trailers = nearestObjects [player, ["Ivory_Trailer_01","Ivory_Trailer_02","Ivory_Trailer_03","Ivory_Trailer_04","Ivory_Trailer_05"], 5];    
	if((count _trailers) == 0) exitwith { hint "You must place this carefully in a trailer."; };
	myDT = createVehicle ["itemsdruglab1", [0,0,0], [], 0, "NONE"];
	myDT attachto [player, [0, 1.3, 0.84] ];
	myDrugAction = player addAction [ "Set Table", { [] call fnc_dropDrugTable; } ];
};

fnc_dropDrugTable = {
	_trailers = nearestObjects [player, ["Ivory_Trailer_01","Ivory_Trailer_02","Ivory_Trailer_03","Ivory_Trailer_04","Ivory_Trailer_05"], 5];    
	if((count _trailers) == 0) exitwith { hint "You must place this carefully in a trailer."; };
	detach myDT;
	cookingMeth = true;
	player removeAction myDrugAction;
	hint "Your table is down, be ready to cook!";
	myActionStart = myDT addAction [ "Start Cooking", {  
		[] spawn fnc_methCooking;
		myDrugValue = 100;
		myDT removeaction myActionStart;
		myAction1 = myDT addAction [ "Mix Acetone", { ["Acetone"] call fnc_upMethCooking; } ];
		myAction2 = myDT addAction [ "Mix Pseudoephedrine", { ["Pseudo"] call fnc_upMethCooking; } ];
		myAction3 = myDT addAction [ "Cool Product", { ["Cool"] call fnc_upMethCooking; } ];
		myAction4 = myDT addAction [ "Heat Product", { ["Heat"] call fnc_upMethCooking; } ];
		myAction5 = myDT addAction [ "Release Pressure", { ["Release"] call fnc_upMethCooking; } ];
	} ];
	myActionPack = myDT addAction [ "Pack Up Contents", {  
		deletevehicle myDT;
		cookingMeth = false;
	} ];
};

fnc_upMethCooking = {
	_required = _this select 0;
	if(checkFinish) exitwith { hint "You need to wait before doing that!"; };

	if(animationState player != "Acts_carFixingWheel") then {
		player playmovenow "Acts_carFixingWheel";  
		player disableAI "anim"; 
	};

	if(requiredOutput == _required) then { 
		hint "Looks like it worked! Your meth didnt lose value!"; 
		if(_required == "Acetone" || _required == "Pseudo") then { playSound3D ["CG_Jobs\sounds\meth\drugAdd.ogg", player, false, getPosasl player, 2, 1, 15]; };
		if(_required == "Cool") then { playSound3D ["CG_Jobs\sounds\meth\drugCool.ogg", player, false, getPosasl player, 2, 1, 15]; };
		if(_required == "Heat") then { playSound3D ["CG_Jobs\sounds\meth\drugBoil.ogg", player, false, getPosasl player, 2, 1, 15]; };
		if(_required == "Release") then { playSound3D ["CG_Jobs\sounds\meth\drugPressure.ogg", player, false, getPosasl player, 2, 1, 15]; };
	} else { 
		myDrugValue = myDrugValue - 10; 
		hint "Well, that was wrong.. lets just hope it doesnt blow up?";
		_randomValue = random 30;
		playSound3D ["CG_Jobs\sounds\meth\drugBoil.ogg", player, false, getPosasl player, 5, 1, 15];
		playSound3D ["CG_Jobs\sounds\meth\drugPressure.ogg", player, false, getPosasl player, 5, 1, 15];
		if(_randomValue < 5) exitwith { "R_60mm_HE" createvehicle (getpos player); hint "Well, you messed up!"; };
	};
	checkFinish = true;
};

fnc_methCooking = {
	_count = 0;
	checkFinish = false;
	while{_count < 15 && cookingMeth} do {
		checkFinish = true;
		sleep 30;
		checkFinish = false;
		_randomValue = round(random 5);
		if(_randomValue == 1 || _randomvalue == 0) then { requiredOutput = "Acetone"; _message = AcetoneArray call BIS_fnc_selectRandom; hint _message; };
		if(_randomValue == 2) then { requiredOutput = "Pseudo"; _message = PseudoArray call BIS_fnc_selectRandom; hint _message; };
		if(_randomValue == 3) then { requiredOutput = "Cool"; _message = CoolArray call BIS_fnc_selectRandom; hint _message; };
		if(_randomValue == 4) then { requiredOutput = "Heat"; _message = HeatArray call BIS_fnc_selectRandom; hint _message; };
		if(_randomValue == 5) then { requiredOutput = "Release"; _message = ReleaseArray call BIS_fnc_selectRandom; hint _message; };
		sleep 30;	
		_count = _count + 1;
	};
	cookingMeth = false;
	player removeaction myAction1;
	player removeaction myAction2;
	player removeaction myAction3;
	player removeaction myAction4;
	player removeaction myAction5;
	player removeaction myActionPack;
};

AcetoneArray = ["WARNING: The substance seems too dark!","WARNING: The substance is turning black!","WARNING: The substance has too much color!"];
PseudoArray = ["WARNING: The substance is losing color!","WARNING: The substance is faded!","WARNING: The substance is almost see-thru!"];
CoolArray = ["WARNING: The stove is forcing steam!","WARNING: The stove is burning the table!","WARNING: The room is filling with heat!"];
HeatArray = ["WARNING: The substance isnt flowing properly!","WARNING: The substance is very thick!","WARNING: The substance is looking sticky!"];
ReleaseArray = ["WARNING: The substance is flowing too fast!","WARNING: Steam is trying to escape!","WARNING: The vials are looking very foggy!"];








fnc_trucking = {

	towvehiclelist = ["IVORY_PRIUS","ivory_gt500","ivory_wrx","ivory_lp560","IVORY_R8","IVORY_R8SPYDER","IVORY_REV","ivory_lfa","ivory_c"];


	while{trucking} do {

		["A truck delivery location will be picked shortly!", false] spawn domsg; 
		_jail = false;

	    chosen = ["Truck_Stop_1","Truck_Stop_2","Truck_Stop_3","Truck_Stop_4","Truck_Stop_5","Truck_Stop_6","Truck_Stop_7","Truck_Stop_8","Truck_Stop_9","Truck_Stop_10"] call BIS_fnc_selectRandom;
	    chosen2 = chosen;
	    chosen = (getmarkerpos chosen);
		_distance = player distance chosen;
		_distance = floor (_distance / 1000);

		if(_distance < 1) then { _distance = 1; };
		if(_distance > 8) then { _distance = 8; };	
		_success = false;
		_calcT = 0;
		while {trucking} do {
			_calcT = _calcT + 1;

			if(player distance chosen < 10) exitwith {
				_success = true;
			};
			if(_calcT > 1200) exitwith {};
			uisleep 1;
			hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You have taken %1 of 1200 seconds. <br/> Your job marker is %2",_calcT,chosen2];
		};
		["You are close, stop, jump out and unhitch your trailers!", false] spawn domsg; 
		sleep 3;
		_goodT = _distance * 20;
		_goodT = _goodT - _calcT;
		_payment = _goodT * 50;
		if(_payment < 2300) then { _payment = 2300; };
		if(_payment > 8220) then { _payment = 8220; };
		_groundPhase = 0;
		while {trucking} do {
			if(!_success) exitwith {};
			_groundPhase = _groundPhase + 1;

			if(!_success) exitwith { ["You failed this mission, stay inside your vehicle until you are close enough to the point.", false] spawn domsg; };

			if(vehicle player isEqualTo player && _success && player distance chosen < 35 && (vehspawned distance player < 30) ) exitwith {
				["Add",25] call fnc_karma;
				["bank","add", _payment] call life_fnc_handleCash;
			    [format["You just got paid %1 your delivery!",_payment], false] spawn domsg;
			};

			if(_groundPhase > 600) exitwith { ["You took to long to finish the trailer hitching!", false] spawn domsg;  };
			uisleep 0.1;
		};

		_remaining = 150 - _calcT;
		if(_remaining < 30) then {
			_remaining = 30;
		};
		while {_remaining > 0 && trucking} do {
			hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You will receive a new job in %1 seconds.",_remaining];
			uisleep 1;
			_remaining = _remaining - 1;
		};
	};

	_remaining = 60;

	while {_remaining > 0 && trucking} do {
		hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> Your vehicle despawns in %1 seconds!",_remaining];
		uisleep 1;
		_remaining = _remaining - 1;
	};

	player allowdamage false;
	sleep 1;
	player setpos (getMarkerPos "Truck_Jobs");
	["Your deliveries have finished!", false] spawn domsg;
	player allowdamage true;
};


fnc_startGarbage = {

	private["_oldBinDir","_oldBinPos"];

	_nearBin = nearestObjects[getPos player,["Land_Dumpster_DED_Dumpster_01_F"],6];
	_isBin = count _nearBin;

	if(_isBin > 0) then {

		_isBinSelected = _nearBin select 0;
		_oldBinPos = getpos _isBinSelected;
		_oldBinDir = getdir _isBinSelected;
		deletevehicle _isBinSelected;
		_veh = vehicle player;

		if(_veh == player) exitwith {};
			
		_veh setfuel 0;
		_veh animate ['contenedor_unhide',1];
		_veh animate ['contenedor',1];
		_veh animate ['tapacontenedor',1];
		sleep 3;
		_veh animate ['contenedor',0];
		_veh animate ['tapacontenedor',0];
		sleep 3;
		_veh animate ['contenedor_unhide',0];
		sleep 3;
		_veh animate ['pala',0];
		_veh animate ['hidraulicos',0];
		_veh animate ['hidraulicos2',0];
		sleep 1;
		_veh animate ['porton',1];
		_veh animate ['basura_unhide',1];
		[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
		sleep 7;
		_veh animate ['pala',1];
		_veh animate ['hidraulicos',1];
		_veh animate ['hidraulicos2',1];
		sleep 2;
		[_veh, "Hidraulics",100] call CBA_fnc_globalSay3d;
		_veh animate ['porton',0];
		sleep 7;
		_veh animate ['pala',1];
		_veh animate ['hidraulicos',1];
		_veh animate ['hidraulicos2',1];
		sleep 1;
		_veh animate ['basura_unhide',0];
		_veh setfuel 1;
		sleep 5;
		_newBin = createVehicle ["Land_Dumpster_DED_Dumpster_01_F", _oldBinPos, [], 0, "NONE"];
		_newBin setdir _oldBinDir;

		} else {

		hint "There is no garbage near you!";	

	};

};










fnc_maintstart = {
	if(side player == west) exitwith {};
	player forceAddUniform "TRYK_HRP_USMC";
	_success = true;

	if(farm) then {
		airvehspawned = createVehicle ["ivory_tractor", position player, [], 0, "NONE"];
		[airvehspawned] spawn life_fnc_clearVehicleAmmo;
		oiljobs = [(getpos wheat1),(getpos wheat2),(getpos wheat3),(getpos wheat4),(getpos wheat5),(getpos wheat6),(getpos wheat7),(getpos wheat8),(getpos wheat9),(getpos wheat10),(getpos wheat11),(getpos wheat12),(getpos wheat13),(getpos wheat14),(getpos wheat15),(getpos wheat16),(getpos wheat17)];
		bullshit_story = [
		"Go cut down the wheat in this area!",
		"Spray pesticide on the marker!",
		"Some tools need to be delivered to a work spot! Check your map!",
		"Drop off some food supplies for animals!",
		"Someone reported a fire on our farm? Surely its a joke, check please!",
		"We heard our crops have pests, check it out please!",
		"We have reports of chemical spillage at the marked location, can you check please?"
		];	
	};
	if (oil) then {
		airvehspawned = createVehicle ["ivory_b206", position player, [], 0, "NONE"];
		[airvehspawned] spawn life_fnc_clearVehicleAmmo;
		oiljobs = [(getpos oilrig1),(getpos oilrig2),(getpos oilrig3),(getpos oilrig4),(getpos oilrig5),(getpos oilrig6),(getpos oilrig7)];
		bullshit_story = [
		"A marker has been put down where medical supplies need to be delivered!",
		"Some tools need to be delivered to a work spot! Check your map!",
		"Drop off some food supplies for workers, ASAP please!",
		"Some papers need signing off, take these to the marked location!",
		"We need you to check out workers at this location!",
		"We have reports of oil leakage at the marked location, can you check please?"
		];
	};



	player action ["getInDriver", airvehspawned];
	while{maintenance_on && _success} do {

		if(player distance airvehspawned > 500 || deadPlayer) exitwith {};
		chosen = oiljobs call BIS_fnc_selectRandom;
		[bullshit_story call BIS_fnc_selectRandom, false] spawn domsg; 
		playSound "ringing";
		markerf = createMarkerLocal ["themarker",chosen];
		markerf setMarkerColorLocal "ColorRed";
		markerf setMarkerTypeLocal "Mil_dot";
		markerf setMarkerTextLocal "*** Next Job ***";

		["Maintenance",chosen] spawn fnc_draw3d;

		_distance = player distance chosen;
		_distance = floor (_distance / 1000);

		if(_distance < 1) then { _distance = 1; };
		if(_distance > 8) then { _distance = 8; };	

		_calcT = 0;
		while {maintenance_on} do {
			if(player distance airvehspawned > 500 || deadPlayer) exitwith {};
			_calcT = _calcT + 1;
			markerf setMarkerPosLocal (chosen);

			if(player distance chosen < 100 && oil ) exitwith {
				_success = true;
				["You are close, land safely and finish the work!", false] spawn domsg; 
			};
			if(player distance chosen < 5 && farm && typeOf(vehicle player) == "ivory_tractor") exitwith {
				_success = true;
				["Get close to the marker and finish the work!", false] spawn domsg; 
			};

			if(_calcT > 360) exitwith { _success = false; ["You failed to finish the job!", false] spawn domsg;  };
			uisleep 1;
			hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You have taken %1 seconds.",_calcT];
		};
		hint "";
		sleep 1;

		_goodT = _distance * 7;
		_goodT = _goodT - _calcT;
		_payment = _goodT * 50;



		if(farm) then {
			 _payment = 110;
		};
		if (oil) then {
			if(_payment < 300) then { _payment = 300; };
			if(_payment > 450) then { _payment = 450; };
		};
		_groundPhase = 0;
		while {maintenance_on} do {
			if(player distance airvehspawned > 500 || deadPlayer) exitwith {};
			if(!_success) exitwith {};
			_groundPhase = _groundPhase + 1;
			markerf setMarkerPosLocal (chosen);

			if(!_success) exitwith { ["You failed this mission, stay inside your vehicle until you are close enough to marked point.", false] spawn domsg; };
			if(vehicle player == player && player distance chosen < 55 && oil) exitwith {
				player playmove "AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthEnd"; 
				["bank","add", _payment] call life_fnc_handleCash;
				[format["You just got paid %1 for your help!",_payment], false] spawn domsg;
				["Add",1] call fnc_karma;
			};
			if(player distance chosen < 3 && farm && typeOf(vehicle player) == "ivory_tractor") exitwith {
				["bank","add", _payment] call life_fnc_handleCash;
				[format["You just got paid %1 for your help!",_payment], false] spawn domsg;
				["Add",1] call fnc_karma;
			};	
			if(_groundPhase > 60) exitwith { ["You took to long!!", false] spawn domsg;  };
			uisleep 1;
		};

		deleteMarkerLocal "themarker";

		_remaining = 5;

		while {_remaining > 0 && maintenance_on} do {
			if(player distance airvehspawned > 500) exitwith {};
			hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You will receive a new task in %1 seconds.",_remaining];
			uisleep 1;
			_remaining = _remaining - 1;
		};
		if(!_success) exitwith { maintenance_on = false; };
	};


	_remaining = 60;

	while {_remaining > 0} do {
		hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> Your vehicle despawns in %1 seconds!",_remaining];
		uisleep 1;
		_remaining = _remaining - 1;
	};

	maintenance_on = false;
	player allowdamage false;
	sleep 0.05;
	_newpos = getpos airvehspawned;
	airvehspawned setVelocity [0, 0, 0];
	deletevehicle airvehspawned;
	player setpos [_newpos select 0, _newpos select 1, 0];
	sleep 0.05;
	player allowdamage true;
	["You have been laid off from your Job!", false] spawn domsg;
};


fnc_fedex = {

	while{fedex_on} do {

		["A new job will be placed on your map shortly - STAY INSIDE YOUR VEHICLE UNTIL NEAR THE PERSON!", false] spawn domsg; 
		sleep 3;
		_jail = false;
		while {fedex_on} do
		{
		    chosen = playableUnits call BIS_fnc_selectRandom;
		    if ((isPlayer chosen) && (side chosen == civilian) && (chosen != player)) exitWith {};
		    sleep 1;
		    playSound "ringing";
		};
		markerf = createMarkerLocal ["themarker",visiblePosition chosen];
		markerf setMarkerColorLocal "ColorRed";
		markerf setMarkerTypeLocal "Mil_dot";
		markerf setMarkerTextLocal format["%1", chosen getVariable["realname",name chosen]];
		_distance = player distance chosen;
		_distance = floor (_distance / 1000);
		if( uniform chosen isEqualTo "A3L_Prisoner_Outfit" && (chosen distance (getMarkerPos "shank_1")) < 20 ) then {
			["This player appears to be in prison, get close to the walls to deliver their package.", false] spawn domsg; 
		};
		if(_distance < 1) then { _distance = 1; };
		if(_distance > 8) then { _distance = 8; };	
		_success = false;
		_calcT = 0;
		while {fedex_on} do {
			_calcT = _calcT + 1;
			markerf setMarkerPosLocal (visiblePosition chosen);
			if( uniform chosen isEqualTo "A3L_Prisoner_Outfit" && (chosen distance (getMarkerPos "shank_1")) < 20 && player distance chosen < 50 ) exitwith {
				_success = true;
				_jail = true;
			};
			if(player distance chosen < 10) exitwith {
				_success = true;
			};
			if ((!isPlayer chosen) && (side chosen != civilian)) exitWith {};
			if((chosen getVariable["dead",FALSE])) exitwith {};
			if(_calcT > 480) exitwith {};
			uisleep 1;
			hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You have taken %1 seconds.",_calcT];
		};
		["You are close, jump out and finish the mission!", false] spawn domsg; 
		sleep 3;
		_goodT = _distance * 7;
		_goodT = _goodT - _calcT;
		_payment = _goodT * 50;
		if(_payment < 600) then { _payment = 600; };
		if(_payment > 2220) then { _payment = 2220; };
		_groundPhase = 0;
		while {fedex_on} do {
			if(!_success) exitwith {};
			_groundPhase = _groundPhase + 1;
			markerf setMarkerPosLocal (visiblePosition chosen);
			if( _jail && vehicle player isEqualTo player && player distance chosen < 50 ) exitwith { 
				"jail" remoteExecCall ["fnc_delivery",chosen];
				["bank","add", _payment] call life_fnc_handleCash;
				_msg = format["You just got paid %1 your delivery!",_payment];
				[_msg, false] spawn domsg; 
			 };
			if(!_success) exitwith { ["You failed this mission, stay inside your vehicle until you are close enough to marked point.", false] spawn domsg; };
			if(vehicle player isEqualTo player && _success && player distance chosen < 15 && vehicle chosen isEqualTo chosen) exitwith {
				player playmove "AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthEnd"; 
				["bank","add", _payment] call life_fnc_handleCash;
				_msg = format["You just got paid %1 your delivery!",_payment];
				[_msg, false] spawn domsg;
				if(typeOf(vehicle player) isEqualTo "critgamin_vangmcc_fedex") then {
					"standard" remoteExecCall ["fnc_delivery",chosen];
					["Add",1] call fnc_karma;
				};
				if(typeOf(vehicle player) isEqualTo "critgamin_vangmcc_pizza") then {
					"fastfood" remoteExecCall ["fnc_delivery",chosen];
					["Add",1] call fnc_karma;
				};
				if(typeOf(vehicle player) isEqualTo "critgamin_vangmcc_fixit") then {
					"fixit" remoteExecCall ["fnc_delivery",chosen];
					["Add",1] call fnc_karma;
				};
				//function for target unit to get a random gift on delivery.
			};
			if(_groundPhase > 60) exitwith { ["You took to long to finish the mission!", false] spawn domsg;  };
			uisleep 1;
		};

		deleteMarkerLocal "themarker";

		_remaining = 150 - _calcT;
		if(_remaining < 30) then {
			_remaining = 30;
		};
		while {_remaining > 0} do {
			hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> You will receive a new job in %1 seconds.",_remaining];
			uisleep 1;
			_remaining = _remaining - 1;
		};
	};
	_remaining = 60;

	while {_remaining > 0} do {
		hint parsetext format["<img size='1' image='cg_mission_files\icons\info.paa'/> <t color='#FFCC00'><t size='0.75'>JOB:</t><br/> Your vehicle despawns in %1 seconds!",_remaining];
		uisleep 1;
		_remaining = _remaining - 1;
	};
	player allowdamage false;
	sleep 1;
	player setpos (getMarkerPos "job_spawn_1");
	["Your deliveries have finished!", false] spawn domsg;
	player allowdamage true;
};




	fnc_trytaxi = {

		if(life_taxi) exitwith { ["Jestes taksowkarzem.", false] spawn domsg; };
		if(checked_taxi) exitwith { ["Chwile temu wzywales Taxi, prosze poczekac!", false] spawn domsg; };
		checked_taxi = true;
		player remoteExec ["fnc_taxi",civilian];
		["Wezwales taksowke!", false] spawn domsg;
		sleep 300;
		checked_taxi = false;
	};

	fnc_taxi = {
		if(!life_taxi) exitwith {};
		_unit = _this;

		_dMarker = createMarkerLocal [format["%1_marker",_unit],visiblePosition _unit];
		_dMarker setMarkerTypeLocal "hd_warning";
		_dMarker setMarkerTextLocal format["Taxi Call: %1", _unit getVariable["realname",name _unit]];
		_dMarker setMarkerColorLocal "ColorWhite";
		playSound "ringing";
		["Ktos wezwal taksowke! Sprawdz mape!"] spawn domsg;
		_skip = false;
		_somecounter = 1;
		while{true} do {
			if(typeOf(vehicle player) != "CG_Taxi") exitwith { _skip = true; ["Nie odebrales polaczenia!"] spawn domsg;  };
			if (player distance _unit < 10) exitwith { ["Jestes obok osoby wzywajacej Taxi, poczekaj az wsiadzie!"] spawn domsg; };

			if (vehicle _unit != _unit) exitwith { 
				_skip = true;
				if (player distance _unit < 500) then {
					["Otrzymales premie za przebywanie obok osoby potrzebujacej Taxi!"] spawn domsg;
					["Ktos Ci zajebal klienta! Masz $1000 na bron i magazynki zeby go dojechac!"] spawn domsg;
					["cash","add",1000] call life_fnc_handleCash;
				};
			};
			if(!life_taxi) exitwith {};
			if(_somecounter > 600) exitwith {};
			_dMarker setMarkerPosLocal (visiblePosition _unit);
			_somecounter = _somecounter + 1;
			sleep 1;
		};
		theirTotal = _somecounter * 5;
		_somecounter = 1;
		while{true} do {
			if(_skip || !life_taxi) exitwith {};

			_dMarker setMarkerPosLocal (visiblePosition _unit);
			if(vehicle _unit != _unit) exitwith {
				_crew = crew (vehicle player);
				{
					if(_x == _unit) then
					{
						["cash","add",theirTotal] call life_fnc_handleCash;
						[format["Osoba wzywajaca taksowke wsiadla do pojazdu. Otrzymujesz $%1 !",theirTotal], false] spawn domsg; 
						life_taxi = false;
					};
				} foreach _crew;
			};
			if(_somecounter > 25) exitwith {};
			sleep 1;
			_somecounter = _somecounter + 1;
		};
		deleteMarkerLocal format["%1_marker",_unit];
	};


	fnc_Pull_ID =
	{
		_cop = _this;

		[format["Twoj dowod osobisty jest sprawdzany przez %1",name _cop], false] spawn domsg;		
		
		disableUserInput true;
		safe_licenses = ["license_civ_driver", "license_civ_air", "license_civ_boat", "license_civ_dive", "license_civ_truck", "license_civ_gun", "license_civ_rifle"];

		_licenses = "";

		{
			if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ" && _x select 0 IN safe_licenses) then
			{
				_licenses = _licenses + ([_x select 0] call life_fnc_varToStr) + " | ";
			};
		} foreach life_licenses;

		[_licenses,life_houses] remoteExecCall ["fnc_give_ID",_cop];
		sleep 10;

		disableUserInput false;
	};

	fnc_give_ID =
	{
		if(count target_houses > 0) then {
			[] call fnc_del_houses;
		};
		target_licenses = _this select 0;
		target_houses = _this select 1;
		_n = 0;
		if(count target_houses > 0) then {

			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				_marker = createMarkerLocal [format["house_%1",_n],_pos];
				_marker setMarkerTextLocal _houseName;
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerTypeLocal "loc_Lighthouse";
				_n = _n + 1;
			} foreach target_houses;

			["Domy obywatela zostaly zaznaczone na mapie!", false] spawn domsg;

		};
		life_gather_info = true;
	};




fnc_virt_dupe = {
	private["_theveh","_unitveh","_myveh","_side","_radius","_nearestunits","_nearestunitofside","_unit"];
	_curtarget = cursortarget;
	life_action_inuse = true;
	//set variable to server pending on object
	if(vehicle player != player) then { _curtarget = vehicle player; } else { _curTarget = cursortarget; };
	_uid = getplayerUID player;
	_curTarget setVariable["vehopen",_uid,true];
	//run check for same variable for 2 seconds
	_penis = 8;
	while{_penis > 0} do
	{
		_check = _curTarget getVariable "vehopen";
		if(_check != _uid) exitwith { closedialog 0; life_action_inuse = false;	 ["Ekwipunek zamkniety z pwowodu ochrony duplikacji", false] spawn domsg;};
		sleep 0.25;
		_penis = _penis - 1;
	};
	life_action_inuse = false;	
	//clear variable and end.
	_curTarget setVariable["vehopen",0,true];
};



fnc_item_CG = {
    _idc = ctrlIDC (_this select 0);          
	_selectedIndex = _this select 1;         
    _unit = player;
	_item = lbData [_idc, _selectedIndex];

	if (_item == "CG_Spikes_Collapsed") then { [true] spawn fnc_spikeStrip_cg; [_item] spawn fnc_removeitem; closeDialog 0; };
	if (_item == "CG_battery_i") then { life_battery = 200; [_item] spawn fnc_removeitem; playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25]; closeDialog 0; };
	if (_item == "CG_ATF_Pizza_Box_i") then { [true] spawn life_fnc_pizza; [_item] spawn fnc_removeitem; closeDialog 0; };
	if (_item == "CG_ATF_Donut_Box_i") then { [true] spawn life_fnc_bronutsbrah; [_item] spawn fnc_removeitem; closeDialog 0; };
	if (_item == "CG_ATF_Handcuffs_i") then { ["You can restrain with these...", false] spawn domsg; closeDialog 0; };
	if (_item == "CG_Pro_Item_i") then { [] spawn fnc_GoPro; closeDialog 0; };
	if (_item == "CG_ATF_Drug_Bottle_01_i") then { [_item] spawn fnc_removeitem; player forceWalk false; [player,"pillswallow"] spawn life_fnc_nearestSound; player setVariable["severeInjuries", nil, true]; closeDialog 0; };

	false
};

fnc_animSelect = {

	_animSelect = _this select 0;

	AnimCam = "CAMERA" camCreate (player modelToWorld [0,-1.25,1.8]); 
	showCinemaBorder false;
	AnimCam camSetTarget player;
	AnimCam cameraEffect ["INTERNAL", "BACK"];
	AnimCam camSetFOV 1;
	AnimCam camSetFocus [50,0];
	AnimCam camCommit 0; 


	//eating
	if(_animSelect == "eat") then {
		player switchmove "DSS_Acts_Eat_Erect";
		uisleep 6;
	};

	//drinking
	if(_animSelect == "drink") then {	
		player switchmove "DSS_Acts_DrinkSoda_Erect";
		uisleep 6;
	};

	//fiddling
	if(_animSelect == "hands") then {	
		player switchmove "DSS_Acts_Drink_Erect";
		uisleep 2;
	};
	
	player switchmove "";
	AnimCam cameraEffect ["TERMINATE","BACK"];
	camDestroy animCam;

};


/*
[] spawn { player switchmove "DSS_Acts_ShadowZed_Pose_0"; uisleep 0.1; player switchmove "DSS_Acts_ShadowZed_Pose_1"; uisleep 0.1; player switchmove "DSS_Acts_ShadowZed_Pose_2"; uisleep 0.1; player switchmove "DSS_Acts_ShadowZed_Pose_3"; uisleep 0.1; player switchmove "DSS_Acts_ShadowZed_Pose_4"; uisleep 0.1;  };
*/



