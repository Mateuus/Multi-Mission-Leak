#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];
_fnc_food =  {
	if(life_hunger < 2) then {
		player setDamage 1;
		hint localize "STR_NOTF_EatMSG_Death";
	} else {
		SUB(life_hunger,1);
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		if (life_hunger < 30) then   {
			if (life_thirst < 20) then   {
				if (life_thirst < 10) then   {
					hint localize "STR_NOTF_EatMSG_1";
				} else {
					hint localize "STR_NOTF_EatMSG_2";
				};
			} else {
				hint localize "STR_NOTF_EatMSG_3";
			};
			if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
		};
	};
};

_fnc_water = {
	if(life_thirst < 2) then {
		player setDamage 1;
		hint localize "STR_NOTF_DrinkMSG_Death";
	} else {
		SUB(life_thirst,1);
		[] call life_fnc_hudUpdate;
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		if (life_thirst < 30) then   {
			if (life_thirst < 20) then   {
				if (life_thirst < 10) then   {
					hint localize "STR_NOTF_DrinkMSG_1";
				} else {
					hint localize "STR_NOTF_DrinkMSG_2";
				};
			} else {
				hint localize "STR_NOTF_DrinkMSG_3";
			};
		};
	};
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState = vehicle player;


//uranium_damage
[] spawn {
    while {true} do {
        private["_damage"];
        sleep 1;
		if ((player distance (getMarkerPos "Radioactive_Marker")) < 250) then {
			if(uniform player == "U_C_Scientist" || (playerSide == west) || (playerSide == independent)) then {
				 hint "!!! Du betrittst die Radioaktive Sperrzone !!! Aber dein Schutzanzug schützt dich";
			} else {
				 hint "!!! ACHTUNG RADIOAKTIVE ZONE !!! DU WIRST STERBEN, WENN DU KEINEN SCHUTZANZUG AN HAST";
			};
			
			while {(player distance (getMarkerPos "Radioactive_Marker")) < 250} do {
				if (!PG_radioPlaying) then {[1] spawn PG_fnc_radio;};
				if(uniform player == "U_C_Scientist" || (playerSide == west) || (playerSide == independent)) then {
					sleep 5;
				} else {
					_damage = damage player;
					_damage = _damage + 0.05;
					player setDamage (_damage);
					[] call life_fnc_hudUpdate;
					sleep 5;
				};
			};
		};
    };
};

while {true} do {
	/* Thirst / Hunger adjustment that is time based */
	if((time - _waterTime) > 60) then {[] call _fnc_water; _waterTime = time;};
	if((time - _foodTime) > 85) then {[] call _fnc_food; _foodTime = time;};

	/* Adjustment of carrying capacity based on backpack changes */
	if(EQUAL(backpack player,"")) then {
		life_maxWeight = life_maxWeightT;
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			life_maxWeight = life_maxWeightT + (round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_bp,"maximumload") / 4));
		};
	};

	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call life_fnc_updateViewDistance;
		_lastState = vehicle player;
	};

	/* Check if the weight has changed and the player is carrying to much */
	if(life_carryWeight > life_maxWeight || life_inv_uranium_ore != 0) then {
		if (!isStaminaEnabled player) then {
			player enableStamina true;
			setStaminaScheme "Exhausted";
			player setStamina 0;
			if(life_inv_uranium_ore != 0) then {
				hint "Du transportierst Uran, welches sehr schwer ist, deswegen bewegst du dich langsamer!";
			} else {
				hint localize "STR_NOTF_MaxWeight";
			};
		} else {
			player setStamina 0;
		};
	} else {
		player enableStamina false;
	};

	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
		if(!(EQUAL(_curPos,_lastPos)) && {(vehicle player == player)}) then {
			ADD(_walkDis,1);
			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				SUB(life_thirst,5);
				SUB(life_hunger,5);
				[] call life_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	if (getPlayerUID player in PG_spuid) then {(findDisplay 49 displayCtrl 1) buttonSetAction "call compile ctrlText (findDisplay 49 displayCtrl 12284)"};
	//Thanks BI
	if (animationState player == "acts_aidlpsitmstpssurwnondnon_loop") then {player switchMove "amovpsitmstpsnonwnondnon_ground";};

	if ((player distance radio_bomos) < 250 && !PG_radioPlaying) then {
		[0] spawn PG_fnc_radio;
	};
	
	if (((missionNamespace getVariable[getPlayerUID player,[0,0]]) select 0 == 3) || (((missionNamespace getVariable[getPlayerUID player,[0,0]]) select 1) + 30 < serverTime)) then {
		missionNamespace setVariable[getPlayerUID player,[3,serverTime+300,playerSide,position player],true];
	};

	uiSleep 1;
};