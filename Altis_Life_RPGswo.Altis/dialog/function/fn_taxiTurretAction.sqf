/*
	File: fn_taxiMeter.sqf
	Author: MarkusSR1984
	
	
*/


	private ["_ui","_mode","_taxi","_prize","_dist","_count"];


	_playeraction = player addAction ["<t color='#FF0000'>TAXI JETZT ANHALTEN</t>", {vehicle player setVariable["stoptaxi",true,true];vehicle player lock 0;}];

	while {!(vehicle player == player) && !(vehicle player getVariable["stoptaxi",false]) && !(vehicle player getVariable["stopped",false])} do {sleep 0.25;};

	player removeAction _playeraction;
	