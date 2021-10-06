import scala.annotation.tailrec

object PascalsTriangle {
  @tailrec
  def reduction(list: List[Int], acc: List[Int]): List[Int] = list match {
    case x :: y :: rest => reduction(y :: rest, (x + y) :: acc)
    case _              => List(1) ++ acc ++ List(1)
  }

  @tailrec
  def generate(n: Int, current: List[Int], acc: List[List[Int]]): List[List[Int]] = {
    val res = reduction(current, List())
    n match {
      case 0 => acc.reverse
      case _ => generate(n - 1, res, res :: acc)
    }
  }

  def rows(n: Int): List[List[Int]] = n match {
    case n if n <= 0 => List()
    case 1 => List(List(1))
    case _ => List(List(1)) ++ generate(n - 1, List(), List())
  }
}
