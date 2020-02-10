package thinpad

import chisel3._
import freechips.rocketchip.config._
import freechips.rocketchip.devices.debug._
import freechips.rocketchip.devices.tilelink.BootROMParams
import freechips.rocketchip.subsystem._
import freechips.rocketchip.subsystem.MemoryPortParams
import freechips.rocketchip.rocket.{
  RocketCoreParams,
  MulDivParams,
  DCacheParams,
  ICacheParams
}
import freechips.rocketchip.tile.{RocketTileParams, XLen}

class WithBootROM
    extends Config((site, here, up) => {
      case BootROMParams =>
        BootROMParams(
          hang = 0x10000, // entry point
          contentFileName = s"./bootrom/bootrom.rv${site(XLen)}.img"
        )
    })

class WithIDBits(n: Int)
    extends Config((site, here, up) => {
      case ExtMem =>
        up(ExtMem, site).map(x => x.copy(master = x.master.copy(idBits = n)))
      case ExtBus => up(ExtBus, site).map(x => x.copy(idBits = n))
    })

class ThinpadFPGAConfig
    extends Config(new WithoutTLMonitors ++
    new WithJtagDTM ++
    new WithRV32 ++
    new WithIDBits(5) ++
    new WithBootROM ++
    new WithNSmallCores(1) ++
    new freechips.rocketchip.system.BaseConfig)
