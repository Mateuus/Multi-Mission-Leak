/*
filename: debugMonitor.sqf

Description: Debug Monitor for Admins

Author: Blackd0g
*/
private ["_adminlevel","_hours","_minutes","_isAdmin","_currentclass","_currentvehicle","_onlineassholes"];
_adminlevel = call lhm_adminlevel;

if(!debugMonitor) then {
debugMonitor = true;

	while {debugMonitor && alive player && player_isAdmin} do
	{
		_hours = lhm_serverUptime select 0;
		_minutes = lhm_serverUptime select 1;
		hintSilent parseText format ["
		<t size='1.10' font='puristaLight'  align='center' color='#00FFFF'>[%1] Adminlevel: %2</t><br/>
		<t size='1.10' font='puristaLight'  align='left' color='#FF0000'>[SERVER]</t><t size='1.1' font='puristaLight' align='right'>FPS: %3</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>TargetClass:</t><t size='0.95 'font='puristaLight' align='right'>%6</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>Players On: %7</t><t size='0.95 'font='puristaLight' align='right'>Within 500m: %8</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>Units:</t><t size='0.95' font='puristaLight'align='right'>%17</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>Vehicles:</t><t size='0.95' font='puristaLight'align='right'>%9</t><br/>
		<t size='1.10' font='puristaLight' align='left' color='#FFBF00'>[CLIENT]</t><t size='1.1' font='puristaLight' align='right'>FPS: %4</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>ViewRange: %5</t><t size='0.95' font='puristaLight' align='right'>Uptime: %15h %16Min</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>GPS: %11</t><t size='0.95' font='puristaLight' align='right' color='#FAFAD2'>DIR: %12</t><br/>
		<t size='0.95' font='puristaLight' align='left' color='#FAFAD2'>TargetCondition:</t><t size='0.95 'font='puristaLight' align='right'>%14 %</t>
		",
		(name player),		//1
		(_adminlevel),		//2
		(serverFPS),		//3
		(round diag_fps),	//4
		viewdistance,	//5
		(typeOf cursorObject),//6
		(count playableUnits),//7
		(({isPlayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 500]))-1),//8
		(count([6800, 9200, 0] nearEntities [["StaticWeapon","Car","Motorcycle","Tank","Air","Ship"],25000])) -27,//9
		count vehicles,//10
		(mapGridPosition getPos player),//11
		(round(getDir player)),//12
		(getPos player),//13
		If (isNull cursorObject) then {"No Target"} else {round((1 - (damage cursorObject)) * 100)},//14
		_hours, //15
		_minutes, //16
		(count AllUnits) //17
		 ];

	sleep 1; // Refresh Time
	};
	hintSilent "";
} else {
	debugMonitor = false;
};