// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerHud.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, [KoS] Bewilderbeest
//	@file Created: 11/09/2012 04:23
//	@file Args:
//  Portet to Altis Life from MarkusSR1984
#include "..\macros.hpp"

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_activity_icon_idc 3602
#define hud_activity_textbox_idc 3603

scriptName "playerHud";

disableSerialization;
private ["_lastHealthReading", "_lastTerritoryName", "_lastTerritoryDescriptiveName", "_territoryCaptureIcon", "_activityIconOrigPos", "_activityTextboxOrigPos", "_dispUnitInfo", "_topLeftBox", "_topLeftBoxPos"];

_lastHealthReading = 100; // Used to flash the health reading when it changes
if (isNil "DWEV_paintball") then {DWEV_paintball = false;};
if (isNil "paintball_gotHits") then {paintball_gotHits = 0;};
if (isNil "DWEV_DIAG_SERVERFPS") then {DWEV_DIAG_SERVERFPS = 0;};
if (isNil "DWEV_var_showHud") then {DWEV_var_showHud = true;};

private ["_mapCtrls", "_mapCtrl","_ui"];

while {true} do
{
	private ["_ui","_vitals","_hudVehicle","_health","_tempString","_yOffset","_vehicle"];

	_ui = uiNameSpace getVariable "WastelandHud";	
	
	if(isNil "_ui") then {1000 cutRsc ["WastelandHud","PLAIN",1e10]; _ui = uiNameSpace getVariable "WastelandHud";};
	if(isNull _ui) then {1000 cutRsc ["WastelandHud","PLAIN",1e10]; _ui = uiNameSpace getVariable "WastelandHud";};
	
	_vitals = _ui displayCtrl hud_status_idc;
	_hudVehicle = _ui displayCtrl hud_vehicle_idc;
	_hudActivityIcon = _ui displayCtrl hud_activity_icon_idc;
	_hudActivityTextbox = _ui displayCtrl hud_activity_textbox_idc;
	
	if (profileNamespace getVariable["dw_show_logo",false] && !visibleMap) then
	{
		
		_hudActivityIcon ctrlShow true;
		//_hudActivityIcon ctrlSetStructuredText parseText "<img size='3' image='textures\Wolflogo\intro_logo.paa'/>";
		_hudActivityIcon ctrlCommit 0;
	}
	else
	{
		_hudActivityIcon ctrlShow false;
		_hudActivityIcon ctrlCommit 0;
	};
	
	
	//Calculate Health 0 - 100
	_health = ((1 - damage player) * 100) max 0;
	_health = if (_health > 1) then { floor _health } else { ceil _health };

	// Flash the health colour on the HUD according to it going up, down or the same
	_healthTextColor = "#FFFFFF";

	if (_health != _lastHealthReading) then
	{
		// Health change. Up or down?
		if (_health < _lastHealthReading) then
		{
			// Gone down. Red flash
			_healthTextColor = "#FF1717";
		}
		else
		{
			// Gone up. Green flash
			_healthTextColor = "#17FF17";
		};
	};

	// Make sure we keep a record of the health value from this iteration
	_lastHealthReading = _health;

	// Icons in bottom right

	_minimumBRs = 5;
	_strArray = [];

	
	
	if (!DWEV_paintball) then
	{
		_strArray pushBack format ["%1 € <img size='0.8' image='icons\bank.paa'/>", [dwf_atmcash] call DWEV_fnc_numberText];
		_strArray pushBack format ["%1 € <img size='0.8' image='icons\money.paa'/>", [dwf_cash] call DWEV_fnc_numberText];
		_strArray pushBack format ["%1 <img size='0.8' image='icons\water.paa'/>", ceil (DWEV_thirst max 0)];
		_strArray pushBack format ["%1 <img size='0.8' image='icons\food.paa'/>", ceil (DWEV_hunger max 0)];
		_strArray pushBack format ["%1 <img size='0.8' image='icons\running_man.paa'/>", 100 - ceil ((getFatigue player) * 100)];
		_strArray pushBack format ["<t color='%1'>%2</t> <img size='0.8' image='icons\health.paa'/>", _healthTextColor, _health];
		_strArray pushBack format ["%1 <img size='0.8' image='icons\fps.paa'/>",ceil (diag_fps)];
	

		if((__GETC__(DWEV_adminlevel) > 1)) then //Ab S
		{
				if (DWEV_SERVER_LOCK) then
				{
					_strArray pushBack "<t color='#FF1717'>!!! SERVER GESPERRT !!!</t>";
					//_strArray pushBack "!!! SERVER GESPERRT !!!";
				}
				else
				{
					_strArray pushBack "<t color='#17FF17'>SERVER OFFEN</t>";
				};
								
		};

		if((__GETC__(DWEV_adminlevel) > 2)) then //Ab A
		{
/*				if (DWEV_HC_isActive) then
				{
					_strArray pushBack "<t color='#17FF17'>HEADLESSCLIENT VERBUNDEN</t>";
				}
				else
				{
					_strArray pushBack "<t color='#FF1717'>!!! HEADLESSCLIENT NICHT VERBUNDEN !!!</t>";
				};
*/				
				switch true do 
				{
					case (DWEV_DIAG_SERVERFPS > 40): {_strArray pushBack format ["<t color='#17FF17'>SERVERLEISTUNG: HERVORRAGEND (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					case (DWEV_DIAG_SERVERFPS > 35): {_strArray pushBack format ["<t color='#B2FF17'>SERVERLEISTUNG: SEHR GUT (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					case (DWEV_DIAG_SERVERFPS > 25): {_strArray pushBack format ["<t color='#F4FF17'>SERVERLEISTUNG: GUT (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					case (DWEV_DIAG_SERVERFPS > 20): {_strArray pushBack format ["<t color='#FFF417'>SERVERLEISTUNG: MITTEL (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					case (DWEV_DIAG_SERVERFPS > 15): {_strArray pushBack format ["<t color='#FFD117'>SERVERLEISTUNG: AKZEPTABEL (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					case (DWEV_DIAG_SERVERFPS > 10): {_strArray pushBack format ["<t color='#FF8017'>SERVERLEISTUNG: GRENZWERTIG (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					case (DWEV_DIAG_SERVERFPS > 1): {_strArray pushBack format ["<t color='#FF1717'>SERVERLEISTUNG: KRITISCH (%1 FPS)</t>",DWEV_DIAG_SERVERFPS];};
					default {};
				};
								
		};

		if(profileNamespace getVariable["dw_extended_hud",false]) then 
		{
				_strArray pushBack format ["%5:%6 Uhr - %7.%8.%9 - POLIZEI: %1 - FEUERWEHR: %2 - ZIVILISTEN %3 - GESAMT: %4 - Division Wolf Altis Life",({side _x == west} count playableUnits),({side _x == independent} count playableUnits),({side _x == civilian} count playableUnits),(count playableUnits),Amyf_zeit select 0,Amyf_zeit select 1,Amyf_zeit select 2,Amyf_zeit select 3,Amyf_zeit select 4];
		}
		else
		{
				_strArray pushBack format ["%1:%2 Uhr - %3.%4.%5 - Division Wolf Altis Life",Amyf_zeit select 0,Amyf_zeit select 1,Amyf_zeit select 2,Amyf_zeit select 3,Amyf_zeit select 4];
		};
	
		
	}
	else
	{
		_strArray pushBack format ["%1 <img size='0.8' image='icons\zielscheibe.paa'/>",DWEV_paintball_kills];
		_strArray pushBack format ["%1 <img size='0.8' image='\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa'/>",DWEV_paintball_death];
		_strArray pushBack format ["%1 <img size='0.8' image='icons\health.paa'/>", (6 - paintball_gotHits)];
		_strArray pushBack format ["Division Wolf Paintball Arena"];
	};
	
	
		_str = "";

	{
		_str = _str + format ["%1%2", if (_forEachIndex > 0) then { "<br/>" } else { "" }, _x];
	} forEach _strArray;

	
		
	
	
	_vitals ctrlShow alive player;
	_vitals ctrlSetStructuredText parseText _str;

	if (profileNamespace getVariable["dw_hide_hud",false] || visibleMap || !(isNil "DWEV_veh_shop") ||  !DWEV_var_showHud) then 
	{
		_vitals ctrlShow false;
	};

	_yOffset = (0.04 * (count _strArray));
	_x = safeZoneX + (safeZoneW * (1 - (1 / SafeZoneW)));
	_y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
	_vitals ctrlSetPosition [_x, _y];
	
	_vitals ctrlCommit 0;

	_tempString = "";
	_yOffset = 0.26;


		if (player != vehicle player) then
		{
			//_yOffset = 0.24;
			
			//_yOffset = 0.30;
			
			_yOffset = (0.04 * (count _strArray));
			
			_vehicle = assignedVehicle player;

			{
				_icon = switch (true) do
				{
					case (driver _vehicle == _x): { "icons\driver.paa" };
					case (gunner _vehicle == _x): { "icons\gunner.paa" };
					default                       { "icons\cargo.paa" };
				};

				_tempString = format ["%1 %2 <img image='%3'/><br/>", _tempString,getPlayerDName(_x), _icon];
				_yOffset = _yOffset + 0.04;
			} count crew _vehicle;
		};


	_hudVehicle ctrlSetStructuredText parseText _tempString;
	_hudVehicle ctrlShow (vehicle player != player);
	
	if (profileNamespace getVariable["dw_hide_hud",false] || !DWEV_var_showHud) then 
	{
		_hudVehicle ctrlShow false;
	};
	
	_x = safeZoneX + (safeZoneW * (1 - (0.4 / SafeZoneW)));
	_y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
	_hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
	_hudVehicle ctrlCommit 0;

	// Remove unrealistic blur effects
	if (!isNil "BIS_fnc_feedback_damageBlur" && {ppEffectCommitted BIS_fnc_feedback_damageBlur}) then { ppEffectDestroy BIS_fnc_feedback_damageBlur };
	if (!isNil "BIS_fnc_feedback_fatigueBlur" && {ppEffectCommitted BIS_fnc_feedback_fatigueBlur}) then { ppEffectDestroy BIS_fnc_feedback_fatigueBlur };

	uiSleep 1;
};
