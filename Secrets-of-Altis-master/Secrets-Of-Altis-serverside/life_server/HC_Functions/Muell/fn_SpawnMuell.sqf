 
 
 
 
 
private["_kav","_pan","_zar","_gra","_ath","_pyr","_sof","_fer","_kor","_par","_ner","_agios","_polia","_cha","_neg","_syr","_dor","_apd","_mol"]; 
diag_log "Muell Spawnen Gestartet"; 
 
if (!hasInterface && !isDedicated) then  
{ 
_kav = ["1","2","3","4","5","6"]; 
_randKav = _kav select floor random count _kav; 
_pan = ["1","2","3","4"]; 
_randPan = _pan select floor random count _pan; 
_zar = ["1","2","3","4","5"]; 
_randZar = _zar select floor random count _zar; 
_gar = ["1","2","3","4"]; 
_randGra = _gar select floor random count _gar; 
_ath = ["1","2","3","4","5"]; 
_randAth = _ath select floor random count _ath; 
_pyr = ["1","2","3","4","5"]; 
_randPyr = _pyr select floor random count _pyr; 
_sof = ["1","2","3","4"]; 
_randSof = _sof select floor random count _sof; 
_fer = ["1","2","3"]; 
_randFer = _fer select floor random count _fer; 
_kor = ["1","2","3"]; 
_randKor = _kor select floor random count _kor; 
_par = ["1","2","3","4","5"]; 
_randPar = _par select floor random count _par; 
_ner = ["1","2","3","4"]; 
_randNeri = _ner select floor random count _ner; 
_agios = ["1","2","3","4"]; 
_randAgios = _agios select floor random count _agios; 
_polia = ["1","2","3","4"]; 
_randPol = _polia select floor random count _polia; 
_cha = ["1","2","3"]; 
_randChal = _cha select floor random count _cha; 
_neg = ["1","2","3"]; 
_randNega = _neg select floor random count _neg; 
_syr = ["1","2","3"]; 
_randSyr = _syr select floor random count _syr; 
_dor = ["1","2","3"]; 
_randDor = _dor select floor random count _dor; 
_apd = ["1","2","3"]; 
_randAbde = _apd select floor random count _apd; 
_mol = ["1","2","3","4"]; 
_randMol = _mol select floor random count _mol; 
diag_log format["Muell Random: Kavala:%1 - Panochori:%2 - Zaros:%3 - Gravia:%4 - Athira:%5 - Pyrgos:%6 -  
  Sofia:%7 - Feres:%8 - Kora:%9 - Paros%10 - Neri:%11 - Agios Dionysios:%12 - Poliakko:%13 - Chalkeia:%14 -  
  Negades:%15 - Syrta:%16 - Dorida:%17 - Abdera:%18 - Molos:%19", 
_randKav,_randPan,_randZar,_randGra,_randAth,_randPyr,_randSof,_randFer,_randKor, 
_randPar,_randNeri,_randAgios,_randPol,_randChal,_randNega,_randSyr,_randDor,_randAbde, 
_randMol 
]; 
 
muell_counter = 19; 
publicvariable "muell_counter"; 
_initCodes = []; 
 
switch (_randKav) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3400.0171, 13029.16, 0.20124446], [], 0, "CAN_COLLIDE"]; 
_this setDir 0.74948961; 
_this setPos [3400.0171, 13029.16, 0.20124446]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKav = [3400.0171, 13029.16, 0.20124446]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3501.1895, 12808.801, 0.1448326], [], 0, "CAN_COLLIDE"]; 
_this setDir 119.37454; 
_this setPos [3501.1895, 12808.801, 0.1448326]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKav = [3501.1895, 12808.801, 0.1448326]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3736.4331, 13333.174, 0.19582738], [], 0, "CAN_COLLIDE"]; 
_this setDir 133.53317; 
_this setPos [3736.4331, 13333.174, 0.19582738]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKav = [3736.4331, 13333.174, 0.19582738]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3706.3252, 13716.429, 0.16759598], [], 0, "CAN_COLLIDE"]; 
_this setDir 21.918991; 
_this setPos [3706.3252, 13716.429, 0.16759598]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKav = [3706.3252, 13716.429, 0.16759598]; 
}; 
case "5": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3819.8418, 12382.781, -1.1444092e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -41.517006; 
_this setPos [3819.8418, 12382.781, -1.1444092e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKav = [3819.8418, 12382.781, -1.1444092e-005]; 
}; 
case "6": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3274.0427, 12426.938, 4.7683716e-007], [], 0, "CAN_COLLIDE"]; 
_this setDir -14.228038; 
_this setPos [3274.0427, 12426.938, 4.7683716e-007]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKav = [3274.0427, 12426.938, 4.7683716e-007]; 
}; 
}; 
 
switch (_randPan) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [5024.1118, 11143.845, -0.0004196167], [], 0, "CAN_COLLIDE"]; 
_this setDir 49.842178; 
_this setPos [5024.1118, 11143.845, -0.0004196167]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPan = [5024.1118, 11143.845, -0.0004196167]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [5001.8882, 11283.435, -0.00012969971], [], 0, "CAN_COLLIDE"]; 
_this setDir -147.45215; 
_this setPos [5001.8882, 11283.435, -0.00012969971]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPan = [5001.8882, 11283.435, -0.00012969971]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4977.48, 11419.459, -6.1035156e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 49.832031; 
_this setPos [4977.48, 11419.459, -6.1035156e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPan = [4977.48, 11419.459, -6.1035156e-005]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [5184.7979, 11170.177, -4.9591064e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -77.928085; 
_this setPos [5184.7979, 11170.177, -4.9591064e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPan = [5184.7979, 11170.177, -4.9591064e-005]; 
}; 
}; 
 
switch (_randZar) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9037.4668, 12023.076, 0.00011444092], [], 0, "CAN_COLLIDE"]; 
_this setDir -161.90691; 
_this setPos [9037.4668, 12023.076, 0.00011444092]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posZar = [9037.4668, 12023.076, 0.00011444092]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9141.8643, 11959.612, 0.20853889], [], 0, "CAN_COLLIDE"]; 
_this setDir -76.876236; 
_this setPos [9141.8643, 11959.612, 0.20853889]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posZar = [9141.8643, 11959.612, 0.20853889]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9292.8242, 12128.016, -8.9645386e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 51.679039; 
_this setPos [9292.8242, 12128.016, -8.9645386e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posZar = [9292.8242, 12128.016, -8.9645386e-005]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9437.2686, 11742.643, 1.7166138e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 77.109283; 
_this setPos [9437.2686, 11742.643, 1.7166138e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posZar = [9437.2686, 11742.643, 1.7166138e-005]; 
}; 
case "5": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [8995.0371, 11670.436, -5.7220459e-006], [], 0, "CAN_COLLIDE"]; 
_this setDir 135.12498; 
_this setPos [8995.0371, 11670.436, -5.7220459e-006]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posZar = [8995.0371, 11670.436, -5.7220459e-006]; 
}; 
}; 
 
switch (_randGra) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [14446.093, 17656.033, 1.1444092e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -50.5047; 
_this setPos [14446.093, 17656.033, 1.1444092e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posGra = [14446.093, 17656.033, 1.1444092e-005]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [14481.927, 17570.844, -1.7166138e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -58.672981; 
_this setPos [14481.927, 17570.844, -1.7166138e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posGra = [14481.927, 17570.844, -1.7166138e-005]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [14576.671, 17590.924, -9.3460083e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 119.26958; 
_this setPos [14576.671, 17590.924, -9.3460083e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posGra = [14576.671, 17590.924, -9.3460083e-005]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [14566.752, 17724.66, -3.8146973e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -118.19076; 
_this setPos [14566.752, 17724.66, -3.8146973e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posGra = [14566.752, 17724.66, -3.8146973e-005]; 
}; 
}; 
 
switch (_randAth) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [13969.855, 18709.998, -3.6239624e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 122.22225; 
_this setPos [13969.855, 18709.998, -3.6239624e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAth = [13969.855, 18709.998, -3.6239624e-005]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [13858.201, 18707.354, 3.6239624e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -42.622074; 
_this setPos [13858.201, 18707.354, 3.6239624e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAth = [13858.201, 18707.354, 3.6239624e-005]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [14133.812, 18479.654, -0.00012016296], [], 0, "CAN_COLLIDE"]; 
_this setDir 61.444748; 
_this setPos [14133.812, 18479.654, -0.00012016296]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAth = [14133.812, 18479.654, -0.00012016296]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [13973.885, 18952.082, 0.00012969971], [], 0, "CAN_COLLIDE"]; 
_this setDir 47.583935; 
_this setPos [13973.885, 18952.082, 0.00012969971]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAth = [13973.885, 18952.082, 0.00012969971]; 
}; 
case "5": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [14367.375, 18974.027, 0.00010681152], [], 0, "CAN_COLLIDE"]; 
_this setDir 139.31146; 
_this setPos [14367.375, 18974.027, 0.00010681152]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAth = [14367.375, 18974.027, 0.00010681152]; 
}; 
}; 
 
switch (_randPyr) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [16682.27, 12413.557, -0.00071716309], [], 0, "CAN_COLLIDE"]; 
_this setDir -130.00572; 
_this setPos [16682.27, 12413.557, -0.00071716309]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPyr = [16682.27, 12413.557, -0.00071716309]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [16624.371, 12474.548, -8.9645386e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 234.17616; 
_this setPos [16624.371, 12474.548, -8.9645386e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPyr = [16624.371, 12474.548, -8.9645386e-005]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [16715.477, 12702.22, 0.00010299683], [], 0, "CAN_COLLIDE"]; 
_this setDir -61.977325; 
_this setPos [16715.477, 12702.22, 0.00010299683]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPyr = [16715.477, 12702.22, 0.00010299683]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [16830.688, 12854.6, -1.5258789e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 130.9874; 
_this setPos [16830.688, 12854.6, -1.5258789e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPyr = [16830.688, 12854.6, -1.5258789e-005]; 
}; 
case "5": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [17000.516, 12584.618, 0.00016593933], [], 0, "CAN_COLLIDE"]; 
_this setDir 133.19173; 
_this setPos [17000.516, 12584.618, 0.00016593933]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPyr = [17000.516, 12584.618, 0.00016593933]; 
}; 
}; 
 
switch (_randSof) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [25542.676, 21178.719, 1.7166138e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 129.03862; 
_this setPos [25542.676, 21178.719, 1.7166138e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSof = [25542.676, 21178.719, 1.7166138e-005]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [25618.986, 21330.148, -7.6293945e-006], [], 0, "CAN_COLLIDE"]; 
_this setDir 134.24263; 
_this setPos [25618.986, 21330.148, -7.6293945e-006]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSof = [25618.986, 21330.148, -7.6293945e-006]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [25834.715, 21367.416, -0.00017166138], [], 0, "CAN_COLLIDE"]; 
_this setDir -134.50798; 
_this setPos [25834.715, 21367.416, -0.00017166138]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSof = [25834.715, 21367.416, -0.00017166138]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [25715.846, 21535.678, -6.2942505e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -133.52849; 
_this setPos [25715.846, 21535.678, -6.2942505e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSof = [25715.846, 21535.678, -6.2942505e-005]; 
}; 
}; 
 
switch (_randFer) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [21605.613, 7569.3955, 2.8610229e-006], [], 0, "CAN_COLLIDE"]; 
_this setDir -67.535881; 
_this setPos [21605.613, 7569.3955, 2.8610229e-006]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posFer = [21605.613, 7569.3955, 2.8610229e-006]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [21824.768, 7522.8569, -8.2969666e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 122.24519; 
_this setPos [21824.768, 7522.8569, -8.2969666e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posFer = [21824.768, 7522.8569, -8.2969666e-005]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [21683.238, 7784.5493, -3.4332275e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -45.308281; 
_this setPos [21683.238, 7784.5493, -3.4332275e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posFer = [21683.238, 7784.5493, -3.4332275e-005]; 
}; 
}; 
 
switch (_randKor) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [7084.8037, 16441.131, -0.00011444092], [], 0, "CAN_COLLIDE"]; 
_this setDir -55.356335; 
_this setPos [7084.8037, 16441.131, -0.00011444092]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKor = [7084.8037, 16441.131, -0.00011444092]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [7260.1602, 16459.658, 0.18153051], [], 0, "CAN_COLLIDE"]; 
_this setDir -51.781769; 
_this setPos [7260.1602, 16459.658, 0.18153051]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKor = [7260.1602, 16459.658, 0.18153051]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [6971.9063, 16298.209, 3.8146973e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -154.77754; 
_this setPos [6971.9063, 16298.209, 3.8146973e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posKor = [6971.9063, 16298.209, 3.8146973e-005]; 
}; 
}; 
 
switch (_randPar) do 
{  
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [20849.879, 16832.506, 8.7738037e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 124.91323; 
_this setPos [20849.879, 16832.506, 8.7738037e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPar = [20849.879, 16832.506, 8.7738037e-005]; 
}; 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [20848.055, 17069.324, -5.3405762e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -156.40532; 
_this setPos [20848.055, 17069.324, -5.3405762e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPar = [20848.055, 17069.324, -5.3405762e-005]; 
}; 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [20968.238, 16950.201, 0.1048264], [], 0, "CAN_COLLIDE"]; 
_this setDir 43.596394; 
_this setPos [20968.238, 16950.201, 0.1048264]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPar = [20968.238, 16950.201, 0.1048264]; 
}; 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [21093.74, 16985.434, -3.6239624e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -129.58412; 
_this setPos [21093.74, 16985.434, -3.6239624e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPar = [21093.74, 16985.434, -3.6239624e-005]; 
}; 
case "5": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [21000.639, 17209.582, -0.00016021729], [], 0, "CAN_COLLIDE"]; 
_this setDir -129.55215; 
_this setPos [21000.639, 17209.582, -0.00016021729]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPar = [21000.639, 17209.582, -0.00016021729]; 
}; 
}; 
 
switch (_randNeri) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4145.6992, 11751.279, 0.13283296], [], 0, "CAN_COLLIDE"]; 
_this setDir 95.966049; 
_this setPos [4145.6992, 11751.279, 0.13283296]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNer = [4145.6992, 11751.279, 0.13283296]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4233.3545, 11765.15, 9.5367432e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 96.554169; 
_this setPos [4233.3545, 11765.15, 9.5367432e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNer = [4233.3545, 11765.15, 9.5367432e-005]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4049.1775, 11612.581, -7.8201294e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 92.539726; 
_this setPos [4049.1775, 11612.581, -7.8201294e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNer = [4049.1775, 11612.581, -7.8201294e-005]; 
}; 
 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [3772.2878, 11586.908, -9.059906e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 220.22133; 
_this setPos [3772.2878, 11586.908, -9.059906e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNer = [3772.2878, 11586.908, -9.059906e-005]; 
}; 
}; 
 
switch (_randAgios) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9005, 15812.344, -0.0001373291], [], 0, "CAN_COLLIDE"]; 
_this setDir -22.258976; 
_this setPos [9005, 15812.344, -0.0001373291]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAgios = [9005, 15812.344, -0.0001373291]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9246.251, 15852.531, 1.5258789e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -17.178667; 
_this setPos [9246.251, 15852.531, 1.5258789e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAgios = [9246.251, 15852.531, 1.5258789e-005]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9515.502, 15967.98, 0.00021362305], [], 0, "CAN_COLLIDE"]; 
_this setDir -157.59831; 
_this setPos [9515.502, 15967.98, 0.00021362305]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAgios = [9515.502, 15967.98, 0.00021362305]; 
}; 
 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [8966.7998, 15488.733, 2.2888184e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -159.26048; 
_this setPos [8966.7998, 15488.733, 2.2888184e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAgios = [8966.7998, 15488.733, 2.2888184e-005]; 
}; 
}; 
 
switch (_randPol) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [10939.856, 13401.333, 0.23598298], [], 0, "CAN_COLLIDE"]; 
_this setDir -151.51292; 
_this setPos [10939.856, 13401.333, 0.23598298]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPoli = [10939.856, 13401.333, 0.23598298]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [11049.821, 13310.272, 0.20318286], [], 0, "CAN_COLLIDE"]; 
_this setDir -56.919708; 
_this setPos [11049.821, 13310.272, 0.20318286]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPoli = [11049.821, 13310.272, 0.20318286]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [10800.554, 13473.887, 5.3405762e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -186.09001; 
_this setPos [10800.554, 13473.887, 5.3405762e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPoli = [10800.554, 13473.887, 5.3405762e-005]; 
}; 
 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [11169.645, 13581.769, 1.1444092e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -132.00058; 
_this setPos [11169.645, 13581.769, 1.1444092e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posPoli = [11169.645, 13581.769, 1.1444092e-005]; 
}; 
}; 
 
switch (_randChal) do 
{ 
case "1"; 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [20243.072, 11609.197, -0.00046157837], [], 0, "CAN_COLLIDE"]; 
_this setDir -251.48555; 
_this setPos [20243.072, 11609.197, -0.00046157837]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posCha = [20243.072, 11609.197, -0.00046157837]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [20061.037, 11704.352, -6.8664551e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -28.08646; 
_this setPos [20061.037, 11704.352, -6.8664551e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posCha = [20061.037, 11704.352, -6.8664551e-005]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [20422.553, 11808.908, 0.1548111], [], 0, "CAN_COLLIDE"]; 
_this setDir -231.98763; 
_this setPos [20422.553, 11808.908, 0.1548111]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posCha = [20422.553, 11808.908, 0.1548111]; 
}; 
}; 
 
switch (_randNega) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4805.1289, 16122.891, -0.0001373291], [], 0, "CAN_COLLIDE"]; 
_this setDir -168.23157; 
_this setPos [4805.1289, 16122.891, -0.0001373291]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNega = [4805.1289, 16122.891, -0.0001373291]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4911.0947, 16205.058, 3.0517578e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -178.30113; 
_this setPos [4911.0947, 16205.058, 3.0517578e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNega = [4911.0947, 16205.058, 3.0517578e-005]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [4950.397, 16124.938, -3.0517578e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir 11.913534; 
_this setPos [4950.397, 16124.938, -3.0517578e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posNega = [4950.397, 16124.938, -3.0517578e-005]; 
}; 
}; 
 
switch (_randSyr) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [8541.7432, 18231.762, 1.5258789e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -202.47409; 
_this setPos [8541.7432, 18231.762, 1.5258789e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSyr = [8541.7432, 18231.762, 1.5258789e-005]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [8530.7871, 18472.115, -6.1035156e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -41.698257; 
_this setPos [8530.7871, 18472.115, -6.1035156e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSyr = [8530.7871, 18472.115, -6.1035156e-005]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [8733.6836, 18186.943, -3.0517578e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -216.49538; 
_this setPos [8733.6836, 18186.943, -3.0517578e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posSyr = [8733.6836, 18186.943, -3.0517578e-005]; 
}; 
}; 
 
switch (_randDor) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [19268.359, 13193.695, 0.00017929077], [], 0, "CAN_COLLIDE"]; 
_this setDir -208.80121; 
_this setPos [19268.359, 13193.695, 0.00017929077]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posDor = [19268.359, 13193.695, 0.00017929077]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [19426.662, 13253.027, 0.12471627], [], 0, "CAN_COLLIDE"]; 
_this setDir -36.142529; 
_this setPos [19426.662, 13253.027, 0.12471627]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posDor = [19426.662, 13253.027, 0.12471627]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [19422.924, 13434.982, 3.0517578e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -88.769005; 
_this setPos [19422.924, 13434.982, 3.0517578e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posDor = [19422.924, 13434.982, 3.0517578e-005]; 
}; 
}; 
 
switch (_randAbde) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9461.6143, 20252.373, -5.3405762e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -108.69684; 
_this setPos [9461.6143, 20252.373, -5.3405762e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAbd = [9461.6143, 20252.373, -5.3405762e-005]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9321.4307, 20284.51, 0.076788649], [], 0, "CAN_COLLIDE"]; 
_this setDir -168.81619; 
_this setPos [9321.4307, 20284.51, 0.076788649]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAbd = [9321.4307, 20284.51, 0.076788649]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [9465.3125, 20157.758, 3.0517578e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -287.38861; 
_this setPos [9465.3125, 20157.758, 3.0517578e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posAbd = [9465.3125, 20157.758, 3.0517578e-005]; 
}; 
}; 
 
switch (_randMol) do 
{ 
case "1": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [26840.816, 23112.621, 5.7220459e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -329.07452; 
_this setPos [26840.816, 23112.621, 5.7220459e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posMol = [26840.816, 23112.621, 5.7220459e-005]; 
}; 
 
case "2": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [26982.207, 23200.578, 3.8146973e-005], [], 0, "CAN_COLLIDE"]; 
_this setDir -311.31366; 
_this setPos [26982.207, 23200.578, 3.8146973e-005]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posMol = [26982.207, 23200.578, 3.8146973e-005]; 
}; 
 
case "3": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [27099.635, 23113.145, -0.00024414063], [], 0, "CAN_COLLIDE"]; 
_this setDir -403.17245; 
_this setPos [27099.635, 23113.145, -0.00024414063]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posMol = [27099.635, 23113.145, -0.00024414063]; 
}; 
 
case "4": 
{ 
_this = createVehicle ["Land_GarbageContainer_closed_F", [27114.426, 23336.275, 0.00046920776], [], 0, "CAN_COLLIDE"]; 
_this setDir -312.50876; 
_this setPos [27114.426, 23336.275, 0.00046920776]; 
_initCodes set [count _initCodes,[_this,"this allowdamage false; this enableSimulation false; this setVariable[""NewSpawn"",true,true];"]]; 
 
posMol = [27114.426, 23336.275, 0.00046920776]; 
}; 
}; 
 
{ 
this = _x select 0; 
[] call compile (_x select 1); 
} foreach _initCodes; 
runInitScript; 
}; 
diag_log "Muell Spawnen fertig"; 
 
_muellContainers =  
[ 
posKav,posPan,posZar,posGra,posAth,posPyr, 
posPar,posSof,posFer,posKor,posNer,posAgios, 
posPoli,posCha,posNega,posSyr,posDor,posAbd, 
posMol 
]; 
 
 
[_muellContainers] call HClient_fnc_MuellInfoSet;