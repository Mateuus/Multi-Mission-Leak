private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
ctrlSetText[3103,"Boutique de plongée"];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_Wetsuit",nil,200],
			["U_O_Wetsuit",nil,200],
			["U_I_Wetsuit",nil,200]
		];
	};
	case 1:
	{
		[
		];
	};	
	case 2:
	{
		[
			["G_Diving",nil,50]
		];
	};	
	case 3:
	{
		[
			["V_RebreatherB",nil,500],
			["V_RebreatherIR",nil,500],
			["V_RebreatherIA",nil,500]
		];
	};	
	case 4:
	{
		[
		];
	};
};