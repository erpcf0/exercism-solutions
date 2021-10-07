import scala.annotation.tailrec

object PrimeFactors {
  def factors(n: Long): List[Int] = {
    @tailrec
    def go(n: Long, factor: Int, acc: List[Int]): List[Int] = n match {
      case 1                      => acc.reverse
      case vl if vl % factor == 0 => go(vl / factor, factor, factor :: acc)
      case _                      => go(n, factor + 1, acc)
    }
    go(n, 2, List())
  }
}
