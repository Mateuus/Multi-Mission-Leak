/*
    File: fn_gpsTracker.sqf
    Author: Poseidon modded by Barney
    
    Description: Attaches a gps tracker to selected vehicle
	
	Modified for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
*/

if(isNull cursortarget) exitWith {};
if(!(cursortarget isKindOf "AllVehicles") or (cursortarget isKindOf "Man")) exitWith {hint format["Das GPS kann an %1 nicht benutzt werden %2", typeof(cursortarget), name player]};
if(player distance cursortarget > 4) exitWith {hint format["Du bist nicht nah genug am %1  %2. Du musst %3 Meter näher dran!", getText(configFile >> "CfgVehicles" >> typeof cursortarget >> "displayName"), name player, (player distance cursortarget) min 4]};
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";

hint format["Tracking device is beeing placed on %1 %2!",getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName"),name player];
sleep 4;

[cursortarget] spawn {
    _veh = _this select 0;
	_ALT = (getPosASL _veh) select 2;
	_fuel = fuel _veh;
	_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
    _markerName = format["%1_gpstracker",_veh];
    _marker = createMarkerLocal [_markerName, visiblePosition _veh];
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerTypeLocal "hd_destroy";
	_DMG = 1 min(getDammage _veh);
	_crew = count(crew _veh);
	_speed = speed _veh;
   _marker setMarkerTextLocal format["Target: %1 | ALT: %2 | Health: %3 %5| Fuel: %4 %5 | Crew: %6 |Speed: %7 kmh",getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName"),round(_ALT), round(_DMG * 100),round(_fuel *100),"%",_crew,_speed];
    _marker setMarkerPosLocal getPos _veh;
	//if (!(_veh iskindof "Air")) then
		//{
		//menudestroy = player addaction["Turn off Engine " + str(_text), {(_this select 3) setHit [getText(configFile >> "cfgVehicles" >> typeOf (_this select 3) >> "HitPoints" >> "HitEngine" >> "name"), 1]; player removeAction (_this select 2); hint format["%1 has been stopped!",getText(configFile >> "CfgVehicles" >> typeof (_this select 3) >> "displayName")];},_veh];
		//};
	
	while {true} do {
        if(not alive _veh) exitWith {deleteMarkerLocal _markerName;hint format["%1 has been lost!","Target"];};
        _marker setMarkerPosLocal getPos _veh;
		_ALT = (getPosASL _veh) select 2;
		_DMG = 1 -(getDammage _veh);
		_fuel = fuel _veh;
		_crew = count(crew _veh);
		_speed = speed _veh;
		
		_marker setMarkerTextLocal format["Target: %1 | ALT: %2 | Health: %3 %5| Fuel: %4 %5 | Crew: %6 |Speed: %7 kmh",getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName"),round(_ALT), round(_DMG * 100),round(_fuel *100),"%",_crew,round(_speed)];
        sleep 0.5;
		
    };
};
