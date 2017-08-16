/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the house interaction menu
*/

if(!dialog)then {
	if(!(createDialog "interactionMenu"))exitWith{};
};

if(DS_doingStuff)exitWith{};

DS_cursorTarget = _this select 0;
disableSerialization;

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

if((!(DS_cursorTarget in DS_keyRing))&&((DS_cursorTarget getVariable ["house_owner",[]] select 0) isEqualTo (getPlayerUID player)))then {
	hint "House was bugged... Fixing... Please wait...";
	DS_keyRing pushBack DS_cursorTarget;
	sleep 5;
};

if(!(DS_cursorTarget in DS_keyRing))then {
	if(playerSide isEqualTo civilian)then {
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_img1 ctrlSetText "extras\icons\houseBuy.jpg";
		if(!(DS_cursorTarget in server_houseArray))then {
			_btn1 ctrlSetTooltip "Buy this property";
			_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_civ_buyHouse;";
		} else {
			_btn1 ctrlSetTooltip "This property is already owned";
		};
		_img2 ctrlSetText "extras\icons\houseInfo.jpg";
		_btn2 ctrlSetTooltip "Property Details";
		_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseInfoReturn;";
		};
	if(playerSide isEqualTo west)then {
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_btn1 ctrlSetTooltip "Raid House";
		_btn1 buttonSetAction "[DS_cursorTarget,false] spawn DS_cop_houseRaid;";
		_img1 ctrlSetText "extras\icons\vehBoot.jpg";
		_btn2 ctrlSetTooltip "Lock Up House";
		_btn2 buttonSetAction "[DS_cursorTarget,true] spawn DS_cop_houseRaid;";
		_img2 ctrlSetText "extras\icons\vehBoot.jpg";
		_btn3 ctrlSetTooltip "Look up owners details";
		_img3 ctrlSetText "extras\icons\copLicense.jpg";
		_btn3 buttonSetAction "[DS_cursorTarget] spawn DS_cop_houseInfo;";
	};
} else {
	if(playerSide isEqualTo civilian)then {
		_owner = DS_cursorTarget getVariable ["house_owner",""];
		_ownerUID = _owner select 0;
		if(isNil "_ownerUID")exitWith {
			closeDialog 0;
			hint "This house is no longer owned";

			_index = DS_keyRing find DS_cursorTarget;
			if(!(_index isEqualTo -1))then {
				DS_keyRing deleteAt _index;
			};
		};

		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_img1 ctrlSetText "extras\icons\houseInfo.jpg";
		_btn1 ctrlSetTooltip "Property Details";
		_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseDetails;"; //Things such as current level, sell price etc...
		_img2 ctrlSetText "extras\icons\houseUpgrade.jpg";
		_btn2 ctrlSetTooltip "Upgrade property's storage for a price plus 5 processed cement";
		_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_upgradeHouse;"; //Increase house storage
		_img3 ctrlSetText "extras\icons\houseUnlock.jpg";
		_btn3 ctrlSetTooltip "Unlock Storage";
		_btn3 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseInfoReturn;"; //Unlock all storage
		_img4 ctrlSetText "extras\icons\houseSell.jpg";
		_btn4 ctrlSetTooltip "Sell House";
		if((getPlayerUID player) isEqualTo _ownerUID)then {
			_btn4 buttonSetAction "[DS_cursorTarget] spawn DS_civ_sellHouse;"; //Sell House
		} else {
			_btn4 buttonSetAction "closeDialog 0;hint ""Only the house owner can use this feature"";"; //Increase house storage
		};
		_img5 ctrlSetText "extras\icons\vehBoot.jpg";
		_btn5 ctrlSetTooltip "Virtual Storage";
		_btn5 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseStorage;"; //House T menu
		_img6 ctrlSetText "extras\icons\gunAdv.jpg";
		_btn6 ctrlSetTooltip "Item Storage";
		_btn6 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseItemStorage;"; //House items menu
		_img7 ctrlSetText "extras\icons\light.jpg";
		_btn7 ctrlSetTooltip "Turn off or on your houses lights";
		_btn7 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseLights;"; //House lights
		_img8 ctrlSetText "extras\icons\houseUpgrade.jpg";
		_btn8 ctrlSetTooltip "Add a garage to your house";
		_btn8 buttonSetAction "[DS_cursorTarget] spawn DS_civ_upgradeHouseGarage;";
		if(DS_cursorTarget getVariable ["garage",false])then {
			_img9 ctrlSetText "extras\icons\carShop.jpg";
			_btn9 ctrlSetTooltip "Retrieve a vehicle";
			_btn9 buttonSetAction "[146,true,""All""] spawn DS_fnc_setupGarageHouse;"; //Garage store[_index,true,"Car"] spawn DS_fnc_setupGarage;
			_img10 ctrlSetText "extras\icons\carShop.jpg";
			_btn10 ctrlSetTooltip "Store your vehicle";
			_btn10 buttonSetAction "[true] spawn DS_fnc_storeVehicle;"; //Garage store
		};
	};

	if(playerSide isEqualTo west)then {
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_btn1 ctrlSetTooltip "Raid House";
		_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_cop_houseRaid;";
		_img1 ctrlSetText "extras\icons\vehBoot.jpg";
		_btn3 ctrlSetTooltip "Look up owners details";
		_img3 ctrlSetText "extras\icons\copLicense.jpg";
		_btn3 buttonSetAction "[DS_cursorTarget] spawn DS_cop_houseInfo;";
	};
};