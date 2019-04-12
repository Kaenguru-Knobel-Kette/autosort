ScriptName TT_AutoSortRetrieve Extends ObjectReference
{Activator that retrieves all items that are currently sorted.}

ObjectReference Property SortingContainer Auto
{The container that sorts the items}

ObjectReference Property StorageContainer Auto
{The container where the items will be transfered to}


Event OnActivate(ObjectReference akActivator)
	If (akActivator == Game.GetPlayer())
		TT_AutoSortContainer Properties = SortingContainer As TT_AutoSortContainer
		Properties.ContainerAmmo.RemoveAllItems(StorageContainer)
		Properties.ContainerBook.RemoveAllItems(StorageContainer)
		Properties.ContainerBow.RemoveAllItems(StorageContainer)
		Properties.ContainerClothing.RemoveAllItems(StorageContainer)
		Properties.ContainerFood.RemoveAllItems(StorageContainer)
		Properties.ContainerGem.RemoveAllItems(StorageContainer)
		Properties.ContainerGold.RemoveAllItems(StorageContainer)
		Properties.ContainerHeavyArmor.RemoveAllItems(StorageContainer)
		Properties.ContainerIngot.RemoveAllItems(StorageContainer)
		Properties.ContainerIngredient.RemoveAllItems(StorageContainer)
		Properties.ContainerJewlery.RemoveAllItems(StorageContainer)
		Properties.ContainerKeys.RemoveAllItems(StorageContainer)
		Properties.ContainerLeather.RemoveAllItems(StorageContainer)
		Properties.ContainerLightArmor.RemoveAllItems(StorageContainer)
		Properties.ContainerMisc.RemoveAllItems(StorageContainer)
		Properties.ContainerOre.RemoveAllItems(StorageContainer)
		Properties.ContainerPoison.RemoveAllItems(StorageContainer)
		Properties.ContainerPotion.RemoveAllItems(StorageContainer)
		Properties.ContainerScroll.RemoveAllItems(StorageContainer)
		Properties.ContainerShield.RemoveAllItems(StorageContainer)
		Properties.ContainerSpellTome.RemoveAllItems(StorageContainer)
		Properties.ContainerSoulgem.RemoveAllItems(StorageContainer)
		Properties.ContainerStaff.RemoveAllItems(StorageContainer)
		Properties.ContainerWeapon.RemoveAllItems(StorageContainer)
	EndIf
EndEvent
