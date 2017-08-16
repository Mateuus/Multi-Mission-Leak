/*
    File: santa.sqf
    Author: Bloodwyn

    Description:
    Spawns/despawns a Drone with attached Usertextures

    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    Usage of this file is restricted to permitted servers e.g. Loewenherz.
    Ask us for permission to use this file: www.lhzp.de
*/


private["_uav","_hunter","_uavda"];

if (playerside == west)then{

	//überprüfen, ob Drohne schon besteht

	{if (_x getVariable ["santauav",false])then{_uav=_x;};}foreach allUnitsUAV;



	if (isNil "_uav")then	//Noch nix da und Drohne erstellen
	{


		player addBackpack "B_uav_01_backpack_F";
		player linkItem "B_uavTerminal";

		titleText["Plaziere die Drohne und stelle Verbindung her.", "PLAIN"];

		_uavda=false;
		_uav=0;
		while {!_uavda}do{
			{
				if(_x distance player <10)then{
					_uav=_x;
					_uavda=true;

				};
				sleep 1;

			}forEach allUnitsUAV;
		};

		waitUntil{getConnectedUAV player == _uav};

		titleText["Drücke 3 für Nyan Cat Song, 4 für Miau und 5 für einen Drop!", "PLAIN"];

		_uav setVariable ["santauav",true,true];
		_uav setObjectTextureGlobal [0,""];
		_uav allowDamage false;

		_hunter = "B_MRAP_01_F" createVehicle [0,0,0];
		_hunter setObjectTextureGlobal [0,""];
		_hunter setObjectTextureGlobal [1,""];
		_hunter attachTo [_uav,[0,0,2]];

		clearWeaponCargoGlobal _hunter;
		clearMagazineCargoGlobal _hunter;
		clearBackpackCargoGlobal _hunter;
		clearItemCargoGlobal _hunter;

		_t1= "UserTexture10m_F" createVehicle [0,0,0];
		_t1 setObjectTextureGlobal [0,"core\textures\events\santa1.paa"];
		_t1 attachTo [_uav,[-1,-0.4,3.6]];
		_t1 setDir 90;

		_t2= "UserTexture10m_F" createVehicle [0,0,0];
		_t2 setObjectTextureGlobal [0,"core\textures\events\santa2.paa"];
		_t2 attachTo [_uav,[-1,-0.4,3.6]];
		_t2 setDir 270;

		_t3= "UserTexture10m_F" createVehicle [0,0,0];
		_t3 setObjectTextureGlobal [0,"core\textures\events\santa2.paa"];
		_t3 attachTo [_uav,[1,-0.4,3.6]];
		_t3 setDir 270;

		_t4= "UserTexture10m_F" createVehicle [0,0,0];
		_t4 setObjectTextureGlobal [0,"core\textures\events\santa1.paa"];
		_t4 attachTo [_uav,[1,-0.4,3.6]];
		_t4 setDir 90;

		_t5= "UserTexture10m_F" createVehicle [0,0,0];
		_t5 setObjectTextureGlobal [0,"core\textures\events\santa3.paa"];
		_t5 attachTo [_uav,[4,2.1,0.87]];
		_t5 setDir 180;
		_t5 setVectorUp [0,-0.999965,-0.0083683];

		cooldowndrop=false;
	//keyhandler stuff ("3","4","5")
	cooldownbutton=false;
	script =
	{if(keyhandlerinuse)then{
				if(_this == 4 && !cooldownbutton) then
		{
			[[player,"santabells"],"lhm_fnc_say3d",true,false]call lhm_fnc_mp;
			titleText["Nyan Cat Song!", "PLAIN"];
			cooldownbutton=true;
			sleep 2;
			cooldownbutton=false;
		};

		if(_this == 5 && !cooldownbutton)then
		{
			[[player,"hoho"],"lhm_fnc_say3d",true,false]call lhm_fnc_mp;;
			titleText["Meow!", "PLAIN"];
			cooldownbutton=true;
			sleep 2;
			cooldownbutton=false;
		};

		if(_this == 6 && !cooldownbutton)then
		{
			cooldownbutton=true;
			_para = createVehicle ["B_Parachute_02_F", [0,0,100], [], 0, ""];
			_para setPosATL (player modelToWorld[0,0,-35]);
			_veh = createVehicle ["O_supplyCrate_F", [0,0,80], [], 0, ""];
			_veh attachTo [_para,[0,0,0]];

			_para setVectorUp [0,0.01, 0.05];

			clearWeaponCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearItemCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;

			_veh addWeaponCargo ["hgun_Pistol_Signal_F", 3];
			_veh addMagazineCargoGlobal ["6Rnd_GreenSignal_F", 6];
			_veh addMagazineCargoGlobal ["6Rnd_RedSignal_F", 6];
			_veh addMagazineCargoGlobal ["SmokeShell", 10];
			_veh addMagazineCargoGlobal ["SmokeShellRed", 10];
			_veh addMagazineCargoGlobal ["SmokeShellGreen", 10];
			_veh addItemCargoGlobal ["Rangefinder", 1];
			_veh addItemCargoGlobal ["ToolKit", 2];
			_veh addItemCargoGlobal ["FirstAidKit", 4];
			_veh addMagazineCargoGlobal ["Chemlight_red", 25];
			_veh addItemCargoGlobal ["H_Cap_grn_BI",5];

			titleText["Ammobox dropped!", "PLAIN"];

			sleep 1;
			cooldownbutton=false;

			WaitUntil {((((position _veh) select 2) < 0.7) || (isNil "_para"))};
			Signal = "SmokeShellRed" createVehicle position _veh; _veh allowDamage false;

			detach _veh;
			sleep 0.3;

			_kippen = 0.03;
			for [{_x=1},{_x<=80},{_x=_x+1}] do
			{
    			_para setVectorUp [0,0.05, _kippen];
    			_kippen = _kippen - 0.001;
    			sleep 0.01;
			};

			_veh setPos [(position _veh) select 0, (position _veh) select 1, 0.6];

			sleep 180;

			deleteVehicle _veh;

		};

	};
	};

	powerHandler = (findDisplay 46) displayAddEventHandler["KeyDown", "(_this select 1) spawn script; false"];
	keyhandlerinuse = true;

	}else{		//Schlitten exestiert schon (löschen)

		_objs = attachedObjects _uav;
		if (count(_objs) == 0) exitwith {};
		_objs = _objs - [Objnull];
		{deleteVehicle _x;}foreach _objs;
		deleteVehicle _uav;
		titleText["Nyan Cat entfernt", "PLAIN"];
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",powerHandler];
		keyhandlerinuse = false;

	};
}else{
	titleText["Du musst als COP eingelogged sein #isso", "PLAIN"];
};
