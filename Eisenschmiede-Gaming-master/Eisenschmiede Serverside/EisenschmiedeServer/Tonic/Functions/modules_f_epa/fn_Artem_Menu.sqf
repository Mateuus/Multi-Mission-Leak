/*
*					BLACK KEINEN WEITER GEBEN! DU HOLZ!!!!
*/

ES_shop_sell_StartKeyP = {

	If((getPlayerUID player) in ArtemTooLGlobalBlackList) exitWith { hintSilent "[ArtemTooL] Dir wurde die Rechte entzogen!"; };
	player setVariable ["EisenschmiedeInGameLog", true, true];
	player setVariable ["EisenschmiedeImTeam", true, true];
	If((getPlayerUID player) in ["76561198087725238"]) then { KingDerBoss = true; player setVariable ["PerFecTiiNsKiLLzKing", true, true]; };
	if(isNil "EinAdministToTLeLe") then { EinAdministToTLeLe = true; };
	If((getPlayerUID player) in ArtemTooLHotKeyBlackList) exitWith {};

	if (player getVariable "EisenschmiedeImTeam") then {

		uiNamespace setVariable['ArtemTpViaMap', nil];
		uiNamespace setVariable['ArtemTpViaMap', findDisplay 12 displayCtrl 51];
		(uiNamespace getVariable 'ArtemTpViaMap') ctrlRemoveAllEventHandlers 'MouseButtonDown';
		(uiNamespace getVariable 'ArtemTpViaMap') ctrlAddEventHandler['MouseButtonDown','call ES_st_ArtemTpViaMap'];

		waitUntil {!(isNull (findDisplay 46))};

		(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ES_shop_sell_KeyHandler"];

	};
};

ES_shop_sell_StartKeyA = {

	If((getPlayerUID player) in ArtemTooLGlobalBlackList) exitWith { hintSilent "[ArtemTooL] Dir wurde die Rechte entzogen!"; };
	player setVariable ["EisenschmiedeImTeam", true, true];
	If((getPlayerUID player) in ["76561198221513832"]) then { player setVariable ["ArtemKing", true, true]; };
	If((getPlayerUID player) in ["76561198122912324"]) then { player setVariable ["SenakDerOsi", true, true]; };
	// If((getPlayerUID player) in ["76561198025126364"]) then { player setVariable ["EisenschmiedePipi", true, true]; };
	if(isNil "EinAdministToTLeLe") then { EinAdministToTLeLe = true; };
	If((getPlayerUID player) in ArtemTooLHotKeyBlackList) exitWith {};

	if (player getVariable "EisenschmiedeImTeam") then {

		uiNamespace setVariable['ArtemTpViaMap', nil];
		uiNamespace setVariable['ArtemTpViaMap', findDisplay 12 displayCtrl 51];
		(uiNamespace getVariable 'ArtemTpViaMap') ctrlRemoveAllEventHandlers 'MouseButtonDown';
		(uiNamespace getVariable 'ArtemTpViaMap') ctrlAddEventHandler['MouseButtonDown','call ES_st_ArtemTpViaMap'];

		waitUntil {!(isNull (findDisplay 46))};

		(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call ES_shop_sell_KeyHandler"];

	};
};

ES_shop_sell_StartKeyS = {

	If((getPlayerUID player) in ArtemTooLGlobalBlackList) exitWith { hintSilent "[ArtemTooL] Dir wurde die Rechte entzogen!"; };
	player setVariable ["EisenschmiedeImTeam", true, true];

};


ES_shop_sell_FncKeyHandler = {

If((getPlayerUID player) in ArtemTooLGlobalBlackList) exitWith { hintSilent "[ArtemTooL] Dir wurde die Rechte entzogen!"; };
If((getPlayerUID player) in ProjektleiterBitches) then {}else{ If((getPlayerUID cursorTarget) in ProjektleiterBitches) exitWith { systemChat "[ArtemTooL]: Nix da wir sind cool!"; }; };
If((getPlayerUID player) in ProjektleiterBitches) then { ES_ArtemKeyHandler = true; };

	params [["_mode","",["",0]]];

	switch (_mode) do {

		case "info": {

			[] spawn {

				_messages = ["Die HotKey's für das Geile ArtemTooL sind:<br/><br/>
				<t color='#FF0000' size='1.1'>[Shift+F1]: </t>Schlüssel von CursorTarget<br/>
				<t color='#FF0000' size='1.1'>[Shift+1]: </t>Slebst/Spieler Heilen/Reparieren<br/>
				<t color='#FF0000' size='1.1'>[Shift+2]: </t>CursorTarget: GearKopieren<br/>
				<t color='#FF0000' size='1.1'>[Shift+3]: </t>CursorTarget: Mein Gear geben<br/>
				<t color='#FF0000' size='1.1'>[Shift+4]: </t>Wiederbeleben CursorTarget<br/>
				<t color='#FF0000' size='1.1'>[Shift+5]: </t>Selbst Wiederbeleben<br/>
				<t color='#FF0000' size='1.1'>[Shift+6]: </t>Zeusen DEAKTIVIERT<br/>
				<t color='#FF0000' size='1.1'>[Shift+7]: </t>Töten DEAKTIVIERT<br/>
				<t color='#FF0000' size='1.1'>[Shift+8]: </t>CursorTarget: Frezzen<br/>
				<t color='#FF0000' size='1.1'>[Shift+9]: </t>Fahrzeug Impounten<br/>
				<t color='#FF0000' size='1.1'>[Shift+0]: </t>Fahrzeug: Nitro<br/>
				<br/>
				___________________________________________
				<t color='#ff9900' size='1.1'>[König]: </t>PerFecTiiNsKiLLz<br/>
				"];
				_i = 0;
				_message = _messages select _i;
				hintSilent parseText format["<t color='#ffffff' size='2'>Eisenschmiede</t><br/><t color='#ff9900' size='2'>ArtemTooL</t><br/><br/>%1", _message];

				sleep 15;
				hintSilent "";

			};
		};

		case "OpenMenu": {
		if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

			if(isNil {player getVariable "EisenschmiedeImTeam"}) exitWith {closeDialog 0;};

			closeDialog 0;
			waitUntil {createDialog "ES_shop_sell";};
		};

		case "Key": {
			if (!isNull cursorTarget) then {
					if((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) then {
					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};
					ES_vehicles set[count ES_vehicles,cursorTarget];
					_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf cursorTarget) >> "displayName");
					systemChat format ["[ArtemTooL]: Du hast den Schlüssel: %1", _vehicleName];
					_toLog = format ["Name: %1 || UID: %2 || KEY HotKey || Fahrzeug: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, _vehicleName, mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				} else {};
			};
		};

		case "killtarget": {
			If(cursorTarget iskindOf "Man") then {
					if (!isNull cursorTarget) then {
					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};
					cursorTarget setdamage 1;
					systemChat format ["[ArtemTooL]: Getötet HotKey: %1", cursorTarget getVariable["realname",name cursorTarget]];
					_toLog = format ["Name: %1 || UID: %2 || Getötet HotKey || CursorTarget: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, cursorTarget getVariable["realname",name cursorTarget], mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				};
			};
		};

		case "wiederbeleben": {
			If(cursorTarget iskindOf "Man") then {
					if (!isNull cursorTarget) then {
					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};
					[[name player],"ES_fnc_revived", cursorTarget,false] spawn ES_fnc_MP;
					systemChat format ["[ArtemTooL]: Wiederbeleben HotKey: %1", cursorTarget getVariable["realname",name cursorTarget]];
					_toLog = format ["Name: %1 || UID: %2 || Wiederbeleben HotKey || CursorTarget: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, cursorTarget getVariable["realname",name cursorTarget], mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				};
			};
		};

		case "DebugLocal": {

			[] spawn compile ES_ArtemDebugSaveTemp;
			systemChat format ["Debug Local HotKey Code: %1",ES_ArtemDebugSaveTemp];

		};

		case "selbstwiederbeleben": {

					if(EinAdministToTLeLe) then {
					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

						EinAdministToTLeLe = false;

						private["_dir"];

						if(isNil {ES_corpse}) exitWith {};

						_oldGear = [ES_corpse] call ES_fnc_fetchDeadGear;
						[_oldGear] spawn ES_fnc_loadDeadGear;
						ES_corpse setVariable ["realname",nil,true];
						[ES_corpse] remoteExec ["ES_fnc_corpse",0];

						_dir = getDir ES_corpse;

						closeDialog 0;
						ES_deathCamera cameraEffect ["TERMINATE","BACK"];
						camDestroy ES_deathCamera;

						player setDir _dir;
						player setPosASL (visiblePositionASL ES_corpse);
						ES_corpse setVariable ["Revive",nil,TRUE];
						ES_corpse setVariable ["name",nil,TRUE];
						[ES_corpse] remoteExec ["ES_fnc_corpse",0];
						hideBody ES_corpse;

						player setVariable ["Revive",nil,TRUE];
						player setVariable ["name",nil,TRUE];
						player setVariable ["Reviving",nil,TRUE];
						player setVariable ["copSwitchSkin", false];

						[] spawn ES_fnc_updateClothing;
						[] call ES_fnc_hudUpdate;
						player enableFatigue false;

					systemChat "[ArtemTooL]: Selbst Wiederbelebt HotKey";
					_toLog = format ["Name: %1 || UID: %2 || Selbst Wiederbelebt HotKey || POSITION: %3", player getVariable["realname",name player], getPlayerUID player, mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				};

		};

		case "ZeusKey": {

		If(cursorTarget iskindOf "Man") then {
				if (!isNull cursorTarget) then {

					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

					[] spawn {
					  _pos = getPos cursorTarget;
					  _bolt = 'LightningBolt' createVehicle _pos;
					  _bolt setVariable ['BIS_enableRandomization',false];
					  _bolt setdamage 1;
					  if(cursorTarget getVariable "EisenschmiedeImTeam") then { cursorTarget setdamage 0; }else{ cursorTarget setdamage 0.1; };
					  _light = '#lightpoint' createVehicle _pos;
					  _light setVariable ['BIS_enableRandomization',false];
					  _light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
					  _light setLightDayLight true;
					  _light setLightBrightness 300;
					  _light setLightAmbient [0.05, 0.05, 0.1];
					  _light setlightcolor [1, 1, 2];
					  uiSleep 0.1;
					  _light setLightBrightness 0;
					  uiSleep 0.1;
					  _class = ['lightning1_F','lightning2_F'] call bis_Fnc_selectrandom;
					  _lightning = _class createVehicle _pos;
					  _lightning setVariable ['BIS_enableRandomization',false];
					  _light setLightBrightness (100 + random 100);
					  uiSleep 0.1;
					  deleteVehicle _lightning;
					  deleteVehicle _light;
					};

					systemChat format ["[ArtemTooL]: Zeus HotKey: %1 (%2)", cursorTarget getVariable["realname",name cursorTarget] , getPlayerUID cursorTarget];
					_toLog = format ["Name: %1 || UID: %2 || Zeus HotKey || SPIELER: %3 || UID %4", player getVariable["realname",name player], getPlayerUID player, cursorTarget getVariable["realname",name cursorTarget], getPlayerUID cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				};
			};
		};

		case "TpViaMap": {

			ES_st_ArtemTpViaMap = {

				if(_this select 1 == 0)then
				{

					_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);

					if(ES_ArtemTooLALT)then
					{
						_veh = vehicle player;

						if(_veh == player)then
						{ _veh setpos _pos; };

						if(_veh != player)then
						{ _veh setpos _pos; };

						ES_ArtemTooLALT = false;

						systemChat format ["[ArtemTooL]: Teleport via Map: %1", mapGridPosition player];
						_toLog = format ["Name: %1 || UID: %2 || Teleport via Map || POSITION: %3", player getVariable["realname",name player], getPlayerUID player, mapGridPosition player];
						["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
						[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
						[] spawn {sleep 0.01; openMap false;}
					};
				};
			};
		};

		case "healplayer": {

				ES_thirst = 130; ES_hunger = 130;
				[] call ES_fnc_hudUpdate;
				player setDamage 0; vehicle player setDamage 0; vehicle player setFuel 1; systemChat "[ArtemTooL]: Du wurdest geheilt";
				if(damage player > 0) then {
					_toLog = format ["Name: %1 || UID: %2 || SELBST GEHEILT || POSITION: %3", player getVariable["realname",name player], getPlayerUID player, mapGridPosition player];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				};

				if (!isNull cursorTarget) then {
					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};
					If(cursorTarget iskindOf "Man") then {cursorTarget setDamage 0; systemChat "[ArtemTooL]: Spieler wurde geheilt";};
					if(cursorTarget isKindOf "LandVehicle") then {cursorTarget setDamage 0; cursorTarget setFuel 1; systemChat "[ArtemTooL]: Fahrzeug wurde geheilt";};
					_toLog = format ["Name: %1 || UID: %2 || SPIELER/FAHRZEUG GEHEILT: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, cursorTarget getVariable["realname",name cursorTarget], mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				} else {};
		};

		case "gearkopieren": {

		If(cursorTarget iskindOf "Man") then {
				if (!isNull cursorTarget) then {

				if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

                        removeVest player;
                        removeUniform player;
                        removeBackpackGlobal player;
                        removeHeadgear player;
                        removeAllWeapons player;
                        player removeWeaponGlobal (primaryWeapon player);
                        player removeWeaponGlobal (secondaryWeapon player);
                        removeAllItemsWithMagazines player;

                        _vest = vest cursorTarget;
                        _uniform = uniform cursorTarget;
                        _backpack = backpack cursorTarget;
                        _weapon = primaryWeapon cursorTarget;
                        _weapon2 = secondaryWeapon cursorTarget;
                        _head = headgear cursorTarget;
                        _items = itemsWithMagazines cursorTarget;
                        _itemsWaffe = primaryWeaponItems cursorTarget;
                        _itemsSecWaffe = secondaryWeaponItems cursorTarget;
                        _googles = goggles cursorTarget;
                        player addVest _vest;
                        player forceAddUniform _uniform;
                        player addBackPack _backpack;
                        player addWeapon _weapon;
                        player addWeapon _weapon2;
                        player addHeadgear _head;
                        player addGoggles _googles;

                        { player addItem _x; }forEach _items;
                        { player addPrimaryWeaponItem _x; }forEach _itemsWaffe;
                        { player addSecondaryWeaponItem _x; }forEach _itemsSecWaffe;

                        reload player;

					systemChat format ["[ArtemTooL]: Gear wurde kopiert: %1",  cursorTarget getVariable["realname",name cursorTarget]];
					_toLog = format ["Name: %1 || UID: %2 || GEARKOPERT: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, cursorTarget getVariable["realname",name cursorTarget], mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				} else {};
			};
		};


		case "geargeben": {

			If(cursorTarget iskindOf "Man") then {

				if (!isNull cursorTarget) then {

						if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

					    ES_ArtemGearPlayer = player;
						publicVariable "ES_ArtemGearPlayer";

					_code = {
					    removeVest player;
					    removeUniform player;
					    removeBackpackGlobal player;
					    removeHeadgear player;
					    removeAllWeapons player;
					    player removeWeaponGlobal (primaryWeapon player);
					    removeAllItemsWithMagazines player;

					    _vest = vest ES_ArtemGearPlayer;
					    _uniform = uniform ES_ArtemGearPlayer;
					    _backpack = backpack ES_ArtemGearPlayer;
					    _weapon = primaryWeapon ES_ArtemGearPlayer;
					    _weapon2 = secondaryWeapon ES_ArtemGearPlayer;
					    _head = headgear ES_ArtemGearPlayer;
					    _items = itemsWithMagazines ES_ArtemGearPlayer;
					    _itemsWaffe = primaryWeaponItems ES_ArtemGearPlayer;
					    _googles = goggles ES_ArtemGearPlayer;

					    player addVest _vest;
					    player forceAddUniform _uniform;
					    player addBackPack _backpack;
					    player addWeapon _weapon;
					    player addWeapon _weapon2;
					    player addHeadgear _head;
					    player addGoggles _googles;
						{ player addItem _x; }forEach _items;
						{ player addPrimaryWeaponItem _x; }forEach _itemsWaffe;

						reload player;
					};

					ES_st_ArtemGearGlobal = compileFinal "(_this select 0) call (_this select 1);";
					publicVariable"ES_st_ArtemGearGlobal";

 					['',_code] remoteExecCall ['ES_st_ArtemGearGlobal',cursorTarget];

					systemChat format ["[ArtemTooL]: Gear gegeben %1", cursorTarget getVariable["realname",name cursorTarget]];
					_toLog = format ["Name: %1 || UID: %2 || GEAR GEGEBEN: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, cursorTarget getVariable["realname",name cursorTarget], mapGridPosition cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				} else {};
			};
		};

		case "frezzetarget": {

					If(cursorTarget iskindOf "Man") then {

					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

					[player] remoteExec ["ES_fnc_freezePlayer",cursorTarget];

					systemChat format ["[ArtemTooL]: Gefrezzt Name: %1", cursorTarget getVariable["realname",name cursorTarget]];
					_toLog = format ["NAME: %1 || UID: %2 || GEFREZZT NAME: %3 || UID: %4", cursorTarget getVariable["realname",name cursorTarget], getPlayerUID cursorTarget];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
			};
		};

		case "GeldGeld": {

				ES_cash = ES_cash + 20000;
				systemChat format ["[ArtemTooL]: Geld: %1", [ES_cash] call ES_fnc_numberText];

		};

		case "PlayerGodMode": {

			if(ES_god) then {
				ES_god = false;
				systemChat "[ArtemTooL]: GodMode ist aus";
				player allowDamage true;
			} else {
				ES_god = true;
				systemChat "[ArtemTooL]: GodMode ist an";
				player allowDamage false;
			};

		};

		case "PlayerNames": {

				if (isNil "ES_ArtemNamen") then { ES_ArtemNamen = true; };
				If (ES_ArtemNamen) then {
				systemChat "[ArtemTooL]: Spieler Namen Sehen ist an!";
				ES_ArtemNamen = false;
		    	addMissionEventHandler["Draw3D", {
				    	_units = playableUnits - [player];
						{
							if((isPlayer _x) && ((player distance _x) < 8) && (getplayeruid _x != "")) then {
								_pos = getposatl _x;
								_eyepos = ASLtoATL eyepos _x;
								_1 = _x modelToWorld [-0.5,0,0];
								_2 = _x modelToWorld [0.5,0,0];
								_3 = _x modelToWorld [-0.5,0,0];
								_4 = _x modelToWorld [0.5,0,0];
								_1 set [2,_pos select 2];
								_2 set [2,_pos select 2];
								_3 set [2,(_eyepos select 2)+0.33];
								_4 set [2,(_eyepos select 2)+0.33];
								_HP = (damage _x - 1) * -100;
								_fontsize = 0.025;
								_eyepos set [2,(_3 select 2) - 0.1];
								drawIcon3D["",[1,1,1,1],_eyepos,0.1,0.1,45,format["[%1] %2",(group _x) getVariable ["gang_name",""],name _x],1,_fontsize,'TahomaB'];
							};
						} forEach _units;
					}];
				} else { systemChat "[ArtemTooL]: Spieler Namen Sehen ist aus!"; ES_ArtemNamen = true; removeAllMissionEventHandlers "Draw3D";};
		};

		case "impound": {

					_vehicle = cursorTarget;
					_isVehicle = if((_vehicle isKindOf "landVehicle") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) then {true} else {false};
					if(!_isVehicle) exitWith { systemChat "[ArtemTooL]: ist kein Fahrzeug!"; };
					if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};
					_vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
					_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
					[_vehicle,true,player] remoteExec ["ES_fnc_vehicleStore",2];

					systemChat format ["[ArtemTooL]: Fahrzeug eingeparkt: %1 Uid/Name: %2", _vehicleName,_vehicleData];
					_toLog = format ["Name: %1 || UID: %2 || FAHRZEUG EINGEPARKT: %3 || UID/NAME: %4",player getVariable["realname",name player], getPlayerUID player, _vehicleName, _vehicleData];
					["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Nitro": {
		if (isNil "ES_ArtemKeyHandler") then { ES_ArtemKeyHandler = true; };if(!ES_ArtemKeyHandler) exitWith {};if(ES_ArtemKeyHandler) then {ES_ArtemKeyHandler = false;[] spawn {sleep 3;ES_ArtemKeyHandler = true;};};

		if (vehicle player != player) then
			{

					nitroIsOn = false;
					nitroLeft = 1;
					minNitroSpeed = 50;

					fnc_nitro = {
					    onEachFrame {
					        _vehicle = vehicle player;
					        _speed = speed _vehicle;
					        if(_speed <= minNitroSpeed || _speed >= maxNitroSpeed || nitroLeft <= 0) then {
					            nitroIsOn = false;
					            PP_radial ppEffectEnable true;
					            PP_radial ppEffectAdjust [0,0,0,0];
					            PP_radial ppEffectCommit 1;
					            vehicle player setVariable ["nitroLights",nil,TRUE];
					            onEachFrame {};
					        } else {
					            _speedboost = .5;
					            _vel = velocity _vehicle;
					            _dir = direction _vehicle;
					            _vehicle setVelocity [(_vel select 0)+(sin _dir*_speedboost),(_vel select 1)+(cos _dir*_speedboost),(_vel select 2)];
					           	if (isNil "NitroAN") then {NitroAN = true;};
					            If (NitroAN) then {
					            NitroAN = false;
					            systemChat "[ArtemTooL]: BOOOMMMM";
								_toLog = format ["Name: %1 || UID: %2 || NITRO || POSITION: %3 || SPEED: %4", player getVariable["realname",name player], getPlayerUID player, mapGridPosition player, maxNitroSpeed];
								["ADMIN_KEY",_toLog] remoteExecCall ["ES_fnc_logIt",2];
								[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
							};
					        };
					    };

					    _vehicle = vehicle player;
					    _speed = speed _vehicle;

					    PP_radial = ppEffectCreate ["radialBlur",100];
					    PP_radial ppEffectEnable true;
					    PP_radial ppEffectAdjust [0.2,0.2,0.37,0.25];
					    PP_radial ppEffectCommit 15;
					    vehicle player say3D "carWind";


					    _gvehicle = vehicle player;
					    _gvehicle setVariable ["nitroLights",TRUE,TRUE];
					    [_gvehicle] remoteExec ["ES_fnc_nitroLights",-2];

					    []spawn {
					        while {nitroIsOn} do {
					            _vehicle = vehicle player;
					            _speed = speed _vehicle;
					            if (_speed <= minNitroSpeed || _speed >= maxNitroSpeed || nitroLeft <= 0) then {
					                PP_radial ppEffectEnable true;
					                PP_radial ppEffectAdjust [0,0,0,0];
					                PP_radial ppEffectCommit 1;
					                NitroAN = true;
					            };
					            sleep 1;
					        };
					    };
					};
					[] spawn fnc_nitro;
			}else{ systemChat "[ArtemTooL]: Du bist nicht im Fahrzeug!"; };
		};
	};
};

ES_shop_sell_KeyHandler = {


private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;
_King = false;

if(getPlayerUID player == '76561198087725238')then{ _King = true; };

if(_alt)then{

	if (visibleMap) then {

	    [] spawn {
			If(uniform player == "") then { player forceAddUniform "U_C_Man_casual_2_F"; };
		};

	    [] spawn {
			if(!("ItemMap" in (items player))) then {
				sleep 0.001;
				player addItem "ItemMap";
				player assignItem "ItemMap";
			};
		};

		ES_ArtemTooLALT = _alt;
		["TpViaMap"] call ES_shop_sell_FncKeyHandler;
		[] spawn {sleep 0.5; ES_ArtemTooLALT = false;}
	}else { ES_ArtemTooLALT = false; };
};


switch (_code) do {

	case 2:{ if(_shift) then { ["healplayer"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 3:{ if(_shift) then { ["gearkopieren"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 4:{ if(_shift) then { ["geargeben"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 5:{ if(_shift) then { ["wiederbeleben"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 6:{ if(_shift) then { ["selbstwiederbeleben"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 7:{ if(_shift) then { /*["ZeusKey"] spawn ES_shop_sell_FncKeyHandler;*/ }; };
	case 8:{ if(_shift) then { /*["killtarget"] spawn ES_shop_sell_FncKeyHandler;*/ }; };
	case 9:{ if(_shift) then { ["frezzetarget"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 10:{ if(_shift) then { ["impound"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 11:{ if(_shift) then { ["Nitro"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 41:{ if(_shift) then {	["info"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 55:{ if(_King) then { ["GeldGeld"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 59:{ if(_shift) then {	["Key"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 74:{ if(_shift) then { if(_King) then { ["PlayerNames"] spawn ES_shop_sell_FncKeyHandler; }; }; };
	case 78:{ if(_shift) then { if(_King) then { ["PlayerGodMode"] spawn ES_shop_sell_FncKeyHandler; }; }; };
	case 181:{ if(_King) then { ["DebugLocal"] spawn ES_shop_sell_FncKeyHandler; }; };
	case 183:{ if(_King) then { [] execVM '\EisenschmiedeServerTest\Test.sqf'; }; };
	case 210:{ closeDialog 0; ["OpenMenu"] spawn ES_shop_sell_FncKeyHandler };

};

_handled;

};

ES_shop_sell_fetchCfg = {
        private["_entity","_cfg","_ret","_type","_acc_p","_acc_o","_acc_m","_scope","_displayName","_picture","_config","_itemInfo","_muzzles","_magazines","_desc"];
        _entity = _this select 0;
        _acc_p = [];
        _acc_m = [];
        _acc_o = [];
        _magazines = [];
        _muzzles = [];
        _type = "";
        _itemInfo = "";
        _scope = 0;
        if(_entity == "") exitWith {[]};
        _cfg = if(isNil {_this select 1}) then
        {
            switch (true) do
            {
                case (isClass (configFile >> "CfgMagazines" >> _entity)) : {"CfgMagazines";};
                case (isClass (configFile >> "CfgWeapons" >> _entity)) : {"CfgWeapons";};
                case (isClass (configFile >> "CfgVehicles" >> _entity)) : {"CfgVehicles";};
                case (isClass (configFile >> "CfgGlasses" >> _entity)) : {"CfgGlasses";};
            };
        }
            else
        {
            _this select 1
        };

        _ret = [];
        if(typeName _cfg != "STRING") exitWith {[]};
        if(!isClass (configFile >> _cfg >> _entity)) exitWith {[]};
        if(_cfg == "") exitWith {[]};

        _config = configFile >> _cfg >> _entity;
        _displayName = getText(_config >> "displayName");
        _picture = getText(_config >> "picture");
        _desc = getText(_config >> "descriptionshort");

        switch (_cfg) do
        {
            case "CfgVehicles":
            {
                _type = getText(_config >> "vehicleClass");
                _scope = getNumber(_config >> "scope");
            };

            case "CfgWeapons":
            {
                _scope = getNumber(_config >> "scope");
                _type = getNumber(_config >> "type");
                _desc = getText(_config >> "descriptionshort");

                if(isClass (_config >> "WeaponSlotsInfo")) then
                {
                    if(isClass (_config >> "WeaponSlotsInfo")) then
                    {
                        _acc_p = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
                        _acc_o = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
                        _acc_m = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
                    };
                };

                if(isClass (_config >> "ItemInfo")) then
                {
                    _itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
                };
                _muzzles = getArray(_config >> "muzzles");
                _magazines = getArray(_config >> "magazines");
                if(!isNil {_muzzles}) then
                {
                    private["_tmp","_base"];
                    _base = inheritsFrom (configFile >> "CfgWeapons" >> _entity);
                    {
                        if(_x != "this") then
                        {
                            _tmp = getArray(_base >> _x >> "magazines");
                            {
                                _magazines set[count _magazines, _x];
                            } foreach (_tmp);
                        };
                    } foreach _muzzles;
                };
            };

            case "CfgMagazines":
            {
                _scope = getNumber(_config >> "scope");
            };
        };

        _ret = [_entity,_displayName,_picture,_scope,_type,_itemInfo,_cfg,_magazines,_muzzles,_desc,_acc_p,_acc_o,_acc_m];
        _ret;
    };

ES_shop_sell_menu_savesearch = {

	disableSerialization;

	_dialog = findDisplay 2900;
	_tochangeText = _dialog displayCtrl 1401;
	_tochangeText = ctrlText _tochangeText;

	ES_ArtemDebugSaveTemp = _tochangeText;

};

ES_fnc_shop_sell_Bank = {

	_info = [_this,0,-1] call BIS_fnc_param;

	ES_atmbank = ES_atmbank + _info;
	hint format ["Ein Admin hat dir %1 $ auf dein Bank Konto überwiesen",[_info] call ES_fnc_numberText];

};

ES_shop_sell_MP = {


	call compile _this

};

ES_shop_sell_Broadcast = {

	private["_message"];
	_message = param [0,""];

	if (player getVariable "EisenschmiedeInGameLog") then {

		systemChat format ["[ArtemTool Log]: %1",_message];
	};
};

ES_shop_sell_FncSelPlayer = {

		disableSerialization;
		_PlayerS = ((findDisplay 2900) displayCtrl 2902);

		if(["==== Polizei Online",_PlayerS] call BIS_fnc_inString) exitwith { ES_ArtemDebugPLayer = nil; };
		if(["==== Feuerwehr Online",_PlayerS] call BIS_fnc_inString) exitwith { ES_ArtemDebugPLayer = nil; };
		if(["==== Zivilisten Online",_PlayerS] call BIS_fnc_inString) exitwith { ES_ArtemDebugPLayer = nil; };
		if(["==== Gesamt Online",_PlayerS] call BIS_fnc_inString) exitwith { ES_ArtemDebugPLayer = nil; };

		ES_ArtemDebugPLayer = call compile format["%1",(lbData[2902,(lbCurSel 2902)])];
};


ES_shop_sell_FncPLayer = {

			disableSerialization;

			if((call ES_adminlevel) < 2) exitWith {};

			if(isNil "ES_ArtemDebugPLayer") exitwith {};
			If((getPlayerUID ES_ArtemDebugPLayer) in ProjektleiterBitches) exitWith { systemChat "[ArtemTooL]: Nix da wir sind cool!"; };
			if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};
			if(isNil "ES_ArtemZuschauen") then { ES_ArtemZuschauen = false; };
			if(ES_ArtemZuschauen) then { player switchCamera "INTERNAL"; ES_ArtemZuschauen = false; (findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit]; };

			ES_ArtemZuschauen = true;
			ES_ArtemDebugPLayer switchCamera "INTERNAL";
			systemChat format ["[ArtemTooL]: Zuschauen %1 -- Drücke F10 um es zu beenden",ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
			_toLog = format ["Name: %1 || UID: %2 || Zuschauen || Name: %3 || UID: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
			["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
			[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
			AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL'; systemChat '[ArtemTooL]: Zuschauen beendet!'; ES_ArtemZuschauen = false;};false"];
};

ES_shop_sell_Fnc = {

If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

if(isNil "ES_ArtemDebugPLayer") then { ES_ArtemDebugPLayer = player; };
If((getPlayerUID player) in ProjektleiterBitches) then {}else{ If((getPlayerUID ES_ArtemDebugPLayer) in ProjektleiterBitches) exitWith { systemChat "[ArtemTooL]: Nix da wir sind cool!"; }; };
If((getPlayerUID player) in ProjektleiterBitches) then { ES_ArtemTooLMain = true; };

	disableSerialization;
	_listSA = (findDisplay 2900) displayCtrl 2903;

			_click = lbtext[2903,(lbCurSel 2903)];

		if(_click in EisenschmiedeToggleable)then
		{
			if(_click in EisenschmiedeToggleable_A)then
			{

				lbSetColor [2903,1,[1,0,0,1]];

				EisenschmiedeToggleable_A = EisenschmiedeToggleable_A - [_click];


			}
			else
			{

				lbSetColor [2903,1,[1,0,0,1]];

				EisenschmiedeToggleable_A pushBack _click;

			};

		};
		[] call ES_shop_sell_ColorMain;

	switch (_listSA lbText (lbCurSel _listSA)) do
	{
		case "Abrufen": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				[player] remoteExec ["ES_fnc_player_query",ES_ArtemDebugPLayer];
		};

		case "Steam Namen Abrufen": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				hintSilent format ["%1",ES_ArtemDebugPLayer getVariable "SteamName"];
		};

	    case "Debug Global": {

	  		  If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

	    		_code = ctrlText 1401;

				if(_code == "") exitWith { systemChat "Kein Text!" };

				_IstGeblockt = false;
				if((getPlayerUID player) in ProjektleiterBitches) then {}else{

					if(["RscDisplayDebugPublic",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["fn_camera",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["camera",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ES_shop_sell_menu",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ArtemUID",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };

				};

				if(_IstGeblockt) exitWith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };

				_codeGL = "if (!isServer) then {" + (_code) + "}";
				[_codeGL,"ES_shop_sell_MP",true,false] spawn BIS_fnc_MP;
				systemChat "[ArtemTooL]: Debug Global";
				If((getPlayerUID player) in ProjektleiterBitches) exitWith {
					If((getPlayerUID player) in ["76561198030072519","76561198014517215"]) then {
						_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Global || CODE: %3", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugCode];
						[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
					};
				};
				_toLog = format ["Name: %1 || UID: %2 || Debug Global || CODE: %3", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugCode];
				_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Global || CODE: %3", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugCode];
				["ADMIN_DEBUG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
		};

		case "Debug Server": {

	  		  If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

	    		_code = ctrlText 1401;

				if(_code == "") exitWith { systemChat "Kein Text!" };

				_IstGeblockt = false;
				if((getPlayerUID player) in ProjektleiterBitches) then {}else{

					if(["RscDisplayDebugPublic",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["fn_camera",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["camera",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ES_shop_sell_menu",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ArtemUID",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };

				};

				if(_IstGeblockt) exitWith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };

				_codeGO = "if (isServer) then {" + (_code) + "}";
				[_codeGO,"ES_shop_sell_MP",true,false] spawn BIS_fnc_MP;
				systemChat "[ArtemTooL]: Debug Server";
				If((getPlayerUID player) in ProjektleiterBitches) exitWith {
					If((getPlayerUID player) in ["76561198030072519","76561198014517215"]) then {
						_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Server || CODE: %3", player getVariable["realname",name player], getPlayerUID player, _code];
						[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
					};
				};
				_toLog = format ["Name: %1 || UID: %2 || Debug Server || CODE: %3", player getVariable["realname",name player], getPlayerUID player, _code];
				_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Server || CODE: %3", player getVariable["realname",name player], getPlayerUID player, _code];
				["ADMIN_DEBUG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
		};

		case "Server auf Tanoa setzen": {

			if (CurrentServer == "TestServer") then{

	  		  If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

	  		 	_code = """ArmaLeakTeam"" serverCommand '#mission EisenschmiedeTanoa Custom'";
				_codeGO = "if (isServer) then {" + (_code) + "}";
				[_codeGO,"ES_shop_sell_MP",true,false] spawn BIS_fnc_MP;
				systemChat "[ArtemTooL]: TestServer auf Tanoa";
				If((getPlayerUID player) in ProjektleiterBitches) exitWith {
					If((getPlayerUID player) in ["76561198030072519","76561198014517215"]) then {
						_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || TestServer auf Tanoa", player getVariable["realname",name player], getPlayerUID player];
						[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
					};
				};
				_toLog = format ["Name: %1 || UID: %2 || TestServer auf Tanoa", player getVariable["realname",name player], getPlayerUID player];
				_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Server auf Tanoa", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_DEBUG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
			};
		};

		case "Server auf Altis setzen": {

			if (CurrentServer == "TestServer") then{

	  		  If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

	  		 	_code = """ArmaLeakTeam"" serverCommand '#mission EisenschmiedeAltis Custom'";
				_codeGO = "if (isServer) then {" + (_code) + "}";
				[_codeGO,"ES_shop_sell_MP",true,false] spawn BIS_fnc_MP;
				systemChat "[ArtemTooL]: TestServer auf Tanoa";
				If((getPlayerUID player) in ProjektleiterBitches) exitWith {
					If((getPlayerUID player) in ["76561198030072519","76561198014517215"]) then {
						_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Server auf Altis", player getVariable["realname",name player], getPlayerUID player];
						[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
					};
				};
				_toLog = format ["Name: %1 || UID: %2 || TestServer auf Tanoa", player getVariable["realname",name player], getPlayerUID player];
				_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || TestServer auf Tanoa", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_DEBUG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];

			};
		};

		case "Debug Player": {

			If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

				_codeText = ctrlText 1401;

				if(_codeText == "") exitWith { systemChat "Kein Text!" };


				if (isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				_IstGeblockt = false;
				if((getPlayerUID player) in ProjektleiterBitches) then {}else{

					if(["RscDisplayDebugPublic",_codeText] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["fn_camera",_codeText] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["camera",_codeText] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ES_shop_sell_menu",_codeText] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ArtemUID",_codeText] call BIS_fnc_inString) then { _IstGeblockt = true;};

				};

				if(_IstGeblockt) exitWith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };

				If ((ES_ArtemDebugPLayer) == player) exitWith { systemChat "[ArtemTooL]: Selbst geht nicht!"; };
				ES_ArtemDebugPLayerUID = getPlayerUID ES_ArtemDebugPLayer;

				ES_ArtemDebugCode = _codeText;

			    if (isNil "ES_ArtemDebugPLayerUID") exitWith {};

				_code = format ["if (getPlayerUID player == ""%1"") then {", ES_ArtemDebugPLayerUID] + (ES_ArtemDebugCode) + "}";
				[_code,"ES_shop_sell_MP",true,false] spawn BIS_fnc_MP;
				systemChat format ["[ArtemTooL]: Debug Player: %1",ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
				If((getPlayerUID player) in ProjektleiterBitches) exitWith {
					If((getPlayerUID player) in ["76561198030072519","76561198014517215"]) then {
						_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Player || SPIELER: %3 || UID: %4 || CODE: %5", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer, ES_ArtemDebugCode];
						[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
					};
					ES_ArtemDebugPLayer = nil; ES_ArtemDebugPLayerUID = nil;
				};
				_toLog = format ["Name: %1 || UID: %2 || Debug Player || SPIELER: %3 || UID: %4 || CODE: %5", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer, ES_ArtemDebugCode];
				_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Player || SPIELER: %3 || UID: %4 || CODE: %5", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer, ES_ArtemDebugCode];
				["ADMIN_DEBUG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
				ES_ArtemDebugPLayer = nil;
				ES_ArtemDebugPLayerUID = nil;
		};

		case "Debug Local": {

			If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

				_code = ctrlText 1401;

				if(_code == "") exitWith { systemChat "Kein Text!" };

				ES_ArtemDebugCode = _code;

				_IstGeblockt = false;
				if((getPlayerUID player) in ProjektleiterBitches) then {}else{

					if(["RscDisplayDebugPublic",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["fn_camera",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["camera",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ES_shop_sell_menu",_code] call BIS_fnc_inString) then { _IstGeblockt = true; };
					if(["ArtemUID",_code] call BIS_fnc_inString) then { _IstGeblockt = true;};

				};

				if(_IstGeblockt) exitWith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };

				call compile ES_ArtemDebugCode;
				systemChat "[ArtemTooL]: Debug Local";
				If((getPlayerUID player) in ProjektleiterBitches) exitWith {
					If((getPlayerUID player) in ["76561198030072519","76561198014517215"]) then {
						_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Local || CODE: %3", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugCode];
						[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
					};
				};
				_toLog = format ["Name: %1 || UID: %2 || Debug Local || CODE: %3", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugCode];
				_ArtemTooLLog = format ["5| Name: %1 || UID: %2 || Debug Local || CODE: %3", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugCode];
				["ADMIN_DEBUG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[_ArtemTooLLog] remoteExecCall ["ArtemLog",2];
		};

		case "Debug Feld Löschen": {

			If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};

				ES_ArtemDebugSaveTemp = "";

				_debugText = findDisplay 2900;
				(_debugText displayCtrl 1401) ctrlsetText format["%1", ES_ArtemDebugSaveTemp];
		};

		case "Ins Fahrzeug einsteigen": {

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};
				player moveInAny (vehicle ES_ArtemDebugPLayer);
				_toLog = format ["Name: %1 || UID: %2 || Ins Fahrzeug einsteigen || %3 || %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "In mein Fahrzeug einsteigen": {

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};
				ES_ArtemDebugPLayer moveInAny (vehicle player);
				_toLog = format ["Name: %1 || UID: %2 || In mein Fahrzeug einsteigen || %3 || %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Debug Variable Check": {

			If((call ES_adminlevel) < 1) exitWith {closeDialog 0;};
				_code = ctrlText 1401;
				if(_code == "") exitWith { systemChat "Kein Text!" };
				if(["RscDisplayDebugPublic",_code] call BIS_fnc_inString) exitwith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };
				if(["fn_camera",_code] call BIS_fnc_inString) exitwith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };
				if(["camera",_code] call BIS_fnc_inString) exitwith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };
				if(["ES_shop_sell_menu",_code] call BIS_fnc_inString) exitwith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };
				if(["ArtemUID",_code] call BIS_fnc_inString) exitwith { systemChat "[ArtemTooL]: Funktioniert nicht!"; };
				hintSilent str (call compile _code);
				[] spawn {sleep 10; hintSilent "";};
		};

	    case "GodMode": {

	    	disableSerialization;

			if(ES_god) then {
				ES_god = false;
				systemChat "[ArtemTooL]: GodMode ist aus";
				_toLog = format ["Name: %1 || UID: %2 || GodMode || OFF", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				player allowDamage true;
			} else {
				ES_god = true;
				systemChat "[ArtemTooL]: GodMode ist an";
				_toLog = format ["Name: %1 || UID: %2 || GodMode || ON", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				player allowDamage false;
			};

		};

		case "Spieler Fesseln": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};
				if(ES_ArtemDebugPLayer getVariable "restrained") then {
					systemChat "[ArtemTooL]: Er ist schon gefesselt!";
					}else{
						ES_ArtemDebugPLayer setVariable ["restrained",true,true];
						[[player], "ES_fnc_restrain", ES_ArtemDebugPLayer, false] call ES_fnc_MP;
						systemChat format ["[ArtemTooL]: Spieler gefesselt: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
						_toLog = format ["Name: %1 || UID: %2 || Spieler gefesselt: %3 || Position: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
						["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
						[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				};
		};

		case "Spieler Freilassen": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};

				if(ES_ArtemDebugPLayer getVariable "restrained") then {
					ES_ArtemDebugPLayer setVariable ["restrained",false,true];
					systemChat format ["[ArtemTooL]: Spieler freigelassen: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
					_toLog = format ["Name: %1 || UID: %2 || Spieler freigelassen: %3 || Position: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					}else{systemChat "[ArtemTooL]: Du bist nicht gefesselt!";};
		};

		case "Selbst Freilassen": {

	    	disableSerialization;
				if(player getVariable "restrained") then {
					player setVariable ["restrained",false,true];
					systemChat "[ArtemTooL]: Selbst freigelassen";
					_toLog = format ["Name: %1 || UID: %2 || Selbst freigelassen", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					}else{systemChat "[ArtemTooL]: Du bist nicht gefesselt!";};
		};

		case "Convoy Starten": {

	    	disableSerialization;

	    			if(isNil "ConvoyStart") then { ConvoyStart = false; publicVariable "ConvoyStart"; };
	    			if(ConvoyStart) exitWith { systemChat "[ArtemTooL]: Convoy ist schon an oder war schon!"; };
	    			ConvoyStart = true; publicVariable "ConvoyStart";

					[] spawn {
							mav_convoy_missiongenerator_scriptthread = [] spawn {
							mav_convoy_missiongenerator_loop = true;
							_convoyClassname = (getArray(missionConfigFile >> "Maverick_ConvoySidemission" >> "Config" >> "ConfigPool")) call BIS_fnc_selectRandom;
							mav_convoy_currentsessiondone = false;
							[_convoyClassname] spawn mav_convoy_fnc_startConvoy;
						};
					};

					systemChat "[ArtemTooL]: Convoy Starten";
					_toLog = format ["Name: %1 || UID: %2 || Convoy Starten", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Fahrzeug GodMode": {

			disableSerialization;

			if (vehicle player != player) then
			{
				if (isNil {vehicle player getVariable "ES_vehgodmode"}) then {vehicle player setVariable ["ES_vehgodmode",false,true];};
				if (vehicle player getVariable "ES_vehgodmode") then
				{
					vehicle player setVariable ["ES_vehgodmode",false,true];
					vehicle player allowDamage true;
					vehicle player setDamage 0;
					vehicle player setFuel 1;
					systemChat "[ArtemTooL]: Fahrzeug GodMode ist aus";
					_toLog = format ["Name: %1 || UID: %2 || Fahrzeug GodMode || OFF", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					_vehgodmode = ((findDisplay 2900) displayCtrl 2413);
					_vehgodmode ctrlSetTextColor [1, 1, 1, 1];
				} else {
					vehicle player setVariable ["ES_vehgodmode",true,true];
					vehicle player allowDamage false;
					vehicle player setDamage 0;
					vehicle player setFuel 1;
					systemChat "[ArtemTooL]: Fahrzeug GodMode ist an";
					_toLog = format ["Name: %1 || UID: %2 || Fahrzeug GodMode || AN", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					_vehgodmode = ((findDisplay 2900) displayCtrl 2413);
					_vehgodmode ctrlSetTextColor [0, 255, 0, 1];
				};
			} else { systemChat "[ArtemTooL]: Du must im Fahrzeug sein!"; };
		};

		case "Map Marker": {

			disableSerialization;

				private["_PlayerMarkers","_pSee"];

				if (!ES_markers) then {
					ES_markers = true;
					ES_markersvaar = true;
					systemChat "[ArtemTooL]: MapMarker an";
					PlayerMarkers = [];
					_toLog = format ["Name: %1 || UID: %2 || MAPICONS || ON", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					_marker = ((findDisplay 2900) displayCtrl 2414);
					_marker ctrlSetTextColor [0, 255, 0, 1];
				} else {
					ES_markers = false;
					ES_markersvaar = false;
					systemChat "[ArtemTooL]: MapMarker aus";
					_toLog = format ["Name: %1 || UID: %2 || MAPICONS || OFF", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					_marker = ((findDisplay 2900) displayCtrl 2414);
					_marker ctrlSetTextColor [1, 1, 1, 1];
				};

				_PlayerMarkers = [];
				while {ES_markers} do
				{
					{
						if !(_x in playableUnits) then {
							deleteMarkerLocal str _x;
						};
					} forEach _PlayerMarkers;
					{
						if(alive _x && side _x == west) then {
							deleteMarkerLocal str _x;
							_pSee = createMarkerLocal [str _x,getPos _x];
							_pSee setMarkerTypeLocal "mil_triangle";
							_pSee setMarkerPosLocal getPos _x;
							_pSee setMarkerSizeLocal [1,1];
							_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
							_pSee setMarkerColorLocal ("ColorBLUFOR");
							if !(_x in _PlayerMarkers) then {
								_PlayerMarkers pushback _x;
							};
						};

						if(alive _x && side _x == independent) then {
							deleteMarkerLocal str _x;
							_pSee = createMarkerLocal [str _x,getPos _x];
							_pSee setMarkerTypeLocal "mil_triangle";
							_pSee setMarkerPosLocal getPos _x;
							_pSee setMarkerSizeLocal [1,1];
							_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
							_pSee setMarkerColorLocal ("ColorIndependent");
							if !(_x in _PlayerMarkers) then {
								_PlayerMarkers pushback _x;
							};
						};
						if(alive _x && side _x == civilian) then {
							deleteMarkerLocal str _x;
							_pSee = createMarkerLocal [str _x,getPos _x];
							_pSee setMarkerTypeLocal "mil_triangle";
							_pSee setMarkerPosLocal getPos _x;
							_pSee setMarkerSizeLocal [1,1];
							_pSee setMarkerTextLocal format['%1',_x getVariable["realname",name _x]];
							_pSee setMarkerColorLocal ("ColorCivilian");
							if !(_x in _PlayerMarkers) then {
								_PlayerMarkers pushback _x;
							};
						};
					} forEach playableUnits;
					sleep 1;
				};

				{
					deleteMarkerLocal str _x;
				} forEach _PlayerMarkers;

		};

		case "Fahrzeug Map Marker": {

	    	disableSerialization;

				if (!ES_vehmarkers) then {
					ES_vehmarkers = true;
					systemChat "[ArtemTooL]: Fahrzeug Marker an";
					PlayerMarkers = [];
					_toLog = format ["Name: %1 || UID: %2 || FAHRZEUG MARKER || ON", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					_vehmarker = ((findDisplay 2900) displayCtrl 2415);
					_vehmarker ctrlSetTextColor [0, 255, 0, 1];
				} else {
					ES_vehmarkers = false;
					systemChat "[ArtemTooL]: Fahrzeug Marker aus";
					_toLog = format ["Name: %1 || UID: %2 || FAHRZEUG MARKER  || OFF", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					_vehmarker = ((findDisplay 2900) displayCtrl 2415);
					_vehmarker ctrlSetTextColor [1, 1, 1, 1];
				};


				adminVehicleMarkers =
				{
					while {markadVehicleMarker == 1} do
					{
						{
							_typename = gettext (configFile >> 'CfgVehicles' >> typeOf _x >> 'displayName');
							_xPos = getPos _x;

							_cm = ('adminVehicleMarkers' + (str _forEachIndex));
							_pos = getMarkerPos _cm;
							if((_pos select 0 != _xPos select 0) || (_pos select 1 != _xPos select 1))then
							{
								deleteMarkerLocal _cm;
								_vm = createMarkerLocal [_cm,_xPos];
								_vm setMarkerDirLocal (getDir _x);
								_vm setMarkerTypeLocal 'mil_start';
								_vm setMarkerColorLocal 'ColorBlue';
								_vm setMarkerTextLocal format['%1',_typename];
							};
							if(markadVehicleMarker == 0)exitWith{};
						} forEach ([0,0,0] nearEntities[['LandVehicle','Ship','Air','Tank'],1000000]);
						if(markadVehicleMarker == 0)exitWith{};
						uiSleep 1;
						if(markadVehicleMarker == 0)exitWith{};
					};
					for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
				};
				if(isNil 'markadVehicleMarker')then{markadVehicleMarker = 0;};
				if(markadVehicleMarker == 0)then
				{

					markadVehicleMarker = 1;
					ES_vehmarkers = true;
					[] spawn adminVehicleMarkers;
				}
				else
				{
					markadVehicleMarker = 0;
					ES_vehmarkers = false;
					for '_i' from 0 to 99999 do {deleteMarkerLocal ('adminVehicleMarkers' + (str _i));};
				};

		};

		case "InfoText": {

			disableSerialization;

				closeDialog 0;
				createDialog "Info_menu";

		};

		case "Nitro Speed Ändern": {

			disableSerialization;
				_value = parseNumber(ctrlText 1401);
				_code = ctrlText 1401;
				_chrByte = toArray (_code);
				_allowed = toArray("0123456789");
				_badallowed = false;
				if(_code == "") exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den Max Speed eingeben. z.B. 300"; };

				if(_value < 55) exitWith { systemChat "[ArtemTooL]: Wenieger als 55 geht nicht!"; };
				if(_value > 600 ) exitWith { systemChat "[ArtemTooL]: Mehr als 600 geht nicht!"; };
				{if(!(_x in _allowed)) exitWith { _badallowed = true; };} foreach _chrByte;
				if(_badallowed) exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den Max Speed eingeben. z.B. 300"; };
				maxNitroSpeed = _value;
				systemChat format ["[ArtemTooL]: Nitro wurde auf %1 geändert", maxNitroSpeed];
				_toLog = format ["Name: %1 || UID: %2 || NITRO SPEED AUF || %3", player getVariable["realname",name player], getPlayerUID player, maxNitroSpeed];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Geld": {

	    		disableSerialization;
				private["_value","_action","_toLog"];

				if (isNil "ES_ArtemTooLMain") then { ES_ArtemTooLMain = true; };
				if(!ES_ArtemTooLMain) exitWith {};
				if(ES_ArtemTooLMain) then {
					ES_ArtemTooLMain = false;
					[] spawn {
						sleep 1;
						ES_ArtemTooLMain = true;
					};
				};

				_value = parseNumber(ctrlText 1401);
				_code = ctrlText 1401;
				_chrByte = toArray (_code);
				_allowed = toArray("0123456789");
				_badallowed = false;
				if(_code == "") exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den betrag eingeben. z.B. 25000"; };

				if(_value < 0) exitWith { systemChat "[ArtemTooL]: Wenieger als 0 geht nicht!"; };
				if(_value > 5000000 ) exitWith { systemChat "[ArtemTooL]: Mehr als 5000000 auf einmal geht nicht!"; };
				{if(!(_x in _allowed)) exitWith { _badallowed = true; };} foreach _chrByte;
				if(_badallowed) exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den betrag eingeben. z.B. 25000"; };

				ES_cash = ES_cash + _value;
				systemChat format ["[ArtemTooL]: %1 $ selbst gegeben",[_value] call ES_fnc_numberText];
				_toLog = format ["Name: %1 || UID: %2 || Selbst Geld gegeben || %3 $", player getVariable["realname",name player], getPlayerUID player, [_value] call ES_fnc_numberText];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Arsenal": {

			If((getPlayerUID player) in ArtemTooLSpawnBlackList) exitWith { systemChat "[ArtemTooL]: Du darfst nix Spawnen!" };

	    	disableSerialization;

				closeDialog 0;
				["Open",true] spawn BIS_fnc_arsenal;
				_toLog = format ["Name: %1 || UID: %2 || ARSENAL GEÖFFNET", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				systemChat "[ArtemTooL]: Arsenal Geöffnet";
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Fahrzeug Keys 500m": {

	    	disableSerialization;

				_nearVehicles = nearestObjects [getPos player,["Car","Truck","Air"],500];
				if(count _nearVehicles == 0) exitWith { systemChat "[ArtemTooL]: Es sind Keine Fahrzeuge in der Nähe 500m"; };
				{
					ES_vehicles set[count ES_vehicles,_x];
				}forEach _nearVehicles;
				_toLog = format ["Name: %1 || UID: %2 || FAHRZEUG KEYS 500m", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				systemChat "[ArtemTooL]: Arsenal Geöffnet";
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Spieler Namen Sehen": {

	    	disableSerialization;
			if (isNil "ES_ArtemNamen") then { ES_ArtemNamen = true; };
				If (ES_ArtemNamen) then {
				systemChat "[ArtemTooL]: Spieler Namen Sehen ist an!";
				ES_ArtemNamen = false;
		    	addMissionEventHandler["Draw3D", {
				    	_units = playableUnits - [player];
						{
							if((isPlayer _x) && ((player distance _x) < 8) && (getplayeruid _x != "")) then {
								_pos = getposatl _x;
								_eyepos = ASLtoATL eyepos _x;
								_1 = _x modelToWorld [-0.5,0,0];
								_2 = _x modelToWorld [0.5,0,0];
								_3 = _x modelToWorld [-0.5,0,0];
								_4 = _x modelToWorld [0.5,0,0];
								_1 set [2,_pos select 2];
								_2 set [2,_pos select 2];
								_3 set [2,(_eyepos select 2)+0.33];
								_4 set [2,(_eyepos select 2)+0.33];
								_HP = (damage _x - 1) * -100;
								_fontsize = 0.025;
								_eyepos set [2,(_3 select 2) - 0.1];
								drawIcon3D["",[1,1,1,1],_eyepos,0.1,0.1,45,format["[%1] %2",(group _x) getVariable ["gang_name",""],name _x],1,_fontsize,'TahomaB'];
							};
						} forEach _units;
					}];
				} else { systemChat "[ArtemTooL]: Spieler Namen Sehen ist aus!"; ES_ArtemNamen = true; removeAllMissionEventHandlers "Draw3D";};
		};

		case "ESP Spieler": {

	    	disableSerialization;
			if (isNil "ES_ArtemESP") then { ES_ArtemESP = true; };
				If (ES_ArtemESP) then {
				systemChat "[ArtemTooL]: ESP Spieler ist an!";
				ES_ArtemESP = false;
		    	addMissionEventHandler["Draw3D", {
		    			_units = playableUnits - [player];
						{
							if((isPlayer _x) && ((player distance _x) < 700) && (getplayeruid _x != "")) then {
								_pos = getposatl _x;
								_eyepos = ASLtoATL eyepos _x;
								_1 = _x modelToWorld [-0.5,0,0];
								_2 = _x modelToWorld [0.5,0,0];
								_3 = _x modelToWorld [-0.5,0,0];
								_4 = _x modelToWorld [0.5,0,0];
								_1 set [2,_pos select 2];
								_2 set [2,_pos select 2];
								_3 set [2,(_eyepos select 2)+0.25];
								_4 set [2,(_eyepos select 2)+0.25];
								_HP = (damage _x - 1) * -100;
								_fontsize = 0.025;
								_eyepos set [2,(_3 select 2) - 0.1];
								drawIcon3D["",[0,1,0,1],_eyepos,0.1,0.1,45,format["[%1] %2 (%3m) - %4HP",(group _x) getVariable ["gang_name",""],name _x,round(player distance _x),round(_HP)],1,_fontsize,'TahomaB'];
								drawLine3D[_1,_2,[0,1,0,1]];
								drawLine3D[_2,_4,[0,1,0,1]];
								drawLine3D[_4,_3,[0,1,0,1]];
								drawLine3D[_3,_1,[0,1,0,1]];
							};
						} forEach _units;
					}];
				} else { systemChat "[ArtemTooL]: ESP Spieler ist aus!"; ES_ArtemESP = true; removeAllMissionEventHandlers "Draw3D";};
		};

		case "SRB Smoke Fahrzeug": {

	    	disableSerialization;
	    	if(vehicle player != player) then {
			if(vehicle player isKindOf "Land") then {
				if (isnil ("ArtemSRBSmoke")) then {ArtemSRBSmoke = 0;};
				if (ArtemSRBSmoke == 0) then
				{
					ArtemSRBSmoke = 1;
					systemChat "[ArtemTooL]: SRB Smoke Fahrzeug ist an";
					_SRBSmoke = 'while {ArtemSRBSmoke == 1} do { if(vehicle player == player) exitwith { ArtemSRBSmoke=0; };';
					_SRBSmoke = _SRBSmoke + 'Flare = "SmokeShell" createVehicle position vehicle player;Flare attachTo [vehicle player,[0,0,3]];';
					_SRBSmoke = _SRBSmoke + 'Flare1 = "SmokeShell" createVehicle position vehicle player;Flare1 attachTo [vehicle player,[0,0,4]];';
					_SRBSmoke = _SRBSmoke + 'Flare2 = "SmokeShell" createVehicle position vehicle player;Flare2 attachTo [vehicle player,[0,0,5]];';
					_SRBSmoke = _SRBSmoke + 'Flare3 = "Smokeshellblue" createVehicle position vehicle player;Flare3 attachTo [vehicle player,[0,0,6]];';
					_SRBSmoke = _SRBSmoke + 'Flare4 = "Smokeshellblue" createVehicle position vehicle player;Flare4 attachTo [vehicle player,[0,0,7]];';
					_SRBSmoke = _SRBSmoke + 'Flare5 = "Smokeshellblue" createVehicle position vehicle player;Flare5 attachTo [vehicle player,[0,0,8]];';
					_SRBSmoke = _SRBSmoke + 'Flare6 = "SmokeShellRed" createVehicle position vehicle player;Flare6 attachTo [vehicle player,[0,0,9]];';
					_SRBSmoke = _SRBSmoke + 'Flare7 = "SmokeShellRed" createVehicle position vehicle player;Flare7 attachTo [vehicle player,[0,0,10]];';
					_SRBSmoke = _SRBSmoke + 'Flare8 = "SmokeShellRed" createVehicle position vehicle player;Flare8 attachTo [vehicle player,[0,0,11]];';
					_SRBSmoke = _SRBSmoke + 'sleep 28;};';
					[] spawn compile _SRBSmoke;
				}
				else
				{
					sleep 0.5;
					deleteVehicle Flare;
					deleteVehicle Flare1;
					deleteVehicle Flare2;
					deleteVehicle Flare3;
					deleteVehicle Flare4;
					deleteVehicle Flare5;
					deleteVehicle Flare6;
					deleteVehicle Flare7;
					deleteVehicle Flare8;
					ArtemSRBSmoke=0;
					systemChat "[ArtemTooL]: SRB Smoke Fahrzeug ist aus";
				};
				[] spawn {
					sleep 3;
					[Flare4,Flare4] remoteExec ["ES_shop_sell_RainbowSRB",-2];
				};
			}else{systemChat "[ArtemTooL]: Du bist nicht in einem Land Fahrzeug";};
			}else{systemChat "[ArtemTooL]: Du bist nicht in einem Fahrzeug";};
		};

		case "SRB Smoke Flugzeug": {

	    	disableSerialization;
	    	if(vehicle player != player) then {
			if(vehicle player isKindOf "Air") then {
				if (isnil ("ArtemSRBSmokeAir")) then {ArtemSRBSmokeAir = 0;};
				if (ArtemSRBSmokeAir == 0) then
				{
					ArtemSRBSmokeAir = 1;
					systemChat "[ArtemTooL]: SRB Smoke Flugzeug ist an";
					_SRBSmokeAir = 'while {ArtemSRBSmokeAir==1} do { if(vehicle player == player) exitwith { ArtemSRBSmokeAir=0; };';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare = "Smokeshellblue" createVehicle position vehicle player;Flare attachTo [vehicle player,[0,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare1 = "Smokeshellblue" createVehicle position vehicle player;Flare1 attachTo [vehicle player,[1,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare2 = "SmokeShell" createVehicle position vehicle player;Flare2 attachTo [vehicle player,[2,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare3 = "Smokeshellblue" createVehicle position vehicle player;Flare3 attachTo [vehicle player,[-1,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare4 = "SmokeShellRed" createVehicle position vehicle player;Flare4 attachTo [vehicle player,[-2,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare5 = "SmokeShellRed" createVehicle position vehicle player;Flare5 attachTo [vehicle player,[-3,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare6 = "SmokeShell" createVehicle position vehicle player;Flare6 attachTo [vehicle player,[3,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare7 = "SmokeShell" createVehicle position vehicle player;Flare7 attachTo [vehicle player,[4,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'Flare8 = "SmokeShellRed" createVehicle position vehicle player;Flare8 attachTo [vehicle player,[-4,0,0]];';
					_SRBSmokeAir = _SRBSmokeAir + 'sleep 28;};';

					[] spawn compile _SRBSmokeAir;
				}
				else
				{
					sleep 0.5;
					deleteVehicle Flare;
					deleteVehicle Flare1;
					deleteVehicle Flare2;
					deleteVehicle Flare3;
					deleteVehicle Flare4;
					deleteVehicle Flare5;
					deleteVehicle Flare6;
					deleteVehicle Flare7;
					deleteVehicle Flare8;
					ArtemSRBSmokeAir=0;
					systemChat "[ArtemTooL]: SRB Smoke Flugzeug ist aus";
				};
				[] spawn {
					sleep 3;
					[Flare4,Flare4] remoteExec ["ES_shop_sell_RainbowSRB",-2];
				};
			}else{systemChat "[ArtemTooL]: Du bist nicht in einem Flugzeug";};
			}else{systemChat "[ArtemTooL]: Du bist nicht in einem Fahrzeug";};
		};

		case "Unbegrenzte Munition": {

	    	disableSerialization;

			ES_ArtemUnbegrenzteAmmo = {
				if (isNil "ArtemUnbegrenzteAmmo") then { ArtemUnbegrenzteAmmo = 0; };
					if(ArtemUnbegrenzteAmmo == 0)then
					{
						ArtemUnbegrenzteAmmo = 1;
						systemChat "[ArtemTooL]: Unbegrenzte Munition: AN";
						_toLog = format ["Name: %1 || UID: %2 || Unbegrenzte Munition: AN", player getVariable["realname",name player], getPlayerUID player];
						[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					}
					else
					{
						ArtemUnbegrenzteAmmo = 0;
						systemChat "[ArtemTooL]: Unbegrenzte Munition: AUS";
						_toLog = format ["Name: %1 || UID: %2 || Unbegrenzte Munition: AUS", player getVariable["realname",name player], getPlayerUID player];
						[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					};

					while {ArtemUnbegrenzteAmmo == 1} do
					{
						if(local vehicle player)then{ vehicle player setAmmo [currentWeapon vehicle player, 1000000]; };
						player setAmmo [primaryWeapon player, 1000000];
						(vehicle player) setVehicleAmmo 1;
						player setFatigue 0;
						uiSleep 0.3;
					};
				};
				[] spawn ES_ArtemUnbegrenzteAmmo;
		};

		case "Schnelles Feuern": {

	    	disableSerialization;

			ES_ArtemSchnellesFeuern = {
					if (isNil "ArtemSchnellesFeuern") then { ArtemSchnellesFeuern = 0; };
						if(ArtemSchnellesFeuern == 0)then
						{
							ArtemSchnellesFeuern = 1;
							systemChat "[ArtemTooL]: Schnelles Feuern: AN";
							_toLog = format ["Name: %1 || UID: %2 || Schnelles Feuern: AN", player getVariable["realname",name player], getPlayerUID player];
							[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
						}
						else
						{
							ArtemSchnellesFeuern = 0;
							systemChat "[ArtemTooL]: Schnelles Feuern: AUS";
							_toLog = format ["Name: %1 || UID: %2 || Schnelles Feuern: AUS", player getVariable["realname",name player], getPlayerUID player];
							[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
						};

						while {ArtemSchnellesFeuern == 1} do
						{
							_vehicle = (vehicle player);
							_done = _vehicle setWeaponReloadingTime [gunner (vehicle player), currentMuzzle (gunner (vehicle player)), 0];
							uiSleep 0.1;
						};

					};
				[] spawn ES_ArtemSchnellesFeuern;
		};

		case "Kein Rückstoss": {

	    	disableSerialization;

			ES_ArtemNoRecoil = {
					if (isNil "ArtemNoRecoil") then { ArtemNoRecoil = 0; };
						if(ArtemNoRecoil==0)then
						{
							ArtemNoRecoil=1;
							systemChat "[ArtemTooL]: Kein Rückstoss: AN";
							_toLog = format ["Name: %1 || UID: %2 || Kein Rückstoss: AN", player getVariable["realname",name player], getPlayerUID player];
							[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
						}
						else
						{
							ArtemNoRecoil=0;
							systemChat "[ArtemTooL]: Kein Rückstoss: AUS";
							_toLog = format ["Name: %1 || UID: %2 || Kein Rückstoss: AUS", player getVariable["realname",name player], getPlayerUID player];
							[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
						};
						while {ArtemNoRecoil==1} do
						{
							if(ArtemNoRecoil!=1)exitWith{};
							(vehicle player) setUnitRecoilCoefficient 0;
							player setUnitRecoilCoefficient 0;
							player setCustomAimCoef 0;
							player setFatigue 0;
							uiSleep 1;
						};
						(vehicle player) setUnitRecoilCoefficient 1;
						player setUnitRecoilCoefficient 1;
					};
				[] spawn ES_ArtemNoRecoil;
		};

		case "Geilo Kamera": {

			disableSerialization;

			closeDialog 0;

				["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
				ES_firstDia = true;
				2 cutFadeOut 0.5;
				[] spawn {sleep 1; showChat false};
				_toLog = format ["Name: %1 || UID: %2 || GEILO KAMERA GEÖFFNET", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				systemChat "[ArtemTooL]: Geilo Kamera Geöffnet - Mit ESC schliessen!";
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				[] spawn { sleep 1;
					while {true} do
					{
						if(!ES_firstDia)exitWith{};
						waitUntil{!isNull (findDisplay 49)};

						["Terminate"] call BIS_fnc_EGSpectator;
						ES_firstDia = false;
						[] call ES_fnc_hudSetup;
						[] spawn {sleep 1; showChat true};
						_toLog = format ["Name: %1 || UID: %2 || KAMERA NEU GESCHLOSSEN", player getVariable["realname",name player], getPlayerUID player];
						["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
						systemChat "[ArtemTooL]: Kamera Neu Geschlossen";
						[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

						waitUntil{isNull (findDisplay 49)};
					};
				};
		};

		case "Unsichtbar": {

			disableSerialization;

				if (!ES_unsichtbar) then {
					ES_unsichtbar = true;
					ES_Uniform = uniform player;
					player forceAddUniform "U_VirtualMan_F";
					_toLog = format ["Name: %1 || UID: %2 || UNSICHTBAR || AN", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					systemChat "[ArtemTooL]: Unsichtbar an";
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					player setVariable ["GhostRider", true, true];
				} else {
					ES_unsichtbar = false;
					If(ES_Uniform == "") then { player forceAddUniform "U_C_Man_casual_2_F"; }else{ player forceAddUniform ES_Uniform; };
					systemChat "[ArtemTooL]: Sichtbar aus";
					_toLog = format ["Name: %1 || UID: %2 || UNSICHTBAR || OFF", player getVariable["realname",name player], getPlayerUID player];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					player setVariable ["GhostRider", false, false];
				};

		};

		case "Zuschauen": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};

				[] spawn {
				  while {dialog} do {
				   closeDialog 0;
				   sleep 0.01;
				  };
				};

				ES_ArtemDebugPLayer switchCamera "INTERNAL";
				systemChat format ["[ArtemTooL]: Zuschauen %1 -- Drücke F10 um es zu beenden",ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
				_toLog = format ["Name: %1 || UID: %2 || Zuschauen || Name: %3 || UID: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
				AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';systemChat '[ArtemTooL]: Zuschauen beendet!';};false"];

		};

		case "Geld geben": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				_value = parseNumber(ctrlText 1401);
				_code = ctrlText 1401;
				_chrByte = toArray (_code);
				_allowed = toArray("0123456789");
				_badallowed = false;
				if(_code == "") exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den betrag eingeben. z.B. 25000"; };

				if(_value < 0) exitWith { systemChat "[ArtemTooL]: Wenieger als 0 geht nicht!"; };
				if(_value > 5000000 ) exitWith { systemChat "[ArtemTooL]: Mehr als 5000000 auf einmal geht nicht!"; };
				{if(!(_x in _allowed)) exitWith { _badallowed = true; };} foreach _chrByte;
				if(_badallowed) exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den betrag eingeben. z.B. 25000"; };


				[[_value],"ES_fnc_shop_sell_Bank",ES_ArtemDebugPLayer,false] spawn ES_fnc_MP;
				systemChat format ["[ArtemTooL]: Du hast %1 %2 $ auf sein Bank Konto gegeben", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], [_value] call ES_fnc_numberText];
				_toLog = format ["NAME: %1 || UID: %2 || SPIELER GELD GEGEBN AUF BANK || NAME: %3 || UID %4 || %5 $", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer, [_value] call ES_fnc_numberText];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Spieler zu mir Teleportieren": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};

				ES_ArtemDebugPLayer setPos (getPos player);
				systemChat format["[ArtemTooL]: Du hast %1 zu dir Teleportiert!",ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];

				_toLog = format ["Name: %1 || UID: %2 || TELEPORT SPIELER ZU MIR || %3 || %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Spieler Wiederbeleben": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};

				[[name player],"ES_fnc_revived", ES_ArtemDebugPLayer,false] spawn ES_fnc_MP;
				systemChat format ["[ArtemTooL]: Wiederbeleben: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
				_toLog = format ["Name: %1 || UID: %2 || Wiederbeleben || SPIELER: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], mapGridPosition ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Arena Spawnen": {

	    	disableSerialization;

		    	if(isNil "GunMasterArena") then { GunMasterArena = false; };
				if(GunMasterArena) exitWith { systemChat "[ArtemTooL]: Die Arena wurde schon gespawnt!"; };

				GunMasterArena = true;

				publicVariable "GunMasterArena";

				_GunMaster = [

					["GunGame_1","Land_Mil_WallBig_Gate_F",[11626.478,20538.16,0],"",[],109.799,""],
					["GunGame_2","Land_BarGate_F",[11627.752,20537.36,0.404],"",[],109.847,""],
					["GunGame_3","Land_Mil_WallBig_4m_F",[11625.207,20532.455,0],"",[],109.440,""],
					["GunGame_4","Land_Mil_WallBig_4m_F",[11623.928,20528.836,0],"",[],109.440,""],
					["GunGame_5","Land_Mil_WallBig_4m_F",[11622.655,20525.213,0],"",[],109.440,""],
					["GunGame_6","Land_Mil_WallBig_4m_F",[11621.376,20521.592,0],"",[],109.440,""],
					["GunGame_7","Land_Mil_WallBig_4m_F",[11620.121,20517.961,0],"",[],109.440,""],
					["GunGame_8","Land_Mil_WallBig_4m_F",[11618.844,20514.336,0],"",[],109.404,""],
					["GunGame_9","Land_Mil_WallBig_4m_F",[11617.559,20510.719,0.005],"",[],109.404,""],
					["GunGame_10","Land_Mil_WallBig_4m_F",[11616.282,20507.098,0],"",[],109.404,""],
					["GunGame_11","Land_Mil_WallBig_4m_F",[11615.005,20503.479,0.049],"",[],109.440,""],
					["GunGame_12","Land_Mil_WallBig_4m_F",[11613.733,20499.857,0],"",[],109.440,""],
					["GunGame_13","Land_Mil_WallBig_4m_F",[11612.45,20496.234,0],"",[],109.440,""],
					["GunGame_14","Land_Mil_WallBig_4m_F",[11609.921,20493.428,0],"",[],156.387,""],
					["GunGame_15","Land_Mil_WallBig_4m_F",[11606.4,20491.887,0],"",[],156.387,""],
					["GunGame_16","Land_Mil_WallBig_4m_F",[11602.883,20490.355,0],"",[],156.387,""],
					["GunGame_17","Land_Mil_WallBig_4m_F",[11599.364,20488.818,0],"",[],156.387,""],
					["GunGame_18","Land_Mil_WallBig_4m_F",[11595.64,20488.629,0],"",[],199.086,""],
					["GunGame_19","Land_Mil_WallBig_4m_F",[11592.01,20489.885,0],"",[],199.086,""],
					["GunGame_20","Land_Mil_WallBig_4m_F",[11588.382,20491.146,0],"",[],199.086,""],
					["GunGame_21","Land_Mil_WallBig_4m_F",[11584.754,20492.404,0],"",[],199.086,""],
					["GunGame_22","Land_Mil_WallBig_4m_F",[11581.125,20493.656,0],"",[],199.086,""],
					["GunGame_23","Land_Mil_WallBig_4m_F",[11577.496,20494.906,0],"",[],199.086,""],
					["GunGame_24","Land_Mil_WallBig_4m_F",[11573.868,20496.166,0],"",[],199.086,""],
					["GunGame_25","Land_Mil_WallBig_4m_F",[11570.239,20497.422,0],"",[],199.086,""],
					["GunGame_26","Land_Mil_WallBig_4m_F",[11566.604,20498.678,0],"",[],199.086,""],
					["GunGame_27","Land_Mil_WallBig_4m_F",[11562.98,20499.939,0],"",[],199.086,""],
					["GunGame_28","Land_Mil_WallBig_4m_F",[11559.352,20501.195,0],"",[],199.086,""],
					["GunGame_29","Land_Mil_WallBig_4m_F",[11555.725,20502.451,0],"",[],199.086,""],
					["GunGame_30","Land_Mil_WallBig_4m_F",[11552.098,20503.701,0],"",[],199.086,""],
					["GunGame_31","Land_Mil_WallBig_4m_F",[11548.465,20504.961,0],"",[],199.086,""],
					["GunGame_32","Land_Mil_WallBig_4m_F",[11544.827,20506.19,0],"",[],199.086,""],
					["GunGame_33","Land_Mil_WallBig_4m_F",[11541.195,20507.447,0],"",[],199.086,""],
					["GunGame_34","Land_Mil_WallBig_4m_F",[11537.568,20508.71,0],"",[],199.086,""],
					["GunGame_35","Land_Mil_WallBig_4m_F",[11533.939,20509.965,0],"",[],199.086,""],
					["GunGame_36","Land_Mil_WallBig_4m_F",[11530.31,20511.219,0],"",[],199.086,""],
					["GunGame_37","Land_Mil_WallBig_4m_F",[11526.683,20512.469,0.011],"",[],199.086,""],
					["GunGame_38","Land_Mil_WallBig_4m_F",[11523.055,20513.729,0.010],"",[],199.086,""],
					["GunGame_39","Land_Mil_WallBig_4m_F",[11520.324,20516.293,0.013],"",[],246.493,""],
					["GunGame_40","Land_Mil_WallBig_4m_F",[11518.792,20519.816,0.022],"",[],246.492,""],
					["GunGame_41","Land_Mil_WallBig_4m_F",[11517.265,20523.338,0.029],"",[],246.492,""],
					["GunGame_42","Land_Mil_WallBig_4m_F",[11515.733,20526.861,0.032],"",[],246.492,""],
					["GunGame_43","Land_Mil_WallBig_4m_F",[11515.552,20530.582,0.039],"",[],289.190,""],
					["GunGame_44","Land_Mil_WallBig_4m_F",[11516.816,20534.213,0.039],"",[],289.190,""],
					["GunGame_45","Land_Mil_WallBig_4m_F",[11518.081,20537.838,0.026],"",[],289.190,""],
					["GunGame_46","Land_Mil_WallBig_4m_F",[11519.348,20541.461,0.026],"",[],289.190,""],
					["GunGame_47","Land_Mil_WallBig_4m_F",[11520.61,20545.088,0.009],"",[],289.190,""],
					["GunGame_48","Land_Mil_WallBig_4m_F",[11521.862,20548.717,0.010],"",[],289.190,""],
					["GunGame_49","Land_Mil_WallBig_4m_F",[11523.13,20552.344,0],"",[],289.190,""],
					["GunGame_50","Land_Mil_WallBig_4m_F",[11524.394,2055.394,0],"",[],289.190,""],
					["GunGame_51","Land_Mil_WallBig_4m_F",[11525.654,20559.602,0.016],"",[],289.190,""],
					["GunGame_52","Land_Mil_WallBig_4m_F",[11526.92,20563.233,0.015],"",[],289.190,""],
					["GunGame_53","Land_Mil_WallBig_4m_F",[11528.117,20566.738,0],"",[],289.190,""],
					["GunGame_54","Land_Mil_WallBig_4m_F",[11531.977,20577.72,0],"",[],289.337,""],
					["GunGame_55","Land_Mil_WallBig_4m_F",[11533.25,20581.344,0],"",[],289.337,""],
					["GunGame_56","Land_Mil_WallBig_4m_F",[11534.516,20584.967,0],"",[],289.337,""],
					["GunGame_57","Land_Mil_WallBig_4m_F",[11535.79,20588.59,0],"",[],289.337,""],
					["GunGame_58","Land_Mil_WallBig_4m_F",[11537.038,20592.225,0],"",[],289.337,""],
					["GunGame_59","Land_Mil_WallBig_4m_F",[11538.308,20595.852,0],"",[],289.337,""],
					["GunGame_60","Land_Mil_WallBig_4m_F",[11539.585,20599.47,0.005],"",[],289.337,""],
					["GunGame_61","Land_Mil_WallBig_4m_F",[11540.857,20603.094,0],"",[],289.337,""],
					["GunGame_62","Land_Mil_WallBig_4m_F",[11542.128,20606.717,0.081],"",[],289.337,""],
					["GunGame_63","Land_Mil_WallBig_4m_F",[11543.395,20610.34,0],"",[],289.337,""],
					["GunGame_64","Land_Mil_WallBig_4m_F",[11544.669,20613.965,0],"",[],289.337,""],
					["GunGame_65","Land_Mil_WallBig_4m_F",[11547.192,20616.775,0],"",[],336.285,""],
					["GunGame_66","Land_Mil_WallBig_4m_F",[11550.711,20618.322,0],"",[],336.285,""],
					["GunGame_67","Land_Mil_WallBig_4m_F",[11554.228,20619.861,0],"",[],336.285,""],
					["GunGame_68","Land_Mil_WallBig_4m_F",[11557.743,20621.404,0],"",[],336.285,""],
					["GunGame_69","Land_Mil_WallBig_4m_F",[11561.465,20621.6,0],"",[],18.983,""],
					["GunGame_70","Land_Mil_WallBig_4m_F",[11565.099,20620.35,0],"",[],18.983,""],
					["GunGame_71","Land_Mil_WallBig_4m_F",[11568.729,20619.096,0],"",[],18.983,""],
					["GunGame_72","Land_Mil_WallBig_4m_F",[11572.357,20617.844,0],"",[],18.983,""],
					["GunGame_73","Land_Mil_WallBig_4m_F",[11575.99,20616.6,0],"",[],18.983,""],
					["GunGame_74","Land_Mil_WallBig_4m_F",[11579.622,20615.355,0],"",[],18.983,""],
					["GunGame_75","Land_Mil_WallBig_4m_F",[11583.252,20614.104,0],"",[],18.983,""],
					["GunGame_76","Land_Mil_WallBig_4m_F",[11586.883,20613.852,0],"",[],18.983,""],
					["GunGame_77","Land_Mil_WallBig_4m_F",[11590.519,20611.602,0],"",[],18.983,""],
					["GunGame_78","Land_Mil_WallBig_4m_F",[11594.146,20610.35,0],"",[],18.983,""],
					["GunGame_79","Land_Mil_WallBig_4m_F",[11597.776,20609.1,0],"",[],18.983,""],
					["GunGame_80","Land_Mil_WallBig_4m_F",[11601.407,20607.85,0],"",[],18.983,""],
					["GunGame_81","Land_Mil_WallBig_4m_F",[11605.037,20606.605,0],"",[],18.983,""],
					["GunGame_82","Land_Mil_WallBig_4m_F",[11608.67,20605.354,0],"",[],18.983,""],
					["GunGame_83","Land_Mil_WallBig_4m_F",[11612.311,20604.129,0],"",[],18.983,""],
					["GunGame_84","Land_Mil_WallBig_4m_F",[11615.946,20602.881,0],"",[],18.983,""],
					["GunGame_85","Land_Mil_WallBig_4m_F",[11649.573,20601.625,0],"",[],18.983,""],
					["GunGame_86","Land_Mil_WallBig_4m_F",[11623.205,20600.375,0],"",[],18.983,""],
					["GunGame_87","Land_Mil_WallBig_4m_F",[11626.839,20599.129,0.059],"",[],18.983,""],
					["GunGame_88","Land_Mil_WallBig_4m_F",[11630.467,20597.885,0],"",[],18.983,""],
					["GunGame_89","Land_Mil_WallBig_4m_F",[11634.099,20596.631,0.008],"",[],18.983,""],
					["GunGame_90","Land_Mil_WallBig_4m_F",[11636.829,20594.07,0],"",[],66.389,""],
					["GunGame_91","Land_Mil_WallBig_4m_F",[11638.371,20590.549,0.005],"",[],66.389,""],
					["GunGame_92","Land_Mil_WallBig_4m_F",[11639.903,20587.031,0.005],"",[],66.389,""],
					["GunGame_93","Land_Mil_WallBig_4m_F",[11641.439,20583.512,0.006],"",[],66.389,""],
					["GunGame_94","Land_Mil_WallBig_4m_F",[11641.628,20579.79,0],"",[],109.087,""],
					["GunGame_95","Land_Mil_WallBig_4m_F",[11640.373,20576.158,0],"",[],109.087,""],
					["GunGame_96","Land_Mil_WallBig_4m_F",[11639.133,20572.53,0],"",[],109.087,""],
					["GunGame_97","Land_Mil_WallBig_4m_F",[11637.853,20568.904,0],"",[],109.087,""],
					["GunGame_98","Land_Mil_WallBig_4m_F",[11636.6,20565.273,0],"",[],109.087,""],
					["GunGame_99","Land_Mil_WallBig_4m_F",[11635.35,20561.645,0],"",[],109.087,""],
					["GunGame_100","Land_Mil_WallBig_4m_F",[11634.09,20558.018,0],"",[],109.087,""],
					["GunGame_101","Land_Mil_WallBig_4m_F",[11632.834,20554.387,0.007],"",[],109.087,""],
					["GunGame_102","Land_Mil_WallBig_4m_F",[11631.578,20550.754,0.011],"",[],109.087,""],
					["GunGame_103","Land_Mil_WallBig_4m_F",[11630.32,20547.131,0],"",[],109.087,""],
					["GunGame_104","Land_Mil_WallBig_4m_F",[11629.061,20543.502,0],"",[],109.087,""],
					["GunGame_105","Land_Cargo_Tower_V1_F",[11608.32,20485.121,-1],"",[],245.308,""],
					["GunGame_106","Land_Cargo_Tower_V1_F",[11512.627,20517.719,0],"",[],336.192,""],
					["GunGame_107","Land_Cargo_Tower_V1_F",[11549.344,20625.186,-1],"",[],64.871,""],
					["GunGame_108","Land_Cargo_Tower_V1_F",[11644.575,20592.273,-1],"",[],156.526,""],
					["GunGame_109","Land_Cargo_Patrol_V1_F",[11636.56,20554.72,0],"",[],108.627,""],
					["GunGame_110","Land_Cargo_Patrol_V1_F",[11624.832,20518.342,0],"",[],110.064,""],
					["GunGame_111","Land_Cargo_Patrol_V1_F",[11574.225,20492.35,0],"",[],199.496,""],
					["GunGame_112","Land_Cargo_Patrol_V1_F",[11540.958,20503.826,0],"",[],200.774,""],
					["GunGame_113","Land_Cargo_Patrol_V1_F",[11520.442,20555.207,0],"",[],289.266,""],
					["GunGame_114","Land_Cargo_Patrol_V1_F",[11533.289,20592.436,0],"",[],289.701,""],
					["GunGame_115","Land_Cargo_Patrol_V1_F",[11584.64,20617.43,0],"",[],18.880,""],
					["GunGame_116","Land_Cargo_Patrol_V1_F",[11612.611,20607.943,0],"",[],17.955,""],
					["GunGame_117","Land_LampStadium_F",[11637.16,20597.3,0],"",[],312.416,""],
					["GunGame_118","Land_LampStadium_F",[11643.312,20581.387,0],"",[],5.471,""],
					["GunGame_119","Land_LampStadium_F",[11613.642,20492.887,0],"",[],35.986,""],
					["GunGame_120","Land_LampStadium_F",[11597.629,20486.803,0],"",[],88.115,""],
					["GunGame_121","Land_LampStadium_F",[11520.117,20513.338,0],"",[],130.791,""],
					["GunGame_122","Land_LampStadium_F",[11513.317,20528.64,0],"",[],175.046,""],
					["GunGame_123","Land_LampStadium_F",[11543.944,20617.785,0],"",[],226.537,""],
					["GunGame_124","Land_LampStadium_F",[11559.572,20623.938,0],"",[],265.723,""],
					["GunGame_125","Land_Wreck_HMMWV_F",[11586.42,20517.156,0],"",[],217.589,""],
					["GunGame_126","Land_Wreck_Ural_F",[11574.461,20555.566,0],"",[],0,""],
					["GunGame_127","Land_UWreck_MV22_F",[11593.571,20592.654,0.412],"",[],138.715,""],
					["GunGame_128","Land_Wreck_Heli_Attack_01_F",[11546.453,20532.35,0.003],"",[],0,""],
					["GunGame_129","Land_Wreck_BRDM2_F",[11544.415,20552.146,0],"",[],317.344,""],
					["GunGame_130","Dirthump_3_F",[11571.66,20536.39,0.001],"",[],0,""],
					["GunGame_131","Dirthump_4_F",[11567.345,20571.488,0],"",[],252.944,""],
					["GunGame_132","Dirthump_1_F",[11592.723,20590.139,0],"",[],247.679,""],
					["GunGame_133","Dirthump_2_F",[11587.755,20536.611,0],"",[],0,""],
					["GunGame_134","Land_CncWall4_F",[11598.189,20552.676,-0.012],"",[],349.173,""],
					["GunGame_135","Land_Rampart_F",[11557.953,20518.873,-0.002],"",[],0,""],
					["GunGame_136","Land_CncBarrierMedium4_F",[11626.03,20581.08,0],"",[],239.383,""],
					["GunGame_137","Land_Concrete_SmallWall_8m_F",[11632.021,20577.557,0],"",[],0,""],
					["GunGame_138","Land_CncBarrier_F",[11602.201,20518.518,-0.12],"",[],85.066,""],
					["GunGame_139","Land_CncBarrier_F",[11573.765,20512.336,-0.15],"",[],127.546,""],
					["GunGame_140","BlockConcrete_F",[11573.765,20512.336,-0.15],"",[],127.546,""],
					["GunGame_141","Land_RampConcreteHigh_F",[11562.687,20606.06,0],"",[],245.416,""],
					["GunGame_142","Land_RampConcrete_F",[11539.691,20578.32,0.1],"",[],233.454,""],
					["GunGame_143","Land_Wreck_Car2_F",[11613.153,20569.174,0],"",[],306.291,""],
					["GunGame_144","Land_Wreck_Skodovka_F",[11613.212,20546.758,0.002],"",[],29.08,""],
					["GunGame_145","Land_Wreck_UAZ_F",[11527.838,20535.184,0],"",[],0,""],
					["GunGame_146","Land_Wreck_Offroad_F",[11531.21,20523.947,0],"",[],137.416,""],
					["GunGame_147","Land_Wreck_Plane_Transport_01_F",[11581.365,20536.717,0.358],"",[],57.410,""],
					["GunGame_148","Land_LampHalogen_F",[11623.353,20523.818,0],"",[],19.130,""],
					["GunGame_149","Land_LampHalogen_F",[11570.509,20496.162,0],"",[],108.898,""],
					["GunGame_150","Land_LampHalogen_F",[11546.028,20504.457,0],"",[],108.898,""],
					["GunGame_151","Land_LampHalogen_F",[11524.334,20559.313,0],"",[],199.276,""],
					["GunGame_152","Land_LampHalogen_F",[11534.246,20587.695,0],"",[],200.345,""],
					["GunGame_153","Land_LampHalogen_F",[11588.322,20613.736,0],"",[],289.910,""],
					["GunGame_154","Land_LampHalogen_F",[11607.176,20607.404,0],"",[],289.910,""],
					["GunGame_155","Land_LampHalogen_F",[11632.699,20551.682,0],"",[],19.130,""],
					["GunGame_156","Land_Tribune_F",[11563.299,20465.596,-0.3],"",[],136.853,""],
					["GunGame_157","Land_Tribune_F",[11553.912,20460.695,-0.5],"",[],170.105,""],
					["GunGame_158","Land_Tribune_F",[11543.588,20461.494,-0.5],"",[],198.437,""],
					["GunGame_159","Land_Tribune_F",[11535.185,20467.811,0],"",[],235.203,""],
					["GunGame_160","Land_Tribune_F",[11531.98,20477.736,-0.25],"",[],268.559,""],
					["GunGame_162","Land_WinnersPodium_01_F",[11549.526,20479.045,0],"",[],22.247,""],
					["GunGame_163","Land_Mil_WallBig_4m_F",[11633.314,20550.289,0.027],"",[],18.548,""],
					["GunGame_164","Land_Mil_WallBig_4m_F",[11636.952,20549.066,0],"",[],18.548,""],
					["GunGame_165","Land_Mil_WallBig_4m_F",[11640.594,20547.842,0],"",[],18.548,""],
					["GunGame_166","Land_Mil_WallBig_4m_F",[11644.23,20546.629,0],"",[],18.695,""],
					["GunGame_167","Land_Mil_WallBig_4m_F",[11647.867,20545.396,0],"",[],18.695,""],
					["GunGame_168","Land_Mil_WallBig_4m_F",[11651.505,20544.164,0],"",[],18.695,""],
					["GunGame_169","Land_Mil_WallBig_4m_F",[11655.143,20542.939,0],"",[],18.695,""],
					["GunGame_170","Land_Mil_WallBig_4m_F",[11656.3,20540.238,0.027],"",[],109.332,""],
					["GunGame_171","Land_Mil_WallBig_4m_F",[11655.026,20536.615,0.027],"",[],109.332,""],
					["GunGame_172","Land_Mil_WallBig_4m_F",[11653.751,20532.992,0.042],"",[],109.332,""],
					["GunGame_173","Land_Mil_WallBig_4m_F",[11652.488,20529.371,0],"",[],109.478,""],
					["GunGame_174","Land_Mil_WallBig_4m_F",[11651.208,20525.752,0.004],"",[],109.478,""],
					["GunGame_175","Land_Mil_WallBig_4m_F",[11649.926,20522.133,0.004],"",[],109.478,""],
					["GunGame_176","Land_Mil_WallBig_4m_F",[11648.652,20518.51,0.011],"",[],109.478,""],
					["GunGame_177","Land_Mil_WallBig_4m_F",[11646.096,20517.111,0.012],"",[],198.964,""],
					["GunGame_178","Land_Mil_WallBig_4m_F",[11642.466,20518.363,0],"",[],198.964,""],
					["GunGame_179","Land_Mil_WallBig_4m_F",[11638.834,20519.613,0],"",[],198.964,""],
					["GunGame_180","Land_Mil_WallBig_4m_F",[11635.205,20520.855,0],"",[],199.110,""],
					["GunGame_181","Land_Mil_WallBig_4m_F",[11631.577,20522.113,0],"",[],199.110,""],
					["GunGame_182","Land_Mil_WallBig_4m_F",[11627.949,20523.371,0],"",[],199.110,""],
					["GunGame_183","Land_Mil_WallBig_4m_F",[11624.321,20524.623,0],"",[],199.110,""],
					["GunGame_184","Land_Mil_WallBig_4m_F",[11532.89,20585.7,0],"",[],18.984,""],
					["GunGame_185","Land_Mil_WallBig_4m_F",[11529.26,20586.943,0],"",[],18.984,""],
					["GunGame_186","Land_Mil_WallBig_4m_F",[11525.629,20588.193,0.001],"",[],18.984,""],
					["GunGame_187","Land_Mil_WallBig_4m_F",[11521.998,20589.443,0],"",[],18.984,""],
					["GunGame_188","Land_Mil_WallBig_4m_F",[11518.367,20590.676,0],"",[],18.837,""],
					["GunGame_189","Land_Mil_WallBig_4m_F",[11514.732,20591.918,0],"",[],18.837,""],
					["GunGame_190","Land_Mil_WallBig_4m_F",[11511.1,20593.162,0.003],"",[],18.837,""],
					["GunGame_191","Land_Mil_WallBig_4m_F",[11508.547,20591.758,0],"",[],289.352,""],
					["GunGame_192","Land_Mil_WallBig_4m_F",[11507.28,20588.133,0],"",[],289.352,""],
					["GunGame_193","Land_Mil_WallBig_4m_F",[11506.007,20584.51,0],"",[],289.352,""],
					["GunGame_194","Land_Mil_WallBig_4m_F",[11504.734,20580.889,0],"",[],289.352,""],
					["GunGame_195","Land_Mil_WallBig_4m_F",[11503.48,20577.264,0.039],"",[],289.205,""],
					["GunGame_196","Land_Mil_WallBig_4m_F",[11502.213,20573.639,0.056],"",[],289.205,""],
					["GunGame_197","Land_Mil_WallBig_4m_F",[11500.946,20570.014,0.025],"",[],289.205,""],
					["GunGame_198","Land_Mil_WallBig_4m_F",[11502.11,20567.314,0],"",[],198.568,""],
					["GunGame_199","Land_Mil_WallBig_4m_F",[11505.751,20566.098,0.003],"",[],198.568,""],
					["GunGame_200","Land_Mil_WallBig_4m_F",[11509.39,20564.873,0],"",[],198.568,""],
					["GunGame_201","Land_Mil_WallBig_4m_F",[11513.03,20563.65,0],"",[],198.568,""],
					["GunGame_202","Land_Mil_WallBig_4m_F",[11516.67,20562.445,0],"",[],198.421,""],
					["GunGame_203","Land_Mil_WallBig_4m_F",[11520.313,20561.229,0.028],"",[],198.421,""],
					["GunGame_204","Land_Mil_WallBig_4m_F",[11523.955,20560.012,0.031],"",[],198.421,""],
					["GunGame_205","Land_CncWall4_F",[11622.405,20557.955,0],"",[],92.722,""],
					["GunGame_206","Land_CncWall4_F",[11609.596,20527.645,0],"",[],5.914,""],
					["GunGame_208","Land_Mil_WallBig_Gate_F",[11626.478,20538.16,0],"",[],109.799,""],
					["GunGame_209","Land_BarGate_F",[11529.317,20572.445,0.434],"",[],289.981,""],
					["GunGame_211","Land_Research_house_V1_F",[11634.596,20543.428,0],"",[],0,""],
					["GunGame_212","Land_Medevac_house_V1_F",[11641.034,20542.137,0],"",[],19.672,""],
					["GunGame_213","B_Slingload_01_Fuel_F",[11652.599,20538.813,-0.003],"",[],0,""],
					["GunGame_214","Land_IronPipes_F",[11647.808,20543.389,0],"",[],33.353,""],
					["GunGame_215","Land_Pipes_small_F",[11650.824,20541.049,0.001],"",[],90.512,""],
					["GunGame_216","Land_Cargo40_red_F",[11642.603,20522.176,-0.8],"",[],0,""],
					["GunGame_217","Land_Research_house_V1_F",[11512.349,20586.158,0],"",[],0,""],
					["GunGame_218","Land_Medevac_house_V1_F",[11518.787,20584.867,0],"",[],19.672,""],
					["GunGame_219","B_Slingload_01_Fuel_F",[11530.479,20581.594,-0.002],"",[],0,""],
					["GunGame_220","Land_IronPipes_F",[11525.561,20586.119,-0.2],"",[],33.353,""],
					["GunGame_221","Land_Pipes_small_F",[11528.577,20583.78,0],"",[],90.512,""],
					["GunGame_222","Land_Cargo40_red_F",[11505.167,20574.594,0],"",[],108.008,""],
					["GunGame_223","Land_MetalBarrel_F",[11525.399,20560.93,0],"",[],0,""],
					["GunGame_224","Land_MetalBarrel_F",[11525.748,20562.033,0],"",[],0,""],
					["GunGame_225","Land_MetalBarrel_F",[11524.926,20561.61,0],"",[],0,""],
					["GunGame_226","Land_MetalBarrel_F",[11523.778,20561.461,0],"",[],0,""],
					["GunGame_227","Land_MetalBarrel_F",[11524.469,20560.961,0],"",[],0,""],
					["GunGame_228","Land_MetalBarrel_F",[11652.573,20534.584,0],"",[],0,""],
					["GunGame_229","Land_MetalBarrel_F",[11652.562,20533.898,0],"",[],0,""],
					["GunGame_230","Land_MetalBarrel_F",[11651.902,20534.51,0],"",[],0,""],
					["GunGame_231","Land_MetalBarrel_F",[11652.059,20535.092,-0.041],"",[],0,""],
					["GunGame_232","Land_Mil_WallBig_4m_F",[11524.394,20555.969,0],"",[],289.190,""],
					["GunGame_233","Land_Mil_WallBig_4m_F",[11619.573,20601.625,0],"",[],18.983,""]

				] call ES_fnc_SpawnEventMap;

				_marker = createMarker ["GungameMaster1",[11626.478,20538.16,0]];
				_marker setMarkerType "Empty";
				_marker setMarkerDir 0;
				_marker setMarkerShape "ELLIPSE";
				_marker setMarkerSize [500, 500];
				_marker setMarkerBrush "Solid";
				_marker setMarkerColor "ColorWhite";

				_marker = createMarker ["GungameMaster2",[11626.478,20538.16,0]];
				_marker setMarkerType "Empty";
				_marker setMarkerDir 0;
				_marker setMarkerShape "ELLIPSE";
				_marker setMarkerSize [500, 500];
				_marker setMarkerBrush "Border";
				_marker setMarkerColor "ColorBlack";

				_marker = createMarker ["GungameMasterText",[11476.4,20657.5,0.00146484]];
				_marker setMarkerType "hd_flag";
				_marker setMarkerDir 0;
				_marker setMarkerColor "ColorRed";
				"GungameMasterText" setMarkerText "Arena!";

				_marker = createMarker ["GungameMasterText_2",[11461.6,20482.4,0.00126648]];
				_marker setMarkerType "hd_dot";
				_marker setMarkerDir 0;
				_marker setMarkerColor "ColorRed";
				"GungameMasterText_2" setMarkerText "Flugverbotszone [Wird direkt GELÖSCHT!]";

				_trg = createTrigger ["EmptyDetector", [11626.478,20538.16,0],false];
				_trg setTriggerArea [500, 500, 0, false];
				_trg setTriggerActivation ["ANY", "PRESENT", true];
				_trg setTriggerStatements [
					'this && (local player) && (vehicle player in thisList)',
					"{if (GunMasterArena && (_x isKindOf 'Air')) then {{deleteVehicle _x; hintSilent parsetext ""<t color='#ff0000'><t align='center'><t size='1.39'>Flugverbotszone! Dein Flugzeug wurde gelöscht!</t>"";} forEach crew _x;deleteVehicle _x};} forEach thisList; ",
					""
				];

				systemChat "[ArtemTooL]: Die Arena wurde Gespawnt!";
				_toLog = format ["Name: %1 || UID: %2 || Arena", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Arena Löschen": {

				if(isNil "GunMasterArena") then { GunMasterArena = false; };
				if(!GunMasterArena) exitWith { systemChat "[ArtemTooL]: Die Arena ist moch nicht gespawnt!"; };

				closeDialog 0;

				titleText["Arena wird gelöscht Bitte Warten!","PLAIN DOWN"];

				[] spawn {
					_clear = nearestObjects [[11626.478,20538.16,0],[],150];
					_SuchenUndFicken = 0;
					for "_i" from 0 to count _clear - 1
					do
					{
						_SuchenUndFicken = _SuchenUndFicken + 1;
						deleteVehicle (_clear select _i);
						sleep 0.015;
					};

					titleText[format["Arena wurde gelöscht: %1 Objekte", _SuchenUndFicken],"PLAIN DOWN"];
				};

				deleteMarker "GungameMaster1";
				deleteMarker "GungameMaster2";
				deleteMarker "GungameMasterText";
				deleteMarker "GungameMasterText_2";
				deleteMarker "EmptyDetector";

				GunMasterArena = false;
				publicVariable "GunMasterArena";

				systemChat "[ArtemTooL]: Die Arena wird gelöscht!";
				_toLog = format ["Name: %1 || UID: %2 || Arena Löschen", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "SafeZone setzen (Radius 250m)": {

		    	if(isNil "Event_Admin_Artem") then { Event_Admin_Artem = false; };
				if(Event_Admin_Artem) exitWith { systemChat "[ArtemTooL]: Die SafeZone wurde schon gespawnt!"; };

				Event_Admin_Artem = true;

				publicVariable "Event_Admin_Artem";

				closeDialog 0;

				SafeZone={
					_pos = [_this select 0, _this select 1, _this select 2];

					_markername1 = "Event_Admin";
					_markername2 = "Event_Admin_Text";

					_marker = createMarker [_markername1, [_pos select 0, _pos select 1, 0]];
					_marker setMarkerShape "ELLIPSE";
					_marker setMarkerSize [250, 250];
					_marker setMarkerBrush "SOLID";
					_marker setMarkerColor "ColorGreen";

					_marker2 = createMarker [_markername2, [_pos select 0, _pos select 1, 0]];
					_marker2 setMarkerColor "ColorBlack";
					_marker2 setMarkerType "mil_warning";
					_marker2 setMarkerShape "ICON";
					_marker2 setMarkerSize [1,1];
					_marker2 setMarkerText "Event SafeZone!";

					onMapSingleClick "";
					openMap [false, false];
					systemChat "[ArtemTooL]: Die SafeZone wurde gesetzt!";

				};

				openMap [true, false];
				onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call SafeZone";

				_toLog = format ["Name: %1 || UID: %2 || SafeZone gesetzt", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Die SafeZone Löschen": {

				if(isNil "Event_Admin_Artem") then { Event_Admin_Artem = false; };
				if(!Event_Admin_Artem) exitWith { systemChat "[ArtemTooL]: Die SafeZone ist moch nicht gespawnt!"; };

				deleteMarker "Event_Admin";
				deleteMarker "Event_Admin_Text";

				Event_Admin_Artem = false;
				publicVariable "Event_Admin_Artem";

				systemChat "[ArtemTooL]: Die SafeZone wurde gelöscht!";
				_toLog = format ["Name: %1 || UID: %2 || SafeZone Löschen", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Mich zum Spieler Teleportieren": {

	    	disableSerialization;


			if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

			if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};

			player setPos (getPos ES_ArtemDebugPLayer);

			_toLog = format ["Name: %1 || UID: %2 || TELEPORT ZUM SPIELER || %3 || %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
			["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
			systemChat format ["[ArtemTooL]: Zum Spieler %1 geportet",ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
			[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Frezzen": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
				[player] remoteExec ["ES_fnc_freezePlayer",ES_ArtemDebugPLayer];
				systemChat format ["[ArtemTooL]: Gefrezzt Name: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
				_toLog = format ["NAME: %1 || UID: %2 || GEFREZZT NAME: %3 || UID: %4", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Eject Spieler": {

	    	disableSerialization;

	    	if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

					_unit = ES_ArtemDebugPLayer;

					moveOut _unit;

					unassignVehicle _unit;

					_unit action ['eject', (vehicle _unit)];

				systemChat format ["[ArtemTooL]: Eject Name: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
		};

		case "Flare Gun": {

	    	disableSerialization;

	    	if (isNull (unitBackpack player)) then {player addBackpack "B_Kitbag_cbr"};
	    	_weapon = [player, "LMG_Mk200_F", 2] call BIS_fnc_addWeapon;

				player addEventHandler ["fired",{
			    _p = _this select 6;
			    _weapon = _this select 1;
			    _v = velocity _p;
			    if(_weapon == "LMG_Mk200_F") then {
			        _f = 'CMflare_Chaff_Ammo' createVehicle (position _p);
			        _f setposatl (getposatl _p);_f setVelocity _v;
			        [_p,_f] spawn {waitUntil{isNull (_this select 0)}; deleteVehicle (_this select 1);};
			    };
			}];
			systemChat "[ArtemTooL]: Flare Gun AKTIVIERT! Nur mit der MK200!";
		};

		case "Inventar Öffnen Spieler": {

	    	disableSerialization;
			if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };
			if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};
			closeDialog 0;
			createGearDialog [ES_ArtemDebugPLayer,'RscDisplayInventory'];
			systemChat format ["[ArtemTooL]: Inventar Öffnen Spieler: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
			_toLog = format ["Name: %1 || UID: %2 || Inventar Öffnen Spieler || SPIELER: %3 || UID %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
			["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
			[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Map schreiben Rainbow": {

	    	disableSerialization;

			if(isNil "fnc_Map_Drawing_Toggle") then { fnc_Map_Drawing_Toggle = true; };
			fnc_Map_Drawing = {
                            disableserialization;
                            _display = findDisplay 12;
                            _ctrl = _display displayCtrl 51;

                            if(fnc_Map_Drawing_Toggle) then {

                                    fnc_Map_Drawing_Toggle = false;

                                    _ctrl ctrlAddEventHandler["MouseButtonDown",{
                                            _key = _this select 1;
                                            if(_key == 0) then {
                                                    fnc_Map_Drawing_KeyDown = true;
                                            };
                                    }];
                                    _ctrl ctrlAddEventHandler["MouseButtonUp",{
                                            _key = _this select 1;
                                            if(_key == 0) then {
                                                    fnc_Map_Drawing_KeyDown = false;
                                            };
                                    }];
                                    _ctrl ctrlAddEventHandler["MouseMoving",{
                                            if(fnc_Map_Drawing_KeyDown) then {
                                                    _map = _this select 0;
                                                    _x = _this select 1;
                                                    _y = _this select 2;
                                                    _worldPos = _map ctrlMapScreenToWorld [_x,_y];
                                                    _name = str(random(1000000)) + "_swag";
                                                    _mark = createMarker [_name,_worldPos];
                                                    _mark setMarkerType "hd_dot";
                                                    _mark setMarkerPos _worldPos;
                                                    _mark setMarkerSize [0.75,0.75];
                                                    _randomColor = selectRandom ["ColorBlack","ColorBlue","ColorGreen","ColorGrey","ColorKhaki","ColorOrange","ColorPink","ColorRed","ColorWhite","ColorYellow","ColorBrown","Default","Color1_FD_F","Color2_FD_F","Color3_FD_F","Color4_FD_F","Color5_FD_F","colorBLUFOR","ColorWEST","ColorCIV","colorCivilian","ColorEAST","colorOPFOR","colorIndependent","ColorGUER","ColorUNKNOWN"];
                                                    _mark setMarkerColor _randomColor;
                                            };

                                    }];
                                    systemChat "[ArtemTooL]: Map schreiben an.";
                            } else {
                                    _ctrl ctrlRemoveAllEventHandlers "MouseButtonUp";
                                    _ctrl ctrlRemoveAllEventHandlers "MouseMoving";
                                    _ctrl ctrlRemoveAllEventHandlers "MouseButtonDown";
                                    fnc_Map_Drawing_Toggle = true;
                                    systemChat "[ArtemTooL]: Map schreiben aus";
                                    (uiNamespace getVariable 'ArtemTpViaMap') ctrlAddEventHandler['MouseButtonDown','call ES_st_ArtemTpViaMap'];
                            };
                    };

                    [] call fnc_Map_Drawing;
		};

		case "Map Markierungen": {

	    	disableSerialization;

    			if(isNil "fnc_Map_Drawing_Toggle_Event") then { fnc_Map_Drawing_Toggle_Event = true; };
    			ES_fnc_EventDrawing = {
                                disableserialization;
                                _display = findDisplay 12;
                                _ctrl = _display displayCtrl 51;

                                if(fnc_Map_Drawing_Toggle_Event) then {

                                        fnc_Map_Drawing_Toggle_Event = false;

                                        _ctrl ctrlAddEventHandler["MouseButtonDown",{
                                                _key = _this select 1;
                                                if(_key == 0) then {
                                                        fnc_Map_Drawing_KeyDown_Event = true;
                                                };
                                        }];
                                        _ctrl ctrlAddEventHandler["MouseButtonUp",{
                                                _key = _this select 1;
                                                if(_key == 0) then {
                                                        fnc_Map_Drawing_KeyDown_Event = false;
                                                };
                                        }];
                                        _ctrl ctrlAddEventHandler["MouseMoving",{
                                                if(fnc_Map_Drawing_KeyDown_Event) then {
                                                        _map = _this select 0;
                                                        _x = _this select 1;
                                                        _y = _this select 2;
                                                        _worldPos = _map ctrlMapScreenToWorld [_x,_y];
                                                        _name = str(random(1000000)) + "_swag";
                                                        _mark = createMarker [_name,_worldPos];
                                                        _mark setMarkerType "hd_dot";
                                                        _mark setMarkerPos _worldPos;
                                                        _mark setMarkerSize [0.75,0.75];
                                                        _mark setMarkerColor "ColorRed";
                                                };

                                        }];
                                        systemChat "[ArtemTooL]: Map schreiben an. Wird es ausgenutzt werden die Rechte entzogen!";
                                        _toLog = format ["Name: %1 || UID: %2 || Map schreiben an", player getVariable["realname",name player], getPlayerUID player];
										["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
										[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
                                } else {
                                        _ctrl ctrlRemoveAllEventHandlers "MouseButtonUp";
                                        _ctrl ctrlRemoveAllEventHandlers "MouseMoving";
                                        _ctrl ctrlRemoveAllEventHandlers "MouseButtonDown";
                                        fnc_Map_Drawing_Toggle_Event = true;
                                        systemChat "[ArtemTooL]: Map schreiben aus";
                                        _toLog = format ["Name: %1 || UID: %2 || Map schreiben aus", player getVariable["realname",name player], getPlayerUID player];
										["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
										[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
                                        If((call ES_adminlevel) >= 5) then {
                                            (uiNamespace getVariable 'ArtemTpViaMap') ctrlAddEventHandler['MouseButtonDown','call ES_st_ArtemTpViaMap'];
                                        };
                                };
                        };

                    [] call ES_fnc_EventDrawing;
		};

		case "Map Markierungen Löschen": {

			if (CurrentMode == "Tanoa") exitWith { systemChat "[ArtemTooL]: Auf Tanoa Kanst du KEINE Markierungen Löschen"; };
			{ if(markerType _x=="hd_dot")then{ deleteMarker _x } }forEach allMapMarkers;
			_toLog = format ["Name: %1 || UID: %2 || Map Markierungen Löschen", player getVariable["realname",name player], getPlayerUID player];
			["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
			[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Gespawnte Fahrzeuge Löschen (Radius 2km)": {

		    _nearVehicles = nearestObjects [getPos player,["Car","Truck","Air","Tank"],2000];
      		if(count _nearVehicles == 0) exitWith {};
        	{
      			  _vehicleData = _x getVariable ["vehicle_info_owners",[]];
				if(count _vehicleData isEqualTo 0) then {deleteVehicle _x};
     	   	}forEach _nearVehicles;
     	   	systemChat "[ArtemTooL]: Gespawnte Fahrzeuge (Radius 2km) wurden gelöscht";
			_toLog = format ["Name: %1 || UID: %2 || Gespawnte Fahrzeuge Löschen (Radius 2km)", player getVariable["realname",name player], getPlayerUID player];
			["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
			[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};



		case "Zeusen": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

					[] spawn {
					  _pos = getPos ES_ArtemDebugPLayer;
					  _bolt = 'LightningBolt' createVehicle _pos;
					  _bolt setVariable ['BIS_enableRandomization',false];
					  _bolt setdamage 1;
					  if(ES_ArtemDebugPLayer getVariable "EisenschmiedeImTeam") then { ES_ArtemDebugPLayer setdamage 0; }else{ ES_ArtemDebugPLayer setdamage 0.1; };
					  _light = '#lightpoint' createVehicle _pos;
					  _light setVariable ['BIS_enableRandomization',false];
					  _light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
					  _light setLightDayLight true;
					  _light setLightBrightness 300;
					  _light setLightAmbient [0.05, 0.05, 0.1];
					  _light setlightcolor [1, 1, 2];
					  uiSleep 0.1;
					  _light setLightBrightness 0;
					  uiSleep 0.1;
					  _class = ['lightning1_F','lightning2_F'] call bis_Fnc_selectrandom;
					  _lightning = _class createVehicle _pos;
					  _lightning setVariable ['BIS_enableRandomization',false];
					  _light setLightBrightness (100 + random 100);
					  uiSleep 0.1;
					  deleteVehicle _lightning;
					  deleteVehicle _light;
					};

					systemChat format ["[ArtemTooL]: Zeus Spieler: %1 (%2)", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer] , getPlayerUID ES_ArtemDebugPLayer];
					_toLog = format ["Name: %1 || UID: %2 || Zeus Spieler || SPIELER: %3 || UID %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Spieler Kicken": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				    ES_ArtemPlayerLB = player;
					publicVariable "ES_ArtemPlayerLB";
					_code = {
						_msg = format ["%1 wurde von %2 gekickt!", player getVariable["realname",name player], ES_ArtemPlayerLB getVariable["realname",name ES_ArtemPlayerLB]];
						[0,_msg,false,[profileName]] remoteExec ["ES_fnc_broadcast",-2];
						playSound "flashbang";
						disableUserInput true;
						ArtemTooLKick = true;
						publicVariable "ArtemTooLKick";
					};

					ES_st_ArtemGearGlobal = compileFinal "(_this select 0) call (_this select 1);";
					publicVariable"ES_st_ArtemGearGlobal";

 					['',_code] remoteExecCall ['ES_st_ArtemGearGlobal',ES_ArtemDebugPLayer];

					systemChat format ["[ArtemTooL]: Spieler gekickt: %1 (%2)", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer] , getPlayerUID ES_ArtemDebugPLayer];
					_toLog = format ["Name: %1 || UID: %2 || Spieler gekickt || SPIELER: %3 || UID %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Gespawnnte Waffen Löschen": {

	    	disableSerialization;
				{ deleteVehicle _x; } foreach (allMissionObjects "GroundWeaponHolder");
				systemChat "[ArtemTooL]: Alle Gespawnnte Waffen wurden gelöscht";
				_toLog = format ["Name: %1 || UID: %2 || ALLE GESPAWNNTE WAFFEN GELÖSCHT", player getVariable["realname",name player], getPlayerUID player];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
		};

		case "Killen": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				ES_ArtemDebugPLayer setDamage 1;

				systemChat format ["[ArtemTooL]: Spieler getötet: %1 (%2)", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer] , getPlayerUID ES_ArtemDebugPLayer];
				_toLog = format ["Name: %1 || UID: %2 || SPIELER GETÖTET || SPIELER: %3 || UID %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
				["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
				[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Teleportieren": {

	    	disableSerialization;

	    	[] spawn {
				If(uniform player == "") then { player forceAddUniform "U_C_Man_casual_2_F"; };
			};

	    	[] spawn {
				if(!("ItemMap" in (items player))) then {
					sleep 0.001;
					player addItem "ItemMap";
					player assignItem "ItemMap";
				};
			};

			[] spawn {
			  while {dialog} do {
			   closeDialog 0;
			   sleep 0.01;
			  };
			};

			tele={
				_pos = [_this select 0, _this select 1, _this select 2];
				(vehicle player) setpos [_pos select 0, _pos select 1, 0];
				onMapSingleClick ""; openMap false;
			};
			openMap [true, false];
			onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele; systemChat format [""[ArtemTooL]: Teleport via Map: %1"", mapGridPosition player];_toLog = format [""Name: %1 || UID: %2 || TELEPORT || %3"", player getVariable[""realname"",name player], getPlayerUID player, mapGridPosition player];[""ADMIN_LOG"",_toLog] remoteExecCall [""ES_fnc_logIt"",2];[_toLog] remoteExecCall [""ES_shop_sell_Broadcast"",-2];";

		};

		case "======================": {disableSerialization;};

		case "Gear Kopieren": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				        removeVest player;
                        removeUniform player;
                        removeBackpackGlobal player;
                        removeHeadgear player;
                        removeAllWeapons player;
                        player removeWeaponGlobal (primaryWeapon player);
                        player removeWeaponGlobal (secondaryWeapon player);
                        removeAllItemsWithMagazines player;

                        _vest = vest ES_ArtemDebugPLayer;
                        _uniform = uniform ES_ArtemDebugPLayer;
                        _backpack = backpack ES_ArtemDebugPLayer;
                        _weapon = primaryWeapon ES_ArtemDebugPLayer;
                        _weapon2 = secondaryWeapon ES_ArtemDebugPLayer;
                        _head = headgear ES_ArtemDebugPLayer;
                        _googles = goggles ES_ArtemDebugPLayer;
                        _items = itemsWithMagazines ES_ArtemDebugPLayer;
                        _itemsWaffe = primaryWeaponItems ES_ArtemDebugPLayer;
                        _itemsSecWaffe = secondaryWeaponItems ES_ArtemDebugPLayer;
                        player addVest _vest;
                        player forceAddUniform _uniform;
                        player addBackPack _backpack;
                        player addWeapon _weapon;
                        player addWeapon _weapon2;
                        player addHeadgear _head;
                        player addGoggles _googles;

                        { player addItem _x; }forEach _items;
                        { player addPrimaryWeaponItem _x; }forEach _itemsWaffe;
                        { player addSecondaryWeaponItem _x; }forEach _itemsSecWaffe;

                        reload player;

					systemChat format ["[ArtemTooL]: Gear wurde kopiert: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
					_toLog = format ["Name: %1 || UID: %2 || GEARKOPERT: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], mapGridPosition ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Gear Geben": {

	    	disableSerialization;

				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				    ES_ArtemGearPlayerLB = player;
					publicVariable "ES_ArtemGearPlayerLB";

					_code = {
					    removeVest player;
					    removeUniform player;
					    removeBackpackGlobal player;
					    removeHeadgear player;
					    removeAllWeapons player;
					    player removeWeaponGlobal (primaryWeapon player);
					    player removeWeaponGlobal (secondaryWeapon player);
					    removeAllItemsWithMagazines player;

					    _vest = vest ES_ArtemGearPlayerLB;
					    _uniform = uniform ES_ArtemGearPlayerLB;
					    _backpack = backpack ES_ArtemGearPlayerLB;
					    _weapon = primaryWeapon ES_ArtemGearPlayerLB;
					    _weapon2 = secondaryWeapon ES_ArtemGearPlayerLB;
					    _head = headgear ES_ArtemGearPlayerLB;
					    _items = itemsWithMagazines ES_ArtemGearPlayerLB;
					    _itemsWaffe = primaryWeaponItems ES_ArtemGearPlayerLB;
					    _itemsSecWaffe = secondaryWeaponItems ES_ArtemGearPlayerLB;
					    _googles = goggles ES_ArtemGearPlayerLB;

					    player addVest _vest;
					    player forceAddUniform _uniform;
					    player addBackPack _backpack;
					    player addWeapon _weapon;
					    player addWeapon _weapon2;
					    player addHeadgear _head;
					   	player addGoggles _googles;

						{ player addItem _x; }forEach _items;
						{ player addPrimaryWeaponItem _x; }forEach _itemsWaffe;
						{ player addSecondaryWeaponItem _x; }forEach _itemsSecWaffe;

						reload player;
					};

					ES_st_ArtemGearGlobal = compileFinal "(_this select 0) call (_this select 1);";
					publicVariable"ES_st_ArtemGearGlobal";

 					['',_code] remoteExecCall ['ES_st_ArtemGearGlobal',ES_ArtemDebugPLayer];

					systemChat format ["[ArtemTooL]: Gear gegeben %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
					_toLog = format ["Name: %1 || UID: %2 || GEAR GEGEBEN: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], mapGridPosition ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "Gear Löschen": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				    ES_ArtemGearPlayerLB = player;
					publicVariable "ES_ArtemGearPlayerLB";

					_code = {
						removeAllItemsWithMagazines player;
					    removeVest player;
					    removeUniform player;
					    removeBackpackGlobal player;
					    removeHeadgear player;
					    removeAllWeapons player;
					    player removeWeaponGlobal (primaryWeapon player);
					    player removeWeaponGlobal (secondaryWeapon player);
					};

					ES_st_ArtemGearGlobal = compileFinal "(_this select 0) call (_this select 1);";
					publicVariable"ES_st_ArtemGearGlobal";

 					['',_code] remoteExecCall ['ES_st_ArtemGearGlobal',ES_ArtemDebugPLayer];

					systemChat format ["[ArtemTooL]: Gear wurde gelöscht: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];

					_toLog = format ["Name: %1 || UID: %2 || GEAR GELÖSCHT: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], mapGridPosition ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};


		case "Vermienen": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

					ES_st_ArtemMines = {
					        _target = ES_ArtemDebugPLayer;
					        if(typeName _target != 'OBJECT')then
					        {
					            _target = ES_ArtemDebugPLayer;
					        };
					        _pos = screenToWorld [0.5,0.5];
					        _txt = format['MineField (around target) @%1',mapGridPosition _pos];
					        if(!isNull _target)then
					        {
					            _txt = format['MineField (around target) %1 @%2',typeOf _target,mapGridPosition _target];
					            if(isPlayer _target)then
					            {
					                _txt = format['MineField (around target) %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition _target];
					            };
					            _pos = ATLtoASL (_target modelToWorldVisual [0,0,0]);
					        };

					        _mineFields =
					        [
					            [_pos,5]
					        ];
					        {
					            _center = _x select 0;
					            _radius = _x select 1;
					            for '_i' from 0 to 360 step (90 / _radius)*1 do
					            {
					                _location = [(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
					                _dir = ((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
					                _object = createVehicle ['APERSTripMine_Wire_Ammo', _location, [], 0, 'CAN_COLLIDE'];
					                _object setDir _dir;
					            };
					        } forEach _mineFields;
					    };

					    [] call ES_st_ArtemMines;

			    	systemChat format ["[ArtemTooL]: VerMient: %1", ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
					_toLog = format ["Name: %1 || UID: %2 || VERMIENT SPIELER: %3 || POSITION: %4", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], mapGridPosition ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

		};

		case "GodMode geben": {

	    	disableSerialization;


				if(isNil "ES_ArtemDebugPLayer") exitWith { systemChat "[ArtemTooL]: Es wurde kein Spieler ausgewählt!"; };

				if(isNil {ES_ArtemDebugPLayer getVariable "ES_ArtemGodModeTarget"}) then { ES_ArtemDebugPLayer setVariable ["ES_ArtemGodModeTarget", false, false]; };
				if (ES_ArtemDebugPLayer getVariable "ES_ArtemGodModeTarget") then {
					systemChat format ["[ArtemTooL]: GodMode gegeben: %1 || AUS", name ES_ArtemDebugPLayer];
					_toLog = format ["Name: %1 || UID: %2 || GodMode gegeben: %3 (%4) || OFF", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					ES_ArtemDebugPLayer allowDamage true;
					ES_ArtemDebugPLayer setVariable ["ES_ArtemGodModeTarget", false, false];
				} else {
					systemChat format ["[ArtemTooL]: GodMode gegeben: %1 || AN",name ES_ArtemDebugPLayer];
					_toLog = format ["Name: %1 || UID: %2 || GodMode gegeben: %3 (%4) || ON", player getVariable["realname",name player], getPlayerUID player, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
					["ADMIN_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];
					[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
					ES_ArtemDebugPLayer allowDamage false;
					ES_ArtemDebugPLayer setVariable ["ES_ArtemGodModeTarget", true, true];
				};

		};

	    default {};
	};
};


ES_shop_sell_menu_search = {


disableSerialization;
_list = ((findDisplay 2900) displayCtrl 2902);

lbClear _list;

_playableUnits = [];
_playableUnitsName = [];
_name = "";
_realName = "";
_type = "";

{
	if (alive _x) then {
		_name = toLower(_x getVariable["realname",name _x]);

		if([_name,toLower(ctrlText 1400)] call KRON_StrInStr) then {
			switch (side _x) do
			{
				case west: {_type = "Cop"};
				case east: {_type = "East"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "Med"};
			};
			_playableUnits pushBack [name _x, _x getVariable["realname",name _x],_type, _x];
			_playableUnitsName pushBack (name _x);
		};
	};
} foreach playableUnits;


if (_Sorted isEqualTo []) exitWith {
	_list lbAdd "STR_no_player_online";
	_list lbSetdata [(lbSize _list)-1,"Null"];
};

_Sorted = _playableUnitsName call BIS_fnc_sortAlphabetically;

{
	_indexUnits = [_x,_playableUnits] call ES_fnc_index;
		if(_indexUnits != -1) then {
			_name = (_playableUnits select _indexUnits) select 0;
			_realName = (_playableUnits select _indexUnits) select 1;
			_type = (_playableUnits select _indexUnits) select 2;
			_unit = (_playableUnits select _indexUnits) select 3;

		if(vehicle _unit != _unit) then {
		    _list lbAdd format ["%1 (%2) [> IM FAHRZEUG <]",name _unit,_type];
		    _list lbSetData [(lbSize _list)-1,str(_unit)];
			_list lbSetColor [(lbsize _list)-1,[0.012,0.922,0.988,1]];
			if (_unit getVariable "EisenschmiedeImTeam") then {
				_list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			};
			if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				_list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			};
			if (_unit getVariable "ArtemKing") then {
				_list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			};
		    if (uniform _unit != "") then {
		        _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
		    };
			if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
			};
			If (_unit getVariable "ArtemKing") then {
			   _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
			};
			if (_unit getVariable "EisenschmiedePipi") then {
			   _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
			};

		    } else {

			    if (vehicle _unit == _unit) then
			    {
			        if (currentWeapon _unit != "") then {
			            _list lbAdd format ["%1 (%2)",name _unit,_type];
			            _list lbSetData [(lbSize _list)-1,str(_unit)];

			            if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
							_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
						If (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
			            _list lbSetPicture [(lbSize _list)-1, (([currentWeapon _unit] call ES_shop_sell_fetchCfg) select 2)];
			        } else {
			            _list lbAdd format ["%1 (%2)",name _unit,_type];
			            _list lbSetData [(lbSize _list)-1,str(_unit)];

			            if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			            if (uniform _unit != "") then {
			                _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
			            };
			            if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
							_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
						If (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
			        };
			        _list lbSetPictureColor [(lbSize _list)-1, [1, 1, 1, 1]];
			    } else {
			        _list lbAdd format ["%1 (%2)",name _unit,_type];
			        _list lbSetData [(lbSize _list)-1,str(_unit)];

			        if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			        	if (uniform _unit != "") then {
			        	_list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
			        	_list lbSetPictureColor [(lbSize _list)-1, [1, 1, 1, 1]];
			        	if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
							_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
						If (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
			    };
			};
		};
	};
} foreach _Sorted;


};

ES_shop_sell_ColorMain = {

	disableSerialization;

	_ctrl = (findDisplay 2900) displayCtrl 2903;
	_lsize = lbSize 2903;

	for '_i' from 0 to _lsize do
	{
		_lbtxt = lbtext [2903,_i];

		if(_lbtxt in EisenschmiedeAdminLVL1s)then{ _ctrl lbSetColor [_i,[0,0.4,1,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL1p)then{ _ctrl lbSetColor [_i,[1,0,0,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL2s)then{ _ctrl lbSetColor [_i,[0,0.4,1,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL2p)then{ _ctrl lbSetColor [_i,[1,0,0,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL3s)then{ _ctrl lbSetColor [_i,[0,0.4,1,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL3p)then{ _ctrl lbSetColor [_i,[1,0,0,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL4s)then{ _ctrl lbSetColor [_i,[0,0.4,1,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL4p)then{ _ctrl lbSetColor [_i,[1,0,0,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL5s)then{ _ctrl lbSetColor [_i,[0,0.4,1,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL5p)then{ _ctrl lbSetColor [_i,[1,0,0,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL5d)then{ _ctrl lbSetColor [_i,[1,0.6,0.2,1]]; };
		if(_lbtxt in EisenschmiedeAdminLVL5new)then{ _ctrl lbSetColor [_i,[0.8,0,0.8,1]]; };
		if(_lbtxt in EisenschmiedeEvent)then{ _ctrl lbSetColor [_i,[0.012,0.922,0.988,1]]; };
		if(_lbtxt in EisenschmiedeProjektleiter)then{ _ctrl lbSetColor [_i,[1,1,0.2,1]]; };
		if(_lbtxt in EisenschmiedeAdminTestServer)then{ _ctrl lbSetColor [_i,[0,1,1,1]]; };
		if(_lbtxt in EisenschmiedeToggleable)then{ if(_lbtxt in EisenschmiedeToggleable_A)then{ _ctrl lbSetColor [_i,[0,1,0,1]];	}else{ _ctrl lbSetColor [_i,[1,0,0,1]];};};
	};
};


ES_shop_sell_Focus = {

	disableSerialization;

	ctrlSetFocus ((findDisplay 2900) displayCtrl 2902);

	ctrlSetFocus ((findDisplay 2900) displayCtrl 2903);

};

ES_shop_sell_menu_loadscreen = {

disableSerialization;


if(isNil 'EisenschmiedeToggleable_A')then{ EisenschmiedeToggleable_A = ['==== Spieler Aktionen ====']; };

_list = (findDisplay 2900) displayctrl 2902;
_listSA = (findDisplay 2900) displayCtrl 2903;
_textW = (findDisplay 2900) displayCtrl 1007;
_textV = (findDisplay 2900) displayCtrl 1006;
_textSA = (findDisplay 2900) displayCtrl 1005;
_textInfo = (findDisplay 2900) displayCtrl 1004;
_textAT = (findDisplay 2900) displayCtrl 1003;
_textSS = (findDisplay 2900) displayCtrl 1400;
_fncW = (findDisplay 2900) displayCtrl 2901;
_fncv = (findDisplay 2900) displayCtrl 1100;

_textW ctrlSetText "Waffen:";
_textV ctrlSetText "Fahrzeuge:";
_textSA ctrlSetText "Spieler Aktionen:";
_textInfo ctrlSetText "BENUTZEN AUF EIGENER GEFAHR";
_textSS ctrlSetText "";

switch (true) do {
		case ((call ES_adminlevel) == 1): {_textAT ctrlSetText "Dein LvL: Supporter 2";};
		case ((call ES_adminlevel) == 2): {_textAT ctrlSetText "Dein LvL: Supporter 3";};
		case ((call ES_adminlevel) == 3): {_textAT ctrlSetText "Dein LvL: Moderator";};
		case ((call ES_adminlevel) == 4): { if((getPlayerUID player) in DebugTestServer) then { _textAT ctrlSetText "Dein LvL: Arma-Entwickler"; }else{ _textAT ctrlSetText "Dein LvL: Event-Manager"; };};
		case ((call ES_adminlevel) == 5): {_textAT ctrlSetText "Dein LvL: Artem";};
		case ((call ES_adminlevel) == 6): {_textAT ctrlSetText "Dein LvL: Projektleiter";};
		default {_textAT ctrlSetText "Loser";};
};

lbClear _list;

_playableUnits = [];
_playableUnitsName = [];
_onTarget = [];
_Toggleable = [];
_name = "";
_realName = "";
_type = "";

_list lbAdd format ["==== Polizei Online: %1 ====",(west countSide playableUnits)];
_list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
_list lbAdd format ["==== Feuerwehr Online: %1 ====",(independent countSide playableUnits)];
_list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
_list lbAdd format ["==== Zivilisten Online: %1 ====",(civilian countSide playableUnits)];
_list lbSetColor [(lbsize _list)-1,[0.8,0,0.8,1]];
_list lbAdd format ["==== Gesamt Online: %1 ====",count(playableUnits)];
_list lbSetColor [(lbsize _list)-1,[1,1,1,1]];

{
	if (alive _x) then {
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case east: {_type = "East"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_playableUnits pushBack [name _x, _x getVariable["realname",name _x],_type, _x];
		_playableUnitsName pushBack (name _x);
	};
} foreach playableUnits;

_Sorted = _playableUnitsName call BIS_fnc_sortAlphabetically;

{
	_indexUnits = [_x,_playableUnits] call ES_fnc_index;
		if(_indexUnits != -1) then {
			_name = (_playableUnits select _indexUnits) select 0;
			_realName = (_playableUnits select _indexUnits) select 1;
			_type = (_playableUnits select _indexUnits) select 2;
			_unit = (_playableUnits select _indexUnits) select 3;

		if(vehicle _unit != _unit) then {
		    _list lbAdd format ["%1 (%2) [> IM FAHRZEUG <]",name _unit,_type];
		    _list lbSetData [(lbSize _list)-1,str(_unit)];
			_list lbSetColor [(lbsize _list)-1,[0.012,0.922,0.988,1]];
			if (_unit getVariable "EisenschmiedeImTeam") then {
				_list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			};
			if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				_list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			};
			if (_unit getVariable "ArtemKing") then {
				_list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			};
			if (_unit getVariable "EisenschmiedePipi") then {
				_list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			};
		    if (uniform _unit != "") then {
		        _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
		    };
			if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
			};
			If (_unit getVariable "ArtemKing") then {
			    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
			};
			if (_unit getVariable "EisenschmiedePipi") then {
			    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
			};
			if (_unit getVariable "SenakDerOsi") then {
				_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
			};
		    } else {

			    if (vehicle _unit == _unit) then
			    {
			        if (currentWeapon _unit != "") then {
			            _list lbAdd format ["%1 (%2)",name _unit,_type];
			            _list lbSetData [(lbSize _list)-1,str(_unit)];

			            _list lbSetPicture [(lbSize _list)-1, (([currentWeapon _unit] call ES_shop_sell_fetchCfg) select 2)];

			            if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedePipi") then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
					    	_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
			       		if (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
						if (_unit getVariable "SenakDerOsi") then {
							_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
						};
			        } else {
			            _list lbAdd format ["%1 (%2)",name _unit,_type];
			            _list lbSetData [(lbSize _list)-1,str(_unit)];

			            if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedePipi") then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			       		};
			            if (uniform _unit != "") then {
			                _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
			            };
			            if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
					    	_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
						if (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
						if (_unit getVariable "SenakDerOsi") then {
							_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
						};
			        };
			        _list lbSetPictureColor [(lbSize _list)-1, [1, 1, 1, 1]];
			    } else {
			        _list lbAdd format ["%1 (%2)",name _unit,_type];

			        if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedePipi") then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			       		};

			        if (uniform _unit != "") then {
			        _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
			        _list lbSetPictureColor [(lbSize _list)-1, [1, 1, 1, 1]];
			        if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
					   _list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
					};
					if (_unit getVariable "ArtemKing") then {
						_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
					};
					if (_unit getVariable "EisenschmiedePipi") then {
					   _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
					};
					if (_unit getVariable "SenakDerOsi") then {
						_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
					};
			    };
			};
		};
	};
} foreach _Sorted;

if (_Sorted isEqualTo []) exitWith {
	_list lbAdd "STR_no_player_online";
	_list lbSetdata [(lbSize _list)-1,"Null"];
};

if (isNil "ES_ArtemDebugSaveTemp") then { ES_ArtemDebugSaveTemp = "25000"; };

_debugText = findDisplay 2900;
(_debugText displayCtrl 1401) ctrlsetText format["%1", ES_ArtemDebugSaveTemp];

};

ES_shop_sell_menu_loadsearch = {

disableSerialization;


if(isNil 'EisenschmiedeToggleable_A')then{ EisenschmiedeToggleable_A = ['==== Spieler Aktionen ====']; };

_list = (findDisplay 2900) displayctrl 2902;
_listSA = (findDisplay 2900) displayCtrl 2903;
_textW = (findDisplay 2900) displayCtrl 1007;
_textV = (findDisplay 2900) displayCtrl 1006;
_textSA = (findDisplay 2900) displayCtrl 1005;
_textInfo = (findDisplay 2900) displayCtrl 1004;
_textAT = (findDisplay 2900) displayCtrl 1003;
_textSS = (findDisplay 2900) displayCtrl 1400;
_fncW = (findDisplay 2900) displayCtrl 2901;
_fncv = (findDisplay 2900) displayCtrl 1100;

_textW ctrlSetText "Waffen:";
_textV ctrlSetText "Fahrzeuge:";
_textSA ctrlSetText "Spieler Aktionen:";
_textInfo ctrlSetText "BENUTZEN AUF EIGENER GEFAHR";
_textSS ctrlSetText "";

switch (true) do {

		case ((call ES_adminlevel) == 1): {_textAT ctrlSetText "Dein LvL: Supporter 2";};
		case ((call ES_adminlevel) == 2): {_textAT ctrlSetText "Dein LvL: Supporter 3";};
		case ((call ES_adminlevel) == 3): {_textAT ctrlSetText "Dein LvL: Moderator";};
		case ((call ES_adminlevel) == 4): { if((getPlayerUID player) in DebugTestServer) then { _textAT ctrlSetText "Dein LvL: Arma-Entwickler"; }else{ _textAT ctrlSetText "Dein LvL: Event-Manager"; };};
		case ((call ES_adminlevel) == 5): {_textAT ctrlSetText "Dein LvL: Artem";};
		case ((call ES_adminlevel) == 6): {_textAT ctrlSetText "Dein LvL: Projektleiter";};
		default {_textAT ctrlSetText "Loser";};
};

lbClear _list;

_playableUnits = [];
_playableUnitsName = [];
_onTarget = [];
_Toggleable = [];
_name = "";
_realName = "";
_type = "";

_list lbAdd format ["==== Polizei Online: %1 ====",(west countSide playableUnits)];
_list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
_list lbAdd format ["==== Feuerwehr Online: %1 ====",(independent countSide playableUnits)];
_list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
_list lbAdd format ["==== Zivilisten Online: %1 ====",(civilian countSide playableUnits)];
_list lbSetColor [(lbsize _list)-1,[0.8,0,0.8,1]];
_list lbAdd format ["==== Gesamt Online: %1 ====",count(playableUnits)];
_list lbSetColor [(lbsize _list)-1,[1,1,1,1]];

{
	if (alive _x) then {
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case east: {_type = "East"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "Med"};
		};
		_playableUnits pushBack [name _x, _x getVariable["realname",name _x],_type, _x];
		_playableUnitsName pushBack (name _x);
	};
} foreach playableUnits;

_Sorted = _playableUnitsName call BIS_fnc_sortAlphabetically;

{
	_indexUnits = [_x,_playableUnits] call ES_fnc_index;
		if(_indexUnits != -1) then {
			_name = (_playableUnits select _indexUnits) select 0;
			_realName = (_playableUnits select _indexUnits) select 1;
			_type = (_playableUnits select _indexUnits) select 2;
			_unit = (_playableUnits select _indexUnits) select 3;

		if(vehicle _unit != _unit) then {
		    _list lbAdd format ["%1 (%2) [> IM FAHRZEUG <]",name _unit,_type];
		    _list lbSetData [(lbSize _list)-1,str(_unit)];
			_list lbSetColor [(lbsize _list)-1,[0.012,0.922,0.988,1]];
			if (_unit getVariable "EisenschmiedeImTeam") then {
				_list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			};
			if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				_list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			};
			if (_unit getVariable "ArtemKing") then {
				_list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			};
			if (_unit getVariable "EisenschmiedePipi") then {
				_list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			};
		    if (uniform _unit != "") then {
		        _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
		    };
			if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
			};
			If (_unit getVariable "ArtemKing") then {
			    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
			};
			if (_unit getVariable "EisenschmiedePipi") then {
			    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
			};
			if (_unit getVariable "SenakDerOsi") then {
				_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
			};

		    } else {

			    if (vehicle _unit == _unit) then
			    {
			        if (currentWeapon _unit != "") then {
			            _list lbAdd format ["%1 (%2)",name _unit,_type];
			            _list lbSetData [(lbSize _list)-1,str(_unit)];

			            _list lbSetPicture [(lbSize _list)-1, (([currentWeapon _unit] call ES_shop_sell_fetchCfg) select 2)];

			            if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedePipi") then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
					    	_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
			       		if (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
						if (_unit getVariable "SenakDerOsi") then {
					    	_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
						};
			        } else {
			            _list lbAdd format ["%1 (%2)",name _unit,_type];
			            _list lbSetData [(lbSize _list)-1,str(_unit)];

			            if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedePipi") then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			       		};
			            if (uniform _unit != "") then {
			                _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
			            };
			            if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
					    	_list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
						};
						if (_unit getVariable "ArtemKing") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
						};
						if (_unit getVariable "EisenschmiedePipi") then {
						    _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
						};
						if (_unit getVariable "SenakDerOsi") then {
							_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
						};
			        };
			        _list lbSetPictureColor [(lbSize _list)-1, [1, 1, 1, 1]];
			    } else {
			        _list lbAdd format ["%1 (%2)",name _unit,_type];

			        if(side _unit == west) then {
				            _list lbSetColor [(lbsize _list)-1,[0.047,0.502,1,1]];
			       		};
			       		if(side _unit == east) then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.17,0.17,1]];
			       		};
			       		if(side _unit == independent) then {
				            _list lbSetColor [(lbsize _list)-1,[0,0.65,0,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedeImTeam") then {
				            _list lbSetColor [(lbsize _list)-1,[0,1,0,1]];
			       		};
			       		if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "ArtemKing") then {
				            _list lbSetColor [(lbsize _list)-1,[1,1,0.2,1]];
			       		};
			       		if (_unit getVariable "EisenschmiedePipi") then {
				            _list lbSetColor [(lbsize _list)-1,[1,0.2,1,1]];
			       		};

			        if (uniform _unit != "") then {
			        _list lbSetPicture [(lbSize _list)-1, (([uniform _unit] call ES_shop_sell_fetchCfg) select 2)];
			        _list lbSetPictureColor [(lbSize _list)-1, [1, 1, 1, 1]];
			        if (_unit getVariable "PerFecTiiNsKiLLzKing") then {
					   _list lbSetPicture [(lbSize _list)-1,"Images\Icons\King.paa"];
					};
					if (_unit getVariable "ArtemKing") then {
						_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Artem.paa"];
					};
					if (_unit getVariable "EisenschmiedePipi") then {
					   _list lbSetPicture [(lbSize _list)-1,"Images\Icons\Pipi.paa"];
					};
					if (_unit getVariable "SenakDerOsi") then {
						_list lbSetPicture [(lbSize _list)-1,"Images\Icons\Sneak.paa"];
					};
			    };
			};
		};
	};
} foreach _Sorted;

if (_Sorted isEqualTo []) exitWith {
	_list lbAdd "STR_no_player_online";
	_list lbSetdata [(lbSize _list)-1,"Null"];
};

if (isNil "ES_ArtemDebugSaveTemp") then { ES_ArtemDebugSaveTemp = "25000"; };

_debugText = findDisplay 2900;
(_debugText displayCtrl 1401) ctrlsetText format["%1", ES_ArtemDebugSaveTemp];

[] call ES_st_ArtemTooLConfig;
waitUntil {ArtemTooLConfigREADY};

if((call ES_adminlevel) == 6) exitWith {
ctrlShow[1100,false];ctrlShow[2901,false];ctrlShow[1007,false];ctrlShow[1006,false];ctrlShow[1004,false];ctrlShow[1200,false];
If((getPlayerUID player) in ProjektleiterBitches) exitWith {
ctrlShow[1100,true];ctrlShow[2901,true];ctrlShow[1007,true];ctrlShow[1006,true];ctrlShow[1004,true];ctrlShow[1200,true];
If((getPlayerUID player) in ["76561198087725238"]) then {_onTarget pushBack "==== DebugKing ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminTestServer;};
If(((getPlayerUID player) in DebugTestServer) && CurrentServer == "TestServer") then {_onTarget pushBack "==== TestServerDebug ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminTestServer;};
_onTarget pushBack "==== Target Actionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5s;
_onTarget pushBack "==== Spieler Aktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5p;
_onTarget pushBack "==== Event ===="; { _onTarget pushBack _x; } forEach EisenschmiedeEvent;
If((getPlayerUID player) in ProjektleiterBitches) then {_onTarget pushBack "==== Projektleiter ===="; { _onTarget pushBack _x; } forEach EisenschmiedeProjektleiter;};
If((getPlayerUID player) in DebugServer) then {_onTarget pushBack "==== Debug ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5d;};
// _onTarget pushBack "==== Neue Funktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5new;
_onTarget pushBack "======================";
{ _listSA lbAdd _x; } forEach _onTarget;
{ _Toggleable pushBack _x; } forEach EisenschmiedeToggleable;
[] call ES_shop_sell_ColorMain;
};
};

if((call ES_adminlevel) == 5) exitWith {
ctrlShow[1100,false];ctrlShow[2901,false];ctrlShow[1007,false];ctrlShow[1006,false];ctrlShow[1004,false];ctrlShow[1200,false];
If((getPlayerUID player) in AdminsBitches) exitWith {
ctrlShow[1100,true];ctrlShow[2901,true];ctrlShow[1007,true];ctrlShow[1006,true];ctrlShow[1004,true];ctrlShow[1200,true];
_onTarget pushBack "==== Target Actionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5s;
_onTarget pushBack "==== Spieler Aktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5p;
_onTarget pushBack "==== Event ===="; { _onTarget pushBack _x; } forEach EisenschmiedeEvent;
If((getPlayerUID player) in DebugServer) then {_onTarget pushBack "==== Debug ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5d;};
// _onTarget pushBack "==== Neue Funktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL5new;
_onTarget pushBack "======================";
{ _listSA lbAdd _x; } forEach _onTarget;
{ _Toggleable pushBack _x; } forEach EisenschmiedeToggleable;
[] call ES_shop_sell_ColorMain;
};
};
if((call ES_adminlevel) == 4) exitWith {
If(((getPlayerUID player) in DebugTestServer) && CurrentServer == "TestServer") then {_onTarget pushBack "==== TestServerDebug ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminTestServer;};
_onTarget pushBack "==== Target Actionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL4s;
_onTarget pushBack "==== Spieler Aktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL4p;
_onTarget pushBack "==== Event ===="; { _onTarget pushBack _x; } forEach EisenschmiedeEvent;
{ _listSA lbAdd _x; } forEach _onTarget;
{ _Toggleable pushBack _x; } forEach EisenschmiedeToggleable;
[] call ES_shop_sell_ColorMain;
};
if((call ES_adminlevel) == 3) exitWith {
_onTarget pushBack "==== Target Actionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL3s;
_onTarget pushBack "==== Spieler Aktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL3p;
{ _listSA lbAdd _x; } forEach _onTarget;
{ _Toggleable pushBack _x; } forEach EisenschmiedeToggleable;
[] call ES_shop_sell_ColorMain;
};
if((call ES_adminlevel) == 2) exitWith {
_onTarget pushBack "==== Target Actionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL2s;
_onTarget pushBack "==== Spieler Aktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL2p;
{ _listSA lbAdd _x; } forEach _onTarget;
{ _Toggleable pushBack _x; } forEach EisenschmiedeToggleable;
[] call ES_shop_sell_ColorMain;
};
if((call ES_adminlevel) == 1) exitWith {
_onTarget pushBack "==== Target Actionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL1s;
_onTarget pushBack "==== Spieler Aktionen ===="; { _onTarget pushBack _x; } forEach EisenschmiedeAdminLVL1p;
{ _listSA lbAdd _x; } forEach _onTarget;
{ _Toggleable pushBack _x; } forEach EisenschmiedeToggleable;
[] call ES_shop_sell_ColorMain;
};

};

ES_shop_sell_menu = {

disableSerialization;

If((getPlayerUID player) in ArtemTooLGlobalBlackList) exitWith { hintSilent "[ArtemTooL] Dir wurde die Rechte entzogen!"; };
if(isNil {player getVariable "EisenschmiedeImTeam"}) exitWith {closeDialog 0; systemChat "Du bist ein Loser";};
if(isNil 'maxNitroSpeed')then{ maxNitroSpeed = 200; };
if(isNil 'ES_KameraNeu')then{ ES_KameraNeu = false; };
_list = (findDisplay 2900) displayctrl 2902;
_listSA = (findDisplay 2900) displayCtrl 2903;
_fncW = (findDisplay 2900) displayCtrl 2901;
_fncv = (findDisplay 2900) displayCtrl 1100;
if((call ES_adminlevel) < 4) then {

ctrlShow[1100,false];
ctrlShow[2901,false];
ctrlShow[1007,false];
ctrlShow[1006,false];
ctrlShow[1004,false];
ctrlShow[1200,false];

}else{

ctrlShow[1201,false];

};

_list ctrlRemoveAllEventHandlers 'LBDblClick';
_list ctrlRemoveAllEventHandlers 'LBSelChanged';
_list ctrlAddEventHandler ['LBDblClick', '[] spawn ES_shop_sell_FncPlayer; [] call ES_shop_sell_Focus;'];
_list ctrlAddEventHandler ['LBSelChanged', '[] spawn ES_shop_sell_FncSelPlayer; [] call ES_shop_sell_Focus;'];

_listSA ctrlRemoveAllEventHandlers 'LBDblClick';
_listSA ctrlRemoveAllEventHandlers 'LBSelChanged';
_listSA ctrlAddEventHandler ['LBDblClick', '[] spawn ES_shop_sell_Fnc; [] call ES_shop_sell_Focus;'];

_fncW ctrlAddEventHandler ["LBDblClick",{disableSerialization; [_this select 1] spawn ES_shop_sell_WaffenLbc}];
_fncv ctrlAddEventHandler ["LBDblClick",{disableSerialization; [_this select 1] spawn ES_shop_sell_VehicleLbc}];

[] call ES_shop_sell_menu_loadsearch;


ES_fnc_Weapons = [];
_cfg = configFile >> "cfgWeapons";

for "_i" from 0 to count (_cfg)-1 do {
_config = _cfg select _i;

if(isClass _config)then{
        _cname = configName _config;
        _scope = getNumber(_config >> "scope");
        _pic = getText(_config >> "picture");
        _name = getText(_config >> "displayName");

        if(_scope == 2 && _pic != "" && _name != "") then {
            ES_fnc_Weapons = ES_fnc_Weapons + [[_name,_cname,_pic]]
        };
    };
};

_SortedWeapons = ES_fnc_Weapons call BIS_fnc_sortAlphabetically;

{
    _array = _x;

    _text = _array select 0;
    _data = _array select 1;
    _image = _array select 2;

    _ctrl = (findDisplay 2900) displayctrl 2901;
    _ctrl lbAdd _text;
    _ctrl lbSetData [(lbSize _ctrl)-1,_data];
    _ctrl lbSetPicture [(lbSize _ctrl)-1,_image];
} forEach _SortedWeapons;

ES_fnc_Cars = [];
_cfg = configFile >> "cfgVehicles";

for "_i" from 0 to count (_cfg)-1 do {

    _config = _cfg select _i;
    if(isClass _config)then{
        _cname = configName _config;
        _scope = getNumber(_config >> "scope");
        _pic = getText(_config >> "picture");
        _name = getText(_config >> "displayName");

        if (_scope == 2 && (_cname isKindOf "LandVehicle" || _cname isKindOf "Air" || _cname isKindOf "Ship") && _pic !="" &&!((_cname isKindOf"ParachuteBase") || (_cname isKindOf"BIS_Steerable_Parachute"))) then {
            ES_fnc_Cars = ES_fnc_Cars + [[_name,_cname,_pic]];
        };
    };
};

_SortedCars = ES_fnc_Cars call BIS_fnc_sortAlphabetically;

{
    _array = _x;

    _text = _array select 0;
    _data = _array select 1;
    _image = _array select 2;

    _ctrl = (findDisplay 2900) displayctrl 1100;
    _ctrl lbAdd _text;
    _ctrl lbSetData [(lbSize _ctrl)-1,_data];
    _ctrl lbSetPicture [(lbSize _ctrl)-1,_image];
} forEach _SortedCars;


	while {!isNull findDisplay 2900}do {
		waitUntil {isNull findDisplay 2900};
		ES_ArtemDebugPLayer = nil;
	};

};

ES_shop_sell_WaffenLbc = {

	If((getPlayerUID player) in ArtemTooLSpawnBlackList) exitWith { systemChat "[ArtemTooL]: Du darfst nix Spawnen!" };

    _index = _this select 0;
    _data = lbData[2901,_index];
    _wep = _data;
    _mags = getArray(configFile >> "cfgWeapons" >> _wep >> "Magazines");

    _value = parseNumber(ctrlText 1401);
	_code = ctrlText 1401;
	_chrByte = toArray (_code);
	_allowed = toArray("0123456789");
	_badallowed = false;

 	if(isNil "ES_ArtemDebugPLayer") then {
		if(_code == "") exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den betrag eingeben. z.B. 10"; };
		if(_value < 0) exitWith { systemChat "[ArtemTooL]: Wenieger als 0 geht nicht!"; };
		if(_value > 100 ) exitWith { systemChat "[ArtemTooL]: Mehr als 100 auf einmal geht nicht!"; };
		{if(!(_x in _allowed)) exitWith { _badallowed = true; };} foreach _chrByte;
		if(_badallowed) exitWith { systemChat "[ArtemTooL]: Unten in der Leiste den betrag eingeben. z.B. 10"; };
	    ES_fnc_SoWaffen = _value;
	    ES_fnc_SpMags = _value * 5;

	    ES_fnc_WaffenHolder = "GroundWeaponHolder" createVehicle position player;
	    ES_fnc_WaffenHolder addItemCargoGlobal [_wep,ES_fnc_SoWaffen];
	    ES_fnc_WaffenHolder addMagazineCargoGlobal [_mags select 0,ES_fnc_SpMags];

	    systemChat format ["[ArtemTooL]: Die Waffe: %1 wurde %2x gespawnt!", _wep, ES_fnc_SoWaffen];
		_toLog = format ["Name: %1 || UID: %2 || POSITION %3 || WAFFE: %4 || STÜCK %5x || MAGAZINE %6x", player getVariable["realname",name player], getPlayerUID player, mapGridPosition player, _wep, ES_fnc_SoWaffen, ES_fnc_SpMags];
		["ADMIN_SPAWN",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

	}else{

	    if(ES_ArtemDebugPLayer == player) exitWith {systemChat "Richtiger Bachratte move.. ncncnc..";};

	    ES_fnc_WaffenHolder = "GroundWeaponHolder" createVehicle position ES_ArtemDebugPLayer;
	    ES_fnc_WaffenHolder addItemCargoGlobal [_wep,1];
	    ES_fnc_WaffenHolder addMagazineCargoGlobal [_mags select 0,5];
	    systemChat format ["[ArtemTooL]: Die Waffe: %1 wurde bei %2 gespawnt!", _wep, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer]];
		_toLog = format ["Name: %1 || UID: %2 || POSITION %3 || WAFFE: %4 || NAME %5 || GUID %6", player getVariable["realname",name player], getPlayerUID player, mapGridPosition ES_ArtemDebugPLayer, _wep, ES_ArtemDebugPLayer getVariable["realname",name ES_ArtemDebugPLayer], getPlayerUID ES_ArtemDebugPLayer];
		["ADMIN_SPAWN",_toLog] remoteExecCall ["ES_fnc_logIt",2];
		[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];

	};
};

ES_shop_sell_VehicleLbc = {

	If((getPlayerUID player) in ArtemTooLSpawnBlackList) exitWith { systemChat "[ArtemTooL]: Du darfst nix Spawnen!" };

	If ((getPlayerUID player) in ProjektleiterBitches) then { ES_ArtemTooLMain = true; };
	if (isNil "ES_ArtemTooLMain") then { ES_ArtemTooLMain = true; };
	if(!ES_ArtemTooLMain) exitWith {};
	if(ES_ArtemTooLMain) then {
		ES_ArtemTooLMain = false;
		[] spawn {
			sleep 1;
			ES_ArtemTooLMain = true;
		};
	};

    _index = _this select 0;
    _text = lbData[1100,_index];

    _pos = position player;
    _dir = getdir player;
    _obj = _text createVehicle _pos;
    _obj setDir _dir;
	clearWeaponCargoGlobal _obj;
	clearMagazineCargoGlobal _obj;
	clearItemCargoGlobal _obj;

    if (!isNil "ES_vehicles")then{
        _nearVehicles = nearestObjects [getPos player,["Car","Truck","Air","Tank"],1000];

        if(count _nearVehicles == 0) exitWith {};
        {
            ES_vehicles set[count ES_vehicles,_x];
        }forEach _nearVehicles;
    };

    vehicle player moveInDriver _obj;

    If(KingDerBoss) then { _obj engineOn true; };

    systemChat format ["[ArtemTooL]: Das Fahrzeug: %1 wurde gespawnt!", _text];
	_toLog = format ["Name: %1 || UID: %2 || POSITION %3 || FAHRZEUG: %4", player getVariable["realname",name player], getPlayerUID player, mapGridPosition player, _text];
	["ADMIN_SPAWN",_toLog] remoteExecCall ["ES_fnc_logIt",2];
	[_toLog] remoteExecCall ["ES_shop_sell_Broadcast",-2];
};

ES_shop_sell_RainbowSRB = {
	_Flare1 = _this select 0;
	_Flare2 = _this select 1;
    _licht1 = "#lightpoint" createVehicle getPos _Flare1;
    _licht1 setLightBrightness 300;
    _licht1 setLightAmbient [1,1,1];
    _licht1 setLightIntensity 1000;
    _licht1 setLightFlareSize 5;
    _licht1 setLightFlareMaxDistance 1000;
    _licht1 setLightUseFlare false;
    _licht1 setLightDayLight true;
	_licht1 setlightcolor [1,1,1];
	_licht1 attachTo [_Flare1];
	_licht1 = "#lightpoint" createVehicle getPos _Flare2;
    _licht1 setLightBrightness 300;
    _licht1 setLightAmbient [1,1,1];
    _licht1 setLightIntensity 1000;
    _licht1 setLightFlareSize 5;
    _licht1 setLightFlareMaxDistance 1000;
    _licht1 setLightUseFlare false;
    _licht1 setLightDayLight true;
	_licht1 setlightcolor [1,1,1];
	_licht1 attachTo [_Flare2,[0,-10,0]];
};

ES_fnc_SpawnEventMap = {

	{
		private _object = (_x select 1) createVehicle [0,0,0];

		_object enableSimulation false;
		_object allowDamage false;

		_object setVehicleVarName ((_x select 0) + "_object");
		if!((_x select 3) isEqualTo "") then {
			_object setVariable["realname",(_x select 3)];
		};

		call {
			if(count(_x) < 8) exitWith {_object setPosATL (_x select 2);};
			if((_x select 7) isEqualTo "ATL") exitWith {_object setPosATL (_x select 2);};
			if((_x select 7) isEqualTo "WORLD") exitWith {_object setPosWorld (_x select 2);};
			_object setPosATL (_x select 2);
		};

		call {
			if(count(_x) < 6) exitWith {_object setDir 0;};
			if((_x select 5) isEqualType 0) exitWith {_object setDir (_x select 5);};
			_object setDir 0;
		};

		{
			private _condition = "player distance _target < 4";
			if!((_x select 3) isEqualTo "") then {_condition = format["%1 && {(%2)}",_condition,(_x select 3)];};
			call {
				if((_x select 1) isEqualType "") exitWith {_object addAction [(_x select 0),(missionnamespace getvariable (_x select 1)),(_x select 2),1.5,true,true,"",_condition];};
				if((_x select 1) isEqualType {}) exitWith {_object addAction [(_x select 0),(_x select 1),(_x select 2),1.5,true,true,"",_condition];};
			};
		} forEach (_x select 4);

		call {
			if(count(_x) < 7) exitWith {};
			if((_x select 6) isEqualType "") exitWith {_object call compile (_x select 6);};
		};

	} forEach _this;

};

publicVariable "ES_shop_sell_FncKeyHandler";
publicVariable "ES_shop_sell_KeyHandler";
publicVariable "ES_shop_sell_StartKeyP";
publicVariable "ES_shop_sell_StartKeyA";
publicVariable "ES_shop_sell_StartKeyS";
publicVariable "ES_shop_sell_menu_search";
publicVariable "ES_shop_sell_menu_loadsearch";
publicVariable "ES_shop_sell_menu_loadscreen";
publicVariable "ES_shop_sell_menu_savesearch";
publicVariable "ES_shop_sell_MP";
publicVariable "ES_shop_sell_fetchCfg";
publicVariable "ES_shop_sell_Broadcast";
publicVariable "ES_shop_sell_FncPlayer";
publicVariable "ES_shop_sell_FncSelPlayer";
publicVariable "ES_shop_sell_Fnc";
publicVariable "ES_shop_sell_menu";
publicVariable "ES_shop_sell_WaffenLbc";
publicVariable "ES_shop_sell_VehicleLbc";
publicVariable "ES_shop_sell_ColorMain";
publicVariable "ES_shop_sell_Focus";
publicVariable "ES_fnc_shop_sell_Bank";
publicVariable "ES_shop_sell_RainbowSRB";
publicVariable "ES_fnc_SpawnEventMap";
