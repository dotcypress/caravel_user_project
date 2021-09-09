package caravel

import spinal.core._
import spinal.lib._

case class Sandbox() extends Component {
  val io = new CaravelHarness()

  new ClockEnableArea(io.isActive) {
    io.bus.clearAll();

    io.gpio.writeEnable := True
    io.gpio.write := 0

    io.logicAnalyzer.read := Counter(16 bit, True).asBits.resized
    io.irq := 0
  }
}
