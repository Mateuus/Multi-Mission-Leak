private["_federal","_policeHQ","_PoliceAthira","_PolicePygros","_PoliceAir","_jail","_spawn"];
disableSerialization;

_federal = getMarkerPos "fed_reserve";
_policeHQ = getMarkerPos "police_hq_1";
_PoliceAthira = getMarkerPos "police_hq_3";
_PolicePygros = getMarkerPos "police_hq_2";
_PoliceAir = getMarkerPos "police_hq_5";
_jail = getMarkerPos "Correctional Facility";
_spawn = getMarkerPos "respawn_civilian";

if(_federal distance player < 225) exitWith { hint "Can't use barricades so close to the federal reserve"};
if(_policeHQ distance player < 69) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_PoliceAthira distance player < 76) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_PolicePygros distance player < 86) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_PoliceAir distance player < 56) exitWith { hint "Can't use barricades so close to the Police HQ"};
if(_jail distance player < 50) exitWith { hint "Can't use barricades so close to the jail"};
if(_spawn distance player < 170) exitWith { hint "Can't use barricades so close to spawn"};

if (count life_placeables_placed >= life_placeables_limit) exitWith { hint "You've reached the limit of objects you can place."; };

_display = findDisplay 20000;
_placeables = _display displayCtrl 20001;

_className = lbData[20001, lbCurSel (20001)];

closeDialog 0;

life_placeable_placing_active = true;
_allowMoveDistance = 11;

_object = _className createVehicle (position player);
life_placeable_active_object = _object;
_attachPos = [0, 3, 0.5];
_object attachTo[player, _attachPos];
_object enableSimulationGlobal false;
_object allowdamage false;



_originalPos = position _object;
_playerOriginalPos = position player;
waitUntil
{
	if (life_placeable_active_object distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
		[true] call life_fnc_placeableCancel;
	};
	UiSleep 1;
	
	!life_placeable_placing_active;
};
