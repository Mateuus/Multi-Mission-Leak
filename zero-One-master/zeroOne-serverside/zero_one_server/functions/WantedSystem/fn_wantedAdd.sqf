/* 
 File: fn_wantedAdd.sqf 
*/ 
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"]; 
_uid = param[0,"",[""]]; 
_name = param[1,"",[""]]; 
_type = param[2,"",[""]]; 
_customBounty = param[3,-1,[0]]; 
if(_uid isEqualTo "" OR _type isEqualTo "" OR _name isEqualTo "") exitWith {}; 
 
switch(_type) do 
{ 
        case "901": {_type = [localize "STR_Wanted_Prison",5];if(_uid in jailedUnits) then {jailedUnits = jailedUnits - [_uid];};}; 
        case "487": {_type = [localize "STR_Wanted_Car_Theft",3.5]}; 
        case "482": {_type = ["Versuchter Drogenhandel",3]}; 
        case "483": {_type = [localize "STR_Wanted_Drug_trafficking",3.8]}; 
        case "1": {_type = [localize "STR_Wanted_Driving_license",0.3]}; 
        case "2": {_type = [localize "STR_Wanted_Attempted_Car",0.8]}; 
        case "3": {_type = [localize "STR_Wanted_Run_foreign_vehicle",1.2]}; 
        case "4": {_type = [localize "STR_Wanted_Driving_lights",0.2]}; 
        case "5": {_type = [localize "STR_Wanted_Excessive_speed",0.3]}; 
        case "6": {_type = [localize "STR_Wanted_Dangerous_driving",1]}; 
        case "7": {_type = [localize "STR_Wanted_Attempted_theft_police_vehicle",1.5]}; 
        case "8": {_type = [localize "STR_Wanted_Theft_police_vehicles",3.8]}; 
        case "9": {_type = [localize "STR_Wanted_Landing_no_fly",1]}; 
        case "10": {_type = [localize "STR_Wanted_Driving_illegal_vehicles",4.2]}; 
        case "11": {_type = [localize "STR_Wanted_Caused_accident",0.2]}; 
        case "12": {_type = [localize "STR_Wanted_Hit_and_Run",1]}; 
        case "13": {_type = [localize "STR_Wanted_Driving_Death",0.3]}; 
        case "14": {_type = [localize "STR_Wanted_Roadblocks",1.8]}; 
        case "15": {_type = [localize "STR_Wanted_Civil_Disorder",1.2]}; 
        case "16": {_type = [localize "STR_Wanted_Police_Arrangement",1]}; 
        case "17": {_type = [localize "STR_Wanted_Insulting",1.2]}; 
        case "18": {_type = [localize "STR_Wanted_Assaulting",1.8]}; 
        case "19": {_type = [localize "STR_Wanted_Police_Exclusion",1]}; 
        case "20": {_type = [localize "STR_Wanted_Killing_Police",5]}; 
        case "21": {_type = [localize "STR_Wanted_Fire",4.2]}; 
        case "22": {_type = [localize "STR_Wanted_Destruction",4]}; 
        case "23": {_type = [localize "STR_Wanted_Drug_possession",4]}; 
        case "24": {_type = [localize "STR_Wanted_Firearm_No_License",1.2]}; 
        case "25": {_type = [localize "STR_Wanted_Gunpoint",0.5]}; 
        case "26": {_type = [localize "STR_Wanted_Prohibited_Weapon",2.5]}; 
        case "27": {_type = [localize "STR_Wanted_Use_Firearm_City",2.2]}; 
        case "28": {_type = [localize "STR_Wanted_Kidnapping",4.8]}; 
        case "29": {_type = [localize "STR_Wanted_Robbery",2]}; 
        case "30": {_type = [localize "STR_Wanted_Bank_robbery",5]}; 
        case "31": {_type = [localize "STR_Wanted_Murder",4.5]}; 
        case "32": {_type = [localize "STR_Wanted_Uprising",3.2]}; 
        case "33": {_type = [localize "STR_Wanted_Attack",3]}; 
        case "34": {_type = [localize "STR_Wanted_Attack_Capital",5]}; 
        case "35": {_type = [localize "STR_Wanted_Attempted_landing",0.5]}; 
        case "36": {_type = [localize "STR_Wanted_200m_City",1]}; 
        case "37": {_type = [localize "STR_Wanted_Escape",5]}; 
        case "38": {_type = [localize "STR_Wanted_Flying",2]}; 
        case "39": {_type = [localize "STR_Wanted_Horn",0.1]}; 
        case "40": {_type = [localize "STR_Wanted_Animal",3.8]}; 
        case "41": {_type = [localize "STR_Wanted_Dark_Matter",4.2]}; 
        case "42": {_type = [localize "STR_Wanted_Pollution",0.2]}; 
        case "43": {_type = [localize "STR_Wanted_Bypassing_Checkpoint",2.5]}; 
        case "44": {_type = [localize "STR_Wanted_Illegal_Parking",0.1]}; 
        case "45": {_type = [localize "STR_Wanted_Prison_Break_In",4]}; 
        case "46": {_type = [localize "STR_Wanted_Bank_Raid",4.5]}; 
        case "47": {_type = [localize "STR_Wanted_House_Burglary",4]}; 
        default {_type = [];}; 
}; 
 
if(_type isEqualTo []) exitWith {}; 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
_index = [_name,tFHiSiX] call zero_fnc_oKzQhZKu; 
 
if(_index != -1) then { 
    _data = tFHiSiX select _index; 
    _crimes = _data select 2; 
    _crimes pushBack (_type select 0); 
    _val = _data select 3; 
    _newVal = (_type select 1); 
    if(_newVal > _val) then { 
        _val = _newVal; 
    }; 
    tFHiSiX set[_index,[_name,_uid,_crimes,_val]]; 
}else{ 
    tFHiSiX pushBack [_name,_uid,[(_type select 0)],(_type select 1)]; 
}; 
