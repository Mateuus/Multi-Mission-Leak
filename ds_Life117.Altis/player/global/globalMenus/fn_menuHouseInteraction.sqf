/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens the house interaction menu
*/

//private[""];

if(!dialog) then
{
	if(!(createDialog "interactionMenu")) exitWith {};
};
if(DS_doingStuff)exitwith{};
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

if((!(DS_cursorTarget in DS_keyRing))&&((DS_cursorTarget getVariable ["house_owner",[]] select 0) == (getPlayerUID player)))then
	{
	hint "House was bugged... Fixing.....Please wait.....";
	[(getPlayerUID player),"HUNT_fnc_getPlayerHouses",false,false] spawn BIS_fnc_MP;
	sleep 5;
	};

if(!(DS_cursorTarget in DS_keyRing))then
	{
	if(playerside == civilian)then
		{
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_img1 ctrlSetText "extras\icons\houseBuy.jpg";
		if(!(DS_cursorTarget in server_houseArray))then
			{
			_btn1 ctrlSetTooltip "Buy this property";
			_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_civ_buyHouse;";
			}
			else
			{
			_btn1 ctrlSetTooltip "This property is already owned";
			};
		_img2 ctrlSetText "extras\icons\houseInfo.jpg";
		_btn2 ctrlSetTooltip "property Details";
		_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseInfoReturn;";
		};
	if(playerside == west)then
		{
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_img1 ctrlSetText "extras\icons\houseInfo.jpg";
		_btn1 ctrlSetTooltip "Raid House";
		_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_cop_houseRaid;";
		_img1 ctrlSetText "extras\icons\vehBoot.jpg";
		};
	}
	else
	{
	if(playerside == civilian)then
		{
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_img1 ctrlSetText "extras\icons\houseInfo.jpg";
		_btn1 ctrlSetTooltip "Property Details";
		_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseDetails;";//Things such as current level, sell price etc.....
		_img2 ctrlSetText "extras\icons\houseUpgrade.jpg";
		_btn2 ctrlSetTooltip "Upgrade Property";
		_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_upgradeHouse;";//Increase house storage
		_img3 ctrlSetText "extras\icons\houseUnlock.jpg";
		_btn3 ctrlSetTooltip "Unlock Storage";
		_btn3 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseInfoReturn;";//unlock all storage
		_img4 ctrlSetText "extras\icons\houseSell.jpg";
		_btn4 ctrlSetTooltip "Sell House";
		_btn4 buttonSetAction "[DS_cursorTarget] spawn DS_civ_sellHouse;";//Sell House
		_img5 ctrlSetText "extras\icons\vehBoot.jpg";
		_btn5 ctrlSetTooltip "Virtual Storage";
		_btn5 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseStorage;";//house T menu
		_img6 ctrlSetText "extras\icons\gunAdv.jpg";
		_btn6 ctrlSetTooltip "Item Storage";
		_btn6 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseItemStorage;";//house items menu
		_img7 ctrlSetText "extras\icons\light.jpg";
		_btn7 ctrlSetTooltip "Turn off or on your houses lights";
		_btn7 buttonSetAction "[DS_cursorTarget] spawn DS_civ_houseLights;";//house lights
		if(typeOf DS_cursorTarget in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"])then
			{
			_img8 ctrlSetText "extras\icons\carShop.jpg";
			_btn8 ctrlSetTooltip "Store your vehicle";
			_btn8 buttonSetAction "[DS_cursorTarget] spawn DS_fnc_storeVehicle;";//Garage store
			};
		};
	if(playerside == west)then
		{
		_header ctrlSetText "extras\textures\menus\realEstate.jpg";
		_img1 ctrlSetText "extras\icons\houseInfo.jpg";
		_btn1 ctrlSetTooltip "Raid House";
		_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_cop_houseRaid;";
		_img1 ctrlSetText "extras\icons\vehBoot.jpg";
		};
	};
	
