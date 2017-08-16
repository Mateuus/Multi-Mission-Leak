closedialog 0;

// Menu Title.  It shouldn't be necessary to mess with this.
MENUTITLE = "Building Menu";

// Don't touch this!
option = [];
img = [];
if(isNil "vars") then { vars = []; };
dontAddToTheArray = 1;

// Format: Option name, path, togglable, extra options, var

// Fortifications
img = img + [""]; option = option + [" ==========	Fortifications	==========","empty.sqf","0","0","0"];
_getcfg =
[
"Land_CncBarrierMedium_F",
"Land_CncBarrierMedium4_F",
"Land_CncBarrier_stripes_F",
"Land_BagBunker_Tower_F",
"Land_HBarrierBig_F",
"Land_HBarrierBig_F",
"Land_HBarrierWall6_F",
"Land_HBarrierWall4_F",
"Land_HBarrierTower_F",
"BlockConcrete_F",
"Land_BagFence_Long_F",
"Land_BagFence_Round_F",
"Land_BarGate_F",
"Land_BagBunker_Tower_F",
"Land_CncBarrier_stripes_F",
"Land_Concrete_SmallWall_8m_F"
];

for "_i" from 0 to (count _getcfg)-1 do
{
	_item = _getcfg select _i;
	img = img + [""];
	option = option + [format["%1",_item],"admin_build.sqf","0","0","0"];
};

// Base Buildings
img = img + [""]; option = option + [" ==========	Base Buildings	==========","empty.sqf","0","0","0"];
_getcfg =
[
"Land_PortableLight_double_F",
"TargetP_Inf3_Acc2_F",
"Land_Maroula_F",
"Hostage_PopUp_Moving_90deg_F",
"Land_WoodenTable_large_F",
"Land_Tyres_F",
"Land_Icebox_F",
"MetalBarrel_burning_F",
"Land_WaterTank_F",
"Land_Tank_rust_F",
"Land_Slide_F",
"Land_SlideCastle_F",
"Campfire_burning_F",
"Land_RampConcrete_F",
"Land_Sun_chair_F",
"Land_Sunshade_F",
"Land_CampingChair_V2_F",
"Land_Billboard_F",
"Land_HBarrierTower_F",
"Land_Airport_Tower_F",
"Land_Cargo_HQ_V1_F",
"Land_Cargo_House_V1_F",
"Land_Cargo_Patrol_V1_F",
"Land_i_Garage_V1_F",
"Land_LampStreet_small_F",
"Land_LampDecor_F",
"Land_LampHalogen_F",
"Land_LampShabby_F"
];

for "_i" from 0 to (count _getcfg)-1 do
{
	_item = _getcfg select _i;
	_itemType = text(_item);
	img = img + [""];
	option = option + [format["%1",_item],"admin_build.sqf","0","0","0"];
};

// Small Buildings
img = img + [""]; option = option + [" ==========	Baseshield  ==========","empty.sqf","0","0","0"];
_getcfg =
[
"SignAd_SponsorS_ARMEX_F"
];

for "_i" from 0 to (count _getcfg)-1 do
{
	_item = _getcfg select _i;
	_itemType = text(_item);
	img = img + [""];
	option = option + [format["%1",_item],"admin_build.sqf","0","0","0"];
};

execVM format['menu_generate.sqf',HDIR];