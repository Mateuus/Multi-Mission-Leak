/*
	Author: Erbse 2-Play.de
	
*/

#define Death_Screen 7300
#define Death_Map 7306


private["_pos","_medic","_name","_marker","_array","_random"];

if (isNull (findDisplay Death_Screen)) exitwith {};
	
_medic = _this select 0;
_name = _this select 1;
play_name = _name;
play_pos = visiblePosition _medic;
play_dir = getDir _medic;		
play_anfrage_angenommen = true;
		
findDisplay Death_Screen displayCtrl Death_Map ctrlAddEventHandler 
		[	
			"Draw", {
			_this select 0 drawIcon
			[
				'\A3\ui_f\data\map\markers\military\arrow_CA.paa',
				[1,0,0,1],
				play_pos,
				30,
				30,
				play_dir,
				play_name,
				1,
				0.08,
				'TahomaB',
				'right'
			]}
		];
[((findDisplay Death_Screen) displayCtrl Death_Map),1,0.1,play_pos] call life_fnc_setMapPosition;	

while {!(isNull (findDisplay Death_Screen)) || play_anfrage_abgelehnt} do
{
	sleep 2;
	play_name = _name;
	play_pos = visiblePosition _medic;
	play_dir = getDir _medic;
	[((findDisplay Death_Screen) displayCtrl Death_Map),1,0.1,play_pos] call life_fnc_setMapPosition;	
	if(isNull (findDisplay Death_Screen) || play_anfrage_abgelehnt) exitWith {};
	sleep 2;
	_array = ["UNTERWEGS!", "ALARM!", "TATUE TATA!", "PLATZ DA!", "MEDIC!"];
	play_name = _array select floor random count _array;
	play_pos = visiblePosition _medic;
	play_dir = getDir _medic;
	[((findDisplay Death_Screen) displayCtrl Death_Map),1,0.1,play_pos] call life_fnc_setMapPosition;	
	if(isNull (findDisplay Death_Screen) || play_anfrage_abgelehnt) exitWith {};
};