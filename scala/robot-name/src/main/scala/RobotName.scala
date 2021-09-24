import scala.util.Random

class Robot() {
  var name: String = Robot.genName()
  def reset(): Unit =
    this.name = Robot.genName()
}

object Robot {
  val gen = Random.shuffle(
    for {
      a <- 'A' to 'Z'
      b <- 'A' to 'Z'
      n <- 100 to 999
    } yield (s"$a$b" + n.toString())
  ).toIterator

  def genName(): String = gen.next()
}






















