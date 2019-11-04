package thinpad

import chisel3._
import freechips.rocketchip.config.{Parameters, Field}
import freechips.rocketchip.devices.tilelink._
import freechips.rocketchip.diplomacy.{LazyModule, LazyModuleImp}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.util._

class RocketChip(implicit val p: Parameters) extends Module {
  val config = p(ExtIn)
  val target = Module(LazyModule(new RocketTop).module)

  require(target.mem_axi4.size == 1)
  require(target.mmio_axi4.size == 1)

  val io = IO(new Bundle {
    val interrupts = Input(UInt(2.W))
    val mem_axi4 = target.mem_axi4.head.cloneType
    val mmio_axi4 = target.mmio_axi4.head.cloneType
  })

  io.mem_axi4 <> target.mem_axi4.head
  io.mmio_axi4 <> target.mmio_axi4.head

  target.interrupts := io.interrupts
  target.debug.map { debug =>
    debug.clockeddmi.map { clockeddmi =>
      clockeddmi.dmiReset := true.B
      clockeddmi.dmiClock := clock
      clockeddmi.dmi.req.valid := false.B
      clockeddmi.dmi.req.bits.op := 0.U
      clockeddmi.dmi.req.bits.addr := 0.U
      clockeddmi.dmi.req.bits.data := 0.U
      clockeddmi.dmi.resp.ready := false.B
    }
  }
  target.dontTouchPorts()
}

class RocketTop(implicit p: Parameters) extends RocketSubsystem
    with HasHierarchicalBusTopology
    with HasPeripheryBootROM
    with HasAsyncExtInterrupts
    with CanHaveMasterAXI4MemPort
    with CanHaveMasterAXI4MMIOPort {
  override lazy val module = new RocketTopModule(this)
}

class RocketTopModule(outer: RocketTop) extends RocketSubsystemModuleImp(outer)
    with HasRTCModuleImp
    with HasExtInterruptsModuleImp
    with HasPeripheryBootROMModuleImp
    with CanHaveMasterAXI4MemPortModuleImp
    with CanHaveMasterAXI4MMIOPortModuleImp
    with DontTouch
