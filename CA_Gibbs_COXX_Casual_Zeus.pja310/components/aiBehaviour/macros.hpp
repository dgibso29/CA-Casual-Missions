// Comment out to disable dev mode - uncomment to enable dev mode
//#define DEVMODE_ENABLED

#include "../../macros.hpp"



#ifdef DEVMODE_ENABLED
        #define MACRO_DEVMODE_NOTIFY hint "[INFO] Dev Mode is enabled!"; [] spawn {sleep 5; hint ""};
        #define MACRO_SPAWN(FUNC,FILE) spawn compile preprocessFileLineNumbers FILE
        #define MACRO_CALL(FUNC,FILE) call compile preprocessFileLineNumbers FILE
#else
        #define MACRO_SPAWN(FUNC,FILE) spawn FUNC
        #define MACRO_CALL(FUNC,FILE) call FUNC
#endif

// If dev mode is enabled, print a message in chat
#ifdef MACRO_DEVMODE_NOTIFY
        MACRO_DEVMODE_NOTIFY
#endif
