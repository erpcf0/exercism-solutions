object BeerSong {
  def nBottles(n: Int): String = n match {
    case 0 => "No more bottles of beer on the wall, no more bottles of beer."
    case 1 => "1 bottle of beer on the wall, 1 bottle of beer."
    case _ => s"$n bottles of beer on the wall, $n bottles of beer."
  }

  def takeBottles(n: Int): String = n match {
    case 0 => "Go to the store and buy some more, 99 bottles of beer on the wall."
    case 1 => "Take it down and pass it around, no more bottles of beer on the wall."
    case 2 => "Take one down and pass it around, 1 bottle of beer on the wall."
    case _ => s"Take one down and pass it around, ${n - 1} bottles of beer on the wall."
  }

  def recite(start: Int, take: Int): String = {
    val bottles = start to (start - take + 1) by -1
    bottles
      .map(n => nBottles(n) ++ "\n" ++ takeBottles(n) ++ "\n")
      .reduce((x, y) => x ++ "\n" ++ y)
  }
}
