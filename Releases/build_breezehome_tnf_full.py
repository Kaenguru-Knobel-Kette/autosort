"""Build full release.
Loose files are packed into a bsa and version numbers are added."""
import config
import logging
import release
import shutil

logger = logging.getLogger(release.__name__)
logger.setLevel(logging.INFO)
formatter = logging.Formatter("%(asctime)s %(levelname)s %(message)s")
handler = logging.FileHandler("{}.log".format(release.__name__), "w")
handler.setFormatter(formatter)
logger.addHandler(handler)

shutil.copytree(config.DIR_SCRIPTS, config.DIR_BREEZEHOME_TNF_LE_SCRIPTS)
try:
    release.build_release(dir_src=config.DIR_BREEZEHOME_TNF_LE,
                          dir_ver=config.DIR_VER,
                          temp_alt=config.DIR_TEMP_ALT,
                          arch_exe=config.ARCH_EXE_LE,
                          trim_fomod=True,
                          warn_modgroups=False)
except Exception as error:
    logger.exception(error)
shutil.rmtree(config.DIR_BREEZEHOME_TNF_LE_SCRIPTS)
