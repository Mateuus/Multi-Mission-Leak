	class Life_Cop_Placeables {    
        idd = 20000;    
        name= "life_cop_placeables";    
        movingEnable = false;    
        enableSimulation = true;    
        onLoad = "";        
        class controlsBackground {  
            class EXphone: life_RscPicture
            {
                idc = 3001;

                text = "textures\phone.paa"; //--- ToDo: Localize;
                x = 0.439625 * safezoneW + safezoneX;
                y = 0.14692 * safezoneH + safezoneY;
                w = 0.426562 * safezoneW;
                h = 0.725732 * safezoneH;
            };
            class Title: Life_RscTitle
            {
                idc = -1;

                text = "Available placeables"; //--- ToDo: Localize;
                x = 0.585312 * safezoneW + safezoneX;
                y = 0.248 * safezoneH + safezoneY;
                w = 0.315 * safezoneW;
                h = 0.028 * safezoneH;
                colorText[] = {0.95,0.95,0.95,1};
            };
        };        
        class controls {                
            class PlaceablesList: Life_RscListBox
        {
            idc = 20001;
            text = "";
            sizeEx = 0.035;
            x = 0.552499 * safezoneW + safezoneX;
            y = 0.286 * safezoneH + safezoneY;
            w = 0.178125 * safezoneW;
            h = 0.434889 * safezoneH;
        };
        class RemoveAll: Life_RscButtonMenu
        {
            onButtonClick = "[] call life_fnc_placeablesRemoveAll";

            idc = -1;
            text = "Remove all"; //--- ToDo: Localize;
            x = 0.649062 * safezoneW + safezoneX;
            y = 0.720667 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
        };
        class Place: Life_RscButtonMenu
        {
            onButtonClick = "[] spawn life_fnc_placeablePlace;";

            idc = -1;
            text = "Place"; //--- ToDo: Localize;
            x = 0.553125 * safezoneW + safezoneX;
            y = 0.720667 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.5,0,0,0.5};
        };
        class ButtonClose: Life_RscButtonInvisible
        {
            onButtonClick = "closeDialog 0;";

            idc = 1012;
            x = 0.601719 * safezoneW + safezoneX;
            y = 0.801 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.0875 * safezoneH;
            colorText[] = {1,1,1,0};
            colorBackground[] = {0,0,0,0};
            tooltip = "Go back"; //--- ToDo: Localize;
        };
    };
};
class Life_Cop_PlaceablesMEDIC {
    idd = 40000;
    name= "life_cop_placeablesMEDIC";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "";
    
        class controlsBackground {  
            class EXphone: life_RscPicture
            {
                idc = 3001;

                text = "textures\phone.paa"; //--- ToDo: Localize;
                x = 0.439625 * safezoneW + safezoneX;
                y = 0.14692 * safezoneH + safezoneY;
                w = 0.426562 * safezoneW;
                h = 0.725732 * safezoneH;
            };
            class Title: Life_RscTitle
            {
                idc = -1;

                text = "Available placeables"; //--- ToDo: Localize;
                x = 0.585312 * safezoneW + safezoneX;
                y = 0.248 * safezoneH + safezoneY;
                w = 0.315 * safezoneW;
                h = 0.028 * safezoneH;
                colorText[] = {0.95,0.95,0.95,1};
            };
        };        
        class controls {                
        class PlaceablesList: Life_RscListBox
        {
            idc = 40001;
            text = "";
            sizeEx = 0.035;
            x = 0.552499 * safezoneW + safezoneX;
            y = 0.286 * safezoneH + safezoneY;
            w = 0.178125 * safezoneW;
            h = 0.434889 * safezoneH;
        };
        class RemoveAll: Life_RscButtonMenu
        {
            onButtonClick = "[] call life_fnc_placeablesRemoveAllMEDIC";

            idc = -1;
            text = "Remove all"; //--- ToDo: Localize;
            x = 0.649062 * safezoneW + safezoneX;
            y = 0.720667 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0,0,0,0.8};
        };
        class Place: Life_RscButtonMenu
        {
            onButtonClick = "[] spawn life_fnc_placeablePlaceMEDIC;";

            idc = -1;
            text = "Place"; //--- ToDo: Localize;
            x = 0.553125 * safezoneW + safezoneX;
            y = 0.720667 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.028 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.5,0,0,0.5};
        };
        class ButtonClose: Life_RscButtonInvisible
        {
            onButtonClick = "closeDialog 0;";

            idc = 1012;
            x = 0.601719 * safezoneW + safezoneX;
            y = 0.801 * safezoneH + safezoneY;
            w = 0.0820312 * safezoneW;
            h = 0.0875 * safezoneH;
            colorText[] = {1,1,1,0};
            colorBackground[] = {0,0,0,0};
            tooltip = "Go back"; //--- ToDo: Localize;
        };
    };
};