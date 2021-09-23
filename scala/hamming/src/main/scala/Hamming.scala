object Hamming {
  def distance(strand1: String, strand2: String): Option[Int] =
    strand1.length() == strand2.length() match {
      case false => None
      case true  => Some((strand1 zip strand2).count { case (a, b) => a != b })
    }
}
