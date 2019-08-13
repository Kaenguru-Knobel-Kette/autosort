"""Build development archive.
Loose files are not packed into a bsa and version numbers are not added."""
import config
import logging
import release
import shutil

logger = logging.getLogger(release.__name__)
logger.setLevel(logging.WARNING)
handler = logging.FileHandler("{}.log".format(release.__name__), "w")
logger.addHandler(handler)

shutil.copytree(config.DIR_SCRIPTS, config.DIR_BREEZEHOME_TNF_LE_SCRIPTS)
try:
    release.build_release(dir_src=config.DIR_BREEZEHOME_TNF_LE,
                          trim_fomod=True,
                          warn_modgroups=False,
                          warn_version=False)
except Exception as error:
    logger.exception(error)
shutil.rmtree(config.DIR_BREEZEHOME_TNF_LE_SCRIPTS)
