/*
	Author: CooliMC
	
	Description:
	Einsatzschild.sqf
	You are not allowed to USE THIS SCRIPT !!!!
	IF YOU WANT TO USE IT PLS CONTACT ME ON STEAM!!!
	
*/

private["_nearSchilds","_nearSchilder","_nearBank","_oft","_off","_plate","_id"];

if(playerSide != west) exitWith {hint "Du bist kein Polizist, zum Benutzen brauchst du eine Spezialausrüstung und eine Sonderausbildung !!"};
if(ES_Einsatzschild) exitWith {hint "Du kannst keine zwei Einsatzschilder gleichzeitig benutzen !!"};
ES_Einsatzschild = true;
ES_EinsatzschildInUseSpawn = false;

player addAction ["EINSATZSCHILD NEHMEN",
{
	_nearSchilds = (player getVariable ["Schild", []]);
	_nearSchilder = false;
	_nearBank = 0;

	if (isNil "EinSchildistOnline") then { EinSchildistOnline = false; publicVariable "EinSchildistOnline"; };
	if (EinSchildistOnline) exitWith { hintSilent "Es ist schon ein Einsatzschild drausen!"; };
	[] spawn { sleep 0.5; EinSchildistOnline = true; publicVariable "EinSchildistOnline"; };

	_nearSchilds = _nearSchilds - [player];
	_nearSchilds pushBack player;
	player setVariable ["Schild", _nearSchilds, true];
	ES_EinsatzschildInUse = true;
	[] spawn { ES_EinsatzschildInUseSpawn = true; sleep 20; ES_EinsatzschildInUseSpawn = false; };
	
	
	hit = [];  
	hitted = 0;  
	handlerIdNames = [];
	att = [];  
	hitdam = 0;
	
	_oft = 32;	
	_off = [
		[-0.05, 0, -0.4], [-0.05, 0, 0.4], [0.4, 0, 0], [-0.5, 0, 0],  
		[0.06, 0, 0.4], [0.173, 0, 0.4], [0.286, 0, 0.4], [0.4, 0, 0.4], [0.4, 0, 0.3], [0.4, 0, 0.2], [0.4, 0, 0.1],  
		[-0.16, 0, 0.4], [-0.273, 0, 0.4], [-0.386, 0, 0.4], [-0.5, 0, 0.4], [-0.5, 0, 0.3], [-0.5, 0, 0.2], [-0.5, 0, 0.1],  
		[0.06, 0, -0.4], [0.173, 0, -0.4], [0.286, 0, -0.4], [0.4, 0, -0.4], [0.4, 0, -0.3], [0.4, 0, -0.2], [0.4, 0, -0.1],  
		[-0.16, 0, -0.4], [-0.273, 0, -0.4], [-0.386, 0, -0.4], [-0.5, 0, -0.4], [-0.5, 0, -0.3], [-0.5, 0, -0.2], [-0.5, 0, -0.1]  
	];

	while {_oft > 0} do  
	{  
		_plate = "Steel_Plate_L_F" createVehicle [0,0,0];
		_plate attachTo [player, (_off select (_oft - 1)), "RightHand"];  
		_plate setObjectTextureGlobal [0,"#(rgb,1,1,1)color(0,0,0,1)"];  
		_id = _plate addEventHandler ["HandleDamage", { hit = [_this select 3, _this select 4, (_this select 3) ammo currentweapon (_this select 3)]; }];  
   
		handlerIdNames pushBack [_plate, "HandleDamage", _id];  
		att pushBack _plate;  
		_oft = _oft - 1;
		sleep 0.001;
	};
	
	_tex = "UserTexture1m_F" createVehicle [0,0,0];
	_dir = getDir player;
	player setDir 0;
	_tex attachto [player, [-0.05, 0.01, 0.3], "RightHand"]; 
	_tex setDir 180;
	player setDir _dir;
	_tex setObjectTextureGlobal [0, "Images\Skins\cop\schild.paa"];
	att pushBack _tex;
	
	[] spawn
	{
		player allowSprint false;
		while {ES_EinsatzschildInUse} do
		{
			player forceWalk true;
			if((currentWeapon player) != "hgun_Rook40_snds_F") then
			{
				if(!("hgun_Rook40_snds_F" in (weapons player))) then { player addWeapon "hgun_Rook40_snds_F"; };
				player selectWeapon "hgun_Rook40_snds_F";
			};
			sleep 0.3;
		};
	};
	
	_id = player addEventHandler ["Hit",  
	{
		_unit = _this select 0;
		_causedBy = _this select 1;
		_dammage = _this select 2;
		
		if(hitted == 1) then { hitted = 2; };  
	}];
	handlerIdNames pushBack [player, "Hit", _id];  
  
	_id = player addEventHandler ["HandleDamage",  
	{  
		_unit = _this select 0;  
		_dame = _this select 2;  
		_source = _this select 3;  
		_projectil = _this select 4;  
  
		if((_source in hit) && (_projectil in hit) && ((_source ammo currentweapon _source) in hit)) then  
		{  
			hitted = 1;  
			hit = [];  
			_oldlife = (getDammage _unit);  
			_dam = _dame - _oldlife;  
		
			if(_dam > 0.2) then { _dam = 0.2; }
			else { _dam = _dam * 0.7; };  
			
			_dame = _oldlife + _dam;    
		} else {  
			if(hitted == 1) then { _dame = (getDammage _unit); }  
			else
			{  
				if(hitted == 2) then
				{  
					hitted = 0;  
					_dame = (getDammage _unit);  
				};  
			};  
		};  
		_dame;  
	}];  
	handlerIdNames pushBack [player, "HandleDamage", _id];
  
	_id = player addEventHandler ["GetInMan",  
	{  
		{  
			(_X select 0) removeEventHandler[(_X select 1), (_X select 2)];  
		} foreach handlerIdNames;  
		
		{  
			deletevehicle _X  
		} foreach att;  
		
		ES_EinsatzschildInUse = false;
		player allowSprint true;
		EinSchildistOnline = false; publicVariable "EinSchildistOnline";
		
		_nearSchilds = (player getVariable ["Schild", []]);
		_nearSchilds = _nearSchilds - [player];
		player setVariable ["Schild", _nearSchilds, true];
		
		hint "Du kannst nicht mit gezogenem Einsatzschild in Fahrzeuge einsteigen, deswegen musstest du es in den Kofferaum packen !!";
	}];
	handlerIdNames pushBack [player, "GetInMan", _id];
  
	_id = player addEventHandler ["Killed",  
	{  
		{  
			(_X select 0) removeEventHandler[(_X select 1), (_X select 2)];  
		} foreach handlerIdNames;  
		
		{  
			deletevehicle _X  
		} foreach att;  
		
		ES_Einsatzschild = false;
		ES_EinsatzschildInUse = false;
		player allowSprint true;
		
		_nearSchilds = (player getVariable ["Schild", []]);
		_nearSchilds = _nearSchilds - [player];
		player setVariable ["Schild", _nearSchilds, true];
	}];
	handlerIdNames pushBack [player, "Killed", _id];
}, "", 0, false, false, "", "ES_Einsatzschild && !ES_EinsatzschildInUse && ((vehicle player) == player)"];

player addAction ["EINSATZSCHILD WEGNEHMEN",
{

	if (ES_EinsatzschildInUseSpawn) exitWith { hintSilent "Warte must 20 Sekunden warten bevor du das Schild einpacken kanst"; };
	EinSchildistOnline = false; publicVariable "EinSchildistOnline";
	{  
		(_X select 0) removeEventHandler[(_X select 1), (_X select 2)];  
	} foreach handlerIdNames;  
	
	{  
		deletevehicle _X  
	} foreach att;  
	
	ES_EinsatzschildInUse = false;
	player allowSprint true;
	
	_nearSchilds = (player getVariable ["Schild", []]);
	_nearSchilds = _nearSchilds - [player];
	player setVariable ["Schild", _nearSchilds, true];
}, "", 0, false, false, "", "ES_Einsatzschild && ES_EinsatzschildInUse && ((vehicle player) == player)"];