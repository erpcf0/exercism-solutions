sealed abstract class Bearing
object Bearing {
  case object North extends Bearing
  case object East extends Bearing
  case object South extends Bearing
  case object West extends Bearing
}

case class Robot(bearing: Bearing, coordinates: (Int, Int)) {
  def turnLeft: Robot = bearing match {
    case Bearing.North => this.copy(bearing = Bearing.West)
    case Bearing.East  => this.copy(bearing = Bearing.North)
    case Bearing.South => this.copy(bearing = Bearing.East)
    case Bearing.West  => this.copy(bearing = Bearing.South)
  }
  def turnRight: Robot = bearing match {
    case Bearing.North => this.copy(bearing = Bearing.East)
    case Bearing.East  => this.copy(bearing = Bearing.South)
    case Bearing.South => this.copy(bearing = Bearing.West)
    case Bearing.West  => this.copy(bearing = Bearing.North)
  }
  def advance: Robot = bearing match {
    case Bearing.North =>
      this.copy(coordinates = (this.coordinates._1, this.coordinates._2 + 1))
    case Bearing.East =>
      this.copy(coordinates = (this.coordinates._1 + 1, this.coordinates._2))
    case Bearing.South =>
      this.copy(coordinates = (this.coordinates._1, this.coordinates._2 - 1))
    case Bearing.West =>
      this.copy(coordinates = (this.coordinates._1 - 1, this.coordinates._2))
  }
  def simulate(steps: String): Robot =
    steps.foldLeft(this)((robot, step) =>
      step match {
        case 'A' => robot.advance
        case 'L' => robot.turnLeft
        case 'R' => robot.turnRight
      }
    )
}
