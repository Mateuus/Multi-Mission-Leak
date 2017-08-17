class life_spawn_selection {
 idd = 38500;
 movingEnable = 0;
 enableSimulation = 1;
 //onLoad = "call (profilenamespace getvariable ""LastSpawnPoint"");";
 class controlsBackground {
    class life_RscTitleBackground: Life_RscText
    {
        idc = -1;
        x = 0.0410937 * safezoneW + safezoneX;
        y = 0.368 * safezoneH + safezoneY;
        w = 0.397031 * safezoneW;
        h = 0.022 * safezoneH;
        colorBackground[] = {0,0,0,0.7};
    };
    class Title: Life_RscTitle
    {
        idc = -1;
        text = "Spawn Selection"; //--- ToDo: Localize;
        x = 0.0410937 * safezoneW + safezoneX;
        y = 0.368 * safezoneH + safezoneY;
        w = 0.376406 * safezoneW;
        h = 0.022 * safezoneH;
        colorText[] = {0.95,0.95,0.95,1};
    };
    class SpawnPointTitle: Title
    {
        idc = 38501;
        style = 1;
        text = "Spawn Selection"; //--- ToDo: Localize;
        x = 0.04625 * safezoneW + safezoneX;
        y = 0.368 * safezoneH + safezoneY;
        w = 0.391875 * safezoneW;
        h = 0.022 * safezoneH;
        colorText[] = {0.95,0.95,0.95,1};
    };
    class Background_1: Life_RscText
    {
        idc = 2200;
        x = 0.041273 * safezoneW + safezoneX;
        y = 0.39 * safezoneH + safezoneY;
        w = 0.396876 * safezoneW;
        h = 0.341 * safezoneH;
        colorBackground[] = {0.188,0.188,0.188,0.5};
    };
    class MapView: Life_RscMapControl
    {
        idc = 38502;
        maxSatelliteAlpha = 0.75;
        alphaFadeStartScale = 1.15;
        alphaFadeEndScale = 1.29;
        x = 0.2025 * safezoneW + safezoneX;
        y = 0.39 * safezoneH + safezoneY;
        w = 0.232031 * safezoneW;
        h = 0.341 * safezoneH;
    };
};
class controls {
    class SpawnPointList: Life_RscListNBox
    {
        idc = 38510;
        coloumns[] = {0,0,0.9};
        drawSideArrows = 0;
        idcLeft = -1;
        idcRight = -1;
        rowHeight = 0.05;
        onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
        x = 0.0410937 * safezoneW + safezoneX;
        y = 0.39 * safezoneH + safezoneY;
        w = 0.159844 * safezoneW;
        h = 0.341 * safezoneH;
    };
    class spawnButton: Life_RscButtonMenu
    {
        onButtonClick = "[] call life_fnc_spawnConfirm";
        idc = 1006;
        text = "Spawn"; //--- ToDo: Localize;
        x = 0.0410937 * safezoneW + safezoneX;
        y = 0.753 * safezoneH + safezoneY;
        w = 0.159844 * safezoneW;
        h = 0.033 * safezoneH;
        colorText[] = {1,1,1,1};
        colorBackground[] = {0,0,0,0.7};
    };
    class ReturnToLobbyButton: Life_RscButtonMenu
        {
        onButtonClick = "endmission'memes';";
        idc = 1007;
        text = "Return To Lobby"; //--- ToDo: Localize;
        x = 0.0410937 * safezoneW + safezoneX;
        y = 0.797 * safezoneH + safezoneY;
        w = 0.159844 * safezoneW;
        h = 0.033 * safezoneH;
        colorText[] = {1,1,1,1};
        colorBackground[] = {0,0,0,0.7};
        };
    };
};