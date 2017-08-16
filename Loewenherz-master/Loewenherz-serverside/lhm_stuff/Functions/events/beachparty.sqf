if (isNil "beachpartykav") then
{
	beachpartykav = 0;

};

if (beachpartykav == 0) then
{

beachpartykav = 1;


diag_log "EVENT:BeachParty Kavala activated!";

_vehicle_2 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MarketShelter_F", [3436.9211, 12774.142, -8.6903572e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_2 = _this;
	_this setDir 80.203392;
	_this setPos [3436.9211, 12774.142, -8.6903572e-005];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_4 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_04_F", [3234.0662, 12846.083, 2.520241], [], 0, "CAN_COLLIDE"];
	_vehicle_4 = _this;
	_this setDir -164.79347;
	_this setPos [3234.0662, 12846.083, 2.520241];
};

_vehicle_9 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RampConcrete_F", [3398.0466, 12783.824, 0.1261714], [], 0, "CAN_COLLIDE"];
	_vehicle_9 = _this;
	_this setDir 77.080566;
	_this setPos [3398.0466, 12783.824, 0.1261714];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_11 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RampConcrete_F", [3388.719, 12781.743, 1.7076566], [], 0, "CAN_COLLIDE"];
	_vehicle_11 = _this;
	_this setDir 77.080566;
	_this setPos [3388.719, 12781.743, 1.7076566];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_13 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RampConcrete_F", [3379.5203, 12779.682, 3.4148738], [], 0, "CAN_COLLIDE"];
	_vehicle_13 = _this;
	_this setDir 77.080566;
	_this setPos [3379.5203, 12779.682, 3.4148738];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_16 = objNull;
if (true) then
{
	_this = createVehicle ["BlockConcrete_F", [3388.8884, 12781.749, -1.3079244], [], 0, "CAN_COLLIDE"];
	_vehicle_16 = _this;
	_this setDir -12.315192;
	_this setPos [3388.8884, 12781.749, -1.3079244];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_18 = objNull;
if (true) then
{
	_this = createVehicle ["BlockConcrete_F", [3379.5059, 12779.637, 0.38310209], [], 0, "CAN_COLLIDE"];
	_vehicle_18 = _this;
	_this setDir -12.315192;
	_this setPos [3379.5059, 12779.637, 0.38310209];
	_this allowDamage false;
	_this enableSimulation false;
};

_vehicle_22 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JumpTarget_F", [3408.5984, 12799.143, 1.5974045e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_22 = _this;
	_this setPos [3408.5984, 12799.143, 1.5974045e-005];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [3421.9751, 12800.077, 6.3419342e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [3421.9751, 12800.077, 6.3419342e-005];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [3426.3994, 12823.384, -0.00010538101], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [3426.3994, 12823.384, -0.00010538101];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [3419.8274, 12849.401, -0.00012230873], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [3419.8274, 12849.401, -0.00012230873];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [3418.1382, 12770.693, 1.4781952e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [3418.1382, 12770.693, 1.4781952e-005];
};

_vehicle_52 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3401.9775, 12788.25, 3.194809e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_52 = _this;
	_this setPos [3401.9775, 12788.25, 3.194809e-005];
};

_vehicle_54 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3403.7151, 12781.562, -7.3194504e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_54 = _this;
	_this setPos [3403.7151, 12781.562, -7.3194504e-005];
};

_vehicle_57 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3443.1819, 12798.229, 5.3882599e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_57 = _this;
	_this setPos [3443.1819, 12798.229, 5.3882599e-005];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3444.0603, 12789.742, -7.2240829e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [3444.0603, 12789.742, -7.2240829e-005];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3446.5437, 12757.102, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [3446.5437, 12757.102, -1.1444092e-005];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3450.5945, 12752.478, 1.0967255e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setPos [3450.5945, 12752.478, 1.0967255e-005];
};

_vehicle_65 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3446.1379, 12712.374, -2.6226044e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_65 = _this;
	_this setPos [3446.1379, 12712.374, -2.6226044e-005];
};

_vehicle_67 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3451.7832, 12721.491, 2.8610229e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_67 = _this;
	_this setPos [3451.7832, 12721.491, 2.8610229e-006];
};

_vehicle_69 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3441.4465, 12776.424, 1.0728836e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_69 = _this;
	_this setPos [3441.4465, 12776.424, 1.0728836e-005];
};

_vehicle_71 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3421.8718, 12807.679, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_71 = _this;
	_this setPos [3421.8718, 12807.679, 7.6293945e-006];
};

_vehicle_73 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3403.3101, 12825.354, 3.6597252e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_73 = _this;
	_this setPos [3403.3101, 12825.354, 3.6597252e-005];
};

_vehicle_75 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3417.3352, 12837.693, -1.0490417e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_75 = _this;
	_this setPos [3417.3352, 12837.693, -1.0490417e-005];
};

_vehicle_77 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3414.1497, 12870.878, 5.8412552e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_77 = _this;
	_this setPos [3414.1497, 12870.878, 5.8412552e-005];
};

_vehicle_79 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3394.2324, 12863.907, -1.0967255e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_79 = _this;
	_this setPos [3394.2324, 12863.907, -1.0967255e-005];
};

_vehicle_81 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3394.6235, 12844.879, 0.00012016296], [], 0, "CAN_COLLIDE"];
	_vehicle_81 = _this;
	_this setPos [3394.6235, 12844.879, 0.00012016296];
};

_vehicle_83 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3425.3296, 12758.1, -5.030632e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_83 = _this;
	_this setPos [3425.3296, 12758.1, -5.030632e-005];
};

_vehicle_85 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3419.77, 12741.612, -0.00011503696], [], 0, "CAN_COLLIDE"];
	_vehicle_85 = _this;
	_this setPos [3419.77, 12741.612, -0.00011503696];
};

_vehicle_87 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3422.8655, 12719.747, -3.695488e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_87 = _this;
	_this setPos [3422.8655, 12719.747, -3.695488e-005];
};

_vehicle_89 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3405.615, 12704.371, 1.4543533e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_89 = _this;
	_this setPos [3405.615, 12704.371, 1.4543533e-005];
};

_vehicle_91 = objNull;
if (true) then
{
	_this = createVehicle ["MetalBarrel_burning_F", [3413.0549, 12677.133, 1.0251999e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_91 = _this;
	_this setPos [3413.0549, 12677.133, 1.0251999e-005];
};

_vehicle_95 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [3435.8391, 12800.921, -6.2584877e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_95 = _this;
	_this setDir 82.697083;
	_this setPos [3435.8391, 12800.921, -6.2584877e-005];
};

_vehicle_97 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [3435.4763, 12803.248, 1.6450882e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_97 = _this;
	_this setDir 78.071648;
	_this setPos [3435.4763, 12803.248, 1.6450882e-005];
};

_vehicle_99 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [3434.303, 12805.356, -7.2240829e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_99 = _this;
	_this setDir 49.482544;
	_this setPos [3434.303, 12805.356, -7.2240829e-005];
};

_vehicle_101 = objNull;
if (true) then
{
	_this = createVehicle ["Land_FieldToilet_F", [3432.166, 12807.372, -2.2411346e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_101 = _this;
	_this setDir 34.669159;
	_this setPos [3432.166, 12807.372, -2.2411346e-005];
};

_vehicle_104 = objNull;
if (true) then
{
	_this = createVehicle ["FirePlace_burning_F", [3428.0439, 12751.576, 1.7642975e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_104 = _this;
	_this setPos [3428.0439, 12751.576, 1.7642975e-005];
};

_vehicle_108 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Traw2_F", [3250.5483, 12589.863, -6.1751304], [], 0, "CAN_COLLIDE"];
	_vehicle_108 = _this;
	_this setDir 110.69958;
	_this setPos [3250.5483, 12589.863, -6.1751304];
};

_vehicle_109 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Traw_F", [3278.5762, 12585.939, -6.2569928], [], 0, "CAN_COLLIDE"];
	_vehicle_109 = _this;
	_this setDir 190.047;
	_this setPos [3278.5762, 12585.939, -6.2569928];
};

_vehicle_111 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_1_F", [3398.0334, 12812.174, -0.00011014938], [], 0, "CAN_COLLIDE"];
	_vehicle_111 = _this;
	_this setDir -14.744477;
	_this setPos [3398.0334, 12812.174, -0.00011014938];
};

_vehicle_115 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_1_F", [3395.4268, 12822.152, -2.2292137e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_115 = _this;
	_this setDir -14.407503;
	_this setPos [3395.4268, 12822.152, -2.2292137e-005];
};

_vehicle_119 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_1_F", [3391.7598, 12832.463, -5.4478645e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_119 = _this;
	_this setDir -20.620605;
	_this setPos [3391.7598, 12832.463, -5.4478645e-005];
};

_vehicle_123 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_1_F", [3398.1365, 12802.579, 4.4703484e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_123 = _this;
	_this setDir 0.95551389;
	_this setPos [3398.1365, 12802.579, 4.4703484e-006];
};

_vehicle_127 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrier_1_F", [3399.1521, 12792.764, -5.1796436e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_127 = _this;
	_this setDir -18.854372;
	_this setPos [3399.1521, 12792.764, -5.1796436e-005];
};

_vehicle_136 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BagFence_Round_F", [3399.9431, 12855.439, -2.7656555e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_136 = _this;
	_this setDir 58.293442;
	_this setPos [3399.9431, 12855.439, -2.7656555e-005];
};

_vehicle_140 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3409.9717, 12836.912, 1.8596649e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_140 = _this;
	_this setDir -18.13607;
	_this setPos [3409.9717, 12836.912, 1.8596649e-005];
};

_vehicle_142 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3410.5706, 12835.259, -1.7166138e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_142 = _this;
	_this setDir -20.248049;
	_this setPos [3410.5706, 12835.259, -1.7166138e-005];
};

_vehicle_145 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3411.3059, 12833.662, -5.5074692e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_145 = _this;
	_this setDir -24.692446;
	_this setPos [3411.3059, 12833.662, -5.5074692e-005];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3411.9038, 12831.847, -1.6689301e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir -13.811428;
	_this setPos [3411.9038, 12831.847, -1.6689301e-006];
};

_vehicle_151 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3412.147, 12830.014, -1.2159348e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_151 = _this;
	_this setDir -3.6377285;
	_this setPos [3412.147, 12830.014, -1.2159348e-005];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3412.1602, 12828.225, -1.7881393e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setDir 2.9180212;
	_this setPos [3412.1602, 12828.225, -1.7881393e-005];
};

_vehicle_157 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3411.9075, 12826.332, -3.862381e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_157 = _this;
	_this setDir 13.597472;
	_this setPos [3411.9075, 12826.332, -3.862381e-005];
};

_vehicle_160 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3411.5237, 12824.673, 6.1511993e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_160 = _this;
	_this setDir 16.708441;
	_this setPos [3411.5237, 12824.673, 6.1511993e-005];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3410.9019, 12822.962, 7.2717667e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir 23.86108;
	_this setPos [3410.9019, 12822.962, 7.2717667e-006];
};

_vehicle_166 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3410.061, 12821.252, -1.680851e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_166 = _this;
	_this setDir 31.983688;
	_this setPos [3410.061, 12821.252, -1.680851e-005];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3408.802, 12819.577, -5.8174133e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir 44.406567;
	_this setPos [3408.802, 12819.577, -5.8174133e-005];
};

_vehicle_172 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3407.4338, 12818.271, -1.6450882e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_172 = _this;
	_this setDir 53.131889;
	_this setPos [3407.4338, 12818.271, -1.6450882e-005];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3405.894, 12817.311, -3.361702e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setDir 62.260284;
	_this setPos [3405.894, 12817.311, -3.361702e-005];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3404.3547, 12816.642, -0.00010824203], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setDir 70.424881;
	_this setPos [3404.3547, 12816.642, -0.00010824203];
};

_vehicle_182 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3402.7197, 12816.125, -4.1246414e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_182 = _this;
	_this setDir 75.17926;
	_this setPos [3402.7197, 12816.125, -4.1246414e-005];
};

_vehicle_185 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3401.0422, 12815.701, -4.2438507e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_185 = _this;
	_this setDir 77.246208;
	_this setPos [3401.0422, 12815.701, -4.2438507e-005];
};

_vehicle_188 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3399.3584, 12815.311, -4.2974949e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_188 = _this;
	_this setDir 77.246208;
	_this setPos [3399.3584, 12815.311, -4.2974949e-005];
};

_vehicle_190 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3397.6062, 12814.911, 5.9068203e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_190 = _this;
	_this setDir 77.246208;
	_this setPos [3397.6062, 12814.911, 5.9068203e-005];
};

_vehicle_192 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3395.8313, 12814.477, -9.6589327e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_192 = _this;
	_this setDir 77.246208;
	_this setPos [3395.8313, 12814.477, -9.6589327e-005];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3393.9685, 12814.013, 1.8998981e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setDir 77.246208;
	_this setPos [3393.9685, 12814.013, 1.8998981e-005];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3392.1255, 12813.592, 7.9274178e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setDir 77.246208;
	_this setPos [3392.1255, 12813.592, 7.9274178e-006];
};

_vehicle_199 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3390.2761, 12813.168], [], 0, "CAN_COLLIDE"];
	_vehicle_199 = _this;
	_this setDir 77.246208;
	_this setPos [3390.2761, 12813.168];
};

_vehicle_202 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CncShelter_F", [3388.4673, 12812.726], [], 0, "CAN_COLLIDE"];
	_vehicle_202 = _this;
	_this setDir 77.246208;
	_this setPos [3388.4673, 12812.726];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3428.3093, 12817.907, 7.0095062e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setPos [3428.3093, 12817.907, 7.0095062e-005];
};

_vehicle_216 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3427.7988, 12828.131, 3.695488e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_216 = _this;
	_this setPos [3427.7988, 12828.131, 3.695488e-005];
};

_vehicle_218 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3419.2039, 12864.451, -1.502037e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_218 = _this;
	_this setPos [3419.2039, 12864.451, -1.502037e-005];
};

_vehicle_220 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3399.741, 12848.146, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_220 = _this;
	_this setPos [3399.741, 12848.146, -6.2942505e-005];
};

_vehicle_222 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3405.9001, 12789.796, -5.030632e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_222 = _this;
	_this setPos [3405.9001, 12789.796, -5.030632e-005];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3409.0408, 12762.29, -5.2452087e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setPos [3409.0408, 12762.29, -5.2452087e-006];
};

_vehicle_226 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3411.1033, 12733.904, -1.4185905e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_226 = _this;
	_this setPos [3411.1033, 12733.904, -1.4185905e-005];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3406.4712, 12711.262, 2.1338463e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setPos [3406.4712, 12711.262, 2.1338463e-005];
};

_vehicle_230 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3430.5698, 12784.765, -7.8201294e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_230 = _this;
	_this setPos [3430.5698, 12784.765, -7.8201294e-005];
};

_vehicle_232 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3390.7336, 12671.504, -1.0728836e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_232 = _this;
	_this setPos [3390.7336, 12671.504, -1.0728836e-006];
};

_vehicle_236 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Camping_Light_F", [3415.95, 12696.192, -4.2200089e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_236 = _this;
	_this setPos [3415.95, 12696.192, -4.2200089e-005];
};

_vehicle_239 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TablePlastic_01_F", [3432.9355, 12785.778, -1.8358231e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_239 = _this;
	_this setDir -45.494503;
	_this setPos [3432.9355, 12785.778, -1.8358231e-005];
};

_vehicle_240 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sink_F", [3431.9153, 12802.037, -2.1457672e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_240 = _this;
	_this setDir -122.69608;
	_this setPos [3431.9153, 12802.037, -2.1457672e-006];
};

_vehicle_241 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_F", [3424.5942, 12799.84, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_241 = _this;
	_this setDir 92.872719;
	_this setPos [3424.5942, 12799.84, 2.2888184e-005];
};

_vehicle_242 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sleeping_bag_blue_F", [3421.5261, 12797.077, -0.00010919571], [], 0, "CAN_COLLIDE"];
	_vehicle_242 = _this;
	_this setDir 181.60815;
	_this setPos [3421.5261, 12797.077, -0.00010919571];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenLog_F", [3417.9216, 12772.281, -1.8119812e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setPos [3417.9216, 12772.281, -1.8119812e-005];
};

_vehicle_245 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenLog_F", [3419.6663, 12770.992, -3.1709671e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_245 = _this;
	_this setPos [3419.6663, 12770.992, -3.1709671e-005];
};

_vehicle_247 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenLog_F", [3418.6328, 12769.501, -2.4795532e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_247 = _this;
	_this setPos [3418.6328, 12769.501, -2.4795532e-005];
};

_vehicle_249 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenLog_F", [3416.7544, 12770.658, -6.0558319e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_249 = _this;
	_this setPos [3416.7544, 12770.658, -6.0558319e-005];
};

_vehicle_251 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_large_F", [3438.5291, 12799.106, -7.7962875e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_251 = _this;
	_this setDir 56.847507;
	_this setPos [3438.5291, 12799.106, -7.7962875e-005];
};

_vehicle_253 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodPile_large_F", [3438.814, 12788.587, -2.1457672e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_253 = _this;
	_this setDir 113.23473;
	_this setPos [3438.814, 12788.587, -2.1457672e-006];
};

_vehicle_255 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [3428.4199, 12835.038, -0.00014090538], [], 0, "CAN_COLLIDE"];
	_vehicle_255 = _this;
	_this setDir 67.597084;
	_this setPos [3428.4199, 12835.038, -0.00014090538];
};

_vehicle_256 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [3437.5688, 12735.165, -9.0360641e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_256 = _this;
	_this setDir -167.22328;
	_this setPos [3437.5688, 12735.165, -9.0360641e-005];
};

_vehicle_258 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [3426.8025, 12837.646, -3.7670135e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_258 = _this;
	_this setDir 46.57922;
	_this setPos [3426.8025, 12837.646, -3.7670135e-005];
};

_vehicle_260 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentA_F", [3424.5671, 12839.843, -2.0027161e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_260 = _this;
	_this setDir 31.799791;
	_this setPos [3424.5671, 12839.843, -2.0027161e-005];
};

_vehicle_263 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [3435.3342, 12730.277, -8.5830688e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_263 = _this;
	_this setDir -137.35014;
	_this setPos [3435.3342, 12730.277, -8.5830688e-006];
};

_vehicle_265 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TentDome_F", [3430.2017, 12727.864, 1.4305115e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_265 = _this;
	_this setDir -113.87272;
	_this setPos [3430.2017, 12727.864, 1.4305115e-006];
};

_vehicle_269 = objNull;
if (true) then
{
	_this = createVehicle ["Dirthump_3_F", [3404.5056, 12687.729, -0.37602004], [], 0, "CAN_COLLIDE"];
	_vehicle_269 = _this;
	_this setDir -68.141129;
	_this setPos [3404.5056, 12687.729, -0.37602004];
};

_vehicle_272 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [3401.6504, 12830.525, -3.6120415e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_272 = _this;
	_this setDir 72.647194;
	_this setPos [3401.6504, 12830.525, -3.6120415e-005];
};

_vehicle_273 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SlideCastle_F", [3401.5366, 12836.543, -0.0001168251], [], 0, "CAN_COLLIDE"];
	_vehicle_273 = _this;
	_this setDir -106.68649;
	_this setPos [3401.5366, 12836.543, -0.0001168251];
};

_vehicle_274 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [3424.6316, 12848.678, -4.4465065e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_274 = _this;
	_this setDir 82.396721;
	_this setPos [3424.6316, 12848.678, -4.4465065e-005];
};

_vehicle_276 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LampHalogen_F", [3414.2974, 12777.119, -6.6757202e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_276 = _this;
	_this setDir -6.4002619;
	_this setPos [3414.2974, 12777.119, -6.6757202e-005];
};

_vehicle_278 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LampHalogen_F", [3412.1465, 12719.688, -6.0796738e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_278 = _this;
	_this setDir 16.434538;
	_this setPos [3412.1465, 12719.688, -6.0796738e-006];
};

_vehicle_281 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LampHalogen_F", [3401.6797, 12855.837, -0.18102425], [], 0, "CAN_COLLIDE"];
	_vehicle_281 = _this;
	_this setDir -41.659351;
	_this setPos [3401.6797, 12855.837, -0.18102425];
};

_vehicle_283 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Runway_PAPI", [3401.4885, 12789.015, -1.4543533e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_283 = _this;
	_this setDir 76.894096;
	_this setPos [3401.4885, 12789.015, -1.4543533e-005];
};

_vehicle_285 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Runway_PAPI", [3403.6135, 12780.381, 5.2452087e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_285 = _this;
	_this setDir 75.747803;
	_this setPos [3403.6135, 12780.381, 5.2452087e-006];
};

_vehicle_291 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pier_F", [3387.2788, 12752.008, -1.183248], [], 0, "CAN_COLLIDE"];
	_vehicle_291 = _this;
	_this setDir -10.741921;
	_this setPos [3387.2788, 12752.008, -1.183248];
};

_vehicle_297 = objNull;
if (true) then
{
	_this = createVehicle ["Land_NavigLight_3_F", [3411.4009, 12742.988, -2.3543112], [], 0, "CAN_COLLIDE"];
	_vehicle_297 = _this;
	_this setDir -185.30705;
	_this setPos [3411.4009, 12742.988, -2.3543112];
};

_vehicle_299 = objNull;
if (true) then
{
	_this = createVehicle ["Land_dp_bigTank_F", [3259.8181, 12735.987, -5.7981853], [], 0, "CAN_COLLIDE"];
	_vehicle_299 = _this;
	_this setDir 14.059087;
	_this setPos [3259.8181, 12735.987, -5.7981853];
};

_vehicle_301 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pier_addon", [3239.6819, 12677.93, -2.1250043], [], 0, "CAN_COLLIDE"];
	_vehicle_301 = _this;
	_this setDir -259.92883;
	_this setPos [3239.6819, 12677.93, -2.1250043];
};

_vehicle_304 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pier_addon", [3246.2451, 12668.967, -2.1070075], [], 0, "CAN_COLLIDE"];
	_vehicle_304 = _this;
	_this setDir -440.25977;
	_this setPos [3246.2451, 12668.967, -2.1070075];
};

_vehicle_307 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RampConcrete_F", [3269.7156, 12635.251, -5.7935715e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_307 = _this;
	_this setDir 50.473366;
	_this setPos [3269.7156, 12635.251, -5.7935715e-005];
};

_vehicle_309 = objNull;
if (true) then
{
	_this = createVehicle ["Land_RampConcrete_F", [3195.2104, 12729.76, 0.0022928326], [], 0, "CAN_COLLIDE"];
	_vehicle_309 = _this;
	_this setDir 216.59967;
	_this setPos [3195.2104, 12729.76, 0.0022928326];
};

_vehicle_311 = objNull;
if (true) then
{
	_this = createVehicle ["Land_HBarrierTower_F", [3412.6504, 12853.62, -0.18579209], [], 0, "CAN_COLLIDE"];
	_vehicle_311 = _this;
	_this setDir 55.420437;
	_this setPos [3412.6504, 12853.62, -0.18579209];
};

_vehicle_312 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BuoyBig_F", [3214.0942, 12734.993, -0.29620817], [], 0, "CAN_COLLIDE"];
	_vehicle_312 = _this;
	_this setDir -100.89996;
	_this setPos [3214.0942, 12734.993, -0.29620817];
};

_vehicle_315 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BuoyBig_F", [3191.925, 12749.557, -9.3923882e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_315 = _this;
	_this setDir -100.89996;
	_this setPos [3191.925, 12749.557, -9.3923882e-005];
};

_vehicle_319 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BuoyBig_F", [3260.1309, 12642.56, 0.0012376726], [], 0, "CAN_COLLIDE"];
	_vehicle_319 = _this;
	_this setDir -83.05024;
	_this setPos [3260.1309, 12642.56, 0.0012376726];
};

_vehicle_320 = objNull;
if (true) then
{
	_this = createVehicle ["Land_BuoyBig_F", [3276.7693, 12621.902, -0.30001846], [], 0, "CAN_COLLIDE"];
	_vehicle_320 = _this;
	_this setDir -83.05024;
	_this setPos [3276.7693, 12621.902, -0.30001846];
};

_vehicle_326 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Pier_F", [3346.3091, 12744.264, -1.2026948], [], 0, "CAN_COLLIDE"];
	_vehicle_326 = _this;
	_this setDir -10.741921;
	_this setPos [3346.3091, 12744.264, -1.2026948];
};
sleep 0.5;

// Speaker to play Music
	beachPartyMusic = createVehicle ["Land_Loudspeakers_F", [3426.9963, 12806.521, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
	beachPartyMusic setDir -9.7112646;
	beachPartyMusic setPos [3426.9963, 12806.521, 5.9127808e-005];
	publicVariable "beachPartyMusic";
	beachPartyMusic allowDamage false;
	beachPartyMusic enableSimulation false;
// Speaker to play Music


/////////////////////////////////////////// SPAWN VEHICLES ///////////////////////////////////////////////
sleep 0.5;
_vehicle_372 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [3435.1553, 12782.172, -3.5762787e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_372 = _this;
	_this setDir -102.02935;
	_this setPos [3435.1553, 12782.172, -3.5762787e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_384 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [3435.7961, 12778.346, -3.4809113e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_384 = _this;
	_this setDir -99.345863;
	_this setPos [3435.7961, 12778.346, -3.4809113e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_386 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [3436.7314, 12774.156, -3.3855438e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_386 = _this;
	_this setDir -102.02935;
	_this setPos [3436.7314, 12774.156, -3.3855438e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_388 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [3437.2346, 12770.257, 2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_388 = _this;
	_this setDir -98.956398;
	_this setPos [3437.2346, 12770.257, 2.2888184e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_390 = objNull;
if (true) then
{
	_this = createVehicle ["B_G_Quadbike_01_F", [3437.8823, 12765.869, 1.4781952e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_390 = _this;
	_this setDir -94.233849;
	_this setPos [3437.8823, 12765.869, 1.4781952e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_401 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_01_rescue_F", [3367.4651, 12736.571, 3.0636787e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_401 = _this;
	_this setDir -190.90205;
	_this setPos [3367.4651, 12736.571, 3.0636787e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_402 = objNull;
if (true) then
{
	_this = createVehicle ["C_Rubberboat", [3392.3816, 12742.411, 0.00010299683], [], 0, "CAN_COLLIDE"];
	_vehicle_402 = _this;
	_this setDir 168.80136;
	_this setPos [3392.3816, 12742.411, 0.00010299683];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_408 = objNull;
if (true) then
{
	_this = createVehicle ["C_Rubberboat", [3386.4924, 12741.328, -5.6327945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_408 = _this;
	_this setDir 170.91641;
	_this setPos [3386.4924, 12741.328, -5.6327945e-006];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_411 = objNull;
if (true) then
{
	_this = createVehicle ["C_Rubberboat", [3379.7671, 12740.101, 0.0003712083], [], 0, "CAN_COLLIDE"];
	_vehicle_411 = _this;
	_this setDir 170.36655;
	_this setPos [3379.7671, 12740.101, 0.0003712083];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_414 = objNull;
if (true) then
{
	_this = createVehicle ["C_Rubberboat", [3373.2676, 12738.835, 0.0019636808], [], 0, "CAN_COLLIDE"];
	_vehicle_414 = _this;
	_this setDir 171.82497;
	_this setPos [3373.2676, 12738.835, 0.0019636808];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_417 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_01_rescue_F", [3361.1582, 12735.374, -0.002532494], [], 0, "CAN_COLLIDE"];
	_vehicle_417 = _this;
	_this setDir -190.90205;
	_this setPos [3361.1582, 12735.374, -0.002532494];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_420 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_01_rescue_F", [3353.6384, 12733.88, 0.010724965], [], 0, "CAN_COLLIDE"];
	_vehicle_420 = _this;
	_this setDir -190.90205;
	_this setPos [3353.6384, 12733.88, 0.010724965];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_422 = objNull;
if (true) then
{
	_this = createVehicle ["C_Boat_Civil_01_rescue_F", [3345.4211, 12732.294, 0.00627715], [], 0, "CAN_COLLIDE"];
	_vehicle_422 = _this;
	_this setDir -190.90205;
	_this setPos [3345.4211, 12732.294, 0.00627715];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_424 = objNull;
if (true) then
{
	_this = createVehicle ["B_SDV_01_F", [3325.3823, 12733.012, 4.529953e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_424 = _this;
	_this setDir -192.47063;
	_this setPos [3325.3823, 12733.012, 4.529953e-005];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};
sleep 0.1;
_vehicle_426 = objNull;
if (true) then
{
	_this = createVehicle ["B_SDV_01_F", [3322.7539, 12746.997, 0.020280609], [], 0, "CAN_COLLIDE"];
	_vehicle_426 = _this;
	_this setDir -371.18036;
	_this setPos [3322.7539, 12746.997, 0.020280609];
	_veh = [_this, 15] spawn lhm_fnc_vehicleRespawn;
};

/////////////////////////////////////////// SPAWN VEHICLES ///////////////////////////////////////////////
sleep 0.1;

	[] spawn {

		partyBox = createVehicle ["Box_IND_Ammo_F", [3425.886, 12811.037, 7.0571899e-005], [], 0, "CAN_COLLIDE"];
		partyBox setDir -10.146722;
		partyBox setPos [3425.886, 12811.037, 7.0571899e-005];
		sleep 0.1;
		
		clearWeaponCargoGlobal partyBox;
		clearMagazineCargoGlobal partyBox;
		clearItemCargoGlobal partyBox;
		clearBackpackCargoGlobal partyBox;
		sleep 0.1;
		
		_magazines =[
		"SmokeShellRed",
		"SmokeShellYellow",
		"SmokeShellPurple",
		"SmokeShellBlue",
		"SmokeShellOrange",
		"Chemlight_red",
		"Chemlight_green",
		"Chemlight_blue",
		"Chemlight_yellow"
		];
		
		_items = [
		"ItemMap",
		"ItemWatch",
		"FirstAidKit"
		];
		
		_backpacks = [
		"B_Parachute"
		];
		
		{partyBox addMagazineCargoGlobal [_x,200];} forEach _magazines;
		{partyBox addItemCargoGlobal [_x, 200];} forEach _items;
		{partyBox addBackpackCargoGlobal [_x, 50];} forEach _backpacks;

	};

	sleep 0.1;
	
		"C_man_1" createUnit [[3422.07,12809.8,0],(createGroup civilian),"
		this setDir 300;
		removeallWeapons this; 
		this allowDamage false; 
		this enableSimulation false;
		this addAction[""Sky Diving"",lhm_fnc_skyDiving,player,0,false,false,"""",'_target distance _this < 5'];
		"];
		
	sleep 0.1;
	beachtrigger = createTrigger ["EmptyDetector", [3385.3889, 12780.962, -2.0980835e-005]];
	beachtrigger setTriggerArea [4, 8, -101.3401, true];
	beachtrigger setTriggerActivation ["ANY", "PRESENT", true];
	beachtrigger setTriggerStatements ["{(_x isKindOf 'LandVehicle')} count thisList > 0; local this;", "Hint 'Hoooooray what a speeeeeeeeeeeeeeeeeeeeed!';_vehicle = vehicle player;  _vel = velocity _vehicle;  _dir = direction _vehicle;  _speed = 70;  _vehicle setVelocity [   (_vel select 0) + (sin _dir * _speed),    (_vel select 1) + (cos _dir * _speed),    (_vel select 2)  ]; vehicle player setDamage 0.99;", ""];
	sleep 1;
	publicVariable "beachtrigger";
	sleep 0.1;
	
	// Play Music
	[] spawn 
	{
		while {beachpartykav == 1} do 
		{
			[[beachPartyMusic,"clubmusic"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp; 
			sleep 41.729;
		};
	};
	
}
else
{
deleteVehicle partyBox;
deleteVehicle beachtrigger;
beachtrigger = nil;
PublicVariable "beachtrigger";
{deleteVehicle _x}forEach ( [3426.9963, 12806.521, 5.9127808e-005] nearObjects ["All",125]);
sleep 0.1;
//deleteMarker "Beachparty";

diag_log "EVENT:BeachParty Kavala deactivated!";

beachpartykav = 0;

};  