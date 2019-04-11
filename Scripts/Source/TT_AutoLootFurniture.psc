ScriptName TT_AutoLootFurniture Extends ObjectReference
{Automatically loot items from selected containers when the player uses this furniture.}

GlobalVariable Property AutoLootProcessCount Auto

ObjectReference[] Property Containers Auto

Spell Property CraftingSpell Auto


Event OnActivate(ObjectReference akActivator)
	If (akActivator == Game.GetPlayer())
		Game.DisablePlayerControls()
		(akActivator As Actor).AddSpell(CraftingSpell, False)
		Utility.Wait(0.5)
		Int i = 0
		While (i < Containers.Length)
			Containers[i].RemoveAllItems(akActivator)
			i += 1
		Endwhile
		RegisterForSingleUpdate(1.0)
	EndIf
EndEvent

Event OnUpdate()
	; Is the player is still crafting?
	If (IsFurnitureInUse())
		RegisterForSingleUpdate(1.0)
	; Is the auto loot effect notified that the player has finished crafting?
	ElseIf (Game.GetPlayer().HasSpell(CraftingSpell))
		Game.GetPlayer().RemoveSpell(CraftingSpell)
		RegisterForSingleUpdate(0.5)
	; Are all items moved back?
	ElseIf (AutoLootProcessCount.GetValue() > 0.0)
		RegisterForSingleUpdate(0.5)
	Else
		AutoLootProcessCount.SetValue(0.0)
		Game.EnablePlayerControls()
	EndIf
EndEvent
