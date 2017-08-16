 
 
 
 
 
 
 
 
private["_captureId","_location","_level","_obj","_dat","_adString","_cString"]; 
 
_captureId = [_this,0,0,[0]] call BIS_fnc_param; 
_location = [_this,1,0,[0]] call BIS_fnc_param; 
_level = [_this,2,0,[0]] call BIS_fnc_param; 
_add = [_this,3,true,[true]] call BIS_fnc_param; 
 
_obj = objNull;_dat = [];_adString = "CAN_COLLIDE"; 
 
_cString = if (_add) then 
{ 
{_obj = (_dat select 0) createVehicle (call compile (_dat select 1));_obj enableSimulation false;_obj setdir (_dat select 2);if((_dat select 3) == -100) then {_obj setposATL (call compile (_dat select 1))} else {_obj setposASL [((call compile (_dat select 1)) select 0),((call compile (_dat select 1)) select 1),(_dat select 3)]};if((_dat select 5) == 0) then {_obj setVectorUp [0,0,1]} else {_obj setVectorUp (surfacenormal (getPosATL _obj))};_obj setVariable["owner", _obj]; if(count (_dat select 6) > 0) then {{call _x} foreach (_dat select 6)}}; 
} 
else 
{ 
{_obj = nearestObject [call compile (_dat select 1), (_dat select 0)]; deleteVehicle _obj;}; 
}; 
 
switch (_captureId) do  
{ 
case 0:  
{ 
switch (_location) do 
{ 
case 0: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_BagBunker_Small_F","[11216.0615234,8690.176758,-0.258698]",0.320974,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Corner_F","[11175.881836,8763.257813,0]",328.466,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[11174.0195313,8762.484375,0]",328.466,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[11171.554688,8760.955078,0]",328.466,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[11169.805664,8758.973633,0]",95.7861,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_3_F","[11191.675781,8688.498047,0]",14.4886,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_Big_F","[11195.19043,8686.361328,0]",3.74049,-100,1,0,[]];call _cString; 
 
}; 
case 2: 
{ 
_dat = ["Land_BagBunker_Small_F","[11216.0615234,8690.176758,-0.258698]",0.320974,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Corner_F","[11175.881836,8763.257813,0]",328.466,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[11174.0195313,8762.484375,0]",328.466,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[11171.554688,8760.955078,0]",328.466,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[11169.805664,8758.973633,0]",95.7861,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_3_F","[11191.675781,8688.498047,0]",14.4886,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_Big_F","[11195.19043,8686.361328,0]",3.74049,-100,1,0,[]];call _cString; 
_dat = ["Land_CamoNet_open_F","[11143.575195,8721.301758,6.76767]",98.5324,-100,1,0,[]];call _cString; 
_dat = ["Land_CamoNet_open_F","[11203.769531,8761.530273,6.81879]",16.5246,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[11192.538086,8766.396484,0]",2.84088,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[11147.273438,8733.0429688,0]",291.108,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[11151.602539,8739.902344,0]",310.71,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[11164.108398,8692.811523,0]",273.258,-100,1,0,[]];call _cString; 
_dat = ["Land_HBarrierTower_F","[11195.0117188,8719.875,-0.0404053]",124.441,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[11221.763672,8688.511719,-0.534805]",167.618,-100,1,1,[]];call _cString; 
}; 
}; 
}; 
case 1: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_BagFence_Long_F","[8902.628906,7507.334961,-0.0566406]",166.864,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[8905.552734,7507.61084,0]",180.803,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_End_F","[8907.405273,7507.489258,-0.176765]",17.8769,-100,1,0,[]];call _cString; 
_dat = ["Land_HBarrierWall4_F","[8947.993164,7473.643555,0]",110.727,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[8908.0224609,7508.221191,0]",110.727,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[8909.53418,7507.589355,0]",119.724,-100,1,0,[]];call _cString; 
}; 
case 2: 
{ 
_dat = ["Land_BagFence_Long_F","[8902.628906,7507.334961,-0.0566406]",166.864,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[8905.552734,7507.61084,0]",180.803,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_End_F","[8907.405273,7507.489258,-0.176765]",17.8769,-100,1,0,[]];call _cString; 
_dat = ["Land_HBarrierWall4_F","[8947.993164,7473.643555,0]",110.727,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[8908.0224609,7508.221191,0]",110.727,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[8909.53418,7507.589355,0]",119.724,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Tower_F","[8983.0595703,7480.119141,-0.111115]",260.405,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[8896.958984,7504.762695,0]",-229.329,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[8897.575195,7509.0620117,0]",149.657,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Tower_F","[8845.0527344,7449.979004,0.0103264]",345.206,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[8914.852539,7515.246094,0]",2.45091,-100,1,0,[]];call _cString; 
}; 
}; 
}; 
}; 
}; 
case 1:  
{ 
switch (_location) do 
{ 
case 0; 
case 1: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_BagFence_Round_F","[4370.52002,18642.429688,-0.0599747]",40.9928,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[4373.107422,18641.791016,-0.0795455]",-356.981,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[4375.989258,18641.666016,-0.0795455]",-356.981,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[4391.829102,18641.117188,-0.0795455]",-356.981,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[4394.416992,18641.609375,-0.110245]",317.325,-100,1,1,[]];call _cString; 
 
}; 
case 2: 
{ 
_dat = ["Land_BagFence_Round_F","[4370.52002,18642.429688,-0.0599747]",40.9928,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[4373.107422,18641.791016,-0.0795455]",-356.981,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[4375.989258,18641.666016,-0.0795455]",-356.981,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[4391.829102,18641.117188,-0.0795455]",-356.981,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[4394.416992,18641.609375,-0.110245]",317.325,-100,1,1,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[4394.228027,18648.121094,0]",-437.236,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[4395.758789,18647.845703,0]",282.764,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[4372.646973,18650.0761719,0]",-449.594,-100,1,0,[]];call _cString; 
_dat = ["Land_Hbarrier_1_F","[4371.0776367,18650.0136719,-0.0359879]",270.595,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[4405.305176,18666.626953,0]",-518.629,-100,1,1,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[4369.504883,18673.783203,0.301025]",155.416,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4365.989258,18648.990234,-0.368056]",-547.796,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4399.82373,18644.839844,-0.284515]",216.956,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4370.70459,18627.0527344,0]",-525.353,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4378.94873,18625.53125,0]",-532.976,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4387.396973,18625.859375,-0.319444]",-552.91,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4395.295898,18626.345703,-0.319443]",173.529,-100,1,0,[]];call _cString; 
_dat = ["Land_FieldToilet_F","[4372.596191,18648.193359,-0.0119934]",3.2078,-100,1,0,[]];call _cString; 
_dat = ["Land_Pier_small_F","[4384.299805,18635.376953,0]",-356.792,-100,1,0,[]];call _cString; 
_dat = ["Land_Pier_small_F","[4354.4375,18629.990234,0]",-326.726,-100,1,0,[]];call _cString; 
_dat = ["Land_Pier_small_F","[4408.585449,18622.00390625,4.19949]",333.947,-100,1,0,[]];call _cString; 
_dat = ["Land_Pier_small_F","[4334.567383,18601.833984,11.0657]",198.388,-100,1,0,[]];call _cString; 
_dat = ["Land_Pier_small_F","[4320.992676,18575.697266,-2.94379]",203.028,-100,1,0,[]];call _cString; 
_dat = ["Land_Pier_small_F","[4377.522461,18602.0820313,4.93814]",181.106,-100,1,0,[]];call _cString; 
}; 
}; 
}; 
case 2: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_Razorwire_F","[4891.829102,21970.0644531,0]",270.831,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4891.912598,21958.169922,0.799286]",272.613,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4827.45752,21907.490234,0.000631273]",212.119,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4805.338379,21922.902344,-0.287415]",233.529,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Short_F","[4867.254883,21950.308594,18.5031]",203.596,-100,1,0,[]];call _cString; 
}; 
case 2: 
{ 
_dat = ["Land_Razorwire_F","[4891.829102,21970.0644531,0]",270.831,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4891.912598,21958.169922,0.799286]",272.613,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4827.45752,21907.490234,0.000631273]",212.119,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[4805.338379,21922.902344,-0.287415]",233.529,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Short_F","[4867.254883,21950.308594,18.5031]",203.596,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[4897.766113,21963.408203,-0.0647888]",275.913,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[4838.78418,22011.492188,6.68561]",162.355,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[4846.179688,22011.00976563,4.40152]",162.355,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[4822.992676,21922.130859,-0.18924]",37.9195,-100,1,1,[]];call _cString; 
_dat = ["Land_BagBunker_Tower_F","[4827.508301,21957.386719,-0.244965]",329.694,-100,1,0,[]];call _cString; 
}; 
}; 
}; 
case 3; 
case 4: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_Razorwire_F","[14229.857422,13069.644531,0]",-17.0954,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14222.135742,13067.900391,0]",-13.2602,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14214.258789,13066.262695,0]",-8.33591,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14206.264648,13065.137695,0]",-3.60106,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14321.459961,13081.495117,0]",-3.60106,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14330.0751953,13080.921875,-0.169823]",11.5505,-100,1,0,[]];call _cString; 
}; 
case 2: 
{ 
_dat = ["Land_Razorwire_F","[14229.857422,13069.644531,0]",-17.0954,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14222.135742,13067.900391,0]",-13.2602,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14214.258789,13066.262695,0]",-8.33591,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14206.264648,13065.137695,0]",-3.60106,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14321.459961,13081.495117,0]",-3.60106,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[14330.0751953,13080.921875,-0.169823]",11.5505,-100,1,0,[]];call _cString; 
}; 
}; 
}; 
case 5: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_Razorwire_F","[13314.641602,13387.157227,0]",261.645,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13359.544922,13423.860352,0]",245.594,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13356.626953,13431.169922,0]",245.594,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13351.0605469,13432.947266,0]",159.988,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13366.31543,13409.652344,0]",65.1488,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13316.479492,13378.631836,0]",72.3931,-100,1,0,[]];call _cString; 
}; 
case 2: 
{ 
_dat = ["Land_Razorwire_F","[13314.641602,13387.157227,0]",261.645,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13359.544922,13423.860352,0]",245.594,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13356.626953,13431.169922,0]",245.594,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13351.0605469,13432.947266,0]",159.988,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13366.31543,13409.652344,0]",65.1488,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[13316.479492,13378.631836,0]",72.3931,-100,1,0,[]];call _cString; 
}; 
}; 
}; 
case 6: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_BagBunker_Small_F","[22078.972656,21112.925781,0.0890846]",227.292,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21991.427734,21043.511719,0]",223.245,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21987.414063,21047.367188,0]",223.245,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21981.84375,21049.0253906,0]",134.846,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21994.03125,21038.0742188,0]",134.846,-100,1,0,[]];call _cString; 
}; 
case 2: 
{ 
_dat = ["Land_BagBunker_Small_F","[22078.972656,21112.925781,0.0890846]",227.292,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21991.427734,21043.511719,0]",223.245,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21987.414063,21047.367188,0]",223.245,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21981.84375,21049.0253906,0]",134.846,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21994.03125,21038.0742188,0]",134.846,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Tower_F","[21934.0546875,20988.371094,-0.186237]",308.719,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[21958.529297,21011.849609,0.630051]",223.539,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[21942.513672,21055.429688,0]",-192.948,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[21940.328125,21051.224609,0]",-294.321,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[21938.837891,21054.605469,-0.0359848]",-244.179,-100,1,0,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[21997.802734,20995.773438,-0.0359848]",-336.982,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[22004.207031,20999.732422,-0.0549242]",-479.643,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Round_F","[22004.958984,20997.119141,-0.0672226]",282.573,-100,1,1,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[21954.761719,21065.677734,0.624369]",210.945,-100,1,0,[]];call _cString; 
}; 
}; 
}; 
case 7: 
{ 
switch (_level) do 
{ 
case 1: 
{ 
_dat = ["Land_BagFence_Long_F","[21939.191406,20871.994141,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[21936.419922,20871.859375,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[21942.0410156,20872.242188,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[22003.236328,20872,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[22000.326172,20871.910156,0]",-180.684,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21903.119141,20904.751953,0]",-221.451,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21840.990234,20856.990234,0]",-172.446,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21899.341797,21002.0527344,0]",-158.857,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21893.806641,21006.148438,0]",-136.698,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21922.0917969,20967.927734,-0.0573959]",196.896,-100,1,1,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[21858.847656,20916.603516,1.40467]",46.3137,-100,1,0,[]];call _cString; 
 
}; 
case 2: 
{ 
_dat = ["Land_BagFence_Long_F","[21939.191406,20871.994141,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[21936.419922,20871.859375,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[21942.0410156,20872.242188,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[22003.236328,20872,0]",-184.046,-100,1,1,[]];call _cString; 
_dat = ["Land_BagFence_Long_F","[22000.326172,20871.910156,0]",-180.684,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21903.119141,20904.751953,0]",-221.451,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21840.990234,20856.990234,0]",-172.446,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21899.341797,21002.0527344,0]",-158.857,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21893.806641,21006.148438,0]",-136.698,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21922.0917969,20967.927734,-0.0573959]",196.896,-100,1,1,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[21858.847656,20916.603516,1.40467]",46.3137,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Tower_F","[21892.833984,20939.351563,0.607323]",138.596,-100,1,0,[]];call _cString; 
_dat = ["Land_BagBunker_Small_F","[21818.726563,20870.222656,-0.232655]",71.7947,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21820.861328,20937.0859375,0]",-254.216,-100,1,0,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21824.238281,20944.363281,-0.125631]",-243.705,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21806.216797,20906.496094,-0.125631]",-238.686,-100,1,1,[]];call _cString; 
_dat = ["Land_Razorwire_F","[21840.529297,20968.484375,0.0231514]",141.452,-100,1,1,[]];call _cString; 
}; 
}; 
}; 
}; 
}; 
};