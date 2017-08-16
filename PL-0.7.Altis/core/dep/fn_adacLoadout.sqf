/*---------------------------------------------------------------------------
	File: fn_adadLoadout.sqf
	Auteur: Skrow & Skyfezzer
---------------------------------------------------------------------------*/
private ["_handle"];
_mode = [_this,3,0,[0]] call BIS_fnc_param;
if(_mode == 1) then {

[] call life_fnc_saveGear;
Life_adacsavegear = life_gear;
life_adac_onDuty = true;
Life_adacsavegear set [16,[]];
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
player unassignItem _x;
player removeItem _x;
} foreach (assignedItems player);

if(hmd player != "") then {
player unlinkItem (hmd player);
};

sleep 0.4;
	player addItem "Itemradio";
	player assignItem "Itemradio";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";
	player forceAddUniform "U_Rangemaster";
	player setObjectTextureGlobal [0,"textures\Tenues\Dep\recruit_uniform_adac.paa"];
	player additem "NVGoggles";
	player assignitem "NVGoggles";
	player addHeadgear "h_cap_blk";
	player addItem "ItemGPS";
	player assignItem "ItemGPS";
	player addBackpack "B_Kitbag_mcamo";
	//player addUniform "U_Rangemaster";
	hint "Votre inventaire viens d'être changé";
	player addItem "Itemradio";
	player assignItem "Itemradio";
	player setVariable ["job",1,true];
    [] call life_fnc_skin;
}else{
	life_gear = Life_adacsavegear;
	[] spawn life_fnc_Loadgear;
	life_adac_onDuty = false;
	hint "Votre inventaire à été rechargé.";
	player setVariable ["job",0,true];
};