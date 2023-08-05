
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters}
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

# See https://dev.epicgames.com/documentation/en-us/uefn/create-your-own-device-in-verse for how to create a verse device.

# A Verse-authored creative device that can be placed in a level
setup_device := class(creative_device):

    @editable FlashlightGranter : item_granter_device = item_granter_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>:void=
        GrantFlashLight()

    GrantFlashLight<private>():void=
        AllPlayers := GetPlayspace().GetPlayers()
        for(X : int = 0..AllPlayers.Length - 1 ):
            if (Player := AllPlayers[X], Agent := agent[Player]):
                FlashlightGranter.GrantItem(Agent)
