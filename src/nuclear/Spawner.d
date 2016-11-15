module nuclear.Spawner;

import entity.Mattis;
import nuclear.Util;
import nuclear.World;
import entity.enemy.AbstractEnemy;
import entity.enemy.Bouncer;
import entity.enemy.RandomBouncer;
import entity.enemy.Charger;
import entity.enemy.Chaser;
import entity.enemy.RandomWalker;
import entity.enemy.Boss;

//import java.util.ArrayList;
//import java.util.List;
import core.stdc.math;
import core.stdc.stdlib;

import geom.Rectangle;
import geom.Vector2f;

import coreinit.debugout;

public class Spawner {

    private const int BOUNCER = 0;
    private const int RANDOM_BOUNCER = 1;
    private const int CHARGER = 2;
    private const int CHASER = 3;
    private const int RANDOM_WALKER = 4;
    private const int BOSS = 5;

    private const int BOSS_SPAWN_INTERVAL = 20000;
    private const int REGULAR_SPAWN_INTERVAL = 100;

    private int totalTime;
    private int timeSinceRegular = 0;
    private int timeSinceBoss = 0;
    private int nextEventType = 0;
    private int bossCount = 0;

    private __gshared World world;
    private __gshared Mattis[] mattis;

    private AbstractEnemy[6] enemyTypes;

    public this(World world, Mattis[] mattis) {
        this.world = world;
        this.mattis = mattis;

        Vector2f zero = new Vector2f(0, 0);
        enemyTypes[0] = new Bouncer(zero);
        enemyTypes[1] = new RandomBouncer(zero);
        enemyTypes[2] = new Charger(zero, mattis);
        enemyTypes[3] = new Chaser(zero, mattis);
        enemyTypes[4] = new RandomWalker(zero);
        enemyTypes[5] = new Boss(zero, mattis);
    }

    public void update(int delta) {

        totalTime += delta;
        spawnBoss(delta);
        spawnRegulars(delta);
    }

    private void createAndAddEnemy(int type, Vector2f position) {
        AbstractEnemy ae = enemyTypes[type].copy();
        ae.setPosition(position);
        world.addEntity(ae);
    }

    private void spawnRegulars(int delta) {

        timeSinceRegular += delta;
        float generalSpawnFactor = (world.isBossAlive() ? 0.2f : 1f);
        while (timeSinceRegular > REGULAR_SPAWN_INTERVAL) {
            foreach(AbstractEnemy e ; enemyTypes) {
                if ((cast(float)(rand() % 100) / 100.0) < e.getSpawnChance(totalTime) * generalSpawnFactor) {
                    //TODO: This will memory leak like nuts
                    Vector2f spawnPosition = getSpawnPosition(world.getSpawnBounds(), mattis[rand() % 1/*Game.numPlayers*/]);
                    world.addEntity(e.copy().setPosition(spawnPosition));
                    
                    delete spawnPosition;
                }
            }
            timeSinceRegular -= REGULAR_SPAWN_INTERVAL;
        }

    }

    private void spawnBoss(int delta) {
        timeSinceBoss += delta;
        if (timeSinceBoss > BOSS_SPAWN_INTERVAL) {
            OSReport("boss spawn");
            Vector2f centerPos = new Vector2f(world.getBounds().getCenterX(), world.getBounds().getCenterY());
            Vector2f[] spawnPositions;
            switch (nextEventType) {
                case 0:
                    //Spawn chasers in a circle
                    spawnPositions = getCirclePositions(centerPos, 180, 12);
                    for(int i = 0; i < 12; i++) {
                        createAndAddEnemy(CHASER, spawnPositions[i]);
                    }
                    break;
                case 1:
                    //Spawn chargers in a circle
                    spawnPositions = getCirclePositions(centerPos, 180, 16);
                    for(int i = 0; i < 16; i++) {
                        createAndAddEnemy(CHARGER, spawnPositions[i]);
                    }
                    break;
                case 2:
                    //Spawn robokitten
                    float distance = (bossCount == 0 ? 0 : 200);
                    spawnPositions = getCirclePositions(centerPos, distance, bossCount + 1);
                    for(int i = 0; i < bossCount+1; i++) {
                        createAndAddEnemy(BOSS, spawnPositions[i]);
                    }
                    bossCount++;
                    break;
                case 3:
                    //Spawn bouncers along the edges
                    spawnPositions = getCirclePositions(centerPos, 250, 24);
                    for(int i = 0; i < 24; i++) {
                        createAndAddEnemy(BOUNCER, spawnPositions[i]);
                    }
                    break;
                case 4:
                    //Spawn chasers + chargers in a square
                    spawnPositions = getCirclePositions(centerPos, 180, 12);
                    for(int i = 0; i < 12; i++) {
                        createAndAddEnemy(CHARGER, spawnPositions[i]);
                    }
                    spawnPositions = getCirclePositions(centerPos, 250, 16);
                    for(int i = 0; i < 16; i++) {
                        createAndAddEnemy(CHASER, spawnPositions[i]);
                    }
                    break;
            }
            nextEventType = (nextEventType + 1) % 5;
            timeSinceBoss = 0;
        }
    }

    private Vector2f[200] getCirclePositions(Vector2f center, float radius, int numPositions) {
        Vector2f[200] positions; //TODO memory leak
        float angle = 0;
        for (int i = 0; i < numPositions; i++) {
            Vector2f desiredPos = new Vector2f(center.x + radius * cast(float) cos(angle), center.y + radius * cast(float) sin(angle));
            positions[i] = getSpawnPosition(world.getSpawnBounds(), mattis[/*r.nextInt(Game.numPlayers)*/0], desiredPos);
            angle += Util.PI * 2 / numPositions;
        }
        return positions;
    }

    private Vector2f getSpawnPosition(Rectangle spawnBounds, Mattis mattis) {
        return getSpawnPosition(spawnBounds, mattis, mattis.getPosition().copy());
    }

    private Vector2f getSpawnPosition(Rectangle spawnBounds, Mattis mattis, Vector2f desiredSpawnPos) {
        Vector2f mattisPos = mattis.getPosition();
        Vector2f spawnPos = desiredSpawnPos;
        while (spawnPos.distanceSquared(mattisPos) < 150 * 150) {
            spawnPos = new Vector2f(cast(float) (spawnBounds.getX() + (cast(float)(rand() % 100) / 100.0) * spawnBounds.getWidth()), cast(float) (spawnBounds.getY() + (cast(float)(rand() % 100) / 100.0) * spawnBounds.getHeight()));
        }
        return spawnPos;
    }
}
