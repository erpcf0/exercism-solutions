case class Triangle(a: Double, b: Double, c: Double) {
  val isValid =
    a > 0 && b > 0 && c > 0 && a + b > c && b + c > a && c + a > b

  def equilateral(): Boolean =
    isValid && a == b && b == c

  def isosceles(): Boolean =
    isValid && (a == b || b == c || c == a)

  def scalene(): Boolean =
    isValid && a != b && b != c && a != c
}
