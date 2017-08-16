#include <macro.h>
private["_display","_locations","_price","_kill","_pos1","_pos2","_dest_name","_distance","_time"];
disableSerialization;
_kill = "";
if(vehicle player != player) exitWith {hint "Vous devez d'abord quitter le véhicule que vous êtes en avant d'utiliser le taxi.";};
if(!dialog) then
{
	createDialog "Life_taxi_menu";
	life_taxi_location = (_this select 3) select 0;
};
_display = findDisplay 48400;
_locations = _display displayCtrl 48402;
lbClear _locations;
switch (life_taxi_location) do
{
	case "taxi_spawn_ile":
	{
		ctrlSetText[48401,"Ile"];
	};
	case "taxi_spawn_kavala":
	{
		ctrlSetText[48401,"Kavala"];
	};
	case "taxi_spawn_athira":
	{
		ctrlSetText[48401,"Athira"];
	};
	case "taxi_spawn_rodo":
	{
		ctrlSetText[48401,"Rodopoli"];
	};
	case "taxi_spawn_pyrgos":
	{
		ctrlSetText[48401,"Pyrgos"];
	};
	case "taxi_spawn_sofia":
	{
		ctrlSetText[48401,"Sofia"];
	};
	case "taxi_spawn_neo":
	{
		ctrlSetText[48401,"Neochori"];
	};	
	case "taxi_spawn_casino":
	{
		ctrlSetText[48401,"Casino"];
	};
	case "taxi_spawn_kavalap":
	{
		ctrlSetText[48401,"Gendarmerie de Kavala"];
	};
	case "taxi_spawn_athirap":
	{
		ctrlSetText[48401,"Gendarmerie de Athira"];
	};
	case "taxi_spawn_frontp":
	{
		ctrlSetText[48401,"Poste Frontière"];
	};
	case "taxi_spawn_gardecote":
	{
		ctrlSetText[48401,"Garde de Côtes"];
	};
	case "taxi_spawn_camp":
	{
		ctrlSetText[48401,"Camp d'entrainement"];
	};	
	case "taxi_spawn_kavalamed":
	{
		ctrlSetText[48401,"Hopital de Kavala"];
	};		
	case "taxi_spawn_frontmed":
	{
		ctrlSetText[48401,"Hopital Poste Frontiere"];
	};		
	case "taxi_spawn_pyrgosmed":
	{
		ctrlSetText[48401,"Hopital de Pyrgos"];
	};		

};
if(_kill != "") exitWith {
hint _kill;
closeDialog 0;
};
{
	if ((playerSide == _x select 2) || (playerSide == east)) then	{
	//if(playerSide == _x select 2) then {
		_dest_name = _x select 0;
		if(life_taxi_location != _dest_name) then
		{
			_pos1 = getMarkerPos life_taxi_location;
			_pos2 = getMarkerPos _dest_name;
			_distance = _pos1 distance _pos2;
			_price = _distance;
			_price = round(_price / 20);
			_time = round(_distance / 1000 * 6);
			_locations lbAdd format["Tarif pour %1 - Normal (%2s): %3€ Rapide (%4s): %5€",_x select 1, [_time] call life_fnc_numberText, [_price] call life_fnc_numberText, [round(_time / 3)] call life_fnc_numberText, [round(_price * 2)] call life_fnc_numberText];
			_locations lbSetData [(lbSize _locations)-1,_dest_name];
			_locations lbSetValue [(lbSize _locations)-1,_price];
		};
	};
} forEach ANL_taxi;