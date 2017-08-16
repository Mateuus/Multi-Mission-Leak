class list_contract {
	idd = 50000;
	name= "list_contract";
	movingEnable = 0;
	enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = -1;
      text = "";
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.396 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    	idc = -1;
    	text = "Setup A Contract"; //--- ToDo: Localize;
    	x = 0.29375 * safezoneW + safezoneX;
    	y = 0.313 * safezoneH + safezoneY;
    	w = 0.4125 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
    	idc = 1100;
    	text = "<t size='0.85'>Select a Player from below, set a contract amount and list it for Contract Killers to accept it. The contract amount will be deducted as soon as you list the hit. If the player selected already has a hit placed, the amount you've chosen will update the total contract amount.<br/>IMPORTANT: By Listing a Contract, you agree that the money put forward will not be given back under any circumstances!</t>"; //--- ToDo: Localize;
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.391875 * safezoneW;
    	h = 0.143 * safezoneH;
    };
    class RscListbox_1500: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.143 * safezoneH;
      sizeEx = 0.035;
    };
    class RscText_1002: Life_RscText
    {
    	idc = 1002;
    	text = "Available Targets"; //--- ToDo: Localize;
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.5 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class RscText_1003: Life_RscButtonMenu
    {
    	idc = 1003;
    	text = "X"; //--- ToDo: Localize;
    	x = 0.680469 * safezoneW + safezoneX;
    	y = 0.709 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
      onButtonClick = "call life_fnc_stoegiugoesoatr;";
    };
    class RscText_1004: Life_RscText
    {
    	idc = 1004;
    	text = "Set Amount"; //--- ToDo: Localize;
    	x = 0.479375 * safezoneW + safezoneX;
    	y = 0.555 * safezoneH + safezoneY;
    	w = 0.216563 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class amount: Life_RscEdit
    {
    	idc = 1400;
      text = "200000";
    	x = 0.489687 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.195937 * safezoneW;
    	h = 0.033 * safezoneH;
    };
    class RscText_1005: Life_RscButtonMenu
    {
    	idc = 1005;
    	text = "Confirm and List Contract"; //--- ToDo: Localize;
    	x = 0.54125 * safezoneW + safezoneX;
    	y = 0.632 * safezoneH + safezoneY;
    	w = 0.0979687 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
      onButtonClick = "call life_fnc_noatroenlepoak;";
    };
    class RscStructuredText_1101: Life_RscStructuredText
    {
    	idc = 1101;
    	text = "The minimum contract amount is $200,000";
    	x = 0.510312 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.159844 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class search: Life_RscEdit
    {
    	idc = 1401;
      text = "";
    	x = 0.304062 * safezoneW + safezoneX;
    	y = 0.522 * safezoneH + safezoneY;
    	w = 0.165 * safezoneW;
    	h = 0.033 * safezoneH;
      onKeyDown = "call life_fnc_viagiuwriaswour;";
    };
  };
};

class list_contracts
{
  idd = 50001;
  name= "list_contracts";
  movingEnable = 0;
  enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    idc = -1;
    text = "";
    x = 0.29375 * safezoneW + safezoneX;
    y = 0.313 * safezoneH + safezoneY;
    w = 0.4125 * safezoneW;
    h = 0.528 * safezoneH;
    colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1001: Life_RscText
    {
    idc = 1001;
    text = "Available Contracts"; //--- ToDo: Localize;
    x = 0.29375 * safezoneW + safezoneX;
    y = 0.313 * safezoneH + safezoneY;
    w = 0.4125 * safezoneW;
    h = 0.022 * safezoneH;
    colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class RscStructuredText_1100: Life_RscStructuredText
    {
      idc = 1100;
      text = "<t size='0.85'>Select a Contract from the list below. Clicking on a contract will give you the specific contract details. Note that multiple people can accept a contract, however only the contract killer that finishes the contract will receive the money. The last seen location of the target will be disclosed once you accept the contract. To accept a contract, you must pay upfront for obvious reasons.<br/>IMPORTANT: Contract Jobs will not covered by the compensation requests!</t>";
      x = 0.304062 * safezoneW + safezoneX;
      y = 0.346 * safezoneH + safezoneY;
      w = 0.391875 * safezoneW;
      h = 0.143 * safezoneH;
    };
    class activecontracts: Life_RscListbox
    {
      idc = 1500;
      text = ""; //--- ToDo: Localize;
      x = 0.304062 * safezoneW + safezoneX;
      y = 0.654 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.143 * safezoneH;
      onLBSelChanged = "call life_fnc_blaphlajiujlun";
      sizeEx = 0.035;
    };
    class RscText_1002: Life_RscText
    {
      idc = 1002;
      text = "Available Contracts"; //--- ToDo: Localize;
      x = 0.304062 * safezoneW + safezoneX;
      y = 0.632 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,1};
    };
    class RscText_1003: Life_RscButtonMenu
    {
      idc = 1003;
      text = "X"; //--- ToDo: Localize;
      x = 0.680469 * safezoneW + safezoneX;
      y = 0.841 * safezoneH + safezoneY;
      w = 0.0257812 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,1};
      onButtonClick = "closeDialog 0;";
    };
    class RscText_1005: Life_RscButtonMenu
    {
      idc = 1005;
      text = "Confirm and Take Contract"; //--- ToDo: Localize;
      x = 0.546406 * safezoneW + safezoneX;
      y = 0.808 * safezoneH + safezoneY;
      w = 0.103125 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,1};
      onButtonClick = "closeDialog 0;call life_fnc_hlamleqoayiaso;";
    };
    class contractinfo: Life_RscStructuredText
    {
      idc = 1101;
      text = "The minimum contract amount is $200,000"; //--- ToDo: Localize;
      x = 0.474219 * safezoneW + safezoneX;
      y = 0.522 * safezoneH + safezoneY;
      w = 0.221719 * safezoneW;
      h = 0.275 * safezoneH;
    };
    class RscText_1006: Life_RscText
    {
      idc = 1006;
      text = "Contract Information"; //--- ToDo: Localize;
      x = 0.474219 * safezoneW + safezoneX;
      y = 0.5 * safezoneH + safezoneY;
      w = 0.221719 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,1};
    };
    class activehitmen: Life_RscListbox
    {
      idc = 1501;
      text = "";
      x = 0.304062 * safezoneW + safezoneX;
      y = 0.522 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.099 * safezoneH;
      sizeEx = 0.035;
    };
    class RscText_1004: Life_RscText
    {
      idc = 1004;
      text = "Active Hitmen"; //--- ToDo: Localize;
      x = 0.304062 * safezoneW + safezoneX;
      y = 0.5 * safezoneH + safezoneY;
      w = 0.165 * safezoneW;
      h = 0.022 * safezoneH;
      colorBackground[] = {0,0,0,1};
    };
  };
};
