object House {
  val that = Array(
    "Jack built.",
    "lay in",
    "ate",
    "killed",
    "worried",
    "tossed",
    "milked",
    "kissed",
    "married",
    "woke",
    "kept",
    "belonged to"
  )

  val the = Array(
    "house",
    "malt",
    "rat",
    "cat",
    "dog",
    "cow with the crumpled horn",
    "maiden all forlorn",
    "man all tattered and torn",
    "priest all shaven and shorn",
    "rooster that crowed in the morn",
    "farmer sowing his corn",
    "horse and the hound and the horn"
  )

  def line(n: Int): String = {
    val content = ((n - 1) to 0 by -1)
      .map(i => s"the ${the(i)} that ${that(i)}")
      .mkString(" ")
    s"This is $content\n"
  }

  def recite(x: Int, y: Int): String =
    (x to y).map(line).mkString + "\n"
}
