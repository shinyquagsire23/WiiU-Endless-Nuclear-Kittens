module animator.DirectionalType;

import animator.Direction;

enum DirectionalType
{
    TWO = [Direction.EAST, Direction.WEST],
    FOUR = [Direction.NORTH, Direction.EAST, Direction.SOUTH, Direction.WEST],
    FOUR_ROT = [Direction.NORTH_EAST, Direction.SOUTH_EAST, Direction.SOUTH_WEST, Direction.NORTH_WEST],
    EIGHT = [Direction.NORTH, Direction.NORTH_EAST, Direction.EAST, Direction.SOUTH_EAST, Direction.SOUTH, Direction.SOUTH_WEST, Direction.WEST, Direction.NORTH_WEST],
}

/*public enum DirectionalType
{
    TWO,
    FOUR,
    FOUR_ROT,
    EIGHT,
}*/
