class shop_landingpage
{
  idd = 42123;
  name= "shop_landingpage";
  movingEnable = 0;
  enableSimulation = 1;
  class controlsBackground {
    class RscText_1000: Life_RscText
    {
    	idc = 1000;
      text = "";
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.357 * safezoneH + safezoneY;
    	w = 0.360937 * safezoneW;
    	h = 0.286 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
  };
  class controls {
    class weaponbutton: Life_RscButtonMenu
    {
    	idc = 2405;
    	text = "Weapons"; //--- ToDo: Localize;
    	x = 0.324687 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0; call life_fnc_priegoukouchlu;";
    };
    class clothingbutton: Life_RscButtonMenu
    {
    	idc = 2406;
    	text = "Clothing"; //--- ToDo: Localize;
    	x = 0.407187 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0825 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0; call life_fnc_spluwrluchoaph;";
    };
    class generalbutton: Life_RscButtonMenu
    {
    	idc = 2407;
    	text = "General"; //--- ToDo: Localize;
    	x = 0.494844 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0; call life_fnc_flacoestlugieg;";
    };
    class unusedbutton: Life_RscButtonMenu
    {
    	idc = 2410;
    	text = "-----"; //--- ToDo: Localize;
    	x = 0.577344 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0773437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class closebutton: Life_RscButtonMenu
    {
    	idc = 2411;
    	text = "X"; //--- ToDo: Localize;
    	x = 0.659844 * safezoneW + safezoneX;
    	y = 0.643 * safezoneH + safezoneY;
    	w = 0.0257812 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "closeDialog 0;";
      class Attributes
      {
        align = "center";
      };
    };
    class retwerqwer: Life_RscStructuredText
    {
    	idc = 1100;
    	text = ""; //--- ToDo: Localize;
    	x = 0.335 * safezoneW + safezoneX;
    	y = 0.379 * safezoneH + safezoneY;
    	w = 0.340312 * safezoneW;
    	h = 0.242 * safezoneH;
    };
  };
};

class generalshop {
  idd = 42125;
  name= "generalshop";
  movingEnable = 0;
  enableSimulation = 1;
  class controlsBackground {
    class uysfjasdfasd: Life_RscText
    {
    	idc = 22;
      text = "";
    	x = 0.221563 * safezoneW + safezoneX;
    	y = 0.291 * safezoneH + safezoneY;
    	w = 0.608437 * safezoneW;
    	h = 0.198 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1002: Life_RscText
    {
    	idc = 23;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.363 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class RscText_1008: Life_RscText
    {
    	idc = 24;
    	x = 0.00500027 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.211406 * safezoneW;
    	h = 0.22 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class shoptitle: Life_RscText
    {
    	idc = 1001;
    	text = "Shop Title"; //--- ToDo: Localize;
    	x = 0.221562 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.608437 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
  };
  class controls {
    class weaponlist: Life_RscListbox
    {
    	idc = 1501;
      text = "";
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_spiuwrlathlecr";
      sizeEx = 0.2;
    };
    class jdfgsdfasd: Life_RscStructuredText
    {
    	idc = 1100;
    	text = "Weapons Available"; //--- ToDo: Localize;
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class weaponammo: Life_RscListbox
    {
    	idc = 1502;
      text = "";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_blapriemlethlu";
    };
    class weaponmuzzle: Life_RscListbox
    {
    	idc = 1503;
      text = "";
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_yoaciewiaqluni";
    };
    class weaponaccessories: Life_RscListbox
    {
    	idc = 1504;
      text = "";
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_ylupiewroaswie";
    };
    class weaponsights: Life_RscListbox
    {
    	idc = 1505;
      text = "";
    	x = 0.711405 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_ylazleylechiaz";
    };
    class qwesdfgsdfadsasd: Life_RscStructuredText
    {
    	idc = 1105;
    	text = "Ammo Specific"; //--- ToDo: Localize;
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1102: Life_RscStructuredText
    {
    	idc = 1102;
    	text = "Muzzle Specific"; //--- ToDo: Localize;
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class RscStructuredText_1103: Life_RscStructuredText
    {
    	idc = 1103;
    	text = "Accessories Specific"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class sightspecific: Life_RscStructuredText
    {
    	idc = 1104;
    	text = "Sights Specific"; //--- ToDo: Localize;
    	x = 0.711406 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class weaponbutton: Life_RscButtonMenu
    {
    	idc = 2402;
    	text = "Weapons"; //--- ToDo: Localize;
    	x = 0.221562 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class clothingbutton: Life_RscButtonMenu
    {
    	idc = 2401;
    	text = "Clothing"; //--- ToDo: Localize;
    	x = 0.345312 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class generalbutton: Life_RscButtonMenu
    {
    	idc = 2404;
    	text = "General"; //--- ToDo: Localize;
    	x = 0.469062 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class unusedbutton: Life_RscButtonMenu
    {
    	idc = 2403;
    	text = "-----"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class closebuttonone: Life_RscButtonMenu
    {
    	idc = 2400;
    	text = "Close"; //--- ToDo: Localize;
    	x = 0.716563 * safezoneW + safezoneX;
    	y = 0.247 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
		onButtonClick = "closeDialog 0;life_shopInfo_array = nil; life_shop_cart = nil; life_shop_cartTotal = nil;";
    };
    class weaponaddtocart: Life_RscButtonMenu
    {
    	idc = 2406;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[0] call life_fnc_riuwrlegoabria;";
    };
    class ammoaddtocart: Life_RscButtonMenu
    {
    	idc = 2407;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[1] call life_fnc_riuwrlegoabria;";
    };
    class muzzleaddtocart: Life_RscButtonMenu
    {
    	idc = 2408;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[2] call life_fnc_riuwrlegoabria;";
    };
    class accessoriesaddtocart: Life_RscButtonMenu
    {
    	idc = 2409;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[3] call life_fnc_riuwrlegoabria;";
    };
    class sightsaddtocart: Life_RscButtonMenu
    {
    	idc = 2410;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.711406 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[4] call life_fnc_riuwrlegoabria;";
    };
    class carttitle: Life_RscText
    {
    	idc = 1003;
    	text = "Cart"; //--- ToDo: Localize;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.0825 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class totalcartamount: Life_RscText
    {
    	idc = 1010;
    	text = "Total Price: $0"; //--- ToDo: Localize;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class cartamount: Life_RscText
    {
    	idc = 1004;
    	text = "0/20"; //--- ToDo: Localize;
    	x = 0.917656 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.0670312 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
      class Attributes
      {
        align = "right";
      };
    };
    class cartlist: Life_RscListbox
    {
    	idc = 1500;
      text = "";
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.346 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.242 * safezoneH;
      sizeEx = 0.035;
    };
    class removefromcart: Life_RscButtonMenu
    {
    	idc = 2411;
    	text = "Remove"; //--- ToDo: Localize;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.588 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "call life_fnc_briavlayleflut;";
    };
    class completepurchase: Life_RscButtonMenu
    {
    	idc = 2405;
    	text = "Complete Purchase"; //--- ToDo: Localize;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.61 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[] spawn life_fnc_troawiukiediuk;";
    };
    class cashonhand: Life_RscStructuredText
    {
    	idc = 1007;
    	text = "Cash on Hand:"; //--- ToDo: Localize;
    	x = 0.840312 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.144375 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class infopage: Life_RscStructuredText
    {
    	idc = 1101;
    	text = ""; //--- ToDo: Localize;
    	x = 0.0101562 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.201094 * safezoneW;
    	h = 0.176 * safezoneH;
    };
    class RscButtonMenu_2412: Life_RscText
    {
    	idc = 2412;
    	text = "Description"; //--- ToDo: Localize;
    	x = 0.00499997 * safezoneW + safezoneX;
    	y = 0.269 * safezoneH + safezoneY;
    	w = 0.211406 * safezoneW;
    	h = 0.022 * safezoneH;
    	colorBackground[] = {0,0,0,1};
    };
    class weaponpreview: Life_RscButtonMenu
    {
    	idc = 2413;
    	text = "Preview"; //--- ToDo: Localize;
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };

    class clothinglist: Life_RscListbox
    {
    	idc = 3000;
      text = "";
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_coamiefrluniuc";
    };
    class qwetdfasdfs: Life_RscStructuredText
    {
    	idc = 3002;
    	text = "Uniforms Available"; //--- ToDo: Localize;
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class glasseslist: Life_RscListbox
    {
    	idc = 3003;
      text = "";
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_stiakoadrludro";
    };
    class hatlist: Life_RscListbox
    {
    	idc = 3006;
      text = "";
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_youdrlustoethi";
    };
    class vestlist: Life_RscListbox
    {
    	idc = 3009;
      text = "";
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_blaqlathiacrlu";
    };
    class backpacklist: Life_RscListbox
    {
    	idc = 3012;
      text = "";
    	x = 0.711405 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_thluwroaclavlu";
    };
    class glassestitle: Life_RscStructuredText
    {
    	idc = 3005;
    	text = "Glasses"; //--- ToDo: Localize;
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class hattitle: Life_RscStructuredText
    {
    	idc = 3008;
    	text = "Hats"; //--- ToDo: Localize;
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class vesttitlee: Life_RscStructuredText
    {
    	idc = 3010;
    	text = "Vests"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class backpacktitle: Life_RscStructuredText
    {
    	idc = 3014;
    	text = "Backpacks"; //--- ToDo: Localize;
    	x = 0.711406 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class clothingaddtocart: Life_RscButtonMenu
    {
    	idc = 3001;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[5] call life_fnc_riuwrlegoabria;";
    };
    class glassesaddtocart: Life_RscButtonMenu
    {
    	idc = 3004;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[6] call life_fnc_riuwrlegoabria;";
    };
    class hatsaddtocart: Life_RscButtonMenu
    {
    	idc = 3007;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[7] call life_fnc_riuwrlegoabria;";
    };
    class vestsaddtocart: Life_RscButtonMenu
    {
    	idc = 3011;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[8] call life_fnc_riuwrlegoabria;";
    };
    class backpacksaddtocart: Life_RscButtonMenu
    {
    	idc = 3013;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.711406 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[9] call life_fnc_riuwrlegoabria;";
    };
    class uniformpreview: Life_RscButtonMenu
    {
    	idc = 3023;
    	text = "Preview"; //--- ToDo: Localize;
    	x = 0.226719 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class glassespreview: Life_RscButtonMenu
    {
    	idc = 3024;
    	text = "Preview"; //--- ToDo: Localize;
    	x = 0.355625 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class hatspreview: Life_RscButtonMenu
    {
    	idc = 3025;
    	text = "Preview"; //--- ToDo: Localize;
    	x = 0.474219 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class vestspreview: Life_RscButtonMenu
    {
    	idc = 3026;
    	text = "Preview"; //--- ToDo: Localize;
    	x = 0.592812 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class backpackpreview: Life_RscButtonMenu
    {
    	idc = 3027;
    	text = "Preview"; //--- ToDo: Localize;
    	x = 0.711406 * safezoneW + safezoneX;
    	y = 0.511 * safezoneH + safezoneY;
    	w = 0.113437 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class magazinelist: Life_RscListbox
    {
    	idc = 4001;
      text = "";
    	x = 0.247344 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_proephiecrlago";
    };
    class werwerewrw: Life_RscStructuredText
    {
    	idc = 4100;
    	text = "Magazines"; //--- ToDo: Localize;
    	x = 0.247344 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class magazineaddtocart: Life_RscButtonMenu
    {
    	idc = 4002;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.2525 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.12375 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[10] call life_fnc_riuwrlegoabria;";
    };
    class explosivesaddtocart: Life_RscButtonMenu
    {
    	idc = 4401;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[11] call life_fnc_riuwrlegoabria;";
    };
    class attachmentsaddtocart: Life_RscButtonMenu
    {
    	idc = 4402;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.525781 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[12] call life_fnc_riuwrlegoabria;";
    };
    class itemsaddtocart: Life_RscButtonMenu
    {
    	idc = 4403;
    	text = "Add to Cart"; //--- ToDo: Localize;
    	x = 0.665 * safezoneW + safezoneX;
    	y = 0.489 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
      onButtonClick = "[13] call life_fnc_riuwrlegoabria;";
    };
    class explosivelist: Life_RscListbox
    {
    	idc = 4004;
      text = "";
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_kiahiacoaphlub;";
      sizeEx = 0.035;
    };
    class attachmentlsist: Life_RscListbox
    {
      idc = 4007;
      text = "";
    	x = 0.525781 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.154 * safezoneH;
      onLBSelChanged = "_this call life_fnc_boejiehiuroewl";
      sizeEx = 0.035;
    };
    class itemlist: Life_RscListbox
    {
      idc = 4010;
      text = "";
    	x = 0.665 * safezoneW + safezoneX;
    	y = 0.324 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.154 * safezoneH;
      sizeEx = 0.035;
      onLBSelChanged = "_this call life_fnc_plebriaqlathoe";
    };
    class RscStructuredText_1101: Life_RscStructuredText
    {
    	idc = 4101;
    	text = "Explosives"; //--- ToDo: Localize;
    	x = 0.386562 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class treadafasdasd: Life_RscStructuredText
    {
    	idc = 4102;
    	text = "Attachments"; //--- ToDo: Localize;
    	x = 0.525781 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class iudsfbasdfsad: Life_RscStructuredText
    {
    	idc = 4103;
    	text = "Items"; //--- ToDo: Localize;
    	x = 0.665 * safezoneW + safezoneX;
    	y = 0.302 * safezoneH + safezoneY;
    	w = 0.128906 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class oisdfnjaddsf: Life_RscText
    {
    	idc = 5000;
      text = "";
    	x = 0.0359372 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.232031 * safezoneW;
    	h = 0.077 * safezoneH;
    	colorBackground[] = {0,0,0,0.7};
    };
    class closebuttontwo: Life_RscButtonMenu
    {
    	idc = 5411;
    	text = "Go Back"; //--- ToDo: Localize;
    	x = 0.0359375 * safezoneW + safezoneX;
    	y = 0.786 * safezoneH + safezoneY;
    	w = 0.232031 * safezoneW;
    	h = 0.022 * safezoneH;
    };
    class dfwertwqwqwe: Life_RscStructuredText
    {
    	idc = 5100;
    	text = "Looking at:<br/>"; //--- ToDo: Localize;
    	x = 0.0359375 * safezoneW + safezoneX;
    	y = 0.731 * safezoneH + safezoneY;
    	w = 0.232031 * safezoneW;
    	h = 0.055 * safezoneH;
    };
  };
};
