/*
	File: fn_sensorLoop.sqf
	Author: © 2015 - MarkusSR1984
	Description:
	Ich will keine Trigger mehr :P
*/

// ["MarkernameORpos",Radius,"Condition","OnActAction","OnDeActAction",state]
//hint parseText format  ['<t color='#54a2e0'>BEI RENNBETRIEB RENNSTRECKE NICHT BEFAHREN</t><br/><t color='#ff0707'>KONTAKT MIT DER<br/><t size='2' underline='true'>SCHRANKE</t><br/>IST<br/><t size='3' underline='true'>TÖDLICH</t>'];
if (isNil "DWEV_sensors") then 
{
DWEV_sensors = switch (worldname) do
	{
		case "Altis":
		{
			 [
				["HQ_ka_100", 100, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, dies ist ein Polizei Revier, bitte verlassen Sie dieses umgehend.'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_pyrgos_HQ", 75, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, dies ist ein Polizei Revier, bitte verlassen Sie dieses umgehend.'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_pyrgos_markt", 70, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden.'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_kavala_markt_weis", 110, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_kavala_markt_weis", 110, "true", "[] spawn DWEV_fnc_speedBreakes;","DWEV_speedbreakes = false;",false],
				["trigger_paintball", 60, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_casino", 60, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_kavala_markt_gruen", 425, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kavala_boot", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kavala_LKW", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kavala_waffen", 20, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kavala_apfel", 75, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kavala_pfirsich", 75, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kavala_metall", 75, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_pyrgos_LKW", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_pyrgos_auto", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_pyrgos_bankauto", 20, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_pyrgos_garage", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_telos_waffen", 20, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_airfield_HQ", 70, "(side player) == civilian", "hint 'Achtung, dies ist ein Polizei Revier, bitte verlassen sie dieses umgehend.';","hint '';",false],
				["trigger_airfield_heli_haendler", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_airfield_heli_garage", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_airfield_verwahrstelle", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_neochori_boot", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_neochori_bankauto", 20, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_premium_sued", 100, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_neochori_nord", 100, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_diamant_boot", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_athira_Polizei", 55, "(side player) == civilian", "hint 'Achtung, dies ist ein Polizei Revier, bitte verlassen sie dieses umgehend.';","hint '';",false],
				["trigger_athira_garage", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_athira_stadt", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_athira_LKW", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_kontrolle_1", 140, "(side player) == civilian", "hint 'Achtung, sie nähern sich einem Checkpoint, bitte drosseln sie ihr Tempo.';","hint 'Achtung, sie haben den Checkpoint verlassen, sie dürfen wieder beschleunigen';",false],
				["trigger_kontrolle_2", 100, "(side player) == civilian", "hint 'Achtung, sie nähern sich einem Checkpoint, bitte drosseln sie ihr Tempo.';","hint 'Achtung, sie haben den Checkpoint verlassen, sie dürfen wieder beschleunigen';",false],
				["trigger_kontrolle_HQ", 40, "(side player) == civilian", "hint 'Achtung, dies ist ein Polizei Revier, bitte verlassen sie dieses umgehend.';","hint '';",false],
				["trigger_sofia_LKW", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_sofia_garage", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_sofia_auto", 20, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_sofia_polizei", 50, "(side player) == civilian", "hint 'Achtung, dies ist ein Polizei Revier, bitte verlassen sie dieses umgehend.';","hint '';",false],
				["trigger_karbahn", 80, "(side player) == civilian", "hint 'Die Kart`s müssen auf der Rennstecke bleiben und dürfen nicht außerhalb der absperrung gefahren werden!';","hint '';",false],
				["trigger_karbahn_schranke", 10, "(side player) == civilian", "","hint 'BEI RENNBETRIEB RENNSTRECKE NICHT BETRETEN!';",false],
				["trigger_zaros_bankauto", 20, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_zaros_garage", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_rebell_sued_mitte", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_rebell_rechts", 90, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_rebell_nord", 250, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_jet", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_faehre_altis", 35, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_fluege_altis", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["PvPArea", 700, "true", "hint 'ACHTUNG PVP ZONE, Hier darf sofort bei Sichtung eines Gegners geschossen werden! KEIN RP Beginn erforderlich'; DWEV_var_playerInPvpAreal = true;","hint 'Du hast den PvP Bereich verlassen';DWEV_var_playerInPvpAreal = false;",false]
				
			];
		};
		
		case "Tanoa":
		{
			[
				["HQ_gt_100", 100, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, dies ist ein Polizei Revier, bitte verlassen Sie dieses umgehend.'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_bambi", 600, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_georgetown_gruen", 250, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_georgetown_weiß", 80, "(side player) == civilian", "hint 'ABSOLUTE SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden'; DWEV_allow_fire = false; player allowdamage false;","hint ''; DWEV_allow_fire = true; player allowdamage true;",false],
				["trigger_georgetown_weiß", 80, "true", "[] spawn DWEV_fnc_speedBreakes;","DWEV_speedbreakes = false;",false],
				["trigger_bankauto_katkoula", 15, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_bankauto_tavu", 15, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_bankauto_lijn", 15, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_bankauto_oumere", 15, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_bankauto_tuvanaka", 15, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_car_tuvanaka", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_car_tavu", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_car_katkoula", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_car_lijn", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_car_oumere", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_g_lijn", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_g_oumere", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_g_katkoula", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_g_tavu", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_g_tuvanaka", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_lkw_tuvanaka", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_lkw_katkoula", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_lkw_lijn", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_reb_vatukoulo", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_heli_1", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_heli_trader_1", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_heli_service", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_boat_2", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_boat_6", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_boat_8", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_9", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_10", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_11", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_12", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_boat_13", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_14", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_boat_15", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_16", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_17", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				//["trigger_boat_18", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_boat_19", 30, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_lkw_georgetown", 50, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_faehre_tanoa", 35, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false],
				["trigger_fluege_tanoa", 25, "(side player) == civilian", "hint 'ACHTUNG SAFEZONE, Hier darf NICHT geschossen, getötet oder geklaut werden!';","hint '';",false]
			];
		};
	
	};
					
	[] spawn
	{
		while {true} do
		{
			{
				if ((call compile (_x select 2)) &&!(_x select 5)) then // Ist Condition erfüllt und Trigger nicht aktiv dann
				{
					_pos = [0,0,0];
					_dist = (_x select 1);
				
					switch (typeName (_x select 0)) do
					{
						case "STRING": {_pos = getMarkerPos (_x select 0);};
						case "ARRAY": {_pos = (_x select 0);};
					};
				
					if ((player distance _pos) <= _dist) then 
					{
						[] call compile (_x select 3);
						_x set [5,true];
					
						[_pos,_dist,_x] spawn 
						{
							waitUntil {sleep 0.5; ((player distance (_this select 0)) > (_this select 1))};
						
							if (((_this select 2) select 4) != "") then 
							{
								[] call compile ((_this select 2) select 4);
							};
						
							(_this select 2) set [5,false];
						};
					};
				};
			
				sleep 0.05;
				false
			} count DWEV_sensors;

			sleep 1;
		}
	};
};