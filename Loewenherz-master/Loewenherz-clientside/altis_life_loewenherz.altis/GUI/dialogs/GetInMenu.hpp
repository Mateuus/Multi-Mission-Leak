class Get_In_Menu
{
	idd = 1990;
	name="Get_In_Menu";
	movingEnabled = 0;
	enableSimulation = 1;

	class controlsBackground
	{
		class DriverPicture: lhm_RscPicture
		{
			idc = 1200;
			text = "core\textures\icons\misc\driver.paa";
			x = 0.29025;
			y = 0.2392;
			w = 0.15;
			h = 0.2;
		};
		class passengerpicture: lhm_RscPicture
		{
			idc = 1201;
			text = "core\textures\icons\misc\passenger.paa";
			x = 0.47725;
			y = 0.2392;
			w = 0.15;
			h = 0.2;
		};
		class pilotpicture: lhm_RscPicture
		{
			idc = 1202;
			text = "core\textures\icons\misc\pilot.paa";
			x = 0.29025;
			y = 0.468;
			w = 0.15;
			h = 0.2;
		};
		class gunnerpicture: lhm_RscPicture
		{
			idc = 1203;
			text = "core\textures\icons\misc\gunner.paa";
			x = 0.47725;
			y = 0.468;
			w = 0.15;
			h = 0.2;
		};

	};

	class controls
	{
		class DriverBTN: lhm_RscButtonSilent
		{
			idc = 1600;
			onButtonClick = "[] spawn {[nil,nil,nil,""driver""] spawn lhm_fnc_unlockVeh; sleep 0.5; closeDialog 0;};";
			x = 0.297222;
			y = 0.23165;
			w = 0.15;
			h = 0.2;
		};
		class PassengerBTN: lhm_RscButtonSilent
		{
			idc = 1601;
			onButtonClick = "[] spawn {[nil,nil,nil,""passenger""] spawn lhm_fnc_unlockVeh; sleep 0.5; closeDialog 0;};";
			x = 0.472222;
			y = 0.232323;
			w = 0.15;
			h = 0.2;
		};
		class PilotBTN: lhm_RscButtonSilent
		{
			idc = 1602;
			onButtonClick = "[] spawn {[nil,nil,nil,""co-pilot""] spawn lhm_fnc_unlockVeh; sleep 0.5; closeDialog 0;};";
			x = 0.296717;
			y = 0.454545;
			w = 0.15;
			h = 0.2;
		};
		class GunnerBTN: lhm_RscButtonSilent
		{
			idc = 1603;
			onButtonClick = "[] spawn {[nil,nil,nil,""gunner""] spawn lhm_fnc_unlockVeh; sleep 0.5; closeDialog 0;};";
			x = 0.47096;
			y = 0.459596;
			w = 0.15;
			h = 0.2;
		};
	};
};