/*
	Author: Erbse 2-Play.de
	
*/
#include <macro.h>
#define Leitstelle 2610100
#define Annehmen 2610105
#define Ablehnen 2610106
#define ListBox 2610103
#define Map 2610104

private["_index","_this","_green","_pos","_dude","_name","_marker"];

if ((isNull (findDisplay Leitstelle)) && (_this select 0 == 0)) then 
{
	if (_this select 1 == 1) exitwith {play_LSanfragen = _this select 2;};
};

_green = [0, 1, 0, 1];

switch (_this select 0) do 
{
	case 0: //lade Leitstelle
	{
		if (_this select 1 == 1) then {play_LSanfragen = _this select 2;};
		lbClear ListBox;
		if (count play_LSanfragen == 0) then 
		{
			ctrlEnable [Annehmen, false];
			ctrlEnable [Ablehnen, false];
		}else
		{
			ctrlEnable [Annehmen, true];
			ctrlEnable [Ablehnen, true];
		};
		{
			_index = lbAdd [ListBox,_x select 1];
			if (_x select 2 == 1) then 
			{
				lbSetColor [ListBox,_index,_green];
				lbSetSelectColor [ListBox, _index,_green];
			};	
		} foreach play_LSanfragen;
	};
	case 1: //Annehmen
	{
		_index = _this select 1;
		_dude = ((play_LSanfragen select _index) select 0);
		play_LSanfragen select _index set [2,1];
		
		[[0,1,play_LSanfragen],"life_fnc_lade_leitstelle",independent,FALSE] spawn life_fnc_MP;
		sleep 0.1;
		[[player,profilename],"life_fnc_medicDeathMap",_dude,FALSE] spawn life_fnc_MP;
		
	};
	case 2: //Ablehnen
	{
		_index = _this select 1;
		_dude = ((play_LSanfragen select _index) select 0);
		[[6],"life_fnc_lade_leitstelle",_dude,FALSE] spawn life_fnc_MP;
		{
			
			if ( _x find _dude >= 0) exitWith
			{
				play_LSanfragen deleteAt _index;
				[[0,1,play_LSanfragen],"life_fnc_lade_leitstelle",independent,FALSE] spawn life_fnc_MP;
			};
			_index = _index + 1;
		}foreach play_LSanfragen;
		
	};
	case 3: //onLBSelChanged
	{
		_index = _this select 1;
		_dude = ((play_LSanfragen select _index) select 0);
		_name = ((play_LSanfragen select _index) select 1);
		play_name = _name;
		play_pos = visiblePosition _dude;
		play_dir = getDir _dude;
		[((findDisplay Leitstelle) displayCtrl Map),1,0.1,play_pos] call life_fnc_setMapPosition;	
		findDisplay Leitstelle displayCtrl Map ctrlAddEventHandler 
		[	
			"Draw", {
			_this select 0 drawIcon
			[
				'\A3\ui_f\data\map\markers\military\dot_CA.paa',
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
	};
	case 4: //wiederbelebt ... weg damit
	{
		_dude = _this select 1;
		_index = 0;
		{
			
			if ( _x find _dude >= 0) exitWith
			{
				play_LSanfragen deleteAt _index;
				[[0,1,play_LSanfragen],"life_fnc_lade_leitstelle",independent,FALSE] spawn life_fnc_MP;
			};
			_index = _index + 1;
		}foreach play_LSanfragen;		
	};
	case 5: //respawned ... weg damit
	{
		_dude = _this select 1;
		_index = 0;
		{
			
			if ( _x find _dude >= 0) exitWith
			{
				play_LSanfragen deleteAt _index; systemchat format ["delete %1",_dude]
			};
			_index = _index + 1;
		}foreach play_LSanfragen;
		
	};
	case 6: //dude abgelehnt
	{
		play_anfrage_abgelehnt = true;
		
	};
};

