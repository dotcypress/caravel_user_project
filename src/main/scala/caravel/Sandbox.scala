package caravel

import spinal.core._
import spinal.lib._
import spinal.lib.bus.wishbone.Wishbone
import spinal.lib.bus.wishbone.WishboneConfig
import spinal.lib.io.TriState

object Elaborate {
  def main(args: Array[String]) {
    val targetDirectory = java.nio.file.Paths.get("verilog/rtl").toString()
    new SpinalConfig(targetDirectory = targetDirectory)
      .generateVerilog(new Sandbox)
  }
}

case class Sandbox() extends Component {
  val io = new CaravelHarness()

  io.irq := 0
  io.bus.DAT_MISO := 0
  io.bus.ACK := False
  io.gpio.writeEnable := False
  io.gpio.write := 0
  io.logicAnalyzer.read := Counter(16 bit, True).asBits.resized
}
