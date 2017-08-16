/*
	File: fn_cop_classification_organize.sqf
	Author: Barney

	Description:
	Go home description you´re drunk!



	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de

	Info:
	1 - Kavala
	2 - BP_West
	3 - BP_West2
	4 - BP_Mitte
	5 - BP_Ueberall
	6 - BP_East
	7 - AP1
	8 - AP2
	9 - HWP
	10 - Sonstige
*/


private ["_ui","_strTEXT","_objects","_allText","_text","_alltext","_textlein"];

disableSerialization;
if(LHM_Small_Radar_on) exitWith {LHM_Small_Radar_on = false;};
closeDialog 0;
LHM_Small_Radar_on = true;
5 cutRsc ["lhm_radar","PLAIN"];
_ui = uiNameSpace getVariable "lhm_radar";
_strTEXT = _ui displayCtrl 1110;




while{true} do {


	_objects = nearestobjects[player,["Landvehicle","Ship","Air"],2000];
	_objects = _objects - [vehicle player];
	_allText = [];
	{
		if(isEngineOn _x) then {
				switch (true) do
				{
					case (_x iskindof "helicopter"):
					{
						_text = parseText format["<t color='#FE2E2E' align='left'>Helicopter</t>  <t color='#FE2E2E' align='right'>%1m</t> <br/>",round(_x distance (vehicle player))];
						_alltext pushback _text;
					};

					case (_x iskindof "plane"):
					{
						_text = parseText format["<t color='#FF8000' align='left'>Plane</t>  <t color='#FF8000' align='right'>%1m</t> <br/>",round(_x distance (vehicle player))];
						_alltext pushback _text;
					};

					case (_x iskindof "LandVehicle"):
					{
						_text = parseText format["<t color='#58FA58' align='left'>LandVehicle</t>  <t color='#58FA58' align='right'>%1m</t> <br/>",round(_x distance (vehicle player))];
						_alltext pushback _text;
					};

					case (_x iskindof "Ship"):
					{
						_text = parseText format["<t color='#2E64FE' align='left'>Ship</t>  <t color='#2E64FE' align='right'>%1m</t> <br/>",round(_x distance (vehicle player))];
						_alltext pushback _text;
					};


				};
		};


	} foreach _objects;
	if(_alltext isEqualTo []) then {
		_text = parseText format["<t color='#FF0000' align='left'>No Vehicles found...</t>"];

	};
	if(!LHM_Small_Radar_on) exitWith {};
	_textlein = composeText _alltext;
	_strTEXT ctrlSetStructuredText _textlein;
	if(!LHM_Small_Radar_on) exitWith {};

	sleep 30;
	if(!LHM_Small_Radar_on) exitWith {};

};

5 cutText ["","PLAIN"];