#include <macro.h>
_mode = [_this,0,-1] call BIS_FNC_PARAM;
_info = [_this,1,-1] call BIS_FNC_PARAM;

switch (_mode) do
{
	case 0:
	{
		_item = _info select 0;
		_price = _info select 1;
		_seller = _info select 2;
		_menge = _info select 3;
		_color = _info select 4;
		_shortname = [_item,1] call life_fnc_varHandle;	
		
		life_beatbankgeld = life_beatbankgeld - _price;
		
		if(_item in life_inv_items) then
		{
			hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion akzeptiert<br/><br/><t color='#33CC33'><t align='center'><t size='1'>%4x <t color='#ff1000'>%1 <t color='#ffffff'>von %3 für <t color='#c0c000'>%2€<br/>",[_item] call life_fnc_varToStr,([_price] call life_fnc_numberText),_seller,_menge];
			
			[_shortname,_menge] call life_fnc_handleInvCheck;
		};

		if(_item isKindOf "Car" OR _item isKindOf "Air") then 
		{
		_vehicleInfo = [_item] call life_fnc_fetchVehInfo;
		_colorVehicle = [(_vehicleInfo select 0),_color] call life_fnc_vehicleColorStr;

			hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion akzeptiert<br/><br/><t color='#ff1000'><t align='center'><t size='1'>%1 <t color='#ffffff'>von %3 mit der Lackierung <t color='#33CC33'>%4 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",(_vehicleInfo select 3),([_price] call life_fnc_numberText),_seller,_colorVehicle];

			VehCreated = false;
			 
			_vehicle = _item createVehicle (getMarkerPos "temp");
			WaitUntil{!IsNil "_vehicle"};
			[_vehicle,_color] remoteExec ["life_fnc_colorVehicle",0];
			_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
			[(getPlayerUID player),playerSide,_vehicle,_color,player] remoteExecCall ["SOA_fnc_vehicleCreate",2];
			WaitUntil{VehCreated};
			[_vehicle,false,player,(damage _vehicle),(fuel _vehicle)] remoteExecCall ["SOA_fnc_vehicleStore",2];
		};

		if(!(_item in life_inv_items) && !(_item isKindOf "Car" OR _item isKindOf "Air")) then 
		{
			if(backpack player == "" && _item != backpack player && _item != uniform player) exitWith {hint "Du besitzt keinen Rucksack!"};
			if(loadbackpack player > 0.8 && _item != backpack player && _item != uniform player) exitWith {hint "Du kannst nicht so viel tragen!"};

			hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion akzeptiert<br/><br/><t color='#33CC33'><t align='center'><t size='1'>%4x <t color='#ff1000'>%1 <t color='#ffffff'>von %3 für <t color='#c0c000'>%2€<br/>",(([_item] call VAS_fnc_fetchCfgDetails) select 1),([_price] call life_fnc_numberText),_seller,_menge];

			for "_i" from 1 to _menge do {[_item,true] spawn life_fnc_handleItem};
		};

		//closedialog 0;
		[] spawn life_fnc_CAH_loadOffers;
	};

	case 1:
	{
		_seller = _info select 0;
		_price = _info select 1;
		_msg = format
		[
			"%1 akzeptierte eines deiner Auktionsgebote, du erhältst %2€",
			name _seller,([_price] call life_fnc_numberText)
		];
		["Post",_msg,player,11] remoteExecCall ["SOA_fnc_handleMessages",2];
		life_beatbankgeld = life_beatbankgeld + _price;
	};

	case 2:
	{
		AH_offers = _info;
		AH_loaded = true;
	};

	case 3: {hint "Dieser Gegenstand ist nicht kaufbar!";};
	
	case 4: 
	{
		_item = _info select 0;
		_price = _info select 1;
		_seller = _info select 2;
		_menge = _info select 3;
		_color = _info select 4;
		_shortname = [_item,1] call life_fnc_varHandle;
		_newprice = round(_price/4);


		if((_item isKindOf "Car" OR _item isKindOf "Air") && playerside != civilian) exitWith {hint "Du kannst im Dienst keine Fahrzeuge kaufen!"}; 
		
		life_beatbankgeld = life_beatbankgeld - _newprice;
		
		if(_item in life_inv_items) then
		{
			hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion storniert<br/><br/><t color='#33CC33'><t align='center'><t size='1'>%3x <t color='#ff1000'>%1 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",[_item] call life_fnc_varToStr,([_newprice] call life_fnc_numberText),_menge];
			
			[_shortname,_menge] call life_fnc_handleInvCheck;
		};

		if(_item isKindOf "Car" OR _item isKindOf "Air") then 
		{
		_vehicleInfo = [_item] call life_fnc_fetchVehInfo;
		_colorVehicle = [(_vehicleInfo select 0),_color] call life_fnc_vehicleColorStr;
		
			hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion storniert<br/><br/><t color='#ff1000'><t align='center'><t size='1'>%1 <t color='#ffffff'>mit der Lackierung <t color='#33CC33'>%3 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",(_vehicleInfo select 3),([_price] call life_fnc_numberText),_colorVehicle];

			VehCreated = false;
			
			_vehicle = _item createVehicle (getMarkerPos "temp");
			WaitUntil{!IsNil "_vehicle"};
			[_vehicle,_color] remoteExec ["life_fnc_colorVehicle",0];
			_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
			[(getPlayerUID player),playerSide,_vehicle,_color,player] remoteExecCall ["SOA_fnc_vehicleCreate",2];
			WaitUntil{VehCreated};
			[_vehicle,false,player,0,1] remoteExecCall ["SOA_fnc_vehicleStore",2];
		};

		if(!(_item in life_inv_items) && !(_item isKindOf "Car" OR _item isKindOf "Air")) then 
		{	
			hint parseText format ["<t color='#316dff'><t size='1.5'><t align='center'>Auktion storniert<br/><br/><t color='#33CC33'><t align='center'><t size='1'>%3x <t color='#ff1000'>%1 <t color='#ffffff'>für <t color='#c0c000'>%2€<br/>",(([_item] call VAS_fnc_fetchCfgDetails) select 1),([_newprice] call life_fnc_numberText),_menge];
			
			for "_i" from 1 to _menge do {[_item,true] spawn life_fnc_handleItem};
		};

		//closedialog 0;
		[] spawn life_fnc_CAH_loadOffers;
	};
};