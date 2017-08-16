class CfgRemoteExec
{
	// List of script functions allowed to be sent from client via remoteExec
	class Functions
	{
		   // State of remoteExec: 0-turned off, 1-turned on, taking whitelist into account, 2-turned on, however, ignoring whitelists (default because of backward compatibility)
		   mode = 0;
		   // Ability to send jip messages: 0-disabled, 1-enabled (default)
		   jip = 1;
		   /*your functions here*/
		   class YourFunction1
		   {
				  allowedTargets=0; // can target anyone (default)
				  jip = 0; // sending jip messages is disabled for this function (overrides settings in the Functions class)
		   };
		   class YourFunction2 { allowedTargets=1; }; // can target only clients
		   class YourFunction3 { allowedTargets=2; }; // can target only the server
	};
	// List of script commands allowed to be sent from client via remoteExec
	class Commands
	{
		  /*your commands here*/
		  class YourCommand1 { allowedTargets=0; jip=0; } // can target anyone, sending jip is turned off (overrides settings in the Commands class)
	};
};