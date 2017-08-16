/*
	File: markt.sqf
	Author: Niklas "Rappelkiste" Quenter
	Server: e-Monkeys.com

	Information: Objekte:182 | Kavala Marktplatz
*/

_initCodes = [];

//Mauer
_vehicle_001 = "Land_City_8m_F" createvehiclelocal [3632.6079, 13098, -0.5];
_vehicle_001 setDir 92.655472;
_vehicle_001 setPos [3632.6079, 13098, -0.5];
_vehicle_001 allowDamage false;
_vehicle_001 enableSimulation false;

_vehicle_002 = "Land_City_8m_F" createvehiclelocal [3673.3147, 13094.822, -0.5];
_vehicle_002 setDir 269.26144;
_vehicle_002 setPos [3673.3147, 13094.822, -0.5];
_vehicle_002 allowDamage false;
_vehicle_002 enableSimulation false;
_vehicle_002 setVectorUp [0,0,1];

_vehicle_003 = "Land_City_8m_F" createvehiclelocal [3673.2319, 13101.822, -0.5];
_vehicle_003 setDir 269.29276;
_vehicle_003 setPos [3673.2319, 13101.822, -0.5];
_vehicle_003 allowDamage false;
_vehicle_003 enableSimulation false;
_vehicle_003 setVectorUp [0,0,1];

_vehicle_004 = "Land_City_Pillar_F" createvehiclelocal [3673.2009, 13105.527, -0.5];
_vehicle_004 setDir 89.961266;
_vehicle_004 setPos [3673.2009, 13105.527, -0.5];
_vehicle_004 allowDamage false;
_vehicle_004 enableSimulation false;
_vehicle_004 setVectorUp [0,0,1];

_vehicle_005 = "Land_City_Pillar_F" createvehiclelocal [3673.1575, 13107.025, -0.5];
_vehicle_005 setDir 267.63571;
_vehicle_005 setPos [3673.1575, 13107.025, -0.5];
_vehicle_005 allowDamage false;
_vehicle_005 enableSimulation false;
_vehicle_005 setVectorUp [0,0,1];

_vehicle_006 = "Land_City_4m_F" createvehiclelocal [3651.7537, 13127.011, -0.5];
_vehicle_006 setDir 92.757538;
_vehicle_006 setPos [3651.7537, 13127.011, -0.5];
_vehicle_006 allowDamage false;
_vehicle_006 enableSimulation false;
_vehicle_006 setVectorUp [0,0,1];

_vehicle_007 = "Land_City_Pillar_F" createvehiclelocal [3646.7209, 13129.285, -0.5];
_vehicle_007 setDir 182.7247;
_vehicle_007 setPos [3646.7209, 13129.285, -0.5];
_vehicle_007 allowDamage false;
_vehicle_007 enableSimulation false;

_vehicle_008 = "Land_City_8m_F" createvehiclelocal [3672.9558, 13124.602, -0.5];
_vehicle_008 setDir 88.772972;
_vehicle_008 setPos [3672.9558, 13124.602, -0.5];
_vehicle_008 allowDamage false;
_vehicle_008 enableSimulation false;
_vehicle_008 setVectorUp [0,0,1];

_vehicle_009 = "Land_City_8m_F" createvehiclelocal [3673.0513, 13117.678, -0.5];
_vehicle_009 setDir 89.419685;
_vehicle_009 setPos [3673.0513, 13117.678, -0.5];
_vehicle_009 allowDamage false;
_vehicle_009 enableSimulation false;
_vehicle_009 setVectorUp [0,0,1];

_vehicle_010 = "Land_City_8m_F" createvehiclelocal [3673.1155, 13110.704, -0.5];
_vehicle_010 setDir 89.321419;
_vehicle_010 setPos [3673.1155, 13110.704, -0.5];
_vehicle_010 allowDamage false;
_vehicle_010 enableSimulation false;
_vehicle_010 setVectorUp [0,0,1];

_vehicle_011 = "Land_City_Pillar_F" createvehiclelocal [3647.9001, 13125.724, -0.5];
_vehicle_011 setDir 182.86452;
_vehicle_011 setPos [3647.9001, 13125.724, -0.5];
_vehicle_011 allowDamage false;
_vehicle_011 enableSimulation false;

_vehicle_012 = "Land_City_Pillar_F" createvehiclelocal [3633.3784, 13114.648, -0.5];
_vehicle_012 setDir 182.6821;
_vehicle_012 setPos [3633.3784, 13114.648, -0.5];
_vehicle_012 allowDamage false;
_vehicle_012 enableSimulation false;
_vehicle_012 setVectorUp [0,0,1];

_vehicle_013 = "Land_City_8m_F" createvehiclelocal [3662.1284, 13128.434, -0.45029014];
_vehicle_013 setDir 3.1293967;
_vehicle_013 setPos [3662.1284, 13128.434, -0.45029014];
_vehicle_013 allowDamage false;
_vehicle_013 enableSimulation false;

_vehicle_014 = "Land_City_8m_F" createvehiclelocal [3655.1257, 13128.825, -0.42629164];
_vehicle_014 setDir 3.1293967;
_vehicle_014 setPos [3655.1257, 13128.825, -0.42629164];
_vehicle_014 allowDamage false;
_vehicle_014 enableSimulation false;

_vehicle_015 = "Land_City_4m_F" createvehiclelocal [3646.6016, 13127.313, -0.45953557];
_vehicle_015 setDir 92.757538;
_vehicle_015 setPos [3646.6016, 13127.313, -0.45953557];
_vehicle_015 allowDamage false;
_vehicle_015 enableSimulation false;
_vehicle_015 setVectorUp [0,0,1];

_vehicle_016 = "Land_City_8m_F" createvehiclelocal [3643.0103, 13129.492, -0.44390202];
_vehicle_016 setDir 3.1293967;
_vehicle_016 setPos [3643.0103, 13129.492, -0.44390202];
_vehicle_016 allowDamage false;
_vehicle_016 enableSimulation false;

_vehicle_017 = "Land_City_8m_F" createvehiclelocal [3636.0149, 13129.889, -0.42692333];
_vehicle_017 setDir 3.1293967;
_vehicle_017 setPos [3636.0149, 13129.889, -0.42692333];
_vehicle_017 allowDamage false;
_vehicle_017 enableSimulation false;

_vehicle_018 = "Land_City_8m_F" createvehiclelocal [3629.042, 13130.273, -0.43139705];
_vehicle_018 setDir 3.1293967;
_vehicle_018 setPos [3629.042, 13130.273, -0.43139705];
_vehicle_018 allowDamage false;
_vehicle_018 enableSimulation false;

_vehicle_019 = "Land_City_4m_F" createvehiclelocal [3632.2761, 13123.096, -0.41988674];
_vehicle_019 setDir 363.1134;
_vehicle_019 setPos [3632.2761, 13123.096, -0.41988674];
_vehicle_019 allowDamage false;
_vehicle_019 enableSimulation false;

_vehicle_020 = "Land_City_8m_F" createvehiclelocal [3669.1367, 13128.049, -0.49645883];
_vehicle_020 setDir 3.1293967;
_vehicle_020 setPos [3669.1367, 13128.049, -0.49645883];
_vehicle_020 allowDamage false;
_vehicle_020 enableSimulation false;

_vehicle_021 = "Land_City_8m_F" createvehiclelocal [3629.4897, 13105.154, -0.49534214];
_vehicle_021 setDir 92.655472;
_vehicle_021 setPos [3629.4897, 13105.154, -0.49534214];
_vehicle_021 allowDamage false;
_vehicle_021 enableSimulation false;

_vehicle_022 = "Land_City_Pillar_F" createvehiclelocal [3650.3611, 13125.535, -0.4846203];
_vehicle_022 setDir 182.86452;
_vehicle_022 setPos [3650.3611, 13125.535, -0.4846203];
_vehicle_022 allowDamage false;
_vehicle_022 enableSimulation false;

_vehicle_023 = "Land_City_8m_F" createvehiclelocal [3633.9619, 13126.731, -0.42683777];
_vehicle_023 setDir 92.655472;
_vehicle_023 setPos [3633.9619, 13126.731, -0.42683777];
_vehicle_023 allowDamage false;
_vehicle_023 enableSimulation false;

_vehicle_024 = "Land_City_8m_F" createvehiclelocal [3630.1118, 13119.936, -0.42782754];
_vehicle_024 setDir 92.655472;
_vehicle_024 setPos [3630.1118, 13119.936, -0.42782754];
_vehicle_024 allowDamage false;
_vehicle_024 enableSimulation false;

_vehicle_025 = "Land_City_4m_F" createvehiclelocal [3630.7959, 13101.357, -0.49731416];
_vehicle_025 setDir 182.80086;
_vehicle_025 setPos [3630.7959, 13101.357, -0.49731416];
_vehicle_025 allowDamage false;
_vehicle_025 enableSimulation false;

_vehicle_026 = "Land_City_4m_F" createvehiclelocal [3631.6367, 13108.319, -0.49460036];
_vehicle_026 setDir 362.98334;
_vehicle_026 setPos [3631.6367, 13108.319, -0.49460036];
_vehicle_026 allowDamage false;
_vehicle_026 enableSimulation false;

_vehicle_027 = "Land_City_Pillar_F" createvehiclelocal [3629.9304, 13116.205, -0.42606822];
_vehicle_027 setDir 273.92639;
_vehicle_027 setPos [3629.9304, 13116.205, -0.42606822];
_vehicle_027 allowDamage false;
_vehicle_027 enableSimulation false;

_vehicle_028 = "Land_City_4m_F" createvehiclelocal [3631.9182, 13116.102, -0.42771113];
_vehicle_028 setDir 362.98334;
_vehicle_028 setPos [3631.9182, 13116.102, -0.42771113];
_vehicle_028 allowDamage false;
_vehicle_028 enableSimulation false;

_vehicle_029 = "Land_City_Pillar_F" createvehiclelocal [3633.2056, 13109.708, -0.51035833];
_vehicle_029 setDir 182.6821;
_vehicle_029 setPos [3633.2056, 13109.708, -0.51035833];
_vehicle_029 allowDamage false;
_vehicle_029 enableSimulation false;
_vehicle_029 setVectorUp [0,0,1];

_vehicle_030 = "Land_City_Pillar_F" createvehiclelocal [3633.2737, 13111.13, -0.50559926];
_vehicle_030 setPos [3633.2737, 13111.13, -0.50559926];
_vehicle_030 setDir 182.6821;
_vehicle_030 allowDamage false;
_vehicle_030 enableSimulation false;
_vehicle_030 setVectorUp [0,0,1];

_vehicle_031 = "Land_City_Pillar_F" createvehiclelocal [3633.3193, 13113.206, -0.49167836];
_vehicle_031 setDir 182.6821;
_vehicle_031 setPos [3633.3193, 13113.206, -0.49167836];
_vehicle_031 allowDamage false;
_vehicle_031 enableSimulation false;
_vehicle_031 setVectorUp [0,0,1];

_vehicle_032 = "Land_City_8m_F" createvehiclelocal [3669.6321, 13091.744, -0.5550555];
_vehicle_032 setDir 3.229882;
_vehicle_032 setPos [3669.6321, 13091.744, -0.5550555];
_vehicle_032 allowDamage false;
_vehicle_032 enableSimulation false;
_vehicle_032 setVectorUp [0,0,1];

_vehicle_033 = "Land_City_8m_F" createvehiclelocal [3662.6548, 13092.145, -0.53764457];
_vehicle_033 setDir 3.229882;
_vehicle_033 setPos [3662.6548, 13092.145, -0.53764457];
_vehicle_033 allowDamage false;
_vehicle_033 enableSimulation false;
_vehicle_033 setVectorUp [0,0,1];

_vehicle_034 = "Land_City_8m_F" createvehiclelocal [3655.677, 13092.535, -0.50245291];
_vehicle_034 setDir 3.1002123;
_vehicle_034 setPos [3655.677, 13092.535, -0.50245291];
_vehicle_034 allowDamage false;
_vehicle_034 enableSimulation false;
_vehicle_034 setVectorUp [0,0,1];

_vehicle_035 = "Land_City_8m_F" createvehiclelocal [3648.6953, 13092.924, -0.42940876];
_vehicle_035 setDir 3.1002123;
_vehicle_035 setPos [3648.6953, 13092.924, -0.42940876];
_vehicle_035 allowDamage false;
_vehicle_035 enableSimulation false;
_vehicle_035 setVectorUp [0,0,1];

_vehicle_036 = "Land_City_8m_F" createvehiclelocal [3641.6753, 13093.315, -0.3799704];
_vehicle_036 setDir 3.1002123;
_vehicle_036 setPos [3641.6753, 13093.315, -0.3799704];
_vehicle_036 allowDamage false;
_vehicle_036 enableSimulation false;
_vehicle_036 setVectorUp [0,0,1];

_vehicle_037 = "Land_City_8m_F" createvehiclelocal [3634.6899, 13093.703, -0.47943664];
_vehicle_037 setDir 3.1002123;
_vehicle_037 setPos [3634.6899, 13093.703, -0.47943664];
_vehicle_037 allowDamage false;
_vehicle_037 enableSimulation false;
_vehicle_037 setVectorUp [0,0,1];

_vehicle_038 = "Land_City_8m_F" createvehiclelocal [3627.707, 13094.087, -0.51988584];
_vehicle_038 setDir 3.1002123;
_vehicle_038 setPos [3627.707, 13094.087, -0.51988584];
_vehicle_038 allowDamage false;
_vehicle_038 enableSimulation false;
_vehicle_038 setVectorUp [0,0,1];

_vehicle_039 = "Land_City_4m_F" createvehiclelocal [3623.2798, 13094.325, -0.53725004];
_vehicle_039 setDir 183.00734;
_vehicle_039 setPos [3623.2798, 13094.325, -0.53725004];
_vehicle_039 allowDamage false;
_vehicle_039 enableSimulation false;
_vehicle_039 setVectorUp [0,0,1];

_vehicle_040 = "Land_City_Pillar_F" createvehiclelocal [3632.4565, 13094.298, -0.42755637];
_vehicle_040 setDir 93.088699;
_vehicle_040 setPos [3632.4565, 13094.298, -0.42755637];
_vehicle_040 allowDamage false;
_vehicle_040 enableSimulation false;
_vehicle_040 setVectorUp [0,0,1];

_vehicle_041 = "Land_City_Pillar_F" createvehiclelocal [3632.4226, 13093.854, -0.41909266];
_vehicle_041 setDir 93.088699;
_vehicle_041 setPos [3632.4226, 13093.854, -0.41909266];
_vehicle_041 allowDamage false;
_vehicle_041 enableSimulation false;
_vehicle_041 setVectorUp [0,0,1];

_vehicle_042 = "Land_Pipe_fence_4m_F" createvehiclelocal [3676.5203, 13124.087, -0.22634976];
_vehicle_042 setPos [3676.5203, 13124.087, -0.22634976];
_vehicle_042 allowDamage false;
_vehicle_042 enableSimulation false;
_vehicle_042 setVectorUp [0,0,1];

//Bürgersteig
_vehicle_043 = "Land_Pavement_narrow_F" createvehiclelocal [3674.0764, 13125.359, -7.6293945e-006];
_vehicle_043 setDir -91.165665;
_vehicle_043 setPos [3674.0764, 13125.359, -7.6293945e-006];
_vehicle_043 allowDamage false;
_vehicle_043 enableSimulation false;

_vehicle_044 = "Land_Pavement_narrow_corner_F" createvehiclelocal [3674.0154, 13128.396, -0.043045152];
_vehicle_044 setDir -91.713882;
_vehicle_044 setPos [3674.0154, 13128.396, -0.043045152];
_vehicle_044 allowDamage false;
_vehicle_044 enableSimulation false;

_vehicle_045 = "Land_Pavement_narrow_F" createvehiclelocal [3657.0413, 13130.032, 0.0031395881];
_vehicle_045 setDir -177.50877;
_vehicle_045 setPos [3657.0413, 13130.032, 0.0031395881];
_vehicle_045 allowDamage false;
_vehicle_045 enableSimulation false;

_vehicle_046 = "Land_Pavement_narrow_F" createvehiclelocal [3660.9998, 13129.854, 0.025772391];
_vehicle_046 setDir -177.27763;
_vehicle_046 setPos [3660.9998, 13129.854, 0.025772391];
_vehicle_046 allowDamage false;
_vehicle_046 enableSimulation false;
_vehicle_046 setVectorUp [0,0,1];

_vehicle_047 = "Land_Pavement_narrow_F" createvehiclelocal [3664.5291, 13129.693, 2.7656555e-005];
_vehicle_047 setDir -177.15019;
_vehicle_047 setPos [3664.5291, 13129.693, 2.7656555e-005];
_vehicle_047 allowDamage false;
_vehicle_047 enableSimulation false;
_vehicle_047 setVectorUp [0,0,1];

_vehicle_048 = "Land_Pavement_narrow_F" createvehiclelocal [3667.3042, 13129.559, 1.335144e-005];
_vehicle_048 setDir -177.15019;
_vehicle_048 setPos [3667.3042, 13129.559, 1.335144e-005];
_vehicle_048 allowDamage false;
_vehicle_048 enableSimulation false;

_vehicle_049 = "Land_Pavement_narrow_F" createvehiclelocal [3670.4451, 13129.407, -8.5830688e-006];
_vehicle_049 setDir -176.86513;
_vehicle_049 setPos [3670.4451, 13129.407, -8.5830688e-006];
_vehicle_049 allowDamage false;
_vehicle_049 enableSimulation false;
_vehicle_049 setVectorUp [0,0,1];

_vehicle_050 = "Land_Pavement_narrow_F" createvehiclelocal [3654.0552, 13130.158, 0.0022586943];
_vehicle_050 setDir -177.34816;
_vehicle_050 setPos [3654.0552, 13130.158, 0.0022586943];
_vehicle_050 allowDamage false;
_vehicle_050 enableSimulation false;
_vehicle_050 setVectorUp [0,0,1];

_vehicle_051 = "Land_Pavement_narrow_F" createvehiclelocal [3643.7678, 13130.727, 0.022616778];
_vehicle_051 setDir -177.7867;
_vehicle_051 setPos [3643.7678, 13130.727, 0.022616778];
_vehicle_051 allowDamage false;
_vehicle_051 enableSimulation false;

_vehicle_052 = "Land_Pavement_narrow_F" createvehiclelocal [3639.8394, 13130.903, 2.8610229e-006];
_vehicle_052 setDir -177.03084;
_vehicle_052 setPos [3639.8394, 13130.903, 2.8610229e-006];
_vehicle_052 allowDamage false;
_vehicle_052 enableSimulation false;
_vehicle_052 setVectorUp [0,0,1];

_vehicle_053 = "Land_Pavement_narrow_F" createvehiclelocal [3635.9192, 13131.099, 1.6212463e-005];
_vehicle_053 setDir -177.07674;
_vehicle_053 setPos [3635.9192, 13131.099, 1.6212463e-005];
_vehicle_053 allowDamage false;
_vehicle_053 enableSimulation false;

_vehicle_054 = "Land_Pavement_narrow_F" createvehiclelocal [3631.9551, 13131.314, -0.02248951];
_vehicle_054 setDir -176.9077;
_vehicle_054 setPos [3631.9551, 13131.314, -0.02248951];
_vehicle_054 allowDamage false;
_vehicle_054 enableSimulation false;
_vehicle_054 setVectorUp [0,0,1];

_vehicle_055 = "Land_Pavement_narrow_F" createvehiclelocal [3627.9731, 13131.529, 3.8146973e-006];
_vehicle_055 setDir -176.67;
_vehicle_055 setPos [3627.9731, 13131.529, 3.8146973e-006];
_vehicle_055 allowDamage false;
_vehicle_055 enableSimulation false;
_vehicle_055 setVectorUp [0,0,1];

_vehicle_056 = "Land_Pavement_narrow_F" createvehiclelocal [3644.5813, 13130.699, 0.02233679];
_vehicle_056 setDir -177.79352;
_vehicle_056 setPos [3644.5813, 13130.699, 0.02233679];
_vehicle_056 allowDamage false;
_vehicle_056 enableSimulation false;

//Parkplatz
_vehicle_057 = "Land_Concrete_SmallWall_8m_F" createvehiclelocal [3628.397, 13097.995, -0.69999999];
_vehicle_057 setDir 183.32442;
_vehicle_057 setPos [3628.397, 13097.995, -0.69999999];
_vehicle_057 allowDamage false;
_vehicle_057 enableSimulation false;

_vehicle_058 = "Land_Concrete_SmallWall_8m_F" createvehiclelocal [3629.7515, 13126.713, -0.69999999];
_vehicle_058 setDir 182.8219;
_vehicle_058 setPos [3629.7515, 13126.713, -0.69999999];
_vehicle_058 allowDamage false;
_vehicle_058 enableSimulation false;

_vehicle_059 = "Land_Noticeboard_F" createvehiclelocal [3633.624, 13124.739, 1.1444092e-005];
_vehicle_059 setDir 92.738785;
_vehicle_059 setPos [3633.624, 13124.739, 1.1444092e-005];
_vehicle_059 setObjectTexture [0, "core\textures\map\ppla.paa"];
_vehicle_059 allowDamage false;
_vehicle_059 enableSimulation false;
_vehicle_059 setVectorUp [0,0,1];

_vehicle_060 = "Land_Noticeboard_F" createvehiclelocal [3633.7888, 13128.2, 1.8119812e-005];
_vehicle_060 setDir 92.738785;
_vehicle_060 setPos [3633.7888, 13128.2, 1.8119812e-005];
_vehicle_060 setObjectTexture [0, "core\textures\map\ppla.paa"];
_vehicle_060 allowDamage false;
_vehicle_060 enableSimulation false;
_vehicle_060 setVectorUp [0,0,1];

_vehicle_061 = "Land_Noticeboard_F" createvehiclelocal [3632.4192, 13099.517, 1.9073486e-006];
_vehicle_061 setDir 92.632622;
_vehicle_061 setPos [3632.4192, 13099.517, 1.9073486e-006];
_vehicle_061 setObjectTexture [0, "core\textures\map\ppf.paa"];
_vehicle_061 allowDamage false;
_vehicle_061 enableSimulation false;
_vehicle_061 setVectorUp [0,0,1];

_vehicle_062 = "SignAd_Sponsor_F" createvehiclelocal [3632.2695, 13095.978, 6.6757202e-006];
_vehicle_062 setDir 92.632622;
_vehicle_062 setPos [3632.2695, 13095.978, 6.6757202e-006];
_vehicle_062 setObjectTexture [0, "core\textures\map\feuerwehrpp.paa"];
_vehicle_062 allowDamage false;
_vehicle_062 enableSimulation false;
_vehicle_062 setVectorUp [0,0,1];

//Markt Objekte
_vehicle_063 = "Land_i_Addon_03_V1_F" createvehiclelocal [3638.9636, 13126.383, -0.60000002];
_vehicle_063 setDir 3.1361644;
_vehicle_063 setPos [3638.9636, 13126.383, -0.60000002];
_vehicle_063 allowDamage false;
_vehicle_063 enableSimulation false;
_vehicle_063 setVectorUp [0,0,1];

_vehicle_064 = "Land_CashDesk_F" createvehiclelocal [3635.2297, 13125.99, 0.27723849];
_vehicle_064 setDir -177.00374;
_vehicle_064 setPos [3635.2297, 13125.99, 0.27723849];
_vehicle_064 allowDamage false;
_vehicle_064 enableSimulation false;
_vehicle_064 setVectorUp [0,0,1];

_vehicle_065 = "Land_GarbageBin_01_F" createvehiclelocal [3666.3098, 13112.306];
_vehicle_065 setDir 90.068275;
_vehicle_065 setPos [3666.3098, 13112.306];
_vehicle_065 allowDamage false;
_vehicle_065 enableSimulation false;
_vehicle_065 setVectorUp [0,0,1];

_vehicle_066 = "Land_TouristShelter_01_F" createvehiclelocal [3658.0928, 13125.601, -0.22254376];
_vehicle_066 setDir 3.0415585;
_vehicle_066 setPos [3658.0928, 13125.601, -0.22254376];
_vehicle_066 allowDamage false;
_vehicle_066 enableSimulation false;
_vehicle_066 setVectorUp [0,0,1];

_vehicle_067 = "Land_Bench_02_F" createvehiclelocal [3668.4561, 13109.601];
_vehicle_067 setDir -0.48142686;
_vehicle_067 setPos [3668.4561, 13109.601];
_vehicle_067 allowDamage false;
_vehicle_067 enableSimulation false;
_vehicle_067 setVectorUp [0,0,1];

_vehicle_068 = "Land_CratesWooden_F" createvehiclelocal [3665.6069, 13118.104, 0.022759236];
_vehicle_068 setDir 453.60342;
_vehicle_068 setPos [3665.6069, 13118.104, 0.022759236];
_vehicle_068 allowDamage false;
_vehicle_068 enableSimulation false;
_vehicle_068 setVectorUp [0,0,1];

_vehicle_069 = "Land_Sunshade_04_F" createvehiclelocal [3630.9873, 13104.839, 0.30000001];
_vehicle_069 setDir 2.2846854;
_vehicle_069 setPos [3630.9873, 13104.839, 0.30000001];
_vehicle_069 allowDamage false;
_vehicle_069 enableSimulation false;
_vehicle_069 setVectorUp [0,0,1];

_vehicle_070 = "Land_Bench_F" createvehiclelocal [3630.8809, 13105.507, -0.01510883];
_vehicle_070 setDir -446.47687;
_vehicle_070 setPos [3630.8809, 13105.507, -0.01510883];
_vehicle_070 allowDamage false;
_vehicle_070 enableSimulation false;
_vehicle_070 setVectorUp [0,0,1];

_vehicle_071 = "Land_WoodenTable_large_F" createvehiclelocal [3630.979, 13106.644, -0.015366243];
_vehicle_071 setDir -267.57391;
_vehicle_071 setPos [3630.979, 13106.644, -0.015366243];
_vehicle_071 allowDamage false;
_vehicle_071 enableSimulation false;
_vehicle_071 setVectorUp [0,0,1];

_vehicle_072 = "Land_Bench_F" createvehiclelocal [3631.0068, 13107.884, -0.00703137];
_vehicle_072 setDir -267.57391;
_vehicle_072 setPos [3631.0068, 13107.884, -0.00703137];
_vehicle_072 allowDamage false;
_vehicle_072 enableSimulation false;
_vehicle_072 setVectorUp [0,0,1];

_vehicle_073 = "Land_Sun_chair_F" createvehiclelocal [3632.0986, 13117.224];
_vehicle_073 setDir -294.22266;
_vehicle_073 setPos [3632.0986, 13117.224];
_vehicle_073 allowDamage false;
_vehicle_073 enableSimulation false;
_vehicle_073 setVectorUp [0,0,1];

_vehicle_074 = "Land_Sun_chair_F" createvehiclelocal [3631.5391, 13118.554];
_vehicle_074 setDir -294.22266;
_vehicle_074 setPos [3631.5391, 13118.554];
_vehicle_074 allowDamage false;
_vehicle_074 enableSimulation false;
_vehicle_074 setVectorUp [0,0,1];

_vehicle_075 = "Land_Sun_chair_F" createvehiclelocal [3631.6436, 13120.737];
_vehicle_075 setDir -233.15929;
_vehicle_075 setPos [3631.6436, 13120.737];
_vehicle_075 allowDamage false;
_vehicle_075 enableSimulation false;
_vehicle_075 setVectorUp [0,0,1];

_vehicle_076 = "Land_Sun_chair_F" createvehiclelocal [3632.5134, 13121.814];
_vehicle_076 setDir -233.15929;
_vehicle_076 setPos [3632.5134, 13121.814];
_vehicle_076 allowDamage false;
_vehicle_076 enableSimulation false;
_vehicle_076 setVectorUp [0,0,1];

_vehicle_077 = "Land_GarbageBin_01_F" createvehiclelocal [3629.2146, 13108.446];
_vehicle_077 setDir 94.647728;
_vehicle_077 setPos [3629.2146, 13108.446];
_vehicle_077 allowDamage false;
_vehicle_077 enableSimulation false;
_vehicle_077 setVectorUp [0,0,1];

_vehicle_078 = "UserTexture10m_F" createvehiclelocal [3659.8745, 13124.534, -1.7];
_vehicle_078 setDir 2.2705336;
_vehicle_078 setPos [3659.8745, 13124.534, -1.7];
_vehicle_078 setObjectTexture[0, "core\textures\map\info.paa"];
_vehicle_078 allowDamage false;
_vehicle_078 enableSimulation false;
_vehicle_078 setVectorUp [0,0,1];

_vehicle_079 = "Land_TableDesk_F" createvehiclelocal [3641.478, 13128.429, 0.18812397];
_vehicle_079 setDir 92.714806;
_vehicle_079 setPos [3641.478, 13128.429, 0.18812397];
_vehicle_079 allowDamage false;
_vehicle_079 enableSimulation false;
_vehicle_079 setVectorUp [0,0,1];

_vehicle_080 = "Land_Maroula_F" createvehiclelocal [3649.2131, 13110.814, -0.46004957];
_vehicle_080 setDir 40.811512;
_vehicle_080 setPos [3649.2131, 13110.814, -0.46004957];
_vehicle_080 allowDamage false;
_vehicle_080 enableSimulation false;
_vehicle_080 setVectorUp [0,0,1];

_vehicle_081 = "Land_Can_V3_F" createvehiclelocal [3634.5068, 13100.204, 0.92190903];
_vehicle_081 setPos [3634.5068, 13100.204, 0.92190903];
_vehicle_081 allowDamage false;
_vehicle_081 enableSimulation false;
_vehicle_081 setVectorUp [0,0,1];

_vehicle_082 = "Land_Can_V2_F" createvehiclelocal [3634.5024, 13100.091, 0.9245984];
_vehicle_082 setPos [3634.5024, 13100.091, 0.9245984];
_vehicle_082 allowDamage false;
_vehicle_082 enableSimulation false;
_vehicle_082 setVectorUp [0,0,1];

_vehicle_083 = "Land_Can_V1_F" createvehiclelocal [3634.5156, 13099.962, 0.91303003];
_vehicle_083 setPos [3634.5156, 13099.962, 0.91303003];
_vehicle_083 allowDamage false;
_vehicle_083 enableSimulation false;
_vehicle_083 setVectorUp [0,0,1];

_vehicle_084 = "Land_Can_V3_F" createvehiclelocal [3634.5208, 13099.821, 0.91816461];
_vehicle_084 setPos [3634.5208, 13099.821, 0.91816461];
_vehicle_084 allowDamage false;
_vehicle_084 enableSimulation false;
_vehicle_084 setVectorUp [0,0,1];

_vehicle_085 = "Land_BottlePlastic_V1_F" createvehiclelocal [3634.5901, 13099.571, 0.91576964];
_vehicle_085 setPos [3634.5901, 13099.571, 0.91576964];
_vehicle_085 allowDamage false;
_vehicle_085 enableSimulation false;
_vehicle_085 setVectorUp [0,0,1];

_vehicle_086 = "Land_Bench_02_F" createvehiclelocal [3629.4238, 13119.716, 1.9073486e-006];
_vehicle_086 setDir 92.902855;
_vehicle_086 setPos [3629.4238, 13119.716, 1.9073486e-006];
_vehicle_086 allowDamage false;
_vehicle_086 enableSimulation false;
_vehicle_086 setVectorUp [0,0,1];

_vehicle_087 = "Land_Bench_F" createvehiclelocal [3630.8206, 13104.204];
_vehicle_087 setDir -267.57391;
_vehicle_087 setPos [3630.8206, 13104.204];
_vehicle_087 allowDamage false;
_vehicle_087 enableSimulation false;
_vehicle_087 setVectorUp [0,0,1];

_vehicle_088 = "Land_WoodenTable_large_F" createvehiclelocal [3630.8093, 13103.017, 0.0083332062];
_vehicle_088 setDir -267.57391;
_vehicle_088 setPos [3630.8093, 13103.017, 0.0083332062];
_vehicle_088 allowDamage false;
_vehicle_088 enableSimulation false;
_vehicle_088 setVectorUp [0,0,1];

_vehicle_089 = "Land_Bench_F" createvehiclelocal [3630.7581, 13101.836, 0.011102676];
_vehicle_089 setDir -446.47687;
_vehicle_089 setPos [3630.7581, 13101.836, 0.011102676];
_vehicle_089 allowDamage false;
_vehicle_089 enableSimulation false;
_vehicle_089 setVectorUp [0,0,1];

_vehicle_090 = "Land_Sunshade_03_F" createvehiclelocal [3631.7966, 13117.861, 2.1934509e-005];
_vehicle_090 setDir -22.997465;
_vehicle_090 setPos [3631.7966, 13117.861, 2.1934509e-005];
_vehicle_090 allowDamage false;
_vehicle_090 enableSimulation false;
_vehicle_090 setVectorUp [0,0,1];

_vehicle_091 = "Land_Sunshade_03_F" createvehiclelocal [3632.0972, 13121.254, 3.8146973e-006];
_vehicle_091 setDir -51.825199;
_vehicle_091 setPos [3632.0972, 13121.254, 3.8146973e-006];
_vehicle_091 allowDamage false;
_vehicle_091 enableSimulation false;
_vehicle_091 setVectorUp [0,0,1];

_vehicle_092 = "Land_Bench_02_F" createvehiclelocal [3628.825, 13104.935, 2.7656555e-005];
_vehicle_092 setDir 92.902855;
_vehicle_092 setPos [3628.825, 13104.935, 2.7656555e-005];
_vehicle_092 allowDamage false;
_vehicle_092 enableSimulation false;
_vehicle_092 setVectorUp [0,0,1];

_vehicle_093 = "Land_i_Addon_04_V1_F" createvehiclelocal [3669.7534, 13114.95, -0.76868993];
_vehicle_093 setDir 89.599091;
_vehicle_093 setPos [3669.7534, 13114.95, -0.76868993];
_vehicle_093 allowDamage false;
_vehicle_093 enableSimulation false;
_vehicle_093 setVectorUp [0,0,1];

_vehicle_094 = "Land_ChairWood_F" createvehiclelocal [3642.354, 13128.325, 0.27217984];
_vehicle_094 setDir -274.93857;
_vehicle_094 setPos [3642.354, 13128.325, 0.27217984];
_vehicle_094 allowDamage false;
_vehicle_094 enableSimulation false;
_vehicle_094 setVectorUp [0,0,1];

_vehicle_095 = "Land_Icebox_F" createvehiclelocal [3641.634, 13123.905, 0.30362299];
_vehicle_095 setDir -176.76801;
_vehicle_095 setPos [3641.634, 13123.905, 0.30362299];
_vehicle_095 allowDamage false;
_vehicle_095 enableSimulation false;
_vehicle_095 setVectorUp [0,0,1];

_vehicle_096 = "Land_GarbageBin_01_F" createvehiclelocal [3643.3105, 13126.415, 0.17809315];
_vehicle_096 setDir 94.695198;
_vehicle_096 setPos [3643.3105, 13126.415, 0.17809315];
_vehicle_096 allowDamage false;
_vehicle_096 enableSimulation false;
_vehicle_096 setVectorUp [0,0,1];

_vehicle_097 = "Land_ToiletBox_F" createvehiclelocal [3653.3369, 13127.578, 2.9563904e-005];
_vehicle_097 setDir 3.1392617;
_vehicle_097 setPos [3653.3369, 13127.578, 2.9563904e-005];
_vehicle_097 allowDamage false;
_vehicle_097 enableSimulation false;
_vehicle_097 setVectorUp [0,0,1];

_vehicle_098 = "Land_Bench_F" createvehiclelocal [3644.4058, 13095.857, -1.2397766e-005];
_vehicle_098 setDir -419.28543;
_vehicle_098 setPos [3644.4058, 13095.857, -1.2397766e-005];
_vehicle_098 allowDamage false;
_vehicle_098 enableSimulation false;
_vehicle_098 setVectorUp [0,0,1];

_vehicle_099 = "Land_WoodenTable_large_F" createvehiclelocal [3645.0117, 13096.822, 0.00041294098];
_vehicle_099 setDir -240.38228;
_vehicle_099 setPos [3645.0117, 13096.822, 0.00041294098];
_vehicle_099 allowDamage false;
_vehicle_099 enableSimulation false;
_vehicle_099 setVectorUp [0,0,1];

_vehicle_100 = "Land_Bench_F" createvehiclelocal [3645.6079, 13097.914, 0.013080597];
_vehicle_100 setDir -240.38228;
_vehicle_100 setPos [3645.6079, 13097.914, 0.013080597];
_vehicle_100 allowDamage false;
_vehicle_100 enableSimulation false;
_vehicle_100 setVectorUp [0,0,1];

_vehicle_101 = "Land_Bench_F" createvehiclelocal [3661.3875, 13104.424, 1.9073486e-006];
_vehicle_101 setDir -361.26318;
_vehicle_101 setPos [3661.3875, 13104.424, 1.9073486e-006];
_vehicle_101 allowDamage false;
_vehicle_101 enableSimulation false;
_vehicle_101 setVectorUp [0,0,1];

_vehicle_102 = "Land_WoodenTable_large_F" createvehiclelocal [3662.5295, 13104.404, 0.011324883];
_vehicle_102 setDir -182.42668;
_vehicle_102 setPos [3662.5295, 13104.404, 0.011324883];
_vehicle_102 allowDamage false;
_vehicle_102 enableSimulation false;
_vehicle_102 setVectorUp [0,0,1];

_vehicle_103 = "Land_Bench_F" createvehiclelocal [3663.6335, 13104.532, 0.023755074];
_vehicle_103 setDir -182.42668;
_vehicle_103 setPos [3663.6335, 13104.532, 0.023755074];
_vehicle_103 allowDamage false;
_vehicle_103 enableSimulation false;
_vehicle_103 setVectorUp [0,0,1];

_vehicle_104 = "Land_Bench_F" createvehiclelocal [3659.793, 13095.664, 1.1444092e-005];
_vehicle_104 setDir -473.98004;
_vehicle_104 setPos [3659.793, 13095.664, 1.1444092e-005];
_vehicle_104 allowDamage false;
_vehicle_104 enableSimulation false;
_vehicle_104 setVectorUp [0,0,1];

_vehicle_105 = "Land_WoodenTable_large_F" createvehiclelocal [3659.3318, 13096.709, 0.019468307];
_vehicle_105 setDir -295.07712;
_vehicle_105 setPos [3659.3318, 13096.709, 0.019468307];
_vehicle_105 allowDamage false;
_vehicle_105 enableSimulation false;
_vehicle_105 setVectorUp [0,0,1];

_vehicle_106 = "Land_Bench_F" createvehiclelocal [3658.8062, 13097.834, 0.052457809];
_vehicle_106 setDir -295.07712;
_vehicle_106 setPos [3658.8062, 13097.834, 0.052457809];
_vehicle_106 allowDamage false;
_vehicle_106 enableSimulation false;
_vehicle_106 setVectorUp [0,0,1];

_vehicle_107 = "Land_Sunshade_F" createvehiclelocal [3659.2876, 13096.724, -2.8610229e-006];
_vehicle_107 setPos [3659.2876, 13096.724, -2.8610229e-006];
_vehicle_107 allowDamage false;
_vehicle_107 enableSimulation false;
_vehicle_107 setVectorUp [0,0,1];

_vehicle_108 = "Land_Sunshade_F" createvehiclelocal [3644.9763, 13096.811, -1.4305115e-005];
_vehicle_108 setDir -52.394215;
_vehicle_108 setPos [3644.9763, 13096.811, -1.4305115e-005];
_vehicle_108 allowDamage false;
_vehicle_108 enableSimulation false;
_vehicle_108 setVectorUp [0,0,1];

_vehicle_109 = "Land_Sunshade_F" createvehiclelocal [3662.4773, 13104.479, 1.4305115e-005];
_vehicle_109 setDir -10.819137;
_vehicle_109 setPos [3662.4773, 13104.479, 1.4305115e-005];
_vehicle_109 allowDamage false;
_vehicle_109 enableSimulation false;
_vehicle_109 setVectorUp [0,0,1];

_vehicle_110 = "Land_BagFence_Long_F" createvehiclelocal [3666.7734, 13113.914, 0.022370547];
_vehicle_110 setDir -91.254791;
_vehicle_110 setPos [3666.7734, 13113.914, 0.022370547];
_vehicle_110 allowDamage false;
_vehicle_110 enableSimulation false;
_vehicle_110 setVectorUp [0,0,1];

_vehicle_111 = "Land_BagFence_Long_F" createvehiclelocal [3666.7314, 13116.795, 0.11402231];
_vehicle_111 setDir -91.254791;
_vehicle_111 setPos [3666.7314, 13116.795, 0.11402231];
_vehicle_111 allowDamage false;
_vehicle_111 enableSimulation false;
_vehicle_111 setVectorUp [0,0,1];

_vehicle_112 = "Land_BagFence_Long_F" createvehiclelocal [3668.3894, 13112.536, -1.7166138e-005];
_vehicle_112 setDir -181.28607;
_vehicle_112 setPos [3668.3894, 13112.536, -1.7166138e-005];
_vehicle_112 allowDamage false;
_vehicle_112 enableSimulation false;
_vehicle_112 setVectorUp [0,0,1];

_vehicle_113 = "Land_BagFence_Short_F" createvehiclelocal [3666.7212, 13118.887, 0.13384649];
_vehicle_113 setDir -91.258972;
_vehicle_113 setPos [3666.7212, 13118.887, 0.13384649];
_vehicle_113 allowDamage false;
_vehicle_113 enableSimulation false;
_vehicle_113 setVectorUp [0,0,1];

_vehicle_114 = "Land_BagFence_Long_F" createvehiclelocal [3668.3262, 13119.536, 0.044786543];
_vehicle_114 setDir -181.28607;
_vehicle_114 setPos [3668.3262, 13119.536, 0.044786543];
_vehicle_114 allowDamage false;
_vehicle_114 enableSimulation false;
_vehicle_114 setVectorUp [0,0,1];

_vehicle_115 = "Land_BagFence_Long_F" createvehiclelocal [3671.1814, 13119.598, 0.068508551];
_vehicle_115 setDir -181.28607;
_vehicle_115 setPos [3671.1814, 13119.598, 0.068508551];
_vehicle_115 allowDamage false;
_vehicle_115 enableSimulation false;
_vehicle_115 setVectorUp [0,0,1];

_vehicle_116 = "Land_WoodenCart_F" createvehiclelocal [3671.6843, 13117.178, 0.068030454];
_vehicle_116 setDir 8.3925047;
_vehicle_116 setPos [3671.6843, 13117.178, 0.068030454];
_vehicle_116 allowDamage false;
_vehicle_116 enableSimulation false;
_vehicle_116 setVectorUp [0,0,1];

_vehicle_117 = "Land_Pallets_stack_F" createvehiclelocal [3650.8406, 13094.903, 2.8610229e-006];
_vehicle_117 setDir -16.730848;
_vehicle_117 setPos [3650.8406, 13094.903, 2.8610229e-006];
_vehicle_117 allowDamage false;
_vehicle_117 enableSimulation false;
_vehicle_117 setVectorUp [0,0,1];

_vehicle_118 = "Land_Pallets_stack_F" createvehiclelocal [3650.832, 13094.889, 0.88376665];
_vehicle_118 setDir -16.730848;
_vehicle_118 setPos [3650.832, 13094.889, 0.88376665];
_vehicle_118 allowDamage false;
_vehicle_118 enableSimulation false;
_vehicle_118 setVectorUp [0,0,1];

_vehicle_119 = "Land_Pallets_F" createvehiclelocal [3651.6018, 13095.173, 0.0024207865];
_vehicle_119 setDir 44.759151;
_vehicle_119 setPos [3651.6018, 13095.173, 0.0024207865];
_vehicle_119 allowDamage false;
_vehicle_119 enableSimulation false;
_vehicle_119 setVectorUp [0,0,1];

_vehicle_120 = "Land_Sunshade_01_F" createvehiclelocal [3649.7063, 13094.844, -0.31457597];
_vehicle_120 setPos [3649.7063, 13094.844, -0.31457597];
_vehicle_120 allowDamage false;
_vehicle_120 enableSimulation false;
_vehicle_120 setVectorUp [0,0,1];

_vehicle_121 = "Land_WaterBarrel_F" createvehiclelocal [3649.7471, 13093.773, 9.5367432e-007];;
_vehicle_121 setPos [3649.7471, 13093.773, 9.5367432e-007];
_vehicle_121 allowDamage false;
_vehicle_121 enableSimulation false;
_vehicle_121 setVectorUp [0,0,1];

_vehicle_122 = "Land_Pallets_stack_F" createvehiclelocal [3648.447, 13094.969, -0.0019932359];
_vehicle_122 setDir 16.139668;
_vehicle_122 setPos [3648.447, 13094.969, -0.0019932359];
_vehicle_122 allowDamage false;
_vehicle_122 enableSimulation false;
_vehicle_122 setVectorUp [0,0,1];

_vehicle_123 = "Land_Saw_F" createvehiclelocal [3648.384, 13095.096, 0.85804278];
_vehicle_123 setPos [3648.384, 13095.096, 0.85804278];
_vehicle_123 allowDamage false;
_vehicle_123 enableSimulation false;
_vehicle_123 setVectorUp [0,0,1];

_vehicle_124 = "Land_ChairWood_F" createvehiclelocal [3635.0144, 13125.204, 0.27053609];
_vehicle_124 setDir -153.74933;
_vehicle_124 setPos [3635.0144, 13125.204, 0.27053609];
_vehicle_124 allowDamage false;
_vehicle_124 enableSimulation false;
_vehicle_124 setVectorUp [0,0,1];

_vehicle_125 = "Land_TreeBin_F" createvehiclelocal [3649.0381, 13110.947, -0.11634588];
_vehicle_125 setPos [3649.0381, 13110.947, -0.11634588];
_vehicle_125 allowDamage false;
_vehicle_125 enableSimulation false;
_vehicle_125 setVectorUp [0,0,1];

_vehicle_126 = "Land_Sacks_goods_F" createvehiclelocal [3660.8442, 13126.344];
_vehicle_126 setDir 64.626274;
_vehicle_126 setPos [3660.8442, 13126.344];
_vehicle_126 allowDamage false;
_vehicle_126 enableSimulation false;
_vehicle_126 setVectorUp [0,0,1];

_vehicle_127 = "Land_Carousel_01_F" createvehiclelocal [3670.5415, 13125.82, -9.5367432e-006];
_vehicle_127 setDir 171.70157;
_vehicle_127 setPos [3670.5415, 13125.82, -9.5367432e-006];
_vehicle_127 allowDamage false;
_vehicle_127 enableSimulation false;
_vehicle_127 setVectorUp [0,0,1];

_vehicle_128 = "Land_Slide_F" createvehiclelocal [3662.71, 13126.924, 2.1934509e-005];
_vehicle_128 setDir 13.181729;
_vehicle_128 setPos [3662.71, 13126.924, 2.1934509e-005];
_vehicle_128 allowDamage false;
_vehicle_128 enableSimulation false;
_vehicle_128 setVectorUp [0,0,1];

_vehicle_129 = "Land_Bench_F" createvehiclelocal [3657.0964, 13101.438, 6.6757202e-006];
_vehicle_129 setDir -403.29742;
_vehicle_129 setPos [3657.0964, 13101.438, 6.6757202e-006];
_vehicle_129 allowDamage false;
_vehicle_129 enableSimulation false;
_vehicle_129 setVectorUp [0,0,1];

_vehicle_130 = "Land_WoodenTable_large_F" createvehiclelocal [3657.9597, 13102.172, 0.0020904541];
_vehicle_130 setDir -224.461;
_vehicle_130 setPos [3657.9597, 13102.172, 0.0020904541];
_vehicle_130 allowDamage false;
_vehicle_130 enableSimulation false;
_vehicle_130 setVectorUp [0,0,1];

_vehicle_131 = "Land_Bench_F" createvehiclelocal [3658.6941, 13103.015, 0.0063714981];
_vehicle_131 setDir -224.461;
_vehicle_131 setPos [3658.6941, 13103.015, 0.0063714981];
_vehicle_131 allowDamage false;
_vehicle_131 enableSimulation false;
_vehicle_131 setVectorUp [0,0,1];

_vehicle_132 = "Land_Sunshade_F" createvehiclelocal [3657.8655, 13102.217, -0.0084095001];
_vehicle_132 setDir -52.853432;
_vehicle_132 setPos [3657.8655, 13102.217, -0.0084095001];
_vehicle_132 allowDamage false;
_vehicle_132 enableSimulation false;
_vehicle_132 setVectorUp [0,0,1];

//Lampen
_vehicle_133 = "Land_LampDecor_F" createvehiclelocal [3649.104, 13125.716, -0.5];
_vehicle_133 setDir 455.469;
_vehicle_133 setPos [3649.104, 13125.716, -0.5];
_vehicle_133 allowDamage false;
_vehicle_133 setVectorUp [0,0,1];

_vehicle_134 = "Land_LampDecor_F" createvehiclelocal [3663.5571, 13092.949];
_vehicle_134 setDir 358.282;
_vehicle_134 setPos [3663.5571, 13092.949];
_vehicle_134 allowDamage false;
_vehicle_134 setVectorUp [0,0,1];

_vehicle_135 = "Land_LampDecor_F" createvehiclelocal [3633.2744, 13112.173, -0.046767414];
_vehicle_135 setDir 541.23438;
_vehicle_135 setPos [3633.2744, 13112.173, -0.046767414];
_vehicle_135 allowDamage false;
_vehicle_135 setVectorUp [0,0,1];

_vehicle_136 = "Land_LampShabby_F" createvehiclelocal [3666.7964, 13112.494, -8.5830688e-006];
_vehicle_136 setDir 34.971695;
_vehicle_136 setPos [3666.7964, 13112.494, -8.5830688e-006];
_vehicle_136 allowDamage false;
_vehicle_136 setVectorUp [0,0,1];

//Werbetafeln
//VIP Tafel

_vehicle_137 = "Land_Billboard_F" createvehiclelocal [3642.0439, 13141.604, -1.081497];
_vehicle_137 setDir 3.3218634;
_vehicle_137 setPos [3642.0439, 13141.604, -1.081497];
_vehicle_137 setObjectTexture [0, "core\textures\map\billboards\vip_tafel.paa"];
_vehicle_137 allowDamage false;
_vehicle_137 enableSimulation false;
_vehicle_137 setVectorUp [0,0,1];

//Hauptstraße

_vehicle_138 = "Land_Billboard_F" createvehiclelocal [3608.78,13116,0];
_vehicle_138 setDir -83.7826;
_vehicle_138 setPos [3608.78,13116,0];
_vehicle_138 setObjectTexture [0, "core\textures\map\billboards\em_web.paa"];
_vehicle_138 allowDamage false;
_vehicle_138 enableSimulation false;
_vehicle_138 setVectorUp [0,0,1];

//Lotsen

_vehicle_139 = "Land_Billboard_F" createvehiclelocal [3633.665, 13142.067, -1.0733804];
_vehicle_139 setDir 3.5301754;
_vehicle_139 setPos [3633.665, 13142.067, -1.0733804];
_vehicle_139 setObjectTexture [0, "core\textures\map\billboards\billboard_lotsen.paa"];
_vehicle_139 allowDamage false;
_vehicle_139 enableSimulation false;
_vehicle_139 setVectorUp [0,0,1];

//Vermietbar

_vehicle_140 = "Land_Billboard_F" createvehiclelocal [3659.3945, 13140.502, -1.0851227];
_vehicle_140 setDir 3.6754327;
_vehicle_140 setPos [3659.3945, 13140.502, -1.0851227];
_vehicle_140 setObjectTexture [0,"core\textures\map\billboards\billboard_sog2.paa"];
_vehicle_140 allowDamage false;
_vehicle_140 enableSimulation false;
_vehicle_140 setVectorUp [0,0,1];

//ATM, Shops, e.t.c.

_vehicle_141 = "Land_Atm_01_F" createvehiclelocal [3639.689, 13098.707];
_vehicle_141 setDir 272.90643;
_vehicle_141 setPos [3639.689, 13098.707];
_initCodes pushBack [_vehicle_141,"this addAction[""<t color='#ADFF2F'>Bankautomat</t>"",EMonkeys_fnc_atmMenu,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
_vehicle_141 allowDamage false;
_vehicle_141 enableSimulation false;
_vehicle_141 setVectorUp [0,0,1];

_vehicle_142 = "Land_Laptop_unfolded_F" createvehiclelocal [3641.4888, 13128.651, 1.0093778];
_vehicle_142 setDir 264.65472;
_vehicle_142 setPos [3641.4888, 13128.651, 1.0093778];
_initCodes pushBack [_vehicle_142,"this addAction[""Lizenzen"",EMonkeys_fnc_buyLicences_extended,[""driver"",""boat"",""pilot"",""truck"",""log"",""home"",""jet""],0,true,true,"""",' playerSide == civilian || playerSide == east && player distance _target < 4 '];"];
_vehicle_142 setObjectTexture [0, "core\textures\map\laptop.paa"];
_vehicle_142 allowDamage false;
_vehicle_142 enableSimulation false;
_vehicle_142 setVectorUp [0,0,1];

_vehicle_143 = "Land_Laptop_unfolded_F" createvehiclelocal [3665.7131, 13099.8, 1.2631617];
_vehicle_143 setDir -54.033676;
_vehicle_143 setPos [3665.7131, 13099.8, 1.2631617];
_initCodes pushBack [_vehicle_143,"this addAction[""Batman's Stuff"",EMonkeys_fnc_weaponShopMenu,""genstore"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
_vehicle_143 setObjectTexture [0, "core\textures\map\laptop.paa"];
_vehicle_143 allowDamage false;
_vehicle_143 enableSimulation false;
_vehicle_143 setVectorUp [0,0,1];

_vehicle_144 = "Land_Laptop_unfolded_F" createvehiclelocal [3635.667, 13125.977, 1.2797871];
_vehicle_144 setDir 374.30692;
_vehicle_144 setPos [3635.667, 13125.977, 1.2797871];
_initCodes pushBack [_vehicle_144,"this addAction[""Bekleidung"",EMonkeys_fnc_clothingMenu,""bruce"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
_vehicle_144 setObjectTexture [0, "core\textures\map\laptop.paa"];
_vehicle_144 allowDamage false;
_vehicle_144 enableSimulation false;
_vehicle_144 setVectorUp [0,0,1];

_vehicle_145 = "Land_Laptop_unfolded_F" createvehiclelocal [3637.5371, 13101.295, 1.2708223];
_vehicle_145 setDir 3.6009352;
_vehicle_145 setPos [3637.5371, 13101.295, 1.2708223];
_initCodes pushBack [_vehicle_145,"this addAction[""Gemischtwaren-Händler"",EMonkeys_fnc_virt_menu,""gemischtwaren"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
_vehicle_145 setObjectTexture [0, "core\textures\map\laptop.paa"];
_vehicle_145 allowDamage false;
_vehicle_145 enableSimulation false;
_vehicle_145 setVectorUp [0,0,1];

_vehicle_146 = "Land_Laptop_unfolded_F" createvehiclelocal [3636.9695, 13101.326, 1.2708223];
_vehicle_146 setDir 3.6009352;
_vehicle_146 setPos [3636.9695, 13101.326, 1.2708223];
_initCodes pushBack [_vehicle_146,"this addAction[""Markt"",EMonkeys_fnc_virt_menu,""market"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
_vehicle_146 setObjectTexture [0, "core\textures\map\laptop.paa"];
_vehicle_146 allowDamage false;
_vehicle_146 enableSimulation false;
_vehicle_146 setVectorUp [0,0,1];

_vehicle_147 = "Land_InfoStand_V2_F" createvehiclelocal [3655.7668, 13127.45, 6.6757202e-006];
_vehicle_147 setDir -44.89439;
_vehicle_147 setPos [3655.7668, 13127.45, 6.6757202e-006];
_initCodes pushBack [_vehicle_147,"this addAction[""Schule"",EMonkeys_fnc_buyLicences_extended,[""diamond"",""salt"",""sand"",""copper"",""iron"",""silver"",""oil"",""cement""],0,true,true,"""",' playerSide in [civilian,east] && vehicle player == player && player distance _target < 3']; this addAction[""Tankstellen Ausschreibung"",{[[player],""TON_fnc_auction_selectFuelstations"",false,false] call EMonkeys_fnc_mp;},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3']"];
_vehicle_147 setObjectTexture [0, "core\textures\map\haendler.paa"];
_vehicle_147 allowDamage false;
_vehicle_147 enableSimulation false;
_vehicle_147 setVectorUp [0,0,1];

_vehicle_148 = "Land_MapBoard_F" createvehiclelocal [3657.3953, 13128.128, -1.9073486e-006];
_vehicle_148 setDir -0.02691347;
_vehicle_148 setPos [3657.3953, 13128.128, -1.9073486e-006];
_initCodes pushBack [_vehicle_148,"this addAction[""<t color='#5CCED4'>Börsenkurse anzeigen</t>"",EMonkeys_fnc_boerse_menu,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 '];"];
_vehicle_148 setObjectTexture [0, "core\textures\map\boerse.paa"];
_vehicle_148 allowDamage false;
_vehicle_148 enableSimulation false;
_vehicle_148 setVectorUp [0,0,1];

_vehicle_149 = "Land_MapBoard_F" createVehiclelocal [3659.1094, 13128.077, 4.7683716e-006];
_vehicle_149 setDir 3.4273944;
_vehicle_149 setPos [3659.1094, 13128.077, 4.7683716e-006];
_initCodes pushBack [_vehicle_149,"this addAction[""Schwarze Brett"",{[[player],""TON_fnc_loadBlackboardNews"",false,false] call Emonkeys_fnc_MP;},"""",0,false,false,"""",'vehicle player == player && player distance _target < 3']"];
_vehicle_149 setObjectTexture [0, "core\textures\map\blackboard.paa"];
_vehicle_149 allowDamage false; 
_vehicle_149 enableSimulation false;

_vehicle_149 = "Land_MapBoard_F" createvehiclelocal [3667.4019, 13119.046, 0.11325066];
_vehicle_149 setDir -47.345757;
_vehicle_149 setPos [3667.4019, 13119.046, 0.11325066];
_initCodes pushBack [_vehicle_149,"this addaction [""Zum Paintball anmelden"",""core\eMonkeys\paintball\pb_join.sqf"","""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 6 ']; this addaction [""Paintball Highscore"",Emonkeys_fnc_paintball_scoreboard,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 6 '];"];
_vehicle_149 setObjectTexture [0,"core\textures\map\paintball.paa"];
_vehicle_149 allowDamage false;
_vehicle_149 enableSimulation false;
_vehicle_149 setVectorUp [0,0,1];

_vehicle_151 = "Land_Laptop_unfolded_F" createvehiclelocal [3648.7979, 13094.968, 0.84986115];
_vehicle_151 setDir 3.608227;
_vehicle_151 setPos [3648.7979, 13094.968, 0.84986115];
_initCodes pushBack [_vehicle_151,"this addAction[""Crafting Händler"",EMonkeys_fnc_virt_menu,""crafting"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 '];"];
_vehicle_151 setObjectTexture [0,"core\textures\map\laptop.paa"];
_vehicle_151 allowDamage false;
_vehicle_151 enableSimulation false;
_vehicle_151 setVectorUp [0,0,1];

_vehicle_152 = "Land_InfoStand_V2_F" createvehiclelocal [3665.8313, 13116.372, 0];
_vehicle_152 setDir 48.514164;
_vehicle_152 setPos [3665.8313, 13116.372, 0];
_initCodes pushBack [_vehicle_152,"this addAction[""<t color='#FF0000'>Lottoschein kaufen !! 30000€ !!</t>"",EMonkeys_fnc_lotto_add,"""",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 4 && EMonkeys_HC_isActive'];"];
_vehicle_152 setObjectTexture [0, "core\textures\map\lotto.paa"];
_vehicle_152 allowDamage false;
_vehicle_152 enableSimulation false;
_vehicle_152 setVectorUp [0,0,1];

//Polizeiwache
_vehicle_153 = "Land_Concrete_SmallWall_8m_F" createvehiclelocal [3640.0718, 13087.32, -0.76060981];;
_vehicle_153 setDir 178.06206;
_vehicle_153 setPos [3640.0718, 13087.32, -0.76060981];
_vehicle_153 allowDamage false;
_vehicle_153 enableSimulation false;

_vehicle_154 = "Land_Concrete_SmallWall_8m_F" createvehiclelocal [3632.1172, 13087.043, -0.7602365];
_vehicle_154 setDir 178.06206;
_vehicle_154 setPos [3632.1172, 13087.043, -0.7602365];
_vehicle_154 allowDamage false;
_vehicle_154 enableSimulation false;

_vehicle_155 = "Land_Concrete_SmallWall_4m_F" createvehiclelocal [3644.3127, 13085.69, -0.74776375];
_vehicle_155 setDir 88.578827;
_vehicle_155 setPos [3644.3127, 13085.69, -0.74776375];
_vehicle_155 allowDamage false;
_vehicle_155 enableSimulation false;

_vehicle_156 = "Land_Concrete_SmallWall_4m_F" createvehiclelocal [3627.97, 13085.141, -0.74112368];
_vehicle_156 setDir 88.578827;
_vehicle_156 setPos [3627.97, 13085.141, -0.74112368];
_vehicle_156 allowDamage false;
_vehicle_156 enableSimulation false;

_vehicle_157 = "Land_Concrete_SmallWall_4m_F" createvehiclelocal [3636.0815, 13085.051, -0.76911092];
_vehicle_157 setDir 88.578827;
_vehicle_157 setPos [3636.0815, 13085.051, -0.76911092];
_vehicle_157 allowDamage false;
_vehicle_157 enableSimulation false;

_vehicle_158 = "Land_Shoot_House_Panels_F" createvehiclelocal [3635.6084, 13071.631, -4.3869019e-005];
_vehicle_158 setDir -3.0204139;
_vehicle_158 setPos [3635.6084, 13071.631, -4.3869019e-005];
_vehicle_158 allowDamage false;
_vehicle_158 enableSimulation false;
_vehicle_158 setVectorUp [0,0,1];

_vehicle_159 = "Land_TableDesk_F" createvehiclelocal [3637.8589, 13080.242, 0.21797889];
_vehicle_159 setDir 88.098274;
_vehicle_159 setPos [3637.8589, 13080.242, 0.21797889];
_vehicle_159 allowDamage false;
_vehicle_159 enableSimulation false;
_vehicle_159 setVectorUp [0,0,1];

_vehicle_160 = "Land_TableDesk_F" createvehiclelocal [3637.9221, 13078.466, 0.21139936];
_vehicle_160 setDir 88.098274;
_vehicle_160 setPos [3637.9221, 13078.466, 0.21139936];
_vehicle_160 allowDamage false;
_vehicle_160 enableSimulation false;
_vehicle_160 setVectorUp [0,0,1];

_vehicle_161 = "Land_OfficeChair_01_F" createvehiclelocal [3638.9116, 13080.438, 0.30793217];
_vehicle_161 setDir 59.012493;
_vehicle_161 setPos [3638.9116, 13080.438, 0.30793217];
_vehicle_161 allowDamage false;
_vehicle_161 enableSimulation false;
_vehicle_161 setVectorUp [0,0,1];

_vehicle_162 = "Land_WaterCooler_01_new_F" createvehiclelocal [3641.4551, 13077.452, 0.25958782];
_vehicle_162 setDir 88.883583;
_vehicle_162 setPos [3641.4551, 13077.452, 0.25958782];
_vehicle_162 allowDamage false;
_vehicle_162 enableSimulation false;
_vehicle_162 setVectorUp [0,0,1];

_vehicle_163 = "MapBoard_seismic_F" createvehiclelocal [3641.1243, 13080.899, 0.31118131];
_vehicle_163 setDir 52.219303;
_vehicle_163 setPos [3641.1243, 13080.899, 0.31118131];
_vehicle_163 allowDamage false;
_vehicle_163 enableSimulation false;
_vehicle_163 setVectorUp [0,0,1];

_vehicle_164 = "Land_FlatTV_01_F" createvehiclelocal [3637.571, 13080.64, 1.0364149];
_vehicle_164 setDir -88.578888;
_vehicle_164 setPos [3637.571, 13080.64, 1.0364149];
_vehicle_164 allowDamage false;
_vehicle_164 enableSimulation false;
_vehicle_164 setVectorUp [0,0,1];

_vehicle_165 = "Land_LampDecor_F" createvehiclelocal [3637.7861, 13084.112, -1.9073486e-006];
_vehicle_165 setPos [3637.7861, 13084.112, -1.9073486e-006];
_vehicle_165 allowDamage false;
_vehicle_165 setVectorUp [0,0,1];

_vehicle_166 = "UserTexture10m_F" createvehiclelocal [3636.3193, 13081.6, -1.15];
_vehicle_166 setDir 177.35944;
_vehicle_166 setPos [3636.3193, 13081.6, -1.15];
_vehicle_166 setObjectTexture[0, "core\textures\map\polizeiwache.paa"];
_vehicle_166 allowDamage false;
_vehicle_166 enableSimulation false;
_vehicle_166 setVectorUp [0,0,1];

_vehicle_167 = "SignAd_Sponsor_F" createvehiclelocal [3642.8562, 13082.142, 1.0490417e-005];
_vehicle_167 setDir 178.34488;
_vehicle_167 setPos [3642.8562, 13082.142, 1.0490417e-005];
_vehicle_167 setObjectTexture [0, "core\textures\map\ppp.paa"];
_vehicle_167 allowDamage false;
_vehicle_167 enableSimulation false;
_vehicle_167 setVectorUp [0,0,1];

_vehicle_168 = "SignAd_Sponsor_F" createvehiclelocal [3632.1406, 13081.695, -1.9073486e-006];
_vehicle_168 setDir 178.34488;
_vehicle_168 setPos [3632.1406, 13081.695, -1.9073486e-006];
_vehicle_168 setObjectTexture [0, "core\textures\map\ppp.paa"];
_vehicle_168 allowDamage false;
_vehicle_168 enableSimulation false;
_vehicle_168 setVectorUp [0,0,1];

//Einwohnermeldeamt
_vehicle_169 = "Land_TableDesk_F" createvehiclelocal [3682.9624, 13110.558, 0.27676973];
_vehicle_169 setDir -2.8958445;
_vehicle_169 setPos [3682.9624, 13110.558, 0.27676973];
_vehicle_169 allowDamage false;
_vehicle_169 enableSimulation false;
_vehicle_169 setVectorUp [0,0,1];

_vehicle_170 = "Land_TableDesk_F" createvehiclelocal [3684.1697, 13111.107, 0.24659328];
_vehicle_170 setDir -93.346527;
_vehicle_170 setPos [3684.1697, 13111.107, 0.24659328];
_vehicle_170 allowDamage false;
_vehicle_170 enableSimulation false;
_vehicle_170 setVectorUp [0,0,1];

_vehicle_171 = "Land_TableDesk_F" createvehiclelocal [3684.0671, 13112.854, 0.23096611];
_vehicle_171 setDir -93.346527;
_vehicle_171 setPos [3684.0671, 13112.854, 0.23096611];
_vehicle_171 allowDamage false;
_vehicle_171 enableSimulation false;
_vehicle_171 setVectorUp [0,0,1];

_vehicle_172 = "Land_OfficeChair_01_F" createvehiclelocal [3683.0396, 13111.998, 0.32733759];
_vehicle_172 setDir -84.135368;
_vehicle_172 setPos [3683.0396, 13111.998, 0.32733759];
_vehicle_172 allowDamage false;
_vehicle_172 enableSimulation false;
_vehicle_172 setVectorUp [0,0,1];

_vehicle_173 = "Land_Laptop_unfolded_F" createvehiclelocal [3684.1477, 13111.937, 1.0750954];
_vehicle_173 setDir 87.72493;
_vehicle_173 setPos [3684.1477, 13111.937, 1.0750954];
_initCodes pushBack [_vehicle_173,"this addAction[""<t color='#FF0000'>Ausweis löschen 10000€</t>"",EMonkeys_fnc_ausweisloeschen,"""",99,false,false,"""",'!(count eM_ausweis == 0) && vehicle player == player && player distance _target < 3 '];this addAction[""<t color='#FF0000'>Ausweis erstellen 20000€</t>"",EMonkeys_fnc_ausweiserstellendialog,"""",99,false,false,"""",'(count eM_ausweis == 0) && vehicle player == player && player distance _target < 3 '];"];
_vehicle_173 setObjectTexture [0,"core\textures\map\laptop.paa"];
_vehicle_173 allowDamage false;
_vehicle_173 enableSimulation false;
_vehicle_173 setVectorUp [0,0,1];

//Lotsenlounge
_vehicle_175 = "Land_TableDesk_F" createvehiclelocal [3647.5442, 13076.82, 0.47295219];
_vehicle_175 setDir -271.94922;
_vehicle_175 setPos [3647.5442, 13076.82, 0.47295219];
_vehicle_175 allowDamage false;
_vehicle_175 enableSimulation false;
_vehicle_175 setVectorUp [0,0,1];

_vehicle_176 = "Land_TableDesk_F" createvehiclelocal [3647.9734, 13078.083, 0.47243583];
_vehicle_176 setDir -182.88235;
_vehicle_176 setPos [3647.9734, 13078.083, 0.47243583];
_vehicle_176 allowDamage false;
_vehicle_176 enableSimulation false;
_vehicle_176 setVectorUp [0,0,1];

_vehicle_177 = "Land_TableDesk_F" createvehiclelocal [3649.7346, 13078.169, 0.41557318];
_vehicle_177 setDir -182.88235;
_vehicle_177 setPos [3649.7346, 13078.169, 0.41557318];
_vehicle_177 allowDamage false;
_vehicle_177 enableSimulation false;
_vehicle_177 setVectorUp [0,0,1];

_vehicle_178 = "MapBoard_altis_F" createvehiclelocal [3650.6875, 13075.943, 0.36384594];
_vehicle_178 setDir 178.07375;
_vehicle_178 setPos [3650.6875, 13075.943, 0.36384594];
_vehicle_178 allowDamage false;
_vehicle_178 enableSimulation false;
_vehicle_178 setVectorUp [0,0,1];

_vehicle_179 = "Land_Bench_F" createvehiclelocal [3644.7683, 13077.165, 0.59728479];
_vehicle_179 setDir -1.4181696;
_vehicle_179 setPos [3644.7683, 13077.165, 0.59728479];
_vehicle_179 allowDamage false;
_vehicle_179 enableSimulation false;
_vehicle_179 setVectorUp [0,0,1];

_vehicle_180 = "Land_Laptop_unfolded_F" createvehiclelocal [3647.8098, 13078.065, 1.2931659];
_vehicle_180 setDir 154.17517;
_vehicle_180 setPos [3647.8098, 13078.065, 1.2931659];
_initCodes pushBack [_vehicle_180,"this addAction[""Lotsen Kleidung"",EMonkeys_fnc_clothingMenu,""gruppe"",0,FALSE,FALSE,"""",' vehicle player == player && player distance _target < 3 && ([""LOTSE""] call EMonkeys_fnc_permLevel > 0)'];"];
_vehicle_180 setObjectTexture [0, "core\textures\map\laptop.paa"];
_vehicle_180 allowDamage false;
_vehicle_180 enableSimulation false;
_vehicle_180 setVectorUp [0,0,1];

_vehicle_181 = "UserTexture10m_F" createvehiclelocal [3644.8499, 13082.272, -0.6];
_vehicle_181 setDir 177.84676;
_vehicle_181 setPos [3644.8499, 13082.272, -0.6];
_vehicle_181 setObjectTexture[0, "core\textures\map\lotsen_lounge.paa"];
_vehicle_181 allowDamage false;
_vehicle_181 enableSimulation false;
_vehicle_181 setVectorUp [0,0,1];

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;

EMonkeys_loadmap1 = true;