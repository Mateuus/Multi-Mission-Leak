private["_array", "_abc", "_pos", "_kfz", "_vehicle", "_buchstabe", "_number"];
_vehicle = _this select 0;
_kfz = life_veh_kfz;
if (!alive _vehicle OR isNull _vehicle) exitWith {};
_array = toArray _kfz;
_numberplaterear = "UserTexture1m_F"
createVehicle[0, 0, 0];
_numberplaterear setObjectTextureGlobal[0, "images\ kfzbackground.paa"];
_numberplatefront = "UserTexture1m_F"
createVehicle[0, 0, 0];
_numberplatefront setObjectTextureGlobal[0, "images\ kfzbackground.paa"];
switch (true) do {
    case (typeOf _vehicle in ["C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]):{
            _numberplaterear attachTo[_vehicle, [-0.04, -3.14, -.7]];
            _numberplatefront attachTo[_vehicle, [.02, 2.099, -.26]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.04, 0.02, 0.135, 0.195, 0.27, 0.33, 0.39];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.145, -.7]];
                _pos = [0.02, -0.04, -0.155, -0.215, -0.29, -0.35, -0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 2.1, -.26]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["C_Offroad_01_F", "B_G_Offroad_01_F", "C_Offroad_01_repair_F", "I_G_Offroad_01_F"]):{
            _numberplaterear attachTo[_vehicle, [0.14, -2.89, -.39]];
            _numberplatefront attachTo[_vehicle, [-.02, 2.613, -.18]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.14, 0.20, 0.315, 0.375, 0.45, 0.51, 0.56];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -2.90, -.39]];
                _pos = [-0.02, -0.08, -0.195, -0.255, -0.33, -0.39, -0.44];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 2.615, -.18]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " C_Offroad_02_unarmed_F"):{
            _numberplaterear attachTo[_vehicle, [-0.1, -1.8, -0.5]];
            _numberplatefront attachTo[_vehicle, [-0.02, 2.32, -.36]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.1, -0.04, 0.075, 0.135, 0.21, 0.27, 0.33];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -1.8, -0.498]];
                _pos = [-0.02, -0.08, -0.195, -0.255, -0.33, -0.39, -0.44];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 2.33, -.36]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["C_Hatchback_01_F", "C_Hatchback_01_sport_F"]):{
            _numberplaterear attachTo[_vehicle, [-0.04, -2.509, -.02]];
            _numberplatefront attachTo[_vehicle, [-0.02, 2.32, -.36]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.04, 0.02, 0.135, 0.195, 0.27, 0.33, 0.39];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -2.511, -.02]];
                _pos = [-0.02, -0.08, -0.195, -0.255, -0.33, -0.39, -0.44];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 2.33, -.36]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["C_Quadbike_01_F"]):{
            _numberplaterear attachTo[_vehicle, [-0.04, -1.12, -.3]];
            _numberplatefront attachTo[_vehicle, [0.02, 1.07, -.45]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.04, 0.02, 0.135, 0.195, 0.27, 0.33, 0.39];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -1.125, -.3]];
                _pos = [0.02, -0.04, -0.155, -0.215, -0.29, -0.35, -0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 1.075, -.45]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["I_Truck_02_transport_F", "I_Truck_02_covered_F", "C_Truck_02_covered_F", "C_Truck_02_transport_F"]):{
            _numberplaterear attachTo[_vehicle, [-0.00, -3.52, -.67]];
            _numberplatefront attachTo[_vehicle, [.08, 3.92, -.88]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.00, 0.06, 0.175, 0.235, 0.31, 0.37, 0.43];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.525, -.67]];
                _pos = [0.08, 0.02, -0.095, -0.155, -0.23, -0.29, -0.35];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 3.925, -.88]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["I_Truck_02_fuel_F", "O_Truck_02_fuel_F", "C_Truck_02_fuel_F"]):{
            _numberplaterear attachTo[_vehicle, [-0.35, -3.74, -.82]];
            _numberplatefront attachTo[_vehicle, [.01, 3.92, -.85]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.35, -0.29, -0.175, -0.115, -0.04, 0.02, 0.08];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.745, -.82]];
                _pos = [0.01, -0.05, -0.165, -0.225, -0.3, -0.36, -0.42];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 3.925, -.85]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["I_Truck_02_box_F", "C_Truck_02_box_F"]):{
            _numberplaterear attachTo[_vehicle, [-0.35, -3.54, -.82]];
            _numberplatefront attachTo[_vehicle, [.01, 4.11, -.85]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.35, -0.29, -0.175, -0.115, -0.04, 0.02, 0.08];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.545, -.82]];
                _pos = [0.01, -0.05, -0.165, -0.225, -0.3, -0.36, -0.42];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 4.115, -.85]];
                _number setdir 180;
            };
        };
    case (typeOf _vehicle in ["O_Truck_03_covered_F", "O_Truck_03_transport_F"]):{
            _numberplaterear attachTo[_vehicle, [.03, -4.64, -.37]];
            _numberplatefront attachTo[_vehicle, [.10, 3.58, -.84]];
            _numberplatefront setdir 180;
            _numberplatefront setVectorDirAndUp[[0, -0.5, 0.5], [0, 0, 1]];
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.03, 0.09, 0.205, 0.265, 0.34, 0.40, 0.46];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -4.645, -.37]];
                _pos = [0.10, 0.04, -0.075, -0.135, -0.21, -0.27, -0.33];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 3.585, -.84]];
                _number setdir 180;
                _number setVectorDirAndUp[[0, -0.5, 0.5], [0, 0, 1]];
            };
        };
    case (typeOf _vehicle in ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]):{
            _numberplaterear attachTo[_vehicle, [0.02, -5.04, -.21]];
            _numberplatefront attachTo[_vehicle, [-.32, 5.13, -.08]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.02, 0.08, 0.195, 0.255, 0.33, 0.39, 0.45];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -5.045, -.21]];
                _pos = [-0.32, -0.38, -0.495, -0.555, -0.63, -0.69, -0.75];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 5.135, -.08]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " O_Truck_03_fuel_F"):{
            _numberplaterear attachTo[_vehicle, [.03, -4.84, -.13]];
            _numberplatefront attachTo[_vehicle, [.10, 3.38, -.58]];
            _numberplatefront setdir 180;
            _numberplatefront setVectorDirAndUp[[0, -0.5, 0.5], [0, 0, 1]];
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.03, 0.09, 0.205, 0.265, 0.34, 0.40, 0.46];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -4.845, -.13]];
                _pos = [0.10, 0.04, -0.075, -0.135, -0.21, -0.27, -0.33];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 3.385, -.58]];
                _number setdir 180;
                _number setVectorDirAndUp[[0, -0.5, 0.5], [0, 0, 1]];
            };
        };
    case (typeof _vehicle in ["O_Truck_03_device_F", "O_Truck_03_ammo_F"]):{
            _numberplaterear attachTo[_vehicle, [.03, -4.93, -.13]];
            _numberplatefront attachTo[_vehicle, [.10, 3.3, -.58]];
            _numberplatefront setdir 180;
            _numberplatefront setVectorDirAndUp[[0, -0.5, 0.5], [0, 0, 1]];
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.03, 0.09, 0.205, 0.265, 0.34, 0.40, 0.46];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -4.935, -.13]];
                _pos = [0.10, 0.04, -0.075, -0.135, -0.21, -0.27, -0.33];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 3.335, -.58]];
                _number setdir 180;
                _number setVectorDirAndUp[[0, -0.5, 0.5], [0, 0, 1]];
            };
        };
    case (_vehicle isKindOf " C_SUV_01_F"):{
            _numberplaterear attachTo[_vehicle, [-0.041, -2.93, .12]];
            _numberplatefront attachTo[_vehicle, [0.02, 2.38, -.33]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.041, 0.021, 0.1351, 0.1951, 0.271, 0.331, 0.391];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -2.94, .12]];
                _pos = [0.02, -0.04, -0.155, -0.215, -0.29, -0.35, -0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 2.385, -.33]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " I_MRAP_03_F"):{
            _numberplaterear attachTo[_vehicle, [-0.041, -3, .42]];
            _numberplatefront attachTo[_vehicle, [0.02, 2.585, 0]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.041, 0.021, 0.1351, 0.1951, 0.271, 0.331, 0.391];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.01, .42]];
                _pos = [0.02, -0.04, -0.155, -0.215, -0.29, -0.35, -0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 2.59, 0]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " B_MRAP_01_F"):{
            _numberplaterear attachTo[_vehicle, [-0.041, -3.75, -1.1]];
            _numberplatefront attachTo[_vehicle, [0.02, 1.55, -0.4]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.041, 0.021, 0.1351, 0.1951, 0.271, 0.331, 0.391];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.78, -1.1]];
                _pos = [0.02, -0.04, -0.155, -0.215, -0.29, -0.35, -0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 1.555, -0.4]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " B_Truck_01_ammo_F"):{
            _numberplaterear attachTo[_vehicle, [0.00, -4.33, -.22]];
            _numberplatefront attachTo[_vehicle, [-.32, 5.17, .25]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.00, 0.06, 0.175, 0.235, 0.31, 0.37, 0.43];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -4.335, -.22]];
                _pos = [-0.32, -0.38, -0.495, -0.555, -0.63, -0.69, -0.75];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 5.175, .25]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " B_Truck_01_fuel_F"):{
            _numberplaterear attachTo[_vehicle, [0.02, -5.0, -.17]];
            _numberplatefront attachTo[_vehicle, [-.32, 5.03, .25]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [0.02, 0.08, 0.195, 0.255, 0.33, 0.39, 0.45];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -5.01, -.17]];
                _pos = [-0.32, -0.38, -0.495, -0.555, -0.63, -0.69, -0.75];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 5.035, .25]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " B_Truck_01_box_F"):{
            _numberplaterear attachTo[_vehicle, [-.02, -4.655, -.5]];
            _numberplatefront attachTo[_vehicle, [-.34, 5.26, -.15]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.02, 0.04, 0.155, 0.215, 0.29, 0.35, 0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -4.6555, -.5]];
                _pos = [-0.34, -0.4, -0.515, -0.575, -0.65, -0.71, -0.77];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 5.265, -.15]];
                _number setdir 180;
            };
        };
    case (_vehicle isKindOf " B_Truck_01_mover_F"):{
            _numberplaterear attachTo[_vehicle, [-.01, -3.85, -.6]];
            _numberplatefront attachTo[_vehicle, [-.34, 4.745, 0.25]];
            _numberplatefront setdir 180;
            for " _i"
            from 0 to(count _array) - 1 do {
                _buchstabe = toString[(_array select _i)];
                _pos = [-0.02, 0.04, 0.155, 0.215, 0.29, 0.35, 0.41];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), -3.855, -.6]];
                _pos = [-0.34, -0.4, -0.515, -0.575, -0.65, -0.71, -0.77];
                _number = "UserTexture1m_F"
                createVehicle[0, 0, 0];
                _number setObjectTextureGlobal[0, format["images\ abc\ % 1. paa", _buchstabe]];
                _number attachTo[_vehicle, [(_pos select _i), 4.746, 0.25]];
                _number setdir 180;
            };
        };
};