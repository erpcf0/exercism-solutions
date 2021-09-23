object SecretHandshake {
  val events = Map(
    1 -> "wink",
    2 -> "double blink",
    4 -> "close your eyes",
    8 -> "jump"
  )
  def commands(input: Int): List[String] = {
    val listEvents = events.foldLeft(List[String]())((acc, event) =>
      if ((input & event._1) > 0) event._2 :: acc
      else acc
    )

    if ((input & 16) > 0) listEvents
    else listEvents.reverse
  }
}
