#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable
#define __GETC__(var) (call var) //Quick clean macro for getting a value of a constant / compileFinal variable. i.e if(__GETC__(numberone) == 1) then {}
#define __SUB__(var1,var2) var1 = var1 - var2

//Control Macros
#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

//Config Macros
#define M_CONFIG(TYPE,CFG,CLASS,ENTRY) TYPE(missionConfigFile >> CFG >> CLASS >> ENTRY)
#define DWEV_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "DWEV_Settings" >> SETTING)
#define FETCH_CONFIG(TYPE,CFG,SECTION,CLASS,ENTRY) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY)
#define FETCH_CONFIG2(TYPE,CFG,CLASS,ENTRY) TYPE(configFile >> CFG >> CLASS >> ENTRY)
#define FETCH_CONFIG3(TYPE,CFG,SECTION,CLASS,ENTRY,SUB) TYPE(configFile >> CFG >> SECTION >> CLASS >> ENTRY >> SUB)
#define ITEM_VARNAME(varName) format ["DWEV_inv_%1",M_CONFIG(getText,"VirtualItems",varName,"variable")]
#define ITEM_VALUE(varName) missionNamespace getVariable [ITEM_VARNAME(varName),0]
#define ITEM_ILLEGAL(varName) M_CONFIG(getNumber,"VirtualItems",varName,"illegal")
#define ITEM_SELLPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"sellPrice")
#define ITEM_BUYPRICE(varName) M_CONFIG(getNumber,"VirtualItems",varName,"buyPrice")
#define ITEM_NAME(varName) M_CONFIG(getText,"VirtualItems",varName,"displayName")
#define ITEM_WAFFE(varName) M_CONFIG(getText,"VirtualWaffen",varName,"displayName")
#define LICENSE_VARNAME(varName,flag) format ["l%1_%2",flag,M_CONFIG(getText,"Licenses",varName,"variable")]
#define LICENSE_VALUE(varName,flag) missionNamespace getVariable [LICENSE_VARNAME(varName,flag),false]

//Condition Macros
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitWith { _res = true };} forEach _types;_res}

//Player based quick macros
#define grpPlayer group player
#define steamid getPlayerUID player
//Realname
#define getMyName player getVariable ["realname",profilename]
#define getPlayerName(unit) unit getVariable ["realname",name unit]
//Displayname
#define getMyDName player getVariable ["displayname",(player getVariable ["realname",profilename])] 
#define getPlayerDName(unit) unit getVariable ["displayname",(unit getVariable ["realname",name unit])]
//Gangname
#define getMyGang (group player) getVariable ["gang_name","ERROR2"]
#define getPlayerGang(unit) (group unit) getVariable ["gang_name","ERROR2"]
//Gangtag
#define getMyTag (group player) getVariable ["gang_tag","ERROR1"]
#define getPlayerTag(unit) (group unit) getVariable ["gang_tag","ERROR1"]


//--- fahrzeugshop
#define IDC_FAHRZEUGSHOP_MAIN 2300
#define IDC_FAHRZEUGSHOP_DROPDOWN_FAHRZEUGTYPEN 2302
#define IDC_FAHRZEUGSHOP_DROPDOWN_LACKIERUNGEN 2304
#define IDC_FAHRZEUGSHOP_VEHICLEINFORMATIONEN_LISTBOX 2303
#define IDC_FAHRZEUGSHOP_BUTTON_KAUFEN 507037
#define IDC_FAHRZEUGSHOP_BUTTON_MIETEN 507038
#define IDC_FAHRZEUGSHOP_BUTTON_SCHLIESSEN 507002

//--- Tankstellendialoge
#define IDC_GASSTAION_VEHICLESELECTION_MAIN 2401
#define IDC_GASSTAION_VEHICLESELECTION_LIST 2402
#define IDC_GASSTAION_FUELVEHICLE_MAIN 2403
#define IDC_GASSTAION_FUELVEHICLE_VEHINFOTXT 2404
#define IDC_GASSTAION_FUELVEHICLE_FUELCAPACITY 2405
#define IDC_GASSTAION_FUELVEHICLE_MISSINGFUEL 2406
#define IDC_GASSTAION_FUELVEHICLE_LITERPRICE 2407
#define IDC_GASSTAION_FUELVEHICLE_REFUELD 2408
#define IDC_GASSTAION_FUELVEHICLE_REFUELPRICE 2409
#define IDC_GASSTATION_VEHICLESELECTION_BTN_CARGO 2410
#define IDC_GASSTATION_VEHICLESELECTION_ICON_CARGO 2411


// FW NachrichtenZentrale
#define IDC_FW_Zentral_Display 88888;
#define IDC_FW_Zentral_MessageList 88882;
#define IDC_FW_Zentral_MessageShow 88887;
#define IDC_FW_Zentral_MessageHeader 88890;


//Preocess
#define IDC_PROCESS_VEHICLESELECTION_MAIN 2420
#define IDC_PROCESS_VEHICLESELECTION_LIST 2421

#define IDC_interact_Btn1 37450
#define IDC_interact_Btn2 37451
#define IDC_interact_Btn3 37452
#define IDC_interact_Btn4 37453
#define IDC_interact_Btn5 37454
#define IDC_interact_Btn6 37455
#define IDC_interact_Btn7 37456
#define IDC_interact_Btn8 37457
#define IDC_interact_Btn9 37458
#define IDC_interact_Btn10 37459
#define IDC_interact_Btn11 37460
#define IDC_interact_Btn12 37461
#define IDC_interact_Btn13 37462
#define IDC_interact_Btn14 37463
#define IDC_interact_Title 37401