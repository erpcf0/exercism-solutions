object ArmstrongNumbers {
  def isArmstrongNumber(n: Int): Boolean = {
    val digits = n.toString().toCharArray()
    digits.map(i => Math.pow(i.asDigit, digits.length)).sum == n
  }
}
