/*################################
#	(c) 2016 Minefactory         #
#								 #
#	Author: PierreAmyf      	 #
#	Lizenz: Lizenz.txt Lesen!	 #
#	File: MineFactory_Config     #
################################*/

private["_craft"];
_craft = [_this,0,0,[0]] call BIS_fnc_param;
_shop = craft_shop;


switch(_craft) do
{
	if(_shop == "weapons") then
	{
		case 0:
		{	
			[
				//[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem]
				["LMG_Mk200_F", ["IBolzen",1,"IFeder",1,"ILauf",1,"IAuswerfer",1,"ISchlagbolzen",1,"IAbzug",1,"ISchlitten",1,"IStahlLegirung",5,"IGriffstuck",1]],
				["200Rnd_65x39_cased_Box", ["IGehause",2,"schwarzrefined",20]],
				["srifle_GM6_camo_LRPS_F", ["IBolzen",2,"IFeder",3,"ILauf",2,"IAuswerfer",1,"ISchlagbolzen",2,"IAbzug",1,"ISchlitten",1,"IStahlLegirung",7,"IGriffstuck",2,"goldbar",2]],
				["5Rnd_127x108_Mag", ["IGehause",1,"schwarzrefined",5]],
				["optic_KHS_hex", ["IGehause",3,"glass",4,"IStahlLegirung",1,"bleiRefined",1]]
			];
		};
		
	}else{
        
        if(_shop == "vehicles") then
        {
            case 0:
            {

                [
                    //[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem]
					["B_MRAP_01_F", ["Imotor",1,"Ireifen",4,"IStosstange",2,"IFedern",4,"IKabelbaum",1,"IGetriebe",1,"IBeleuchtung",4,"glass",6,"IABS",1,"ILenkrad",1,"ISitze",4,"IBatterie",1,"fuelFull",2,"IPanzerung",1], "Item_MRAP_01_F", 1],
					["O_MRAP_02_F", ["Imotor",1,"Ireifen",4,"IStosstange",2,"IFedern",4,"IKabelbaum",2,"IGetriebe",1,"IBeleuchtung",4,"glass",6,"ILenkrad",1,"ISitze",5,"IBatterie",1,"fuelFull",2,"IPanzerung",1], "Item_MRAP_02_F", 1],
					["O_Heli_Attack_02_F", ["Imotor",3,"IMRotor",2,"ISRotor",1,"Iseilwinde",1,"IIsstrumente",2,"IFahrwerk",1,"IHuelle",2,"IThermal",1,"IPanzerung",4], "Item_Heli_Attack_02_F", 1],
					["B_Heli_Transport_03_F", ["Imotor",4,"IMRotor",4,"Iseilwinde",1,"IIsstrumente",2,"IFahrwerk",1,"IHuelle",2,"IThermal",1,"IPanzerung",4], "Item_Heli_Transport_03_F", 1]
                ];
            };
	
	}else{
			if(_shop == "clothing") then
			{
				case 0:
				{

					[
						//[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem]
						//Anzüge
						["U_IG_Guerilla1_1", ["peach",1]]
					];
				};
			};
		};
	};
};