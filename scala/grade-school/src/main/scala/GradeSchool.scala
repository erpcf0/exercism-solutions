class School {
  type DB = Map[Int, Seq[String]]

  var school = Map[Int, Seq[String]]()

  def add(name: String, g: Int) =
    school += (g -> (grade(g) :+ name))

  def db: DB = school

  def grade(g: Int): Seq[String] =
    school.getOrElse(g, Seq())

  def sorted: DB =
    school.toSeq.sortBy(_._1).map(s => (s._1, s._2.sorted)).toMap
}
