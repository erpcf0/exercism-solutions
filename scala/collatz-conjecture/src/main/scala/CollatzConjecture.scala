import scala.annotation.tailrec

object CollatzConjecture {
  @tailrec
  def step(n: Int, acc: Int): Int = n match {
    case 1               => acc
    case x if x % 2 == 0 => step(x / 2, acc + 1)
    case _               => step(3 * n + 1, acc + 1)
  }

  def steps(n: Int): Option[Int] =
    if (n <= 0) None
    else Some(step(n, 0))
}
