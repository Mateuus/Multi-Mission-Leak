if (isNil "kavaladefense") then
{
	kavaladefense = 0;
	//PublicVariable "kavaladefense";
};

if (kavaladefense == 0) then
{

kavaladefense = 1;
//PublicVariable "kavaladefense";

diag_log "EVENT:Kavala Defense activated!";

_vehicle_0 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Tower_F", [3624.0122, 13138.391, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_0 = _this;
	_this setDir -172.49164;
	_this setPos [3624.0122, 13138.391, 5.7220459e-006];
};

_vehicle_1 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Small_F", [3613.0898, 13136.059, -0.13496178], [], 0, "CAN_COLLIDE"];
	_vehicle_1 = _this;
	_this setDir -265.24094;
	_this setPos [3613.0898, 13136.059, -0.13496178];
};

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Large_F", [3673.2693, 13141.236, -0.13570122], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 181.8987;
	_this setPos [3673.2693, 13141.236, -0.13570122];
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3615.8806, 13145.402, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir 3.498729;
	_this setPos [3615.8806, 13145.402, 1.5258789e-005];
};

_vehicle_5 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3616.0542, 13069.391, 6.8664551e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_5 = _this;
	_this setDir -87.088196;
	_this setPos [3616.0542, 13069.391, 6.8664551e-005];
};

_vehicle_8 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncWall4_F", [3679.7217, 13083.88, -2.9563904e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_8 = _this;
	_this setDir -33.994804;
	_this setPos [3679.7217, 13083.88, -2.9563904e-005];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall_corridor_F", [3601.1453, 13098.903, 9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 169.0965;
	_this setPos [3601.1453, 13098.903, 9.5367432e-007];
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3663.7759, 13083.392, 4.2915344e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir 179.40987;
	_this setPos [3663.7759, 13083.392, 4.2915344e-005];
};

_vehicle_12 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall_corner_F", [3656.4485, 13084.204, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_12 = _this;
	_this setDir 176.67513;
	_this setPos [3656.4485, 13084.204, 2.0980835e-005];
};

_vehicle_15 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3690.05, 13134.808, 2.1934509e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_15 = _this;
	_this setDir 94.033791;
	_this setPos [3690.05, 13134.808, 2.1934509e-005];
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall_corner_F", [3688.6465, 13127.562, 0.067872047], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir 91.299011;
	_this setPos [3688.6465, 13127.562, 0.067872047];
};

_vehicle_20 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncWall4_F", [3681.8521, 13085.397, 2.1934509e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_20 = _this;
	_this setDir -34.585323;
	_this setPos [3681.8521, 13085.397, 2.1934509e-005];
};

_vehicle_23 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncWall4_F", [3677.1475, 13158.991, -2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_23 = _this;
	_this setDir -178.58215;
	_this setPos [3677.1475, 13158.991, -2.8610229e-006];
};

_vehicle_26 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncWall4_F", [3671.8484, 13159.114, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_26 = _this;
	_this setDir -178.58215;
	_this setPos [3671.8484, 13159.114, 4.5776367e-005];
};

_vehicle_29 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3608.3787, 13080.982, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_29 = _this;
	_this setDir 3.498729;
	_this setPos [3608.3787, 13080.982, 2.2888184e-005];
};

_vehicle_32 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3619.7517, 13072.184, -1.4305115e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_32 = _this;
	_this setDir 3.498729;
	_this setPos [3619.7517, 13072.184, -1.4305115e-005];
};

_vehicle_35 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3616.6553, 13065.347], [], 0, "CAN_COLLIDE"];
	_vehicle_35 = _this;
	_this setDir -110.65121;
	_this setPos [3616.6553, 13065.347];
};

_vehicle_38 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3618.1873, 13061.622, 6.3896179e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_38 = _this;
	_this setDir -115.41714;
	_this setPos [3618.1873, 13061.622, 6.3896179e-005];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3612.0806, 13141.836, -4.7683716e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setDir -84.492691;
	_this setPos [3612.0806, 13141.836, -4.7683716e-006];
};

_vehicle_48 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3601.1294, 13091.889, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_48 = _this;
	_this setDir 257.39471;
	_this setPos [3601.1294, 13091.889, 2.2888184e-005];
};

_vehicle_51 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall_corner_F", [3606.4583, 13101.909, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_51 = _this;
	_this setDir 311.84265;
	_this setPos [3606.4583, 13101.909, -2.2888184e-005];
};

_vehicle_56 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3633.73, 13072.079, 6.6757202e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_56 = _this;
	_this setDir -0.87222624;
	_this setPos [3633.73, 13072.079, 6.6757202e-006];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3648.4119, 13072.451, -5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setDir -0.48936164;
	_this setPos [3648.4119, 13072.451, -5.7220459e-006];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3693.6687, 13091.524, -6.6757202e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setDir 89.071266;
	_this setPos [3693.6687, 13091.524, -6.6757202e-006];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3691.4175, 13106.265, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setDir 89.071266;
	_this setPos [3691.4175, 13106.265, 2.0980835e-005];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3690.2249, 13120.696, -2.9563904e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setDir 87.497284;
	_this setPos [3690.2249, 13120.696, -2.9563904e-005];
};

_vehicle_70 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3631.0247, 13141.03, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_70 = _this;
	_this setDir 366.12396;
	_this setPos [3631.0247, 13141.03, -1.9073486e-006];
};

_vehicle_74 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3639.2878, 13140.477, -9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_74 = _this;
	_this setDir 366.12396;
	_this setPos [3639.2878, 13140.477, -9.5367432e-006];
};

_vehicle_76 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3647.5977, 13139.906, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_76 = _this;
	_this setDir 366.12396;
	_this setPos [3647.5977, 13139.906, -9.5367432e-007];
};

_vehicle_78 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3655.8584, 13139.345, 8.5830688e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_78 = _this;
	_this setDir 366.12396;
	_this setPos [3655.8584, 13139.345, 8.5830688e-006];
};

_vehicle_80 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierWall6_F", [3664.0742, 13138.74, 9.5367432e-007], [], 0, "CAN_COLLIDE"];
	_vehicle_80 = _this;
	_this setDir 366.12396;
	_this setPos [3664.0742, 13138.74, 9.5367432e-007];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagBunker_Tower_F", [3618.2764, 13090.46, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setDir -357.52423;
	_this setPos [3618.2764, 13090.46, 7.6293945e-006];
};

_vehicle_86 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3611.4375, 13130.42, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_86 = _this;
	_this setDir -84.492691;
	_this setPos [3611.4375, 13130.42, -3.8146973e-006];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrierMedium4_F", [3610.0801, 13123.195, -2.5749207e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setDir -73.948402;
	_this setPos [3610.0801, 13123.195, -2.5749207e-005];
};

_vehicle_106 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [3609.1099, 13102.68, 6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_106 = _this;
	_this setDir 2.4048007;
	_this setPos [3609.1099, 13102.68, 6.2942505e-005];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningMilitaryArea_F", [3605.355, 13060.594, -1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_111 = _this;
	_this setDir 7.7210288;
	_this setPos [3605.355, 13060.594, -1.7166138e-005];
};

_vehicle_121 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierBig_F", [3674.6033, 13130.283, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_121 = _this;
	_this setDir 50.680225;
	_this setPos [3674.6033, 13130.283, 2.8610229e-006];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_5_F", [3625.377, 13133.021, 2.5749207e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir 97.491615;
	_this setPos [3625.377, 13133.021, 2.5749207e-005];
};

_vehicle_128 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningMilitaryArea_F", [3592.4424, 13091.155, 3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_128 = _this;
	_this setDir 74.461411;
	_this setPos [3592.4424, 13091.155, 3.4332275e-005];
};

_vehicle_131 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningMilitaryArea_F", [3603.7346, 13143.729, 3.1471252e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_131 = _this;
	_this setDir 96.386322;
	_this setPos [3603.7346, 13143.729, 3.1471252e-005];
};

_vehicle_134 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningMilitaryArea_F", [3618.3462, 13152.489, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_134 = _this;
	_this setDir 187.15973;
	_this setPos [3618.3462, 13152.489, -1.9073486e-006];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sign_WarningMilitaryArea_F", [3697.6929, 13130.154], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir 268.81613;
	_this setPos [3697.6929, 13130.154];
};

_vehicle_139 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3701.1099, 13141.247, 2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_139 = _this;
	_this setDir -119.16367;
	_this setPos [3701.1099, 13141.247, 2.4795532e-005];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3702.4778, 13137.412, 1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir -104.57544;
	_this setPos [3702.4778, 13137.412, 1.335144e-005];
};

_vehicle_144 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3681.2202, 13152.898, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_144 = _this;
	_this setDir 34.202702;
	_this setPos [3681.2202, 13152.898, 3.0517578e-005];
};

_vehicle_147 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3677.9819, 13154.212, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_147 = _this;
	_this setDir 14.255778;
	_this setPos [3677.9819, 13154.212, 1.5258789e-005];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3673.7271, 13154.758, 8.5830688e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setDir 1.6574819;
	_this setPos [3673.7271, 13154.758, 8.5830688e-006];
};

_vehicle_152 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3622.3811, 13153.971, 0.00012493134], [], 0, "CAN_COLLIDE"];
	_vehicle_152 = _this;
	_this setDir 27.812265;
	_this setPos [3622.3811, 13153.971, 0.00012493134];
};

_vehicle_155 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncBarrier_stripes_F", [3618.4702, 13155.27], [], 0, "CAN_COLLIDE"];
	_vehicle_155 = _this;
	_this setDir 8.2918577;
	_this setPos [3618.4702, 13155.27];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cargo_House_V1_F", [3612.3997, 13114.573, 1.2397766e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir -85.74585;
	_this setPos [3612.3997, 13114.573, 1.2397766e-005];
};

_KavalaDef = createMarker ["KavalaDef", [3650.4165, 13107.605,0]];
_KavalaDef setMarkerText "Restricted Zone";
_KavalaDef setMarkerShape "Icon";
_KavalaDef setMarkerType "mil_warning";
_KavalaDef setMarkerColor "ColorYellow";
_KavalaDef setMarkerBrush "SolidBorder";
_KavalaDef setMarkerSize [1, 1];

alarmSound1 = createSoundSource ["Sound_Alarm", [3650.4165, 13107.605, 3.8146973e-006], [], 120];

_msg = "THE MARTIAL LAW HAS BEEN CALLING! KAVALA-MARKET IS CLOSED. EVERY PLAYER THAT'S NEARS THE MARKET WILL BE SHOT WITHOUT PREWARNING!";
[[_msg,"Police HQ",4],"clientMessage",true,false] call lhm_fnc_mp;

}
else
{

deleteMarker "KavalaDef";
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_BagBunker_Tower_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_BagBunker_Small_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_BagBunker_Large_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_CncBarrierMedium4_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_CncBarrier_stripes_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_CncWall4_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_HBarrierWall_corridor_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_HBarrierWall6_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_HBarrierWall_corner_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_HBarrier_5_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_Sign_WarningMilitaryArea_F"
,100]);
sleep 0.1;	
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_HBarrierBig_F"
,100]);
sleep 0.1;
{deleteVehicle _x}forEach ( [3650.4165, 13107.605, 3.8146973e-006] nearObjects [
"Land_Cargo_House_V1_F"
,100]);	

deleteVehicle alarmSound1;

_msg = "The martial law was lifted! Kavala Market is now open!";
[[_msg,"The Government",4],"TON_fnc_clientMessage",true,false] call lhm_fnc_mp;

diag_log "EVENT:Kavala Defense deactivated!";

kavaladefense = 0;
//PublicVariable "kavaladefense";
};  