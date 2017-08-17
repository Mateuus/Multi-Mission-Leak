class CfgServerInfoMenu
{
   addAction = 1; // Enable/disable action menu item | use 0 to disable | default: 1 (enabled)
   antiHACK = "infiSTAR + BattlEye";
   hostedBy = "Orion Servers";
   ipPort = "66.70.180.218 : 2312";
   //openKey = "User7"; // https://community.bistudio.com/wiki/inputAction/actions
   openAtLogin = no;
   restart = 4; // Amount of hours before server automatically restarts
   serverName = "OrionLife";
   class menuItems
   {
      // title AND content accept formatted text ( since update Oct5.2016 )
      class first
      {
         menuName = "General";
         title = "<t color='#ffffff'>GENERAL INFORMATION</t>";
         content[] = {
            "Hey there! Welcome to OrionLife<br /><br />",
            "If you want to close this menu, simply click ESC"
         };
      };
      class second
      {
         menuName = "Rules";
         title = "SERVER RULES";
         content[] = {
            "<t size='1.75'>Our Rules</t><br />Visit our website for our full list of rules here: <a href='https://orionlife.enjin.com/forum/m/44369049/viewforum/8274610/' color='#56BDD6'>SERVER RULES<br />",
         };
      };
      class third
      {
         menuName = "Features";
         title = "FEATURES";
         content[] = {
             "<t size='1.45'>Y</t><br />Opens player menu<br />",
             "<t size='1.15'>Shift B</t><br />Surrender<br />",
             "<t size='1.15'>Shift H</t><br />Holster<br />",
             "<t size='1.15'>Tab</t><br />Close ID card<br />",
             "<t size='1.15'>Shift Tab</t><br />Open taxi driver menu<br />"
         };
      };
      class fourth
      {
         menuName = "Staff";
         title = "ORION STAFF";
         content[] = {
			"Founder: Brix",
            "<br />",
            "Developers: Repentz, Flabby, Mr New",
            "<br />",
			"Directors: Flabby, Repentz",
            "<br />",
			"Head Admin: Aburnkatoo",
            "<br />",
			"Senior Admin: Flabby, Left Twix",
            "<br />",
			"Admins: Mook, Applebottom, Spartan"
		 };
      };
      class fifth
      {
         menuName = "Reporting";
         title = "REPORTING PLAYERS";
         content[] = {"To report a player, visit this link: <a href='https://orionlife.enjin.com/forum/m/44369049/viewforum/8288869/' color='#56BDD6'>REPORT PLAYER HERE</a>"
         };
      };
      class sixth
      {
         menuName = "Communication";
         title = "VOICE SERVER AND WEBSITE";
         content[] = {
            "<a href='http://invite.teamspeak.com/ts.orionservers.net/' color='#56BDD6'>Join Teamspeak</a>",
            "<br />",
            "<a href='https://orionlife.enjin.com/' color='#56BDD6'>Website</a>"
         };
      };
      class seventh
      {
         menuName = "Credits";
         title = "CREDITS WHERE CREDITS DUE";
         content[] = {
            "<t size='1.25'>IT07:</t> coder/creator of this menu",
            "<br />",
            "<t size='1.25'>Repentz:</t> Main development of this mission file",
            "<br />",
            "<t size='1.25'>Mr New:</t> Textures Developer"
         };
      };
   };
};
