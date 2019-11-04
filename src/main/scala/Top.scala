package thinpad

import Chisel._
import freechips.rocketchip.config.{Parameters, Field}
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.util.DontTouch

class Top(implicit val p: Parameters) extends Module {
  val config = p(ExtIn)
  val target = Module(LazyModule(new ThinpadTop).module)

  require(target.mem_axi4.size == 1)

  val io = new Bundle {
    val interrupts = UInt(OUTPUT, width = 2)
  }

  target.interrupts := io.interrupts

  target.dontTouchPorts()
  target.connectSimAXIMem()
  target.connectSimAXIMMIO()
}

class ThinpadTop(implicit p: Parameters) extends RocketSubsystem
    with HasHierarchicalBusTopology
    with HasPeripheryBootROM
    with HasAsyncExtInterrupts
    with CanHaveMasterAXI4MemPort
    with CanHaveMasterAXI4MMIOPort {
  override lazy val module = new ThinpadTopModule(this)
}

class ThinpadTopModule(outer: ThinpadTop) extends RocketSubsystemModuleImp(outer)
    with HasRTCModuleImp
    with HasExtInterruptsModuleImp
    with HasPeripheryBootROMModuleImp
    with CanHaveMasterAXI4MemPortModuleImp
    with CanHaveMasterAXI4MMIOPortModuleImp
    with DontTouch
