#include "..\..\macros.hpp"
if(isServer) exitWith {systemChat ""};
if ((!hasInterface && !isDedicated)) exitWith {};
waitUntil {!isnull player && player == player};
waitUntil {!isNil {DWEV_fnc_broadcast}};




private["_cfg","_patches","_sel","_name","_patches"];

/*
[] spawn     // Aktualisiere Realname und Playertype Variablen
{
	while {true} do 
	{
		
		switch ((side player)) do
		{
			case west:
			{
				player setVariable["playertype","COP",true];
				player setVariable["coplevel", __GETC__(DWEV_coplevel), true];
						
			};
	
			case civilian:
			{
				player setVariable["playertype","ZIV",true];
			};
	
			case independent:
			{
					player setVariable["playertype","MED",true];
			};
			
			case east:
			{
					player setVariable["playertype","WSC",true];
			};
		};
		player setVariable["steam64ID",getPlayerUID player,true];
		player setVariable["playerUID",getPlayerUID player,true];
		player setVariable["realname",name player,true];
		sleep 300;
	};

};
*/


// Setze die Variablen auf die Neue Performatere Methode
_vars = [];

switch ((side player)) do
{
	case west:
	{
		_vars pushBack ["playertype","COP",true];
		_vars pushBack ["coplevel", __GETC__(DWEV_coplevel), true];
						
	};
	
	case civilian:
	{
		_vars pushBack ["playertype","ZIV",true];
	};
	
	case independent:
	{
		_vars pushBack ["playertype","MED",true];
	};
			
	case east:
	{

		_vars pushBack ["playertype","WSC",true];

	};
};

_vars pushBack ["steam64ID",getPlayerUID player,true];
_vars pushBack ["playerUID",getPlayerUID player,true];
//_vars pushBack ["realname",name player,true];

[player,_vars] remoteExec ["DWF_fnc_setObjVars",2];


//Spieler aus der Gruppe werfen wenn er kein Telefon hat
//und wieder in die Gruppe schieben wenn er es wieder hat
[] spawn 
	{
		
		DWEV_my_gang = ObjNull;
		lock_backupGroup = false;
		sleep 30;
		backupGroup = group player;
		while {true} do 
		{
			sleep 5;
			//systemChat "######################";
			_currGroup = group player;
			
			
						if !("ItemRadio" in assignedItems player) then // hat kein Telefon
						{
							
							//systemChat format["Spieler hat kein Telefon aktuelle gruppe: %1", _currGroup];
							//systemChat format["Backup Gruppe: %1", backupGroup];
							//systemChat format["DWEV_my_gang: %1", DWEV_my_gang];
							lock_backupGroup = true;
							if (side player == west && _currGroup == backupGroup && count (units(_currGroup)) > 1) then {[player] joinSilent (createGroup west);};
							if (side player == civilian && _currGroup == backupGroup && count (units(_currGroup)) > 1) then {[player] joinSilent (createGroup civilian);};
							if (side player == independent && _currGroup == backupGroup && count (units(_currGroup)) > 1) then {[player] joinSilent (createGroup independent);};
							if (side player == east && _currGroup == backupGroup && count (units(_currGroup)) > 1) then {[player] joinSilent (createGroup east);};
							//DWEV_my_gang = ObjNull;
						};
				
						if ("ItemRadio" in assignedItems player) then // hat Telefon
						{
						
							//systemChat format["Spieler hat ein Telefon aktuelle gruppe: %1", _currGroup];
							//systemChat format["Spieler in Gruppe: %1", count (units(_currGroup))]; 
							//systemChat format["Backup Gruppe: %1", backupGroup];
							//systemChat format["DWEV_my_gang: %1", DWEV_my_gang];
							if (_currGroup != backupGroup) then
							{
								if (lock_backupGroup) then
								{
									//systemChat "Prüfe ob backup Gruppe existiert...";
									if (count (units(backupGroup)) > 0 ) then 
									{
										//systemChat format["Spieler wieder in die Gruppe schieben: %1", backupGroup];
										[player] joinSilent backupGroup;
									};
									
									lock_backupGroup = false;
																		
								};
							
								if (!lock_backupGroup) then
								{
									//systemChat "Aktualisiere Backup Gruppe...";
									sleep 1;
									backupGroup = group player;
								};
														
							};
						
						};
			
		};
	};

