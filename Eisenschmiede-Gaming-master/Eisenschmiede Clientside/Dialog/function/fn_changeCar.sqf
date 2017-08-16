#include "..\script_macros.hpp" 

disableSerialization;
private["_mode","_className","_colorIndex","_textureArray","_textures","_curSel"];
_mode = _this select 0;
if(ES_cMenu_lock) exitWith {};
ES_vMenu_lock = true;

switch (_mode) do {
	case 0: {
		_className = lbData[2302,(lbCurSel 2302)];
		if (!isNil "ES_vShop_veh") then {
			if (!isNull ES_vShop_veh) then {
				deleteVehicle ES_vShop_veh;
			};
		};
		ES_vShop_veh = _className createVehicleLocal ES_vShop_vPos;
		ES_vShop_veh attachTo [ES_vShop_logic,[0,0,0]];
		ES_vShop_veh setPosATL [ES_vShop_vPos select 0, ES_vShop_vPos select 1, 0];
		ES_vShop_veh setPosASL [ES_vShop_vPos select 0, ES_vShop_vPos select 1, (((getPosASL ES_vShop_veh) select 2) + (ES_vShop_vPos select 2))];
		ES_vShop_veh enableSimulation false;
		ES_vShop_veh allowDamage false;

		ES_vShop_cam camSetTarget ES_vShop_veh;
		ES_vShop_cam camCommit 0;

		//Set default Texture
		_colorIndex = lbValue[2304,0];
		if (isNil "_colorIndex") then {_colorIndex = 0;};
		_textureArray = M_CONFIG(getArray,"CfgVehicles",(typeOf ES_vShop_veh),"textures");
		if (!isNil "_textureArray") then {
			if (count _textureArray > 0) then {
				_textures = _textureArray select _colorIndex select 2;
				if(!isNil "_textures" && !(EQUAL(count _textures,0))) then {
					{ES_vShop_veh setObjectTexture [_forEachIndex,_x];} foreach _textures;
				};
			};
		};
	};
	case 1: {
		_curSel = lbCurSel 2304;
		if (_curSel == -1) then { _curSel = 0; };
		_colorIndex = lbValue[2304,_curSel];
		if (isNil "_colorIndex") then {_colorIndex = 0;};
		_textureArray = M_CONFIG(getArray,"CfgVehicles",(typeOf ES_vShop_veh),"textures");
		if (!isNil "_textureArray") then {
			if (count _textureArray > 0) then {
				if(count _textureArray < _colorIndex) exitWith {diag_log "Fail"};
				_textures = ((_textureArray select _colorIndex) select 2);
				if(!isNil "_textures" && !(EQUAL(count _textures,0))) then {
					{ES_vShop_veh setObjectTexture [_forEachIndex,_x];} foreach _textures;
				};
			};
		};
	};
};
ES_vMenu_lock = false;