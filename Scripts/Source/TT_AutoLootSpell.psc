ScriptName TT_AutoLootSpell Extends ActiveMagicEffect  
{Keep track of automatically looted items and send them back when the player exits the furniture.}

GlobalVariable Property AutoLootProcessCount Auto

ObjectReference Property SortingContainer Auto

Spell Property CraftingSpell Auto

Actor Target


Event OnEffectStart(Actor akTarget, Actor akCaster)
	Target = akTarget
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	; Ignore crafted items
	If (akSourceContainer != None)
		AutoLootProcessCount.Mod(1.0)
		While (Target.HasSpell(CraftingSpell)) 
			Utility.Wait(1.0)
		EndWhile
		Target.RemoveItem(akBaseItem, aiItemCount, True, SortingContainer)
		AutoLootProcessCount.Mod(-1.0)
	EndIf
EndEvent
