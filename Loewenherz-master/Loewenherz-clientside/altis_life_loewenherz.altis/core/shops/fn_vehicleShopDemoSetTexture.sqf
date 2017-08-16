/*
	File: fn_vehicleShopDemoSetTexture.sqf
	Author: Barney

	Description:
	Showcase und so

	You're not allowed to modify this file!
        Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/



private ["_className","_colorindex","_texture","_selectedtexture","_texture","_whatsit","_count"];


_className = lbData[2302,(lbCurSel 2302)];



_colorindex = lbValue[2304,(lbCurSel 2304)];




_texture = [_className] call lhm_fnc_vehicleColorCfg;

_whatsit = lhm_veh_shop select 2;

sleep 0.1;
//{
	//if((_x select 1) != _whatsit) then {
//		_texture = _texture - [_x];
//	};

//} foreach _texture;



//if(count(_texture) < _colorindex) then {
//	_colorindex = 0;
//};

_selectedtexture = _texture select _colorindex;

if(!isnil "_selectedtexture") then {

	_count = count(_selectedtexture);

	if(_count == 2) then {
		LHM_shop_show_vehicle setObjectTexture [0,(_selectedtexture select 0)];
	};

	if(_count == 3) then {
		LHM_shop_show_vehicle setObjectTexture [0,(_selectedtexture select 0)];
		LHM_shop_show_vehicle setObjectTexture [1,(_selectedtexture select 2)];
	};

	if(_count == 4) then {
		LHM_shop_show_vehicle setObjectTexture [0,(_selectedtexture select 0)];
		LHM_shop_show_vehicle setObjectTexture [1,(_selectedtexture select 2)];
		LHM_shop_show_vehicle setObjectTexture [2,(_selectedtexture select 3)];
	};

};


true;