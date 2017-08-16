#include "..\..\macros.hpp"
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.

	Modifiziert von MarkusSR1984
	Description:
	Die Einzelnen Punkte werden nun Deutlich schneller abgehandelt, wenn ich Tonics Beschreibung lese war da ja nie Gummigeschosse und Fahrzeughandling vorgesehen.
	- Allgemeine Performance: Verbessert durch verbesserten Programmablauf (was gerade nicht benötigt wird, wird auch nicht verarbeitet)
	- Tazer und Gummigeschosse machen nun 10 HP Schaden.
	- Der Schaden des Tazers nach 100m wird nun auf 1 hp reduziert. Da dieser ja sonst meist auf einen Schuss tötlich war
	- Beim überfahren wird man nun Verwarnt und wenn man es übertreibt auch von Server geworfen (Werte müssen noch ermittelt werden)
	- Wenn man überfahren wird, bekommt man keine 100% mehr sondern es werden 5 HP abgezogen
	- Spieler legen sich nun nicht mehr auf den Boden wenn sie Getroffen werden

	- Fahrzeug kollisions Schaden reduziert

*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_oldDamage = damage _unit;

DWEV_lastPlayerDamage = diag_tickTime;
//Internal Debugging.

//systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
//diag_log format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];

//Handle the tazer first (Top-Priority).
if(!isNull _source && _source != _unit) then
{
		// Weitere Variablen Deklarieren die für einige dinge benötigt werden
	 	_curWep = currentWeapon _source;
		_curMag = currentMagazine _source;

		if (player getVariable["DWEV_paintball_arena",false]) exitWith
		{
			// Spieler ist in Paintball Modus und in der Arena
			if (isNil "paintball_gotHits") then {paintball_gotHits = 0;};
			if (isNil "lock_damage") then {lock_damage = false};

			if !(lock_damage) then
			{
				lock_damage = true;

				paintball_gotHits = paintball_gotHits + 1;
				//hint format ["Du wurdest getroffen!\n\n %1 von 5\nmöglichen Treffern",paintball_gotHits];
				[_source] spawn
				{
					_source = _this select 0;
					if (paintball_gotHits > 5) then
					{
						[getMyName,(player getVariable["pballSide",""])] remoteExec ["DWEV_fnc_painballHitConfirmed",_source];
						["Du wurdest zu oft getroffen\nfang von vorne an!"] call DWEV_fnc_paintballLeafArena;

					};
				};

				[] spawn
				{
					sleep 0.25;
					lock_damage = false;
				};

			};
			_damage = _oldDamage; _damage; // Keine Schaden verursachen
		};

		if (player getVariable["DWEV_paintball_dome",false]) exitWith {_damage = _oldDamage; _damage;}; // Innerhalb den Domes keinen Schaden durch beschuss zulassen

		if((side player) == independent && _projectile != "") exitWith {_damage = _oldDamage + 0.1; _damage;};
		if(player getVariable["noobschutz",false] && _projectile != "" && !(side _source == west) && !DWEV_var_playerInPvpAreal) exitWith {_damage = _oldDamage; _damage;};
	
		if (DWEV_var_kevlar >= 1 && (side player) == civilian && _projectile != "") then 
		{
			if(DWEV_var_kevlar == 1) exitWith {_damage = _oldDamage + 0.14; _damage;};
			if(DWEV_var_kevlar == 2) exitWith {_damage = _oldDamage + 0.16; _damage;};
			if(DWEV_var_kevlar == 3) exitWith {_damage = _oldDamage + 0.18; _damage;};
			if(DWEV_var_kevlar == 4) exitWith {_damage = _oldDamage + 0.20; _damage;};
			if(DWEV_var_kevlar == 5) exitWith {_damage = _oldDamage + 0.12; _damage;};
			if(DWEV_var_kevlar == 6) exitWith {_damage = _oldDamage + 0.10; _damage;};
		};
		
		if(_projectile in ["B_45ACP_Ball","B_9x21_Ball"] && _curWep in ["hgun_Pistol_heavy_01_snds_F","hgun_P07_khk_F"]) exitWith
		{
				if (isNil "lock_tazer") then {lock_tazer = false};

				if !(lock_tazer) then
				{
					lock_tazer = true;
					[] spawn {sleep 5; lock_tazer = false;};

					private["_distance","_isVehicle","_isQuad"];
					_distance = if(_projectile == "B_45ACP_Ball" || _projectile == "B_9x21_Ball") then {100} else {35};
					_isVehicle = if(vehicle player != player) then {true} else {false};

					_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","C_Kart_01_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F","B_Quadbike_01_F"]) then {true} else {false}} else {false};


					if(_unit distance _source < _distance) then
					{
						if(!DWEV_istazed && !(_unit getVariable["restrained",false])) then
						{
							_damage = (_oldDamage + 0.1); // 10% Schaden beim Tazern
							if(_isVehicle && _isQuad) then
							{
								player action ["Eject",vehicle player];
								[_unit,_source] spawn DWEV_fnc_tazed;
							}
							else
							{
								if(vehicle player == player) then
								{
									[_unit,_source] spawn DWEV_fnc_tazed;
								};
							};
						}
						else
						{
							_damage = _oldDamage;
						};
					}
					else
					{
						_damage = (_oldDamage + 0.01); // Wenn maximale Reichweite Überschritten dann auch nur 1% Schaden machen
					};
				}
				else
				{
					_damage = _oldDamage;
				};

			//[] spawn DWEV_fnc_hudUpdate;
			_damage; // Rückgabewert setzen und Funktion verlassen

		};

//Gummigeschosse NUR für COPs

		if (_curMag in ["30Rnd_65x39_caseless_mag_Tracer"] && _projectile in ["B_65x39_Caseless"]) exitWith
		{
			if((side _source == west && (side player) != west)) then
			{
				private["_isVehicle","_isQuad"];

				if (isNil "lock_rubberbullets") then {lock_rubberbullets = false};

				if !(lock_rubberbullets) then
				{
					lock_rubberbullets = true;
					[] spawn {sleep 5; lock_rubberbullets = false;};

					if(!DWEV_isdowned && !(_unit getVariable["restrained",false])) then
					{
						_damage = (_oldDamage + 0.1);
						if(typeOf(vehicle player) == "B_Quadbike_01_F") then
						{
							player action ["Eject",vehicle player];
							[_unit,_source] spawn DWEV_fnc_handleDowned;
						}
						else
						{
							if(vehicle player == player) then
							{
								[_unit,_source] spawn DWEV_fnc_handleDowned;
							};
						};
					}
					else
					{
						_damage = _oldDamage;
					};
				}
				else
				{
					_damage = _oldDamage;
				};
			}
			else
			{
				_damage = _oldDamage;
			};

			_damage; // Rückgabewert setzen und Funktion verlassen

		};
}
else // Schaden durch z.B. Sprung (Ohne Schadensquelle)
{
		if (player getVariable["DWEV_paintball_arena",false]) exitWith
		{
					[] spawn
					{

						["Du bist gestorben\nGut dass es beim Paintball keine Toten gibt ;-)"] spawn DWEV_fnc_paintballLeafArena;
					};

					_damage = _oldDamage; _damage; // Keinen Schaden verursachen
		};

		if ((vehicle player != player) && playerDamageHandler) exitWith
		{

			_HighDamageValue 	= (_damage - _oldDamage);
			_LowDamageValue		= (_HighDamageValue * 0.25);

//			systemChat format ["Fahrzeug Kollisionsschaden von %1 reduziert auf %2",_HighDamageValue,_LowDamageValue];
			_damage = _oldDamage + _LowDamageValue;
			_damage;
		};

};

///*
if(!isNull _source && _source != _unit) then
{



   if (vehicle _source != _source) exitWith
   {
        if (isNil "lock_vdm_warnings") then {lock_vdm_warnings = false};
		
		if (!(lock_vdm_warnings) && !(_source in (crew vehicle player))) then
		{
			lock_vdm_warnings = true;
			if (_projectile != "") exitWith {[] spawn {uisleep 1;lock_vdm_warnings = false;}; _damage;};
			_damage = (_oldDamage + 0.05); // 5% Schaden beim Überfahren machen
			[player,"amovppnemstpsraswrfldnon"] remoteExec ["DWEV_fnc_animSync",-2];
			_warncounter = _source getVariable["verwarnungen_vdm",0];
			_warncounter = _warncounter + 1;
			_msg = format ["!!! WARNUNG !!! \n\nDas Überfahren von Spielern ist nicht erlaubt\nWarnung %1 von 5\n\n!!! WARNUNG !!!\n\nWenn du nicht aufhörst, wirst du getötet und aus dem Spiel geworfen!",_warncounter];
			_msg remoteExec ["hint",_source]; // Warnung an den Spieler senden
			systemChat format["Du wurdest von %1 überfahren!",getPlayerDName(_source)]; // Bessere Variante, da diese den Server nicht belastet
			_source setVariable["verwarnungen_vdm",_warncounter,true];
			[] spawn {sleep 3;lock_vdm_warnings = false;};
		}
		else
		{
			_damage = _oldDamage;
		};

		/*
		if (_source getVariable["verwarnungen_vdm",0] > 5) then
		{
			if (alive _source) then
			{
//				[[],"DWEV_fnc_forcequit",_source,false] spawn DWEV_OLD_fnc_MP;
//				[[],"DWEV_fnc_adminkickaction",_source,false] spawn DWEV_OLD_fnc_MP;
			};

		};
		*/

		////[] spawn DWEV_fnc_hudUpdate;
		_damage; // Rückgabewert setzen und Funktion verlassen
	};
   /* // Spieler bei Hit auf den Boden legen
   if (vehicle _unit != _unit) then // Wenn Spieler nicht in einem Fahrzeug ist dann
   {
		[[player,"amovppnemstpsraswrfldnon"],"DWEV_fnc_animSync",true,false] spawn DWEV_OLD_fnc_MP; // Auf den Boden legen wenn er getroffen wurde
   };
   */
};
////*/

_damage;
