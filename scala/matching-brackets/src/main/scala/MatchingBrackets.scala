import scala.annotation.tailrec

sealed trait Bracket
case object Round extends Bracket
case object Square extends Bracket
case object Curly extends Bracket

sealed trait State
case class Open(bracket: Bracket) extends State
case class Close(bracket: Bracket) extends State
case object NotBracket extends State

object MatchingBrackets {
  def transform(str: String): List[State] = {
    str
      .map(c =>
        c match {
          case '(' => Open(Round)
          case ')' => Close(Round)
          case '[' => Open(Square)
          case ']' => Close(Square)
          case '{' => Open(Curly)
          case '}' => Close(Curly)
          case _   => NotBracket
        }
      )
      .toList
  }

  @tailrec
  def verify(list: List[State], acc: List[Bracket]): Boolean = {
    (list, acc) match {
      case (Open(c) :: tail, acc)                  => verify(tail, c :: acc)
      case (Close(c) :: tail, b :: tacc) if c == b => verify(tail, tacc)
      case (NotBracket :: tail, acc)               => verify(tail, acc)
      case (Nil, Nil)                              => true
      case (_, _)                                  => false
    }
  }

  def isPaired(str: String): Boolean = {
    verify(transform(str), List())
  }
}
