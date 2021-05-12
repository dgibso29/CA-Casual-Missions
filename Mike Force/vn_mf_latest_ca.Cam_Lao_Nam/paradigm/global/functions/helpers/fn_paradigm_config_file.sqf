/*
    File: fn_paradigm_config_file.sqf
    Author: Spoffy
    Date: 2020-10-30
    Last Update: 2020-10-30
    Public: No
    
    Description:
        Retrieves the config file associated with paradigm.
		If paradigm is loaded as an addon, it retrieves the addon config.
		Otherwise, if paradigm is loaded into the mission, returns the mission config file.
    
    Parameter(s):
		None

    Returns:
		None
    
    Example(s):
		call para_g_fnc_paradigm_config_file
*/

[configFile, missionConfigFile] select (isClass (missionConfigFile >> "Paradigm"))