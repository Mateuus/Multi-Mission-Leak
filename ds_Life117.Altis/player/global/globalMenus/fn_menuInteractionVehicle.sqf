/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens the vehicle interaction menu
*/

//private[""];

if(!dialog) then
{
	if(!(createDialog "interactionMenu")) exitWith {};
};

_vehicle = _this select 0;
if(!((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_fuel_F") || 
(typeOf _vehicle == "Land_Pod_Heli_Transport_04_box_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_covered_F") || 
(typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") || (typeOf _vehicle == "Land_Pod_Heli_Transport_04_repair_F") || 
(typeOf _vehicle == "B_Slingload_01_Cargo_F") || (typeOf _vehicle == "B_Slingload_01_Medevac_F") || (typeOf _vehicle == "B_Slingload_01_Repair_F") || 
(typeOf _vehicle == "B_Slingload_01_Fuel_F") || 
(typeOf _vehicle == "Land_Wreck_Ural_F") || 
(typeOf _vehicle == "Land_Wreck_HMMWV_F") || 
(typeOf _vehicle == "Land_Wreck_BRDM2_F") || 
(typeOf _vehicle == "Land_UWreck_MV22_F") || 
(typeOf _vehicle == "Plane_Fighter_03_wreck_F")))exitwith{};//Not a valid vehicle type
if((player getVariable["cuffed",FALSE])||(player getVariable["Escorted",FALSE])||(player getVariable["cuffedVeh",FALSE]))exitwith{};//Get outta here
DS_cursorTarget = _vehicle;
disableSerialization;
_highwayPatrol = false;
if((player getVariable ["policeSquad",""]) == "Highway Patrol")then{_highwayPatrol = true};
_dialog = findDisplay 666675;
_img1 = _dialog displayCtrl 1200;
_img2 = _dialog displayCtrl 1201;
_img3 = _dialog displayCtrl 1202;
_img4 = _dialog displayCtrl 1203;
_img5 = _dialog displayCtrl 1204;
_img6 = _dialog displayCtrl 1205;
_img7 = _dialog displayCtrl 1206;
_img8 = _dialog displayCtrl 1207;
_img9 = _dialog displayCtrl 1208;
_img10 = _dialog displayCtrl 1209;
_btn1 = _dialog displayCtrl 2401;
_btn2 = _dialog displayCtrl 2402;
_btn3 = _dialog displayCtrl 2403;
_btn4 = _dialog displayCtrl 2404;
_btn5 = _dialog displayCtrl 2405;
_btn6 = _dialog displayCtrl 2406;
_btn7 = _dialog displayCtrl 2407;
_btn8 = _dialog displayCtrl 2408;
_btn9 = _dialog displayCtrl 2409;
_btn10 = _dialog displayCtrl 2410;
_header = _dialog displayCtrl 1210;
//Hide them all by default
_btn1 ctrlShow false;_btn2 ctrlShow false;
_btn3 ctrlShow false;_btn4 ctrlShow false;
_btn5 ctrlShow false;_btn6 ctrlShow false;
_btn7 ctrlShow false;_btn8 ctrlShow false;
_btn9 ctrlShow false;_btn10 ctrlShow false;
//First look after universal buttons
_header ctrlSetText "extras\textures\menus\vehInteraction.jpg";
if((DS_item_repairKit > 0)||(_highwayPatrol))then
	{
	_btn1 buttonSetAction "[] spawn DS_fnc_vehRepair;";
	};

if((player getVariable ["medic",false])||((_vehicle in DS_keyRing)&&(playerside != west))&&(count crew (DS_cursorTarget) == 0)&&(!surfaceisWater (getPos DS_cursorTarget)))then
	{
	_btn2 buttonSetAction "DS_cursorTarget setPos [getPos DS_cursorTarget select 0, getPos DS_cursorTarget select 1, (getPos DS_cursorTarget select 2)+0.5];closeDialog 0;";
	};
	
if((playerside == west)&&(!surfaceisWater (getPos DS_cursorTarget)))then
	{
	_btn2 buttonSetAction "DS_cursorTarget setPos [getPos DS_cursorTarget select 0, getPos DS_cursorTarget select 1, (getPos DS_cursorTarget select 2)+0.5];closeDialog 0;";
	};

	if(DS_item_refuelKit > 0)then
	{
	_btn3 buttonSetAction "[] spawn DS_fnc_vehRefuel;";
	};
_btn1 ctrlShow true;
_btn2 ctrlShow true;	
_btn3 ctrlShow true;
_btn4 ctrlShow true;
_img1 ctrlSetText "extras\icons\vehRepair.jpg";
_img2 ctrlSetText "extras\icons\vehUnflip.jpg";
_img3 ctrlSetText "extras\icons\vehRefuel.jpg";
_btn1 ctrlSetTooltip "Repair this vehicle if you have a repair kit";
_btn2 ctrlSetTooltip "Un-flip this vehicle if you have the keys and the vehicle is empty";
_btn3 ctrlSetTooltip "Refuel this vehicle if you have a jerry can";
//Now the side specific functions
switch(playerside)do
	{
	case civilian:
		{
		if(((count crew DS_cursorTarget) != 0)&&((primaryWeapon player != "")||(handgunWeapon player != "")))then
			{
			_btn4 buttonSetAction "[] spawn DS_fnc_vehPullout;";
			};
		if(DS_item_lockpick > 0)then
			{
			_btn5 ctrlShow true;
			_btn5 buttonSetAction "[] spawn DS_fnc_vehLockpick;";
			};
		if(DS_item_lighter > 0)then
			{
			_btn6 ctrlShow true;
			_btn6 buttonSetAction "[] spawn DS_fnc_vehBurn;";
			};
		if(DS_item_siphonKit > 0)then
			{
			_btn7 ctrlShow true;
			_btn7 buttonSetAction "[] spawn DS_fnc_siphonKit";
			};
		if((DS_item_nitro > 0)||(DS_item_vehNos > 0)||(DS_item_vehNosAdv > 0))then
			{
			_btn8 ctrlShow true;
			_btn8 buttonSetAction "[] spawn DS_fnc_installNos";
			};
		if(_vehicle in DS_keyRing)then
			{
			_btn9 ctrlShow true;
			_btn9 buttonSetAction "[DS_cursorTarget] spawn DS_fnc_menuBoot";
			};
		if((DS_cursorTarget in DS_keyRing)&&(typeOf _vehicle in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]))then
			{
			_btn10 ctrlShow true;
			_btn10 ctrlSetTooltip "Enter Go Kart";
			_btn10 buttonSetAction "player MoveInDriver DS_cursorTarget;closeDialog 0;";
			_img10 ctrlSetText "extras\icons\goKart.jpg";
			};
		if((_vehicle isKindOf "Ship")&&(_vehicle in DS_keyRing))then
			{
			_btn10 ctrlShow true;
			_btn10 ctrlSetTooltip "Push Boat";
			_btn10 buttonSetAction "[] spawn DS_fnc_pushBoat;";
			_img10 ctrlSetText "extras\icons\pushBoat.jpg";
			};
		if((typeOf _vehicle == "O_Truck_03_device_F")&&(_vehicle in DS_keyRing))then
			{
			_btn10 ctrlShow true;
			_btn10 ctrlSetTooltip "Start Auto Miner";
			_btn10 buttonSetAction "[] spawn DS_fnc_autoMiner;";
			_img10 ctrlSetText "extras\icons\miner.jpg";
			};
		_img4 ctrlSetText "extras\icons\vehPullout.jpg";
		_img5 ctrlSetText "extras\icons\lockpick.jpg";
		_img6 ctrlSetText "extras\icons\lighter.jpg";
		_img7 ctrlSetText "extras\icons\vehSiphon.jpg";
		_img8 ctrlSetText "extras\icons\nitro.jpg";
		_img9 ctrlSetText "extras\icons\vehBoot.jpg";
		_btn1 ctrlSetTooltip "Repair this vehicle if you have a repair kit";
		_btn2 ctrlSetTooltip "Un-flip this vehicle if you have the keys and the vehicle is empty";
		_btn3 ctrlSetTooltip "Refuel this vehicle if you have a jerry can";
		_btn4 ctrlSetTooltip "Pull players out this vehicle if you are armed";
		_btn5 ctrlSetTooltip "Lock pick this vehicle if you have lockpicks";	
		_btn6 ctrlSetTooltip "Light this vehicles fuel tank if you have lighters";
		_btn7 ctrlSetTooltip "Siphon fuel from this vehicle if you have a siphon kit";
		_btn8 ctrlSetTooltip "Install Nos on this vehicle if you have a nos kit";
		_btn9 ctrlSetTooltip "Open this vehicles boot menu if you have the vehicles keys";
		};
	case west:
		{
		if(typeOf DS_cursorTarget == "O_Truck_03_covered_F")then
			{
			_btn1 ctrlSetTooltip "Repair this vehicle if you have a repair kit";
			_btn2 ctrlSetTooltip "Un-flip this vehicle if you have the keys and the vehicle is empty";
			_btn3 ctrlSetTooltip "Refuel this vehicle if you have a jerry can";
			_btn4 ctrlSetTooltip "Pull players out of this vehicle";
			_img4 ctrlSetText "extras\icons\vehPullout.jpg";
			if((count crew DS_cursorTarget) != 0)then
				{
				_btn4 buttonSetAction "[] spawn DS_fnc_vehPullout;";
				};
			_img5 ctrlSetText "extras\icons\mcu.jpg";
			_btn5 ctrlShow true;
			_btn5 buttonSetAction "[0,DS_cursorTarget] spawn DS_cop_MCU;";
			_btn5 ctrlSetTooltip "Pack or Setup the MCU";
			_btn6 ctrlSetTooltip "Police Shops";
			_img6 ctrlSetText "extras\icons\gunAdv.jpg";
			_btn7 ctrlSetTooltip "Enter Nearest Weapon";
			_img7 ctrlSetText "extras\icons\mcuGun.jpg";
			_btn8 ctrlSetTooltip "Get out a sand bag";
			_img8 ctrlSetText "extras\icons\sandBag.jpg";
			_btn9 ctrlSetTooltip "Repair/repfuel/rearm all nearby vehicles";
			_img9 ctrlSetText "extras\icons\repairKit.jpg";
			_btn10 ctrlSetTooltip "Weapons Locker";
			_img10 ctrlSetText "extras\icons\vehLocker.jpg";
			if(!(DS_cursorTarget getVariable ["packed",false]))then
				{
				_btn6 ctrlShow true;
				_btn6 buttonSetAction "[1,DS_cursorTarget] spawn DS_cop_MCU;";
				_btn7 ctrlShow true;
				_btn7 buttonSetAction "[2,DS_cursorTarget] spawn DS_cop_MCU;";
				_btn8 ctrlShow true;
				_btn8 buttonSetAction "[3,DS_cursorTarget] spawn DS_cop_MCU;";
				_btn9 ctrlShow true;
				_btn9 buttonSetAction "[4,DS_cursorTarget] spawn DS_cop_MCU;";
				};
			_btn10 ctrlShow true;
			_btn10 buttonSetAction "[] spawn DS_cop_vehLocker;";
			}
			else
			{
			if(((count crew DS_cursorTarget) != 0)&&((primaryWeapon player != "")||(handgunWeapon player != "")))then
				{
				_btn4 buttonSetAction "[] spawn DS_fnc_vehPullout;";
				};
			_btn5 ctrlShow true;
			_btn5 buttonSetAction "[] spawn DS_cop_vehRego;";
			
			_btn6 ctrlShow true;
			_btn6 buttonSetAction "[] spawn DS_cop_vehSearch;";
			
			_btn7 ctrlShow true;
			_btn7 buttonSetAction "[] spawn DS_cop_vehImpound";
			
			_btn8 ctrlShow true;
			_btn8 buttonSetAction "[] spawn DS_cop_vehDestroy";
			
			_btn9 ctrlShow true;
			_btn9 buttonSetAction "[DS_cursorTarget] spawn DS_fnc_menuBoot";
			
			if(_vehicle getVariable ["policeVehicle",false])then
				{
				_btn10 ctrlShow true;
				_btn10 buttonSetAction "[] spawn DS_cop_vehLocker";
				};
			
			_img4 ctrlSetText "extras\icons\vehPullout.jpg";
			_img5 ctrlSetText "extras\icons\rego.jpg";
			_img6 ctrlSetText "extras\icons\vehSearch.jpg";
			_img7 ctrlSetText "extras\icons\vehImpound.jpg";
			_img8 ctrlSetText "extras\icons\vehDestroy.jpg";
			_img9 ctrlSetText "extras\icons\vehBoot.jpg";
			_img10 ctrlSetText "extras\icons\vehLocker.jpg";
			_btn1 ctrlSetTooltip "Repair this vehicle if you have a repair kit";
			_btn2 ctrlSetTooltip "Un-flip this vehicle if you have the keys and the vehicle is empty";
			_btn3 ctrlSetTooltip "Refuel this vehicle if you have a jerry can";
			_btn4 ctrlSetTooltip "Pull players out of this vehicle";
			_btn5 ctrlSetTooltip "Check this vehicles registration information";	
			_btn6 ctrlSetTooltip "Search this vehicle";
			_btn7 ctrlSetTooltip "Impound this vehicle";
			_btn8 ctrlSetTooltip "Destroy this vehicle";
			_btn9 ctrlSetTooltip "Open this vehicles boot menu if you have the vehicles keys";
			_btn10 ctrlSetTooltip "Open your weapons locker";
			};
		};
	case independent:
		{
		if(player getVariable ["mechanic",false])then
			{
			_btn4 ctrlShow true;
			_img4 ctrlSetText "extras\icons\messageadmin.paa";
			_btn4 buttonSetAction "[] spawn DS_mech_textVehOwner;";
			_btn4 ctrlSetTooltip "Text this vehicles owner for permission to impound their vehicle";
			
			_btn5 ctrlShow true;
			_img5 ctrlSetText "extras\icons\lockpick.jpg";
			_btn5 buttonSetAction "[] spawn DS_mech_forceUnlock;";
			_btn5 ctrlSetTooltip "Force vehicle unlocked to remove dead bodies so the vehicle can be impounded";
			
			_btn6 ctrlShow true;
			_img6 ctrlSetText "extras\icons\vehImpound.jpg";
			_btn6 buttonSetAction "[] spawn DS_mech_vehImpound;";
			_btn6 ctrlSetTooltip "Impound this vehicle";
			
			if((DS_item_nitro > 0)||(DS_item_vehNos > 0)||(DS_item_vehNosAdv > 0))then
				{
				_btn7 ctrlShow true;
				_btn7 buttonSetAction "[] spawn DS_fnc_installNos";
				};
			_img7 ctrlSetText "extras\icons\nitro.jpg";
			_btn7 ctrlSetTooltip "Install Nos on this vehicle if you have a nos kit";
			};
		if(player getVariable ["security",false])then
			{
			_btn4 ctrlSetTooltip "Pull players out of this vehicle";
			_img4 ctrlSetText "extras\icons\vehPullout.jpg";
			_btn4 buttonSetAction "[] spawn DS_fnc_vehPullout;";
			
			_btn5 ctrlShow true;
			_img5 ctrlSetText "extras\icons\vehImpound.jpg";
			_btn5 buttonSetAction "[] spawn DS_sec_vehImpound;";
			_btn5 ctrlSetTooltip "Request an Impound for this vehicle";
			};
		if(player getVariable ["medic",false])then
			{
			_btn4 ctrlShow true;
			_img4 ctrlSetText "extras\icons\lockpick.jpg";
			_btn4 buttonSetAction "[] spawn DS_med_forceUnlock;";
			_btn4 ctrlSetTooltip "Force vehicle unlocked to remove dead bodies so the vehicle can be impounded";
			};
		};
	};
			

