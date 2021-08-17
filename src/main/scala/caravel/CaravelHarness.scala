package caravel

import spinal.core._
import spinal.lib._
import spinal.lib.bus.wishbone.Wishbone
import spinal.lib.bus.wishbone.WishboneConfig
import spinal.lib.io.TriState

class CaravelHarness(
    gpioPads: Int = 38,
    sharedHarness: Boolean = false
) extends Bundle {
  val clk2 = in(Bool)
  val irq = out(Bits(3 bit))

  val bus = slave(Wishbone(WishboneConfig(32, 32, 4)))
  val analog = inout(Analog(Bits((gpioPads - 9) bits)))
  val gpio = master(TriState(Bits(gpioPads bits)))
  val logicAnalyzer = slave(TriState(Bits(128 bits)))

  val active = if (sharedHarness) in(Bool) else null
}
