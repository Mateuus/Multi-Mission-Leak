class setWanted {
	idd = 2951;
	name= "setWanted";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn DS_fnc_setupWantedMenu;";

	class controls
	{
		class backGround: IGUIBack
		{
			idc = 2200;
			text = ""; //--- ToDo: Localize;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 40 * GUI_GRID_W;
			h = 25 * GUI_GRID_H;
		};
		class playerList: DS_RscListBox
		{
			idc = 2902;
			text = ""; //--- ToDo: Localize;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 18 * GUI_GRID_H;
		};
		class RscButton_1600Spec: DS_RscButtonMenu
		{
			idc = 1900;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19 * GUI_GRID_H + GUI_GRID_Y;
			w = 13.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Release from jail";
			onButtonClick = "[] call DS_cop_releaseplayer";
		};
		class RscButton_1601Spec: DS_RscButtonMenu
		{
			idc = 1901;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Fire Officer";
			onButtonClick = "[] call DS_cop_fireCop";
		};
		class RscButton_1602Spec: DS_RscButtonMenu
		{
			idc = 1902;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Block Phone";
			onButtonClick = "[] call DS_cop_blockPhone";
		};
		class RscButton_1603Spec: DS_RscButtonMenu
		{
			idc = 1903;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Car License";
			onButtonClick = "[0] call DS_cop_revoke";
		};
		class RscButton_1604Spec: DS_RscButtonMenu
		{
			idc = 1904;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Air License";
			onButtonClick = "[1] call DS_cop_revoke";
		};
		class RscButton_1605Spec: DS_RscButtonMenu
		{
			idc = 1905;
			x = 0.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Gun License";
			onButtonClick = "[2] call DS_cop_revoke";
		};
		class RscButton_160533Spec: DS_RscButtonMenu
		{
			idc = 190333;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 23.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Boat license";
			onButtonClick = "[3] call DS_cop_revoke";
		};
		class RscButton_1600: DS_RscButtonMenu
		{
			idc = 1600;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 10.54 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Theft";
			onButtonClick = "[""thieft""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1601: DS_RscButtonMenu
		{
			idc = 1601;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Grand Theft Auto";
			onButtonClick = "[""gta""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1602: DS_RscButtonMenu
		{
			idc = 1602;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Attempted Murder";
			onButtonClick = "[""amurder""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1603: DS_RscButtonMenu
		{
			idc = 1603;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Unsafe Conduct";
			onButtonClick = "[""unsafe""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1604: DS_RscButtonMenu
		{
			idc = 1604;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Abduction";
			onButtonClick = "[""abduction""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1605: DS_RscButtonMenu
		{
			idc = 1605;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 13.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Stole Documents";
			onButtonClick = "[""spythieft""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1606: DS_RscButtonMenu
		{
			idc = 1606;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Murder";
			onButtonClick = "[""murder""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1607: DS_RscButtonMenu
		{
			idc = 1607;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 15 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Bank Robbery";
			onButtonClick = "[""brob""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1608: DS_RscButtonMenu
		{
			idc = 1608;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Knox/Research Facility Robbery";
			onButtonClick = "[""fortknox""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1609: DS_RscButtonMenu
		{
			idc = 1609;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Armed Occupation";
			onButtonClick = "[""armedocc""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1610: DS_RscButtonMenu
		{
			idc = 1610;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Terrorism";
			onButtonClick = "[""terrorism""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1611: DS_RscButtonMenu
		{
			idc = 1611;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 18 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Possession";
			onButtonClick = "[""drug""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1612: DS_RscButtonMenu
		{
			idc = 1612;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Man Slaughter";
			onButtonClick = "[""manslaughter""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1613: DS_RscButtonMenu
		{
			idc = 1613;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 19.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Using Fake ID";
			onButtonClick = "[""fakeId""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1614: DS_RscButtonMenu
		{
			idc = 1614;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1615: DS_RscButtonMenu
		{
			idc = 1615;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 21 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class RscButton_1616: DS_RscButtonMenu
		{
			idc = 1616;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 22.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.5 * GUI_GRID_W;
			h = 2 * GUI_GRID_H;
			text = "Close";
			onButtonClick = "closeDialog 0;";
		};
		class RscButton_1617: DS_RscButtonMenu
		{
			idc = 1617;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Reckless Driving";
			onButtonClick = "[""reckless""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1618: DS_RscButtonMenu
		{
			idc = 1618;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Evading Police";
			onButtonClick = "[""evade""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1619: DS_RscButtonMenu
		{
			idc = 1619;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Drink Driving";
			onButtonClick = "[""ddriving""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1620: DS_RscButtonMenu
		{
			idc = 1620;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 2.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Careless Flying";
			onButtonClick = "[""cflying""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1621: DS_RscButtonMenu
		{
			idc = 1621;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Vandalism";
			onButtonClick = "[""vandalism""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1622: DS_RscButtonMenu
		{
			idc = 1622;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Bribery";
			onButtonClick = "[""bribe""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1623: DS_RscButtonMenu
		{
			idc = 1623;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Hit and Run";
			onButtonClick = "[""hitandrun""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1624: DS_RscButtonMenu
		{
			idc = 1624;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Breach of the Peace";
			onButtonClick = "[""bpeace""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1625: DS_RscButtonMenu
		{
			idc = 1625;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Trespassing";
			onButtonClick = "[""trespass""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1626: DS_RscButtonMenu
		{
			idc = 1626;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 7 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Armed Robbery";
			onButtonClick = "[""armrob""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1627: DS_RscButtonMenu
		{
			idc = 1627;
			x = 14.55 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Accessory";
			onButtonClick = "[""acces""] call DS_cop_setPlayerWanted";
		};
		class RscButton_1628: DS_RscButtonMenu
		{
			idc = 1628;
			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			text = "Illegal Weapon";
			onButtonClick = "[""illegalweapon""] call DS_cop_setPlayerWanted";
		};
	};
};