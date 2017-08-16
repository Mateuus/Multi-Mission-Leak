#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks what shop the player is trying to access and displays the data needed
*/
private["_index","_dialog","_className","_btn1","_btn2","_btn3","_display","_list","_price","_sellPrice","_longClassName","_noLicense","_combo","_textureArray"];

disableSerialization;

_display = _this select 0;
_index = _this select 1;
_className = "";
_noLicense = "";
_textureArray = [];

_dialog = findDisplay 666667;
_btn1 = _dialog displayCtrl 777;
_btn2 = _dialog displayCtrl 778;
_list = _dialog displayCtrl 1501;
_btn3 = _dialog displayCtrl 66654;
_combo = _dialog displayCtrl 66653;

hint "";//Dont keep old pop ups around

_className = _list lbData _index;
//DS_price = 0;
//Vehicle Shops
if(DS_shopIndex in [0,1,2,3,30,31,32,33,34,35,61,62,36,83,95,96,120,123,127])then
	{
	_noLicense = [DS_shopIndex] call DS_fnc_checkLicense;
	_price = [_className,DS_shopIndex,3] call DS_fnc_getPrice;
	if(DS_coin < _price)then{_btn1 ctrlEnable false}else{_btn1 ctrlEnable true};
	if(DS_coin < (_price*1.5))then{_btn2 ctrlEnable false}else{_btn2 ctrlEnable true};

	_upgBtn1 = _dialog displayCtrl 1212;
	_upgBtn2 = _dialog displayCtrl 1213;
	_upgBtn3 = _dialog displayCtrl 1214;
	_upgBtn4 = _dialog displayCtrl 1215;
	_upgBtn5 = _dialog displayCtrl 1216;
	_upgBtn6 = _dialog displayCtrl 1217;
	_upgBtn7 = _dialog displayCtrl 1218;
	_upgBtn8 = _dialog displayCtrl 1219;
	
	
	if(_noLicense != "")then
		{
		ctrlShow[66654,true];
		ctrlEnable [66654,false];
		_btn3 ctrlSetText "No License";
		hint format ["%1",_noLicense];
		}
		else
		{
		ctrlShow[66654,false];
		ctrlShow[777,true];
		ctrlShow[778,true];
		ctrlShow[1212,true];
		ctrlShow[1213,true];
		ctrlShow[1214,true];
		ctrlShow[1215,true];
		ctrlShow[1216,true];
		ctrlShow[1217,true];
		ctrlShow[1218,false];
		ctrlShow[1219,false];
		if(playerside == west)then
			{
			ctrlShow[1218,true];
			if(_className in ["B_MRAP_01_hmg_F","I_APC_Wheeled_03_cannon_F","O_G_Offroad_01_armed_F","I_MRAP_03_hmg_F"])then
				{
				ctrlShow[1219,true];
				};
			};
		
		lbClear _combo;
		_textureArray = [_className,false,playerSide] call DS_fnc_vehicleTextures;
		//No point displaying this if there is no textures to show
		if(count(_textureArray) > 0)then
			{
			ctrlShow[66653,true];
			lbClear _combo;
			};
		{
			_combo lbAdd format["%1",_x];
			//_combo lbSetValue [(lbSize _ctrl)-1,_forEachIndex];
		}forEach _textureArray;
		
		DS_className = _className;
		DS_price = _price;
		_btn1 ctrlSetText format ["Rent $%1",[_price] call DS_fnc_numberText];
		_btn1 buttonSetAction "[false] spawn DS_fnc_buyVehicle;";
		_btn2 ctrlSetText format ["Purchase $%1",[_price*1.5] call DS_fnc_numberText];
		_btn2 buttonSetAction "[true] spawn DS_fnc_buyVehicle;";
		_upgBtn1 ctrlSetTooltip "Add/Remove Vehicle Capacity Upgrade";
		_upgBtn1 buttonSetAction "[0] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn2 ctrlSetTooltip "Add/Remove Vehicle Fuel Upgrade";
		_upgBtn2 buttonSetAction "[1] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn3 ctrlSetTooltip "Add/Remove Vehicle Security Upgrade";
		_upgBtn3 buttonSetAction "[2] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn4 ctrlSetTooltip "Add/Remove Vehicle Airbags";
		_upgBtn4 buttonSetAction "[3] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn5 ctrlSetTooltip "Add/Remove Vehicle Animal Sensor System";
		_upgBtn5 buttonSetAction "[4] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn6 ctrlSetTooltip "Add/Remove Vehicle Insurance";
		_upgBtn6 buttonSetAction "[5] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn7 ctrlSetTooltip "Add/Remove Vehicle Thermal Vision";
		_upgBtn7 buttonSetAction "[6] spawn DS_fnc_shopVehUpgrades;";
		_upgBtn8 ctrlSetTooltip "Add/Remove Vehicle Ammo Upgrade";
		_upgBtn8 buttonSetAction "[7] spawn DS_fnc_shopVehUpgrades;";
		};
	
	DS_className = _className;
	DS_price = _price;

	_btn1 ctrlSetText format ["Rent $%1",[_price] call DS_fnc_numberText];
	_btn1 buttonSetAction "[false] spawn DS_fnc_buyVehicle;";
	_btn2 ctrlSetText format ["Purchase $%1",[_price*1.5] call DS_fnc_numberText];
	_btn2 buttonSetAction "[true] spawn DS_fnc_buyVehicle;";
	};
//Virt Shops
if(DS_shopIndex in [4,22,67,72,104,119])then
	{
	_index = [_className] call DS_fnc_itemIndex;
	//_noLicense = [DS_shopIndex] call DS_fnc_checkLicense;
	//if(_noLicense != "")exitwith{hint _noLicense};
	ctrlShow[66654,true];
	ctrlShow[777,true];
	ctrlShow[778,true];
	DS_price = 0;
	_price = DS_buyArray select _index;
	_sellPrice = DS_sellArray select _index;
	_longClassName = format ["DS_item_%1",_className];
	_value = missionNamespace getVariable _longClassName;
	if(DS_coin < (_price))then{_btn2 ctrlEnable false}else{_btn2 ctrlEnable true};
	if(DS_coin < (_price*5))then{_btn3 ctrlEnable false}else{_btn3 ctrlEnable true};
	if((_sellPrice*_value) < 1)then{_btn1 ctrlEnable false}else{_btn1 ctrlEnable true};

	DS_className = _className;
	DS_price = _price;
	
	_btn1 ctrlSetText format ["Sell All $%1",[_sellPrice*_value] call DS_fnc_numberText];
	_btn1 buttonSetAction "[] spawn DS_fnc_sellVirtItem;";
		
	_btn2 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
	_btn2 buttonSetAction "[false] spawn DS_fnc_buyVirtItem;";
	
	_btn3 ctrlSetText format ["Purchase 5 ($%1)",[_price*5] call DS_fnc_numberText];
	_btn3 buttonSetAction "[true] spawn DS_fnc_buyVirtItem;";
	};
//Virt Raw Selling only
if(DS_shopIndex in [46,47,53,81,108,109])then
	{
	ctrlShow[66654,true];
	_index = [_className] call DS_fnc_itemIndex;
	_price = DS_buyArray select _index;
	_sellPrice = DS_sellArray select _index;
	_longClassName = format ["DS_item_%1",_className];
	_value = missionNamespace getVariable _longClassName;
	if(_value > 0)then{_btn3 ctrlEnable true}else{_btn3 ctrlEnable false};
	
	DS_className = _className;
	DS_price = _price;
	
	_btn3 ctrlSetText format ["Sell All $%1",[_sellPrice*_value] call DS_fnc_numberText];
	_btn3 buttonSetAction "[] spawn DS_fnc_sellVirtItem;";
	};
//Weapons Shops
if(DS_shopIndex in [5,6,7,14,15,16,17,18,19,20,21,57,59,60,63,121,122])then
	{
	_price = [_className,DS_shopIndex,0] call DS_fnc_getPrice;
	_noLicense = [DS_shopIndex] call DS_fnc_checkLicense;
	ctrlShow[66654,true];
	if(_noLicense != "")then
		{
		ctrlEnable [66654,false];
		_btn3 ctrlSetText "Unavailable";
		hint format ["%1",_noLicense];
		}
		else
		{
		if(_price <= DS_coin)then
			{
			ctrlEnable [66654,true];
			_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
			DS_className = _className;
			DS_price = _price;
			}
			else
			{
			_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
			ctrlEnable [66654,false];
			};
			_btn3 buttonSetAction "[] call DS_fnc_buyWeapon;";
		};
	};
//License Shops
if(DS_shopIndex in [8,39,52,58,93])then
	{
	_price = [_className,DS_shopIndex,1] call DS_fnc_getPrice;
	ctrlShow[66654,true];
	if(DS_coin >= _price)then
		{
		ctrlEnable [66654,true];
		_btn3 ctrlSetText format ["Purchase $%1",[_price] call DS_fnc_numberText];
		_btn3 buttonSetAction "[] spawn DS_fnc_buyLicense;";
		DS_className = _className;
		DS_price = _price;
		}
		else
		{
		ctrlEnable [66654,false];
		_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
		};
	};
//Clothing Shops
if(DS_shopIndex in [9,10,11,12,13,73,74,75,76,77,124])then
	{
	_price = [_className,DS_shopIndex,2] call DS_fnc_getPrice;
	_noLicense = [DS_shopIndex] call DS_fnc_checkLicense;
	if(_noLicense != "")exitwith{hint _noLicense};
	ctrlShow[66654,true];
	if(DS_coin >= _price)then
		{
		ctrlEnable [66654,true];
		_btn3 ctrlSetText format ["Purchase $%1",[_price] call DS_fnc_numberText];
		_btn3 buttonSetAction "[] spawn DS_fnc_buyWeapon;";
		DS_className = _className;
		DS_price = _price;
		}
		else
		{
		ctrlEnable [66654,false];
		_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
		};
	};
//Cop Clothing Shops
if(DS_shopIndex in [24,25,26,27,28,29])then
	{
	_price = [_className,DS_shopIndex,2] call DS_fnc_getPrice;
	_noLicense = [DS_shopIndex] call DS_fnc_checkLicense;
	ctrlShow[66654,true];
	if(_noLicense != "")then
		{
		ctrlEnable [66654,false];
		_btn3 ctrlSetText "Unavailable";
		hint format ["%1",_noLicense];
		}
		else
		{
		if(DS_coin >= _price)then
			{
			ctrlEnable [66654,true];
			_btn3 ctrlSetText format ["Purchase $%1",[_price] call DS_fnc_numberText];
			_btn3 buttonSetAction "[] spawn DS_fnc_buyWeapon;";
			DS_className = _className;
			DS_price = _price;
			}
			else
			{
			ctrlEnable [66654,false];
			_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
			};
		};
	};
//Cap gang hideout
if(DS_shopIndex in [48])then
	{
	ctrlShow [66654,true];
	ctrlEnable [66654,true];
	_btn3 ctrlSetText "Capture Hideout";
	_btn3 buttonSetAction "[] spawn DS_civ_captureHideout;";
	};

//Virt Shops Gang areas
if(DS_shopIndex in [54])then
	{
	if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to use this shop"};
	ctrlShow[66654,true];
	ctrlShow[777,true];
	ctrlShow[778,true];
	_index = [_className] call DS_fnc_itemIndex;
	_price = DS_buyArray select _index;
	_sellPrice = DS_sellArray select _index;
	_longClassName = format ["DS_item_%1",_className];
	_value = missionNamespace getVariable _longClassName;
	if(DS_coin < (_price))then{_btn2 ctrlEnable false}else{_btn2 ctrlEnable true};
	if(DS_coin < (_price*5))then{_btn3 ctrlEnable false}else{_btn3 ctrlEnable true};
	if((_sellPrice*_value) < 1)then{_btn1 ctrlEnable false}else{_btn1 ctrlEnable true};

	DS_className = _className;
	DS_price = _price;
	
	_btn1 ctrlSetText format ["Sell All $%1",[_sellPrice*_value] call DS_fnc_numberText];
	_btn1 buttonSetAction "[] spawn DS_fnc_sellVirtItem;";
		
	_btn2 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
	_btn2 buttonSetAction "[false] spawn DS_fnc_buyVirtItem;";
	
	_btn3 ctrlSetText format ["Purchase 5 ($%1)",[_price*5] call DS_fnc_numberText];
	_btn3 buttonSetAction "[true] spawn DS_fnc_buyVirtItem;";
	};

//Garages
if(DS_shopIndex in [55,84,86])then
	{
	_vehicle = lbData[1501,(lbCurSel 1501)];
	_vehicle = (call compile format["%1",_vehicle]) select 0;
	_vehID = lbValue[1501,(lbCurSel 1501)];
	_pid = getPlayerUID player;
	_unit = player;
	_tempSpawn = (DS_spawnPoint select 0);
	if(isNil "_vehicle") exitWith {hint "No vehicle selected"};
	if(count(nearestObjects[(getMarkerPos _tempSpawn),["Car","Ship","Air","Tank"],5]) > 0)exitwith{hint "There is a vehicle blocking this spawn point"};
	ctrlShow[66654,true];
	ctrlShow[778,true];
	//_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory FROM vehicles WHERE id='%1' AND pid='%2'",_vehID,_pid];
	//[[player,_query,0,_vehID],"HUNT_fnc_returnVehicleList",false,false] spawn BIS_fnc_MP; 
	
	DS_className = _vehID;
		
	_btn2 ctrlSetText "Sell vehicle";
	_btn2 buttonSetAction "[true] spawn DS_fnc_sellVehicle;";
	
	_btn3 ctrlSetText "Retrieve Vehicle";
	_btn3 buttonSetAction "[true] spawn DS_fnc_retrieveVehicle;";
	};
//Gang Weapons Shops
if(DS_shopIndex in [64])then
	{
	_price = [_className,DS_shopIndex,0] call DS_fnc_getPrice;
	if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to use this shop"};
	ctrlShow[66654,true];
	if(_price <= DS_coin)then
		{
		ctrlEnable [66654,true];
		_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
		DS_className = _className;
		DS_price = _price;
		}
		else
		{
		_btn3 ctrlSetText format ["Purchase ($%1)",[_price] call DS_fnc_numberText];
		ctrlEnable [66654,false];
		};
	_btn3 buttonSetAction "[] spawn DS_fnc_buyWeapon;";
	};
//Vehicle Shops
if(DS_shopIndex in [65])then
	{
	if(!([] call DS_civ_myHideout))exitwith{hint "You must own this gang hideout to use this shop"};
	_price = [_className,DS_shopIndex,3] call DS_fnc_getPrice;
	if(DS_coin < _price)then{_btn1 ctrlEnable false}else{_btn1 ctrlEnable true};
	if(DS_coin < (_price*1.5))then{_btn2 ctrlEnable false}else{_btn2 ctrlEnable true};

	ctrlShow[66654,false];
	ctrlShow[777,true];
	ctrlShow[778,true];
		
	lbClear _combo;
	_textureArray = [_className,false,playerSide] call DS_fnc_vehicleTextures;
	//No point displaying this if there is no textures to show
	if(count(_textureArray) > 0)then
		{
		ctrlShow[66653,true];
		lbClear _combo;
		};
	{
		_combo lbAdd format["%1",_x];
	}forEach _textureArray;
		
	DS_className = _className;
	DS_price = _price;
	_btn1 ctrlSetText format ["Rent $%1",[_price] call DS_fnc_numberText];
	_btn1 buttonSetAction "[false] spawn DS_fnc_buyVehicle;";
	_btn2 ctrlSetText format ["Purchase $%1",[_price*1.5] call DS_fnc_numberText];
	_btn2 buttonSetAction "[true] spawn DS_fnc_buyVehicle;";
	};
//Police transport
if(DS_shopIndex in [82])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Transport";
	_btn3 buttonSetAction "[] spawn DS_cop_policeTransport;";
	};
//Medic transport
if(DS_shopIndex in [140])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Transport";
	_btn3 buttonSetAction "[] spawn DS_med_medicTransport;";
	};
//Buy RealEstate
if(DS_shopIndex in [85])then
	{
	_array = [] call DS_fnc_realestateConfig;
	_className = (parseNumber(_className));
	_className = _array select _className;
	DS_className = _className;
	ctrlShow[66654,true];
	ctrlShow[778,true];
	_btn2 ctrlSetText "Sell All";
	_btn2 buttonSetAction "[] spawn DS_fnc_sellRealEstate;";
	_btn3 ctrlSetText "Purchase";
	_btn3 buttonSetAction "[] spawn DS_fnc_buyRealEstate;";
	};
//Civ Jobs
if(DS_shopIndex in [88])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Start Job";
	_btn3 buttonSetAction "[] spawn DS_civ_startJob;";
	};
//Vehicle Upgrades
if(DS_shopIndex in [91])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Purchase Upgrade";
	_btn3 buttonSetAction "[DS_className] spawn DS_fnc_vehUpgrades;";
	};
//Chop Shops
if(DS_shopIndex in [100])then
	{
	_nearVehicles = nearestObjects [getPos player,["Car","Truck","Air"],25];
	_nearVehicles = _nearVehicles select 0;
	if(typeOf _nearVehicles == _className)then
		{
		_owners = _nearVehicles getVariable ["vehicle_owners",[["bum"]]];
		if((name player) != ((_owners select 0) select 0))then
			{
			DS_shopIndex = 666;
			_price = [_className,DS_shopIndex,3] call DS_fnc_getPrice;
			_price = (round(_price/2));
			switch(DS_perkLevel)do
				{
				case 1:{_price = (round(_price*1.2))};
				case 2:{_price = (round(_price*1.4))};
				case 3:{_price = (round(_price*1.6))};
				case 4:{_price = (round(_price*1.8))};
				case 5:{_price = (round(_price*2))};
				default {_price = _price};
				};
			if(_price == 0)exitwith{hint "Some Error Occurred";closeDialog 0};
			ctrlShow[66654,true];
			_btn3 ctrlSetText format ["Chop Vehicle ($%1)",[_price] call DS_fnc_numberText];
			_btn2 ctrlShow false;
			_btn1 ctrlShow false;
			hint format ["This vehicle can be chopped for $%1, if it has any upgrades you will also be paid for these upon chopping",[_price] call DS_fnc_numberText];
			DS_className = _className;
			DS_price = _price;
			_btn3 buttonSetAction "[] spawn DS_fnc_chopVehicle;";
			};
		};
	};
//Bus Stop
if(DS_shopIndex in [101])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Catch Bus";
	_btn3 buttonSetAction "[] spawn DS_fnc_catchBus;";
	};
//Rebel Missions
if(DS_shopIndex in [102])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Begin Missions";
	_btn3 buttonSetAction "[] spawn DS_civ_rebelMissions;";
	};
//Vehicle Shops (Rent only)
if(DS_shopIndex in [103])then
	{
	_price = [_className,DS_shopIndex,3] call DS_fnc_getPrice;
	if(DS_coin < _price)then{_btn1 ctrlEnable false}else{_btn1 ctrlEnable true};
	ctrlShow[66654,false];
	ctrlShow[777,true];
	ctrlShow[778,false];
	lbClear _combo;
	_textureArray = [_className,false,playerSide] call DS_fnc_vehicleTextures;
	//No point displaying this if there is no textures to show
	if(count(_textureArray) > 0)then
		{
		ctrlShow[66653,true];
		lbClear _combo;
		};
	{
		_combo lbAdd format["%1",_x];
	}forEach _textureArray;
		
	DS_className = _className;
	DS_price = _price;
	_btn1 ctrlSetText format ["Rent $%1",[_price] call DS_fnc_numberText];
	_btn1 buttonSetAction "[false] spawn DS_fnc_buyVehicle;";
	DS_className = _className;
	DS_price = _price;

	_btn1 ctrlSetText format ["Rent $%1",[_price] call DS_fnc_numberText];
	_btn1 buttonSetAction "[false] spawn DS_fnc_buyVehicle;";
	_btn2 ctrlSetText format ["Purchase $%1",[_price*1.5] call DS_fnc_numberText];
	_btn2 buttonSetAction "[true] spawn DS_fnc_buyVehicle;";
	};
//crafting
if(DS_shopIndex in [106,107,111])then
	{
	ctrlShow[66654,true];
	ctrlShow[777,false];
	ctrlShow[778,true];
	DS_className = _className;
	
	_btn3 ctrlEnable true;
	_btn3 ctrlSetText "Craft Item";
	_btn3 buttonSetAction "[DS_className] spawn DS_civ_crafting;";
	
	_btn2 ctrlEnable true;	
	_btn2 ctrlSetText "Item Recipe";
	_btn2 buttonSetAction "[DS_className] spawn DS_civ_bluePrintInfo;";
	
	};
//Vehicle repaint
if(DS_shopIndex in [113])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Apply Paint Job";
	_btn3 buttonSetAction "[DS_className] spawn DS_fnc_vehRepaint;";
	};
	
//Building Stuffs
if(DS_shopIndex in [115])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Purchase";
	_btn3 buttonSetAction "[DS_className] spawn DS_fnc_buyBuilding;";
	};
	
//Insurance broker
if(DS_shopIndex in [118])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Purchase";
	_btn3 buttonSetAction "[DS_className] spawn DS_fnc_buyInsurance;";
	};
//Clothing Retexture
if(DS_shopIndex in [128])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Re texture";
	_btn3 buttonSetAction "[] spawn DS_fnc_retextureClothing;";
	};
//Vehicle Retexture
if(DS_shopIndex in [129])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Re texture";
	_btn3 buttonSetAction "[] spawn DS_fnc_retextureVehicle;";
	};
//Rebel Tokens
if(DS_shopIndex in [130])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Purchase";
	_btn3 buttonSetAction "[] spawn DS_fnc_useRebelTokens;";
	};
//Rebel Tokens
if(DS_shopIndex in [134])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Purchase";
	_btn3 buttonSetAction "[] spawn DS_fnc_upgradeBase;";
	};
//Plane mission
//Civ Jobs
if(DS_shopIndex in [135])then
	{
	DS_className = _className;
	ctrlShow[66654,true];
	_btn3 ctrlSetText "Start Job";
	_btn3 buttonSetAction "[] spawn DS_civ_startPlaneMission;";
	};
