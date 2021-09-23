object SpaceAge {

  def onEarth(n: Double): Double =
    (n / 31557600)

  def onMercury(n: Double): Double =
    onEarth(n / 0.2408467)

  def onVenus(n: Double): Double =
    onEarth(n / 0.61519726)

  def onMars(n: Double): Double =
    onEarth(n / 1.8808158)

  def onJupiter(n: Double): Double =
    onEarth(n / 11.862615)

  def onSaturn(n: Double): Double =
    onEarth(n / 29.447498)

  def onUranus(n: Double): Double =
    onEarth(n / 84.016846)

  def onNeptune(n: Double): Double =
    onEarth(n / 164.79132)
}
