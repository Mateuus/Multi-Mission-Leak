/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Polizei Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms/////////////////////////////////////////////////////////////// 
	case 0:
	{
		if((call EMonkeys_coplevel) == 1) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25];
		};
		if((call EMonkeys_coplevel) == 2) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25];	
			_ret  pushBack ["U_B_Wetsuit","Taucheranzug",550];		
		};
		if((call EMonkeys_coplevel) == 3) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25];   			
			_ret  pushBack ["U_O_Wetsuit","Taucheranzug",5000];
			_ret  pushBack ["U_B_Wetsuit","Taucheranzug",5000];
			_ret  pushBack ["U_Marshal","Zivilkleidung 1",5000];   
			_ret  pushBack ["U_C_Poor_2","Zivilkleidung 2",5000];                  
			_ret  pushBack ["U_IG_Guerilla2_2","Zivilkleidung 3",5000];
            _ret  pushBack ["U_IG_Guerilla3_1","Zivilkleidung 4",5000];
            _ret  pushBack ["U_IG_Guerilla2_3","Zivilkleidung 5",5000];  			
		};
		if((call EMonkeys_coplevel) == 4) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25];               
			_ret  pushBack ["U_O_Wetsuit","Taucheranzug",5000];
			_ret  pushBack ["U_B_Wetsuit","Taucheranzug",5000];    
			_ret  pushBack ["U_Marshal","Zivilkleidung 1",5000];   
			_ret  pushBack ["U_C_Poor_2","Zivilkleidung 2",5000];                  
			_ret  pushBack ["U_IG_Guerilla2_2","Zivilkleidung 3",5000];
            _ret  pushBack ["U_IG_Guerilla3_1","Zivilkleidung 4",5000];
            _ret  pushBack ["U_IG_Guerilla2_3","Zivilkleidung 5",5000]; 

		};
		if((call EMonkeys_coplevel) == 5) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25];
            _ret  pushBack ["U_B_CombatUniform_mcam","SEK Uniform",25];  
            _ret  pushBack ["U_O_Wetsuit","Taucheranzug",5000];
            _ret  pushBack ["U_B_Wetsuit","Taucheranzug",5000];
            _ret  pushBack ["U_Marshal","Zivilkleidung 1",5000];   
            _ret  pushBack ["U_C_Poor_2","Zivilkleidung 2",5000];                  
            _ret  pushBack ["U_IG_Guerilla2_2","Zivilkleidung 3",5000];
            _ret  pushBack ["U_IG_Guerilla3_1","Zivilkleidung 4",5000];
            _ret  pushBack ["U_IG_Guerilla2_3","Zivilkleidung 5",5000];	
		};
		if((call EMonkeys_coplevel) == 6) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25];
			_ret  pushBack ["U_B_CombatUniform_mcam","SEK Uniform",25];
            _ret  pushBack ["U_O_Wetsuit","Taucheranzug",5000];
            _ret  pushBack ["U_B_Wetsuit","Taucheranzug",5000];    
            _ret  pushBack ["U_Marshal","Zivilkleidung 1",5000];   
            _ret  pushBack ["U_C_Poor_2","Zivilkleidung 2",5000];                  
            _ret  pushBack ["U_IG_Guerilla2_2","Zivilkleidung 3",5000];
            _ret  pushBack ["U_IG_Guerilla3_1","Zivilkleidung 4",5000];
            _ret  pushBack ["U_IG_Guerilla2_3","Zivilkleidung 5",5000];
		};
		if((call EMonkeys_coplevel) == 7) then
		{
			_ret  pushBack ["U_Rangemaster","Polizei Uniform",25]; 
			_ret  pushBack ["U_B_CombatUniform_mcam","SEK Uniform",25];			
            _ret  pushBack ["U_O_Wetsuit","Taucheranzug",5000];
            _ret  pushBack ["U_B_Wetsuit","Taucheranzug",5000];    
            _ret  pushBack ["U_Marshal","Zivilkleidung 1",5000];   
            _ret  pushBack ["U_C_Poor_2","Zivilkleidung 2",5000];                  
            _ret  pushBack ["U_IG_Guerilla2_2","Zivilkleidung 3",5000];
            _ret  pushBack ["U_IG_Guerilla3_1","Zivilkleidung 4",5000];
            _ret  pushBack ["U_IG_Guerilla2_3","Zivilkleidung 5",5000];
		};
	};
	
	//Hats///////////////////////////////////////////////////////////////////////////
case 1:
    {
        if((call EMonkeys_coplevel) == 1) then
        {
            _ret  pushBack ["H_Cap_police","Basecap Polizei",75];
        };
        if((call EMonkeys_coplevel) == 2) then
        {
            _ret  pushBack ["H_Beret_blk_POLICE","Barret Polizei",75];
            _ret  pushBack ["H_Cap_police","Basecap Polizei",75];
        };
        if((call EMonkeys_coplevel) == 3) then
        {
            _ret  pushBack ["H_Beret_blk_POLICE","Barret Polizei",75];
            _ret  pushBack ["H_Cap_police","Basecap Polizei",75];
        };
        if((call EMonkeys_coplevel) == 4) then
        {
            _ret  pushBack ["H_Beret_blk_POLICE","Barret Polizei",75];
            _ret  pushBack ["H_Cap_police","Basecap Polizei",75];
        };
        if((call EMonkeys_coplevel) == 5) then
        {
			_ret  pushBack ["H_Beret_02","Barret Nato",550];
			_ret  pushBack ["H_Beret_Colonel","Barret Komissar",100];
			_ret  pushBack ["H_Beret_blk_POLICE","Barret Polizei",75];
			_ret  pushBack ["H_Cap_police","Basecap Polizei",75];  
			_ret  pushBack ["H_HelmetB_black","Helm1 Polizei",175];
			_ret  pushBack ["H_HelmetSpecB_blk","Helm2 Polizei",175];  
        };
        if((call EMonkeys_coplevel) == 6) then
        {
			_ret  pushBack ["H_Beret_02","Barret Nato",550];
			_ret  pushBack ["H_Beret_Colonel","Barret Komissar",100];
			_ret  pushBack ["H_Beret_blk_POLICE","Barret Polizei",75];
			_ret  pushBack ["H_Cap_police","Basecap Polizei",75];
			_ret  pushBack ["H_HelmetB_black","Helm1 Polizei",175];
			_ret  pushBack ["H_HelmetSpecB_blk","Helm2 Polizei",175];  
        };
        if((call EMonkeys_coplevel) == 7) then
        {
            _ret  pushBack ["H_Beret_02","Barret Nato",550];
            _ret  pushBack ["H_Beret_Colonel","Barret Komissar",100];
            _ret  pushBack ["H_Beret_blk_POLICE","Barret Polizei",75];
            _ret  pushBack ["H_Cap_police","Basecap Polizei",75];
			_ret  pushBack ["H_HelmetB_black","Helm1 Polizei",175];
			_ret  pushBack ["H_HelmetSpecB_blk","Helm2 Polizei",175];  
        };
	 };
	//Glasses////////////////////////////////////////////////////////////////////////
	case 2:
	{
		_ret = 
		[
        ["G_Shades_Black",nil,25],
        ["G_Shades_Blue",nil,20],
        ["G_Sport_Blackred",nil,20],
        ["G_Sport_Checkered",nil,20],
        ["G_Sport_Blackyellow",nil,20],
        ["G_Sport_BlackWhite",nil,20],
        ["G_Aviator",nil,75],
        ["G_Squares",nil,10],
        ["G_Spectacles_Tinted",nil,250],
        ["G_Diving","Taucherbrille",55],
		["G_Balaclava_blk","Ab Rang 5",75],
		["G_Balaclava_lowprofile",nil,75],
        ["G_Balaclava_oli",nil,10]
        ];
	};
	
	//Vest///////////////////////////////////////////////////////////////////////////
	case 3:
{
        if((call EMonkeys_coplevel) == 1) then
        {
			_ret  pushBack ["V_Rangemaster_belt",nil,750];
        };
        if((call EMonkeys_coplevel) == 2) then
        {
			_ret  pushBack ["V_Rangemaster_belt",nil,750];
			_ret  pushBack ["V_TacVest_blk_POLICE","Polizei Schwarz",550];
			_ret  pushBack ["V_RebreatherB","Tauchgerät",550];
        };
        if((call EMonkeys_coplevel) == 3) then
        {
			_ret  pushBack ["V_Rangemaster_belt",nil,750];
			_ret  pushBack ["V_TacVest_blk_POLICE","Polizei Schwarz",550];
			_ret  pushBack ["V_RebreatherB","Tauchgerät",550];
        };
        if((call EMonkeys_coplevel) == 4) then
        {
			_ret  pushBack ["V_Rangemaster_belt",nil,750];
			_ret  pushBack ["V_TacVest_blk_POLICE","Polizei Schwarz",550];
			_ret  pushBack ["V_RebreatherB","Tauchgerät",550];
			_ret  pushBack ["V_PlateCarrierSpec_blk","Schwere Weste (PSM)",1550];
        };
        if((call EMonkeys_coplevel) == 5) then
        {
			_ret  pushBack ["V_Rangemaster_belt",nil,750];
			_ret  pushBack ["V_TacVest_blk_POLICE","Polizei Schwarz",550];
			_ret  pushBack ["V_RebreatherB","Tauchgerät",550];
			_ret  pushBack ["V_PlateCarrier1_blk","Tragegurt Schwarz",1550];
			_ret  pushBack ["V_PlateCarrierSpec_blk","Schwere Weste (PSM)",1550];
			_ret  pushBack ["V_PlateCarrierGL_blk","SEK Weste",20550];
        };
        if((call EMonkeys_coplevel) == 6) then
        {
            _ret  pushBack ["V_Rangemaster_belt",nil,750];
            _ret  pushBack ["V_TacVest_blk_POLICE","Polizei Schwarz",550];
            _ret  pushBack ["V_RebreatherB","Tauchgerät",550];
            _ret  pushBack ["V_PlateCarrier1_blk","Tragegurt Schwarz",1550];
            _ret  pushBack ["V_PlateCarrierSpec_blk","Schwere Weste (PSM)",1550];
            _ret  pushBack ["V_PlateCarrierGL_blk","SEK Weste",20550];
        };
        if((call EMonkeys_coplevel) == 7) then
        {
            _ret  pushBack ["V_Rangemaster_belt",nil,750];
            _ret  pushBack ["V_TacVest_blk_POLICE","Polizei Schwarz",550];
            _ret  pushBack ["V_RebreatherB","Tauchgerät",550];
            _ret  pushBack ["V_PlateCarrier1_blk","Tragegurt Schwarz",1550];
            _ret  pushBack ["V_PlateCarrierSpec_blk","Schwere Weste (PSM)",1550];
            _ret  pushBack ["V_PlateCarrierGL_blk","SEK Weste",20550];
 
        };
    };
	
	//Backpacks//////////////////////////////////////////////////////////////////////
	case 4:
	{
		if((call EMonkeys_coplevel) == 1) then
		{
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];	
		};
		if((call EMonkeys_coplevel) == 2) then
		{
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];
		};
		if((call EMonkeys_coplevel) == 3) then
		{
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];
		};
		if((call EMonkeys_coplevel) == 4) then
			{
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];
		};
		if((call EMonkeys_coplevel) == 5) then
		        {			
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];
            _ret  pushBack ["B_UAV_01_backpack_F",nil,50000];			
		};
		if((call EMonkeys_coplevel) == 6) then
		{
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];
            _ret  pushBack ["B_UAV_01_backpack_F",nil,50000];		
                };
		if((call EMonkeys_coplevel) == 7) then
		{
			_ret  pushBack ["B_Bergen_blk",nil,3500];
			_ret  pushBack ["B_Bergen_sgg",nil,3500];
			_ret  pushBack ["B_Carryall_oli",nil,5000];
			_ret  pushBack ["B_Kitbag_cbr",nil,5000];
            _ret  pushBack ["B_UAV_01_backpack_F",nil,50000];	
		};
	};
};

_ret;