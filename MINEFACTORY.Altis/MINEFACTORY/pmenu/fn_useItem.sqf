#include "..\..\script_macros.hpp"
/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private "_item";
disableSerialization;
if(EQUAL(lbCurSel 2005,-1)) exitWith {hint  "Du musst zuerst einen Gegenstand auswählen!";};
_item = CONTROL_DATA(2005);

switch (true) do {
	case (_item in ["waterBottle","coffee","redgull"]): {
		if(([false,_item,1] call life_fnc_handleInv)) then {
			life_thirst = 100;
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 0;};
			if(EQUAL(_item,"redgull") && {EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)}) then {
				[] spawn {
					life_redgull_effect = time;
					titleText[ "Du kannst jetzt für 3 Minuten weiter laufen","PLAIN"];
					player enableFatigue false;
					waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
					player enableFatigue true;
				};
			};
		};
	};

	case (EQUAL(_item,"boltcutter")): {
		[cursorObject] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (EQUAL(_item,"blastingcharge")): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorObject] spawn life_fnc_blastingCharge;
	};

	case (EQUAL(_item,"defusekit")): {
		[cursorObject] spawn life_fnc_defuseKit;
	};

	case (EQUAL(_item,"storagesmall")): {
		[] call life_fnc_storageBoxSmall;
	};

	case (EQUAL(_item,"storagebig")): {
		[] call life_fnc_storageBoxBig;
	};

	case (EQUAL(_item,"spikeStrip")): {
		if(!isNull life_spikestrip) exitWith {hint  "Du platzierst bereits ein Nagelband"};
		if(([false,_item,1] call life_fnc_handleInv)) then {
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (EQUAL(_item,"fuelFull")): {
		if(vehicle player != player) exitWith {hint  "Du kannst ein Fahrzeug nicht betanken während du dich darin befindest!"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (EQUAL(_item,"lockpick")): {
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","donuts","tbacon","peach"]): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"edible"),-1))) then {
			if([false,_item,1] call life_fnc_handleInv) then {
				_val = M_CONFIG(getNumber,"VirtualItems",_item,"edible");
				_sum = life_hunger + _val;
				switch (true) do {
					case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
					case (_sum > 100): {life_hunger = 100;};
					default {life_hunger = _sum;};
				};
			};
		};
	};

	case (EQUAL(_item,"Eingeburgert")): {
	//War leider zu dumm für ein Windows-Testen menü :P #YOLO
		if(([false,_item,1] call life_fnc_handleInv) && (!license_civ_Eingeburgert) && (side player) == civilian) then  {
			player setPos (getMarkerPos "einwanderung1");
			license_civ_Eingeburgert = true;
			life_einwanderung = false;
			sleep 1;
			_text2 = parseText format ["<t><t size='1.35'>Willkommen auf MineFactory Altis Life.<br/><br/></t><t size='1.15'>%1,<br/></t><t><t size='1'>Du bist neu auf der Insel, denke daran das du für Illegale Straftaten innerhalb der nächsten 5 Tage extrem hart bestraft werden kannst!!!<br/><br/></t>",name player];
			_result2 = [_text2, false,"Verstanden", false] call BIS_fnc_guiMessage;	
			sleep 1;
			[
				[
					["Du bist Eingewandert :)","align = 'center' shadow = '1' size = '1.0'"],
					["","<br/>"],
					["Viel Glück,","align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
					[" und Willkommen auf Altis.","align = 'center' shadow = '1' size = '0.7'","#aaaaaa"]
					
				]
			] spawn BIS_fnc_typeText2;
			[] call life_fnc_spawnMenu;
		};
	};
	
	case (_item == "news" ):
	{		
		[player] remoteExec ["DB_fnc_news",2];
		closedialog 0;
	};
	
	case (EQUAL(_item,"nitro")): {
		[] spawn life_fnc_nitro;
	};
	
	//Altis Polizisten, mörder und Faschisten!
	case (EQUAL(_item,"protest")): {
		[] spawn life_fnc_protest;
	};
	

	case (EQUAL(_item,"lsdp")): {
		if(playerSide in [west,independent]) exitWith {hint "Hallo Sie sind im Dienst!!";}; 
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Du nimmst bereits Affen Titten geilen Stuff";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then 
		{ 
		if(isNil "life_drug") then {life_drug = 0;}; 
		//Wenn er Drogen nimmt
		life_drug = life_drug + 0.08; 
		if (life_drug < 0.00) exitWith {}; 
		[] spawn life_fnc_LSDnimm; 
		}; 
	};
	
	case (EQUAL(_item,"heroin_processed")): {
		if(playerSide in [west,independent]) exitWith {hint "Hallo Sie sind im Dienst!!";}; 
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Du nimmst bereits verfickt Geiles Zeug";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then 
		{ 
		if(isNil "life_drug") then {life_drug = 0;}; 
		//Wenn er Drogen nimmt
		life_drug = life_drug + 0.08; 
		if (life_drug < 0.00) exitWith {}; 
		[] spawn life_fnc_Heroinnimm; 
		}; 
	};
	
	case (EQUAL(_item,"cocaine_processed")): {
		if(playerSide in [west,independent]) exitWith {hint "Hallo Sie sind im Dienst!!";}; 
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Du hast bereits geilen stuff im Blut";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then 
		{ 
		if(isNil "life_drug") then {life_drug = 0;}; 
		//Wenn er Drogen nimmt
		life_drug = life_drug + 0.08; 
		if (life_drug < 0.00) exitWith {}; 
		[] spawn life_fnc_Cocainenimm; 
		}; 
	};
	
	case (EQUAL(_item,"marijuana")): {
		if(playerSide in [west,independent]) exitWith {hint "Hallo Sie sind im Dienst!!";}; 
		if((player getVariable ["Druged",FALSE])) exitWith {hint "Du nimmst bereits geiles Zeug";}; 
		if(([false,_item,1] call life_fnc_handleInv)) then 
		{ 
		if(isNil "life_drug") then {life_drug = 0;}; 
		//Wenn er Drogen nimmt
		life_drug = life_drug + 0.08; 
		if (life_drug < 0.00) exitWith {}; 
		[] spawn life_fnc_Weednimm; 
		}; 
	};
	
	case (EQUAL(_item,"schein")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		license_civ_gun_big = true;
		cutText ["Du hast deinen Jagtschein ausgefüllt","PLAIN",2];
		};
	};
	case (EQUAL(_item,"swat")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		license_cop_swat = true;
		cutText ["Du bist nun S.E.K. mitglied","PLAIN",2];
		};
	};
	case (EQUAL(_item,"cAir")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		license_cop_cAir = true;
		cutText ["Du hast deinen Pilotenschein ausgefüllt","PLAIN",2];
		};
	};
	case (EQUAL(_item,"cDriver")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		license_cop_cDriver = true;
		cutText ["Du hast deinen Führerschein ausgefüllt","PLAIN",2];
		};
	};
	case (EQUAL(_item,"cg")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		license_cop_cg = true;
		cutText ["Du hast deinen Bootschein ausgefüllt","PLAIN",2];
		};
	};
	case (EQUAL(_item,"money10")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		life_cash = life_cash + 10000;
		closeDialog 0;
		};
		
	};

	case (EQUAL(_item,"money50")): {
		if(([false,_item,1] call life_fnc_handleInv)) then  {
		life_cash = life_cash + 50000;
		closeDialog 0;
		};
		
	};
	
	case (EQUAL(_item,"pickaxe")): {
		["Zum benutzen Windows-Taste drücken."] spawn life_fnc_nachricht;
	};
	
	case (EQUAL(_item,"heal")): {
		if(!(EQUAL(M_CONFIG(getNumber,"VirtualItems",_item,"heal"),-1))) then {
			if(([false,_item,1] call life_fnc_handleInv)) then {
				titleText[ "Bitte bewege dich nicht","PLAIN"];
				uiSleep 3;
		
				while{true} do
				{
					if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
					[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",0];
						player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
						player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
					};
					sleep 0.10;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
					if(_cP >= 1) exitWith {};
					if(!alive player) exitWith {};
					if(life_interrupted) exitWith {};
				};
				
				player setDamage 0;
				life_thirst = 100;
				life_hunger = 100;
				player playActionNow "stop";
			};
		};
	};
	
	case (EQUAL(_item,"Item_MRAP_01_F")): {
		_vehicle = "B_MRAP_01_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"Item_MRAP_02_F")): {
		_vehicle = "O_MRAP_02_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"Item_Heli_Attack_02_F")): {
		_vehicle = "O_Heli_Attack_02_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};
	
	case (EQUAL(_item,"Item_Heli_Transport_03_F")): {
		_vehicle = "B_Heli_Transport_03_F";
		_flag = "civ";
		closeDialog 0;
		[_vehicle,_flag,_item] spawn life_fnc_vehicleSpawnMenu;
	};

	default {
		hint  "Dieser Gegenstand ist nicht benutzbar.";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
