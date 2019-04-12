"""Global variables for Autosort build system"""
import os

DIR_REPO = "C:\\Users\\user\\Documents\\GitHub\\autosort"
"""Directory where the git repository for Autosort is stored."""

DIR_SCRIPTS = os.path.join(DIR_REPO, "Scripts")
"""Directory where the autosort scripts are stored."""

DIR_HEARTHFIRE_LE = os.path.join(DIR_REPO, "Hearthfire - LE")
"""Directory where all mod files for Hearthfire Autosort - Legendary Edition are stored."""

DIR_HEARTHFIRE_LE_SCRIPTS = os.path.join(DIR_HEARTHFIRE_LE, "Hearthfire Autosort", "Scripts")
"""Directory where the autosort scripts for Hearthfire Autosort - Legendary Edition will be stored."""

DIR_VER = "C:\\Users\\user\\Documents\\Skyrim Tools\\Mod Organizer\\mods\\Autosort - Release"
"""Directory where version number is manually added to plugins."""

DIR_TEMP_ALT = "C:\\Windows\\Temp"
"""Directory where temporary files can be stored.
The path must not contain a directory that ends with "Data"."""

DIR_SKYRIM_LE = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Skyrim"
"""Directory where Skyrim Legendary Edition is installed."""

DIR_SKYRIM_SE = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\SkyrimSpecialEdition"
"""Directory where Skyrim Special Edition is installed."""

ARCH_EXE_LE = os.path.join(DIR_SKYRIM_LE, "Archive.exe")
"""Path to Archive.exe for Legendary Edition"""

ARCH_EXE_SE = os.path.join(DIR_SKYRIM_SE, "Tools\\Archive\\Archive.exe")
"""Path to Archive.exe for Special Edition"""
