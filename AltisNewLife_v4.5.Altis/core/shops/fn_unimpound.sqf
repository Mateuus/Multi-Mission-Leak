private["_display","_cars","_veh","_sel","_i","_name","_color","_text","_check","_price","_pos"];
disableSerialization;
_display = findDisplay 2800;
_cars = _display displayCtrl 2801;
_sel = lbCurSel _cars;
_veh = _cars lbData _sel;
_veh = life_vehicles select parseNumber(_veh);
_price = _cars lbValue _sel;
if(_veh distance impound_obj < 50) then
{

	hint format["%1", life_impound_yard];
	switch (life_impound_yard) do
	{
		case "civ":
		{
			switch (true) do
			{
				case (_veh isKindOf "Car") : {_pos = getPos car_impound;};
				case (_veh isKindOf "Air") : {_pos = getPos air_impound;};
				case (_veh isKindOf "Ship") : {_pos = getPos boat_impound;};
			};
		};
		
		case "cop":
		{
			switch (true) do
			{
				case (_veh isKindOf "Car") : {_pos = getPos cop_car_impound;};
				case (_veh isKindOf "Air") : {_pos = getPos cop_air_impound;};
				case (_veh isKindOf "Ship") : {_pos = getPos cop_boat_impound;};
			};
		};
	};
	_check = nearestObjects[_pos,["LandVehicle","Air"],4];
	if(count _check > 0) exitWith {hint "Il y a deja un vehicule ici !";};
	if(_price > argent_liquide) then
	{
		_price = _price + 100;
		if(_price > compte_banque) exitWith {hint "Vous n'avez pas assez d'argent sur ​​vous ou à la banque pour acheter votre vehicule."};
		compte_banque = compte_banque - _price;
		argent_liquide = argent_liquide + _price;
	};
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_veh setDamage 0;
	_veh setFuel 0;
	_veh allowDamage false;
	_veh addEventHandler["handleDamage",{false}];
	[_veh] spawn
	{
		private["_v"];
		_v = _this select 0;
		uiSleep 10;
		_v allowDamage true;
		_v removeallEventHandlers "handleDamage";
	};

	hint format["Vous avez sorti de la fourriere votre %1 pour %3€",_name,[_price] call life_fnc_numberText];
	detach _veh;
	if(_veh isKindOf "Air") then 
	{
		_veh setPos [_pos select 0, _pos select 1, 1];
	}
	else
	{
		_veh setPos _pos;
	};
	player reveal _veh;
	argent_liquide = argent_liquide - _price;
	bank_addfunds = _price;
	publicVariableServer "bank_addfunds";
	_veh setFuel 1;
};

[] call life_fnc_impoundMenu; //Refresh it