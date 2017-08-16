private["_craft","_return"];
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0}; //Bad shop type passed.
switch(_craft) do
{
	case "material":
	{
		_return = [
                //[Object classname, [item #1,quantity item #1,item #2,quantity item #2],outputitem]
				//Standart Auto
                ["Imotor", ["iron_refined",5,"copper_refined",3,"nitro",1,"storageSmall",1,"IKolbenzurueckholfeder",3,"IRitzel",2]],
				["Ireifen", ["IFelge",1,"IGummi",2,"ISchrauben",6]],
				["IStosstange", ["iron_refined",7,"copper_refined",5,"cement",4]],
				["IFedern", ["IKolbenzurueckholfeder",3,"iron_refined",4]],
				["IKabelbaum", ["IGummi",10,"copper_refined",13]],
				["IGetriebe", ["Igetriebesand",2,"IRitzel",10,"storageSmall",1]],
				["IBeleuchtung", ["IGluhlampe",1,"glass",2]],
				["IABS", ["IElektronik",2,"IKabelbaum",1]],
				["ILenkrad", ["IGummi",2,"iron_refined",2]],
				["ISitze", ["IStoff",2,"iron_refined",1]],
				["IBatterie", ["salt_refined",13,"storageSmall",1,"copper_refined",2]],
				["IKarosserie", ["iron_refined",12,"copper_refined",10]],
				//Standart Heli
				["IMRotor", ["IKugellager",1,"iron_refined",15]],
				["ISRotor", ["IKugellager",1,"iron_refined",7]],
				["Iseilwinde", ["IStoff",4,"iron_refined",2,"IElektronik",1]],
				["IIsstrumente", ["IElektronik",5,"glass",4,"IKabelbaum",1]],
				["IFahrwerk", ["Ireifen",3,"iron_refined",2]],
				["IHuelle", ["iron_refined",20,"cement",2]],
				//Speziell
				["IThermal", ["lsdp",3,"iron_refined",1]],
				["IPanzerung", ["IKruppstahl",3]],
				//Einzelteile
				["Igetriebesand", ["sand",4]],
				["IKolbenzurueckholfeder", ["iron_refined",3,"carbonrefined",2]],
				["IFelge", ["carbonrefined",3,"iron_refined",2]],
				["IGummi", ["oil_processed",10]],
				["ISchrauben", ["carbonrefined",1,"iron_refined",1]],
				["IRitzel", ["carbonrefined",2,"copper_refined",1]],
				["IGluhlampe", ["glass",1,"copper_refined",1]],
				["IElektronik", ["copper_refined",1,"IGummi",1]],
				["IStoff", ["salt_refined",2,"bleirefined",1]],
				["IKugellager", ["iron_refined",2,"oil_processed",1]],
				["IKruppstahl", ["iron_refined",1,"copper_refined",1,"bleiRefined",1]],
				["IBolzen", ["IRundeForm",1,"IGewindeschneider",1,"bleiRefined",1]],
				["IFeder", ["iron_refined",7,"lockpick",3]],
				["ILauf", ["IRundeForm",1,"IStahlLegirung",2,"IGewindeschneider",1]],
				["IAuswerfer", ["iron_refined",2,"bleiRefined",1]],
				["ISchlagbolzen", ["IRundeForm",1,"IStahlLegirung",1,"iron_refined",1]],
				["IAbzug", ["iron_refined",1,"diamond_cut",1]],
				["ISchlitten", ["IStahlLegirung",2]],
				["IStahlLegirung", ["iron_refined",1,"copper_refined",1,"bleiRefined",1]],
				["IGriffstuck", ["holzrefined",3,"IStahlLegirung",1]],
				["IRundeForm", ["cement",3]],
				["IGewindeschneider", ["iron_refined",3,"IStahlLegirung",1,"IRundeForm",1]],
				["IGehause", ["iron_refined",1,"IStahlLegirung",1]]
					
        ];
	};
};
_return; 