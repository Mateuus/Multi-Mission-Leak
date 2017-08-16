
private["_control","_index","_infoboxtext","_Preis","_item","_hasMM","_hasApex"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _control OR _index == -1) exitWith {closeDialog 0;};

if(!isnull weapon_shop_vehicle) then {
	deletevehicle weapon_shop_vehicle;
}; 

_infoboxtext = ((findDisplay 38400) displayCtrl 38404);
_item = _control lbData _index;
_infos = [_item] call life_fnc_fetchCfgDetails;

_hasApex = if(_item in ["arifle_AKS_F","arifle_ARX_blk_F","arifle_CTAR_blk_F","arifle_AKM_F","srifle_DMR_07_blk_F","LMG_03_F"]) then {"Dies ist ein Apex-DLC-Inhalt! <img image='a3\ui_f\data\logos\arma3_bundle_icon_ca.paa' /><br/><br/>"} else {""};
_hasMM = if(_item in ["srifle_DMR_06_camo_F","srifle_DMR_03_F"]) then {"Dies ist ein Marksmen-DLC-Inhalt! <img image='a3\ui_f\data\logos\arma3_bundle_icon_ca.paa' /><br/><br/>"} else {""};

if(_infos select 6 == "CfgMagazines") then {  
	weapon_shop_vehicle = "groundweaponholder" createvehiclelocal [0,0,0];	
	weapon_shop_vehicle addmagazineCargo [_item,1];
	weapon_shop_vehicle setpos [7107.6,16552.8,1.3];
	weapon_shop_vehicle setVectorDirAndUp [[0,0,1],[0,1,0]];	
	weapon_shop_vehicle enableSimulation false;
};

if(_infos select 6 == "CfgWeapons") then {
	weapon_shop_vehicle = "groundweaponholder" createvehiclelocal [0,0,0];
	weapon_shop_vehicle addWeaponCargo [_item,1]; 		
	weapon_shop_vehicle setpos [7107.6,16552.8,1.3];
	weapon_shop_vehicle setVectorDirAndUp [[0,0,1],[0,1,0]]; 	
	weapon_shop_vehicle enableSimulation false;
};

if(_infos select 6 == "CfgGlasses") then {
	weapon_shop_vehicle = "groundweaponholder" createvehiclelocal [0,0,0];
	weapon_shop_vehicle addItemCargo [_item,1];
	weapon_shop_vehicle setpos [7107.6,16552.8,1.3];
	weapon_shop_vehicle setVectorDirAndUp [[0,0,1],[0,1,0]];	
	weapon_shop_vehicle enableSimulation false;
};

if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	_iS = [_item,playerside] call life_fnc_classPrices;
	if(_iS == -1) then {_Preis = 100;} else {_Preis = _iS/2;};
	_control lbSetValue[_index,_Preis];

	_infoboxtext ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t><br/><br/>Preis: <t color='#8cff9b'>%2€</t><br/><br/>%3%4",(_infos select 9),[_Preis] call life_fnc_numberText,_hasMM,_hasApex];
} else {
	_iS = [_item,playerside] call life_fnc_classPrices;
	if(_iS == -1) then {_Preis = 100;} else {_Preis = _iS;};
	_control lbSetValue[_index,_Preis];

	_infoboxtext ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t><br/><br/>Preis: <t color='#8cff9b'>%2€</t><br/><br/>%3%4",(_infos select 9),[_Preis] call life_fnc_numberText,_hasMM,_hasApex];
}