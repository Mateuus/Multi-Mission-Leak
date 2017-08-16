#include <macro.h>
/*
	File: fn_changeCar.sqf
	Author: RafiQuak for PlayGermany

	Description:
	Used in the vehicle store to show a 'preview' of the car.
*/
disableSerialization;
private["_mode","_className","_colorIndex","_textureArray","_textures","_curSel"];
_mode = _this select 0;
//if(life_cMenu_lock) exitWith {};
//life_vMenu_lock = true;

switch (_mode) do {
	case 0: {
		_className = lbData[2302,(lbCurSel 2302)];
		if (!isNil "PG_vShop_veh") then {
			if (!isNull PG_vShop_veh) then {
				deleteVehicle PG_vShop_veh;
				waitUntil{isNull PG_vShop_veh};
			};
		};
		PG_vShop_veh = _className createVehicleLocal PG_vShop_vPos;
		waitUntil{!isNull PG_vShop_veh};
		//PG_vShop_veh attachTo [PG_vShop_logic,[0,0,0]];
		PG_vShop_veh setVariable ["BIS_enableRandomization", false];
		PG_vShop_veh setPosATL [PG_vShop_vPos select 0, PG_vShop_vPos select 1, 0];
		PG_vShop_veh setPosASL [PG_vShop_vPos select 0, PG_vShop_vPos select 1, (((getPosASL PG_vShop_veh) select 2) + (PG_vShop_vPos select 2))];
		_pos = PG_vShop_veh worldToModel position PG_vShop_logic;
		PG_vShop_veh attachTo [PG_vShop_logic,[-(_pos select 0),-(_pos select 1),-(_pos select 2)+23]];
		PG_vShop_veh allowDamage false;
		
		//Animations
		switch (playerSide) do {
			case independent: {
				if ((life_veh_shop select 0) == "thw_shop") then {
					PG_vShop_veh animate ["HidePolice", 0];
					PG_vShop_veh animate ["HideConstruction", 0];
					PG_vShop_veh animate ["HideBumper2", 0];
					PG_vShop_veh animate ["BeaconsStart", 1];
				};
			};			
			case civilian: {
				if ((life_veh_shop select 0) == "civ_air") then {
					PG_vShop_veh animate ["addBenches",0];
					PG_vShop_veh animate ["addTread",0];					
				};
			};			
		};

		PG_vShop_cam camSetTarget PG_vShop_veh;
		PG_vShop_cam camCommit 0;

		//Set default Texture
		_colorIndex = lbValue[2304,0];
		if (isNil "_colorIndex") then {_colorIndex = 0;};
		_textureArray = M_CONFIG(getArray,CONFIG_VEHICLES,(typeOf PG_vShop_veh),"textures");
		if (!isNil "_textureArray") then {
			if (count _textureArray > 0) then {
				_textures = SEL(SEL(_textureArray,_colorIndex),2);
				if(!isNil "_textures" && !(EQUAL(count _textures,0))) then {
					{PG_vShop_veh setObjectTexture [_forEachIndex,_x];} foreach _textures;
				};
				_flag = SEL(SEL(_textureArray,_colorIndex),1);
				switch (typeOf PG_vShop_veh) do {
					case "C_Offroad_01_F": {
						if(_flag == "cop") then {
							PG_vShop_veh animate ["HidePolice", 0];
							PG_vShop_veh animate ["HideBumper1", 0];
							PG_vShop_veh animate ["BeaconsStart", 1];
						} else {
							PG_vShop_veh animate ["HidePolice", 1];
							PG_vShop_veh animate ["HideBumper1", 1];							
						};
					};
					case "B_G_Offroad_01_F": {
						if(_flag == "cop") then {
							PG_vShop_veh animate ["HidePolice", 0];
							PG_vShop_veh animate ["HideBumper1", 0];
							PG_vShop_veh animate ["BeaconsStart", 1];
							PG_vShop_veh animate ["HideBumper2", 0];
							PG_vShop_veh animate ["HideBackpacks", 1];
							PG_vShop_veh animate ["HideDoor1", 0];
							PG_vShop_veh animate ["HideDoor2", 0];
							PG_vShop_veh animate ["HideDoor3", 1];
							PG_vShop_veh animate ["HideConstruction", 0];
						} else {
							PG_vShop_veh animate ["HidePolice", 1];
							PG_vShop_veh animate ["HideBumper1", 0];
							PG_vShop_veh animate ["HideBumper2", 1];
							PG_vShop_veh animate ["HideBackpacks", 0];
							PG_vShop_veh animate ["HideDoor1", 0];
							PG_vShop_veh animate ["HideDoor2", 0];
							PG_vShop_veh animate ["HideDoor3", 1];
							PG_vShop_veh animate ["HideConstruction", 1];						
						};
					};
				};
			};
		};
	};
	case 1: {
		_curSel = lbCurSel 2304;
		if (_curSel == -1) then { _curSel = 0; };
		_colorIndex = lbValue[2304,_curSel];
		if (isNil "_colorIndex") then {_colorIndex = 0;};
		_textureArray = M_CONFIG(getArray,CONFIG_VEHICLES,(typeOf PG_vShop_veh),"textures");
		if (!isNil "_textureArray") then {
			if (count _textureArray > 0) then {
				if(count _textureArray < _colorIndex) exitWith {diag_log "Fail"};
				_textures = ((_textureArray select _colorIndex) select 2);
				if(!isNil "_textures" && !(EQUAL(count _textures,0))) then {
					{PG_vShop_veh setObjectTexture [_forEachIndex,_x];} foreach _textures;
				};
				_flag = SEL(SEL(_textureArray,_colorIndex),1);
				switch (typeOf PG_vShop_veh) do {
					case "C_Offroad_01_F": {
						if(_flag == "cop") then {
							PG_vShop_veh animate ["HidePolice", 0];
							PG_vShop_veh animate ["HideBumper1", 0];
							PG_vShop_veh animate ["BeaconsStart", 1];
						} else {
							PG_vShop_veh animate ["HidePolice", 1];
							PG_vShop_veh animate ["HideBumper1", 1];							
						};
					};
					case "B_G_Offroad_01_F": {
						if(_flag == "cop") then {
							PG_vShop_veh animate ["HidePolice", 0];
							PG_vShop_veh animate ["HideBumper1", 0];
							PG_vShop_veh animate ["BeaconsStart", 1];
							PG_vShop_veh animate ["HideBumper2", 0];
							PG_vShop_veh animate ["HideBackpacks", 1];
							PG_vShop_veh animate ["HideDoor1", 0];
							PG_vShop_veh animate ["HideDoor2", 0];
							PG_vShop_veh animate ["HideDoor3", 1];
							PG_vShop_veh animate ["HideConstruction", 0];
						} else {
							PG_vShop_veh animate ["HidePolice", 1];
							PG_vShop_veh animate ["HideBumper1", 0];
							PG_vShop_veh animate ["HideBumper2", 1];
							PG_vShop_veh animate ["HideBackpacks", 0];
							PG_vShop_veh animate ["HideDoor1", 0];
							PG_vShop_veh animate ["HideDoor2", 0];
							PG_vShop_veh animate ["HideDoor3", 1];
							PG_vShop_veh animate ["HideConstruction", 1];						
						};
					};
				};
			};
		};
	};
};
//life_vMenu_lock = false;