import asyncio
from loguru import logger
from bleak import BleakScanner


async def list_all_devices():
    # read data from devices
    devices = await BleakScanner.discover(return_adv=True, timeout=60, use_bdaddr=True)
    for addr, adv_data in devices.items():
        for i, (key, data) in enumerate(adv_data[1].service_data.items()):
            logger.info("Found Device:")
            logger.info(f"\tAddress: {addr}")
            logger.info(f"\tadv_data: {adv_data}")
            logger.info(f"\tManufacturer Data: {adv_data[1].manufacturer_data}")
            logger.info(f"\tService Data: {adv_data[1].service_data}")


asyncio.run(list_all_devices())
