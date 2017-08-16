class agb
{
 idd = 32154;
 name = "agb";
 movingEnable = false;
 enableSimulation = false;
 
 class controlsBackground
 {
 class RscTitleBackground : Life_RscText
 {
 colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
 idc = -1;
 x = 0.0875;
 y = 0.06;
 w = 0.825;
 h = 0.04;
 };
 
 class RscBackground : Life_RscText
 {
 colorBackground[] = {0.31,0.31,0.31,1};
 idc = -1;
 x = 0.0875;
 y = 0.12;
 w = 0.825;
 h = 0.82;
 };
 
 class RscTitleText : Life_RscTitle
 {
 colorBackground[] = {0, 0, 0, 0};
 idc = -1;
 text = "Die Serverregeln in kurzer form von Island of Liberty:";
 x = 0.0875;
 y = 0.06;
 w = 0.825;
 h = 0.04;
 class Attributes 
 {
 align = "center";
 };
 };
 
 class RsclolStatus : Life_RscStructuredText
 {
 idc = -1;
 colorBackground[] = {0, 0, 0, 0};
 sizeEx = 0.0001;
 text = "<t size = '0.8'>Unerwuenschtes Fehlverhalten fuehrt ggf. zu Bann<br / >§1: Hacking / Cheating / Duping / Belleidigungen<br / >§1.1: Selbstmord / Disconect um sich dem Rollenspiel zu entziehen.<br / >§1.2: Bugs/Exploites ausnutzen - im Zweifel Admin fragen<br / ><br / >§2: RP wird bei uns Gross geschrieben. Haellst du dich nicht an das RP, hast du hier nix verloren!<br / ><br / >§3: RDM / VDM wird sofort geahndet und die Taeter gebannt.<br / ><br / >Unsere Kontaktdaten: <br / >TS³ ts.island-of-liberty.com<br / >Homepage www.Island-of-Liberty.com<br / >Altis Life Team: <br / >Cris, Toxicality, Anonymous, Tim Taylor, Jack Brown <br / ><br / >Hinweis: Wir suchen Mitarbeiter der MTD und Polizisten sowie verstaerkung bei unserem Support Team. Bewerbungen im Forum.<br / ></t> <t font ='PuristaBold' size='0.9'>Um auf dem Island of Liberty Server zu spielen musst du diesen Regeln zustimmen und verpflichtest dich dazu diese einzuhalten und hast auch die Regeln im Forum gelesen und verstanden.</t>";
 x = 0.1125;
 y = 0.16;
 w = 0.775;
 h = 0.66;
 }; 
 };
 
 class Controls
 {
 class naz : Life_RscButtonMenu
 {
 idc = -1;
 text = "Nicht Akzeptieren";
 colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
 onButtonClick = "closeDialog 0;";
 x = 0.1075;
 y = 0.88;
 w = 0.3;
 h = 0.04;
 class Attributes 
 {
 align = "center";
 };
 };
 
 
 class az : Life_RscButtonMenu
 {
 idc = -1;
 text = "Akzeptieren";
 colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
 onButtonClick = "rulesok = true; closeDialog 0;";
 x = 0.5825;
 y = 0.88;
 w = 0.3;
 h = 0.04;
 class Attributes 
 {
 align = "center";
 }; 
 };
 };
};