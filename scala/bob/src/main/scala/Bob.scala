object Bob {
  def response(statement: String): String = {
    val input = statement.trim()
    val upper = statement.toUpperCase()
    val scream = upper == statement && statement.toLowerCase() != upper
    statement match {
      case _ if input == ""                 => "Fine. Be that way!"
      case _ if scream && input.last == '?' => "Calm down, I know what I'm doing!"
      case _ if input.last == '?'           => "Sure."
      case _ if scream                      => "Whoa, chill out!"
      case _                                => "Whatever."
    }
  }
}
