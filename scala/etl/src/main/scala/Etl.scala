object Etl {
  def transform(letters: Map[Int, Seq[String]]): Map[String, Int] =
    for {
      (k, v) <- letters
      res    <- v.map { id => id.toLowerCase -> k }
    } yield res
}
