/*----------------------------------------------------------
Author: Shawn "Huntah" Macgillivray
	
Description:
Fuel delivery missions
-----------------------------------------------------------*/

private ["_jobDepots","_lastLoc","_newPrice","_markerojb","_tempNum","_fuelDeliveryArray","_done"];

_moneyearned = 0;
_distance = 0;
_totalmoneyearned = 0;
_totaldistance = 0;
_counter = 0;
_currentpoint = ObjNull;
_lastLoc = (position player);
_jobDepots = ["jobs1","jobs1_1","jobs1_2","jobs1_3"];
_done = false;

if(DS_fuelMission) exitwith {systemchat "Seems you already have one of these active... guess you better finish it?"};
DS_fuelMission = true;
deleteMarkerLocal "fueldeliverymarker";

_fuelDeliveryArray =
[
getmarkerpos "bv",getmarkerpos "Gas1",getmarkerpos "Gas1_1_1",getmarkerpos "Gas1_1",getmarkerpos "Gas1_1_1_1",getmarkerpos "Gas1_1_1_2",getmarkerpos "Gas1_1_1_2_1",getmarkerpos "Gas1_1_1_2_1_1",
getmarkerpos "Gas1_1_1_2_1_1_1",getmarkerpos "Gas1_1_1_2_1_1_1_1",getmarkerpos "Gas1_1_1_2_1_1_1_1_1",getmarkerpos "bv_1_1_1",getmarkerpos "bv_1"
];

_newmarker = (floor(random(count _fuelDeliveryArray)));
_markerlocation = (_fuelDeliveryArray select _newmarker);

while{(_lastLoc distance _markerlocation > 8000)} do
		{
		_newmarker = (floor(random(count _fuelDeliveryArray)));
		_markerlocation = (_fuelDeliveryArray select _newmarker);
		};

_currentpoint = _markerlocation;
_markerobj = createmarkerlocal ["fueldeliverymarker",[0,0]];
_markername = "fueldeliverymarker";
_markerobj setmarkershapelocal "Icon";
"fueldeliverymarker" setmarkertypelocal "hd_warning";
"fueldeliverymarker" setmarkercolorlocal "colorblack";
"fueldeliverymarker" setmarkersizelocal [1, 1];
"fueldeliverymarker" setmarkertextlocal "Fuel Delivery";
_markername Setmarkerposlocal _markerlocation;
_lastLoc = _markerlocation;

systemchat "Your job is to deliver fuel to 3 gas stations.";
hint 'Your job is to deliver fuel to 3 gas stations.';

sleep 3;
systemchat "Your first delivery point is shown as the black (!) marked on your map";
hint 'Your first delivery point is shown as the black (!) marked on your map';
sleep 10;
systemchat "Make sure you use a fuel truck to receive payments, you purchase these at any truck shop!";
hint 'Make sure you use a fuel truck to receive payments, you purchase these at any truck shop!';
sleep 5;
systemchat "WARNING! DO not use a bus during these missions!";
hint "WARNING! DO not use a bus during these missions!";
_plocation = getpos player;
_distance = _plocation distance _markerlocation;

while {DS_fuelMission} do
	{
	if (player distance _markerlocation <= 20) then
		{
		if(typeOf (vehicle player) in ["B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F"])then
			{
			if((gasMoneyArray select 11) > 300)then
				{
				_moneyearned = (ceil(_distance * 17));
				}
				else
				{
				if((gasMoneyArray select 11) > 200)then
					{
					_moneyearned = (ceil(_distance * 13));
					}
					else
					{
					if((gasMoneyArray select 11) > 100)then
						{
						_moneyearned = (ceil(_distance * 10));
						}
						else
						{
						_moneyearned = (ceil(_distance *7));
						};
					};
				};
			if ((gasMoneyArray select 11) > 15) then
				{
				_amountToLower = (round((gasMoneyArray select 11)/10));
				if(_amountToLower < 10)then{_amountToLower = 10};
				_newPrice = ((gasMoneyArray select 11) - _amountToLower);
				gasMoneyArray set[11,_newPrice];
				publicvariable "gasMoneyArray";
				[[1,format["%1 has had the fuel price lowered by $%2!", name player,[_amountToLower] call DS_fnc_numberText],true],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			
			_totalmoneyearned = _totalmoneyearned + _moneyearned;
			_counter = _counter + 1;
	
			deleteMarkerLocal "fueldeliverymarker";
			systemchat format["For this job you will earn $%1 which you will receive after completing three deliveries", [_moneyearned] call DS_fnc_numberText];
			hint format["For this job you will earn $%1 which you will receive after completing three deliveries", [_moneyearned] call DS_fnc_numberText];
			}
			else
			{
			deleteMarkerLocal "fueldeliverymarker";
			systemchat "Where is the fuel? Go away and buy an actual fuel truck.... Derp Derp";
			hint 'Where is the fuel? Go away and buy an actual fuel truck.... Derp Derp';
			};
			sleep 5;
			if(_counter < 3)then
				{
			
				systemchat "please wait a moment for your next delivery point";
				hint 'please wait a moment for your next delivery point';

				while{((_lastLoc distance _markerlocation < 4000)||(_lastLoc distance _markerlocation > 10000))} do
					{
					_newmarker = (floor(random(count _fuelDeliveryArray)));
					_markerlocation = (_fuelDeliveryArray select _newmarker);
					};
					
				_lastLoc = _markerlocation;
				_currentpoint = _markerlocation;
				_markerobj = createmarkerlocal ["fueldeliverymarker",[0,0]];
				_markername = "fueldeliverymarker";
				_markerobj setmarkershapelocal "Icon";
				"fueldeliverymarker" setmarkertypelocal "hd_warning";
				"fueldeliverymarker" setmarkercolorlocal "colorblack";
				"fueldeliverymarker" setmarkersizelocal [1, 1];
				"fueldeliverymarker" setmarkertextlocal "Fuel delivery";
				_markername Setmarkerposlocal _markerlocation;

				systemchat "New Delivery point added";
				hint 'New Delivery point added';

				_plocation = getpos player;
				_distance = _plocation distance _markerlocation;
				
				};
		};

		if(_counter > 2)exitwith
			{
			systemchat "You must now return to a Jobs depot for payment and to restock your truck";
			hint 'You must now return to a Jobs depot for payment and to restock your truck';

			_currentpoint = ObjNull;

			while {true} do
				{	
					{
					if(player distance (getMarkerPos _x) < 20)then
						{
						_done = true;
						};
					}forEach _jobDepots;
				if(_done)exitwith
					{
					[_totalmoneyearned,true,true] spawn DS_fnc_handleMoney;
					_counter = 0;
					DS_fuelMission = false;
					systemchat format["For these deliveries you have earned a total of $%1", [_totalmoneyearned] call DS_fnc_numberText];
					hint format["For these deliveries you have earned a total of $%1", [_totalmoneyearned] call DS_fnc_numberText];
					[100,true] spawn DS_fnc_moralAlter;
					};
					/*
					if((player_questLog select 0) == 14)then
						{
						["I_Truck_02_transport_F","Car",0] spawn life_fnc_questCompleted;
						};
					if((player_questLog select 0) == 24)then
						{
						_tempNum = (player_questLog select 1) + 1;
						player_questLog set [1,_tempNum];
						if((player_questLog select 1) > 2) then
							{
							["O_Heli_Transport_04_fuel_F","Air",0] spawn life_fnc_questCompleted;
							};
						};
					*/
				if(_done)exitwith{DS_fuelMission = false;};
				sleep 10;
				};
			};
		if(_done)exitwith{};
		sleep 10;
		if((getPos (vehicle player) select 2) > 20)exitwith{hint "Mission failed"};
	};

if((DS_infoArray select 13) == 9)then
	{
	[0] call DS_fnc_questCompleted;
	};
if((DS_infoArray select 13) == 24)then
	{
	_tempNum = DS_infoArray select 14;
	_tempNum = _tempNum + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 1)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 13) == 30)then
	{
	_tempNum = DS_infoArray select 14;
	_tempNum = _tempNum + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 4)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};
if((DS_infoArray select 13) == 46)then
	{
	_tempNum = DS_infoArray select 14;
	_tempNum = _tempNum + 1;
	DS_infoArray set [14,_tempNum];
	if((DS_infoArray select 14) > 4)then
		{
		[0] call DS_fnc_questCompleted;
		};
	};

