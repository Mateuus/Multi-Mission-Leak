/*
	File: fn_vehicleColorList.sqf
	Author: Bryan "Tonic" Boardwine & John "Paratus" VanderZwet
	
	Description:
	FUCK I DON"T KNOW!
*/
private["_index","_veh","_text","_c_arr","_donation_req","_forceCiv","_indexId","_comboId"];

_indexId = [_this,0,2302,[0]] call BIS_fnc_param;
_comboId = [_this,1,2304,[0]] call BIS_fnc_param;

_index = lbCurSel _indexId;
lbClear _comboId;
if (_indexId == 2302) then
{
	_data = call compile (lbData[_indexId,_index]);
	_veh = _data select 0;
	_forceCiv = _data select 1;
}
else
{
	_veh = lbData[_indexId,_index];
	_forceCiv = true;
};
_c_arr = [_veh] call life_fnc_vehicleColorCfg;
_modVeh = (life_vehicleInfo select ([_veh, life_vehicleInfo] call life_fnc_index)) select 11;
if (isNil "_modVeh") then { _modVeh = false };
for "_i" from 0 to (count _c_arr)-1 do
{
	if (typeName (_c_arr select _i) == "ARRAY") then
	{
		switch(life_veh_shop) do
		{
			case "black_market":
			{
				if((_c_arr select _i) select 1 in ["civ","reb"]) then
				{
					_text = if (_modVeh) then { getText(configFile >> "CfgVehicles" >> (_c_arr select _i) >> "displayName") } else { [_veh,_i] call life_fnc_vehicleColorStr };
					lbAdd[_comboId,format["%1",_text]];
					lbSetValue [_comboId,(lbSize _comboId)-1,_i];
				};
			};
		
			case "reb_car":
			{
				if((_c_arr select _i) select 1 == "reb") then
				{
					_text = if (_modVeh) then { getText(configFile >> "CfgVehicles" >> (_c_arr select _i) >> "displayName") } else { [_veh,_i] call life_fnc_vehicleColorStr };
					lbAdd[_comboId,format["%1",_text]];
					lbSetValue [_comboId,(lbSize _comboId)-1,_i];
				};
			};
					
			default
			{
				_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; case independent:{"med"}; default {"civ"};};
				if (_forceCiv) then { _id = "civ" };
				if((_c_arr select _i) select 1 == _id) then
				{
					_donation_req = 0;
					_prestige_req = 0;
					if (count (_c_arr select _i) > 4) then { _donation_req = (_c_arr select _i) select 4; };
					if (count (_c_arr select _i) > 5) then { _prestige_req = (_c_arr select _i) select 5; };
					if (life_donator >= _donation_req && (_prestige_req == 0 || _prestige_req in life_achievements)) then
					{
						_text = if (_modVeh) then { getText(configFile >> "CfgVehicles" >> ((_c_arr select _i) select 0) >> "displayName") } else { [_veh,_i] call life_fnc_vehicleColorStr };
						lbAdd[_comboId,format["%1",_text]];
						lbSetValue [_comboId,(lbSize _comboId)-1,_i];
					};
				};
			};
		};
	};
};

lbSetCurSel [_comboId,0];
if((lbSize _comboId)-1 != -1) then
{
	ctrlShow[_comboId,true];
}
	else
{
	ctrlShow[_comboId,false];
};