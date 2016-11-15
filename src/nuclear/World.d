module nuclear.World;

import geom.Vector2f;
import geom.Rectangle;
import geom.Circle;
import entity.Mattis;
import entity.Entity;
import entity.Hurtable;
import entity.CollidingEntity;
import entity.enemy.Boss;
import entity.projectile.Projectile;
import entity.projectile.OdysseyRocket;
import entity.Explosion;
import entity.Pickup;
import entity.graphic.Graphic;
import entity.graphic.PickupGraphic;
import nuclear.IGameObject;
import nuclear.Graphics;
import nuclear.Image;
import nuclear.Color;
import nuclear.Util;
import nuclear.SpriteSheet;
import nuclear.PickupSpawner;
import nuclear.MultiControls;

import core.stdc.stdlib;
import coreinit.debugout;

public class World
{
    private const double DROP_SPAWN_CHANCE = 0.1;
    public const ulong TWO = 2;
    private const int MAX_ENTITY = 0x800;
    private Vector2f screensize;
    private Mattis[] mattis;
    private Rectangle bounds;
    
    __gshared Hurtable[MAX_ENTITY] enemies;
    __gshared Projectile[MAX_ENTITY] projectiles;
    __gshared Explosion[MAX_ENTITY] explosions;
    __gshared Pickup[MAX_ENTITY] pickups;
    __gshared Graphic[MAX_ENTITY] graphics;

    /*private List<Hurtable> enemies = new ArrayList<Hurtable>();
    private List<Projectile> projectiles = new ArrayList<Projectile>();
    private List<Explosion> explosions = new ArrayList<Explosion>();
    private List<Pickup> pickups = new ArrayList<Pickup>();
    private List<Graphic> graphics = new ArrayList<Graphic>();*/

    private Vector2f seekCam;
    private Vector2f cam;

    private ulong score = 0;
    private ulong frags = 0;
    private ulong bfrags = 0;

    private int shakeDuration = -1;
    private Vector2f shake;

    private PickupSpawner pickupSpawner;

    private const int SPRITE_W = 0;
    private const int SPRITE_NW = 1;
    private const int SPRITE_N = 2;
    private const int SPRITE_NE = 3;
    private const int SPRITE_E = 4;
    private const int SPRITE_SE = 5;
    private const int SPRITE_S = 6;
    private const int SPRITE_SW = 7;
    private const int SPRITE_C = 8;
    private const int NUM_SPRITES = 9;
    
    private __gshared Image[NUM_SPRITES] lasergrid;

    private int pickupDelay = 0;
    Vector2f empty;
    
    public this(Vector2f screenSize, Mattis[] mattis)
    {
        this.mattis = mattis;
        this.screensize = screenSize;
        pickupSpawner = new PickupSpawner(mattis);
    
        shake = new Vector2f(0, 0);
        empty = new Vector2f(0.0f, 0.0f);
        
        seekCam = new Vector2f(-screensize.x / 4.0f + mattis[0].getX(), -screensize.y / 4.0f + mattis[0].getY());
        cam = new Vector2f(-screensize.x / 4.0f + mattis[0].getX(), -screensize.y / 4.0f + mattis[0].getY());
        bounds = new Rectangle(0, 0, 256 * 4, 256 * 2);
        
        SpriteSheet sheet = new SpriteSheet("lasergrid_sheet.png", 128, 128);
        lasergrid[SPRITE_C] = sheet.getSprite(0, 0);
        lasergrid[SPRITE_N] = sheet.getSprite(1, 0);
        lasergrid[SPRITE_S] = sheet.getSprite(1, 0).setFlipped(false, true);
        lasergrid[SPRITE_E] = sheet.getSprite(2, 0);
        lasergrid[SPRITE_W] = sheet.getSprite(2, 0).setFlipped(true, false);
        lasergrid[SPRITE_NW] = sheet.getSprite(3, 0);
        lasergrid[SPRITE_NE] = sheet.getSprite(3, 0).setFlipped(true, false);
        lasergrid[SPRITE_SW] = sheet.getSprite(3, 0).setFlipped(false, true);
        lasergrid[SPRITE_SE] = sheet.getSprite(3, 0).setFlipped(true, true);
        
        for(int i = 0; i < MAX_ENTITY; i++)
        {
            enemies[i] = null;
            projectiles[i] = null;
            explosions[i] = null;
            pickups[i] = null;
            graphics[i] = null;
        }
    }
    
    public bool update(int delta)
    {
        if (shakeDuration >= 0) {
            shakeDuration += delta;
            float amount = 2 + 1 * (1 - shakeDuration / 250f);
            shake.x = cast(float) (cast(float)(rand() % 100) / 100.0) * amount - amount * 2;
            shake.y = cast(float) (cast(float)(rand() % 100) / 100.0) * amount - amount * 2;
            if (shakeDuration >= 250) {
                shakeDuration = -1;
                shake = new Vector2f(0, 0);
            }
        }

        pickupDelay *= 0.99f;

        foreach(Mattis m ; mattis)
        {
            if(m is null) break;
            
        	if(m.isDead())
        		continue;
        		
        	seekCam.x = -screensize.x / 4.0f + m.getX();
        	seekCam.y = -screensize.y / 4.0f + m.getY();
        	break;
        }
        seekCam.x = Util.fmax(bounds.getX() - 100, Util.fmin(bounds.getMaxX() - screensize.x / 4f + 100, seekCam.x));
        seekCam.y = Util.fmax(bounds.getY() - 100, Util.fmin(bounds.getMaxY() - screensize.y / 2f + 100, seekCam.y));

        if (cam.distanceSquared(seekCam) > 1f) {
            for (int i = 0; i < delta; i++) {
                cam.x += (seekCam.x - cam.x) * 0.004f;
                cam.y += (seekCam.y - cam.y) * 0.004f;
            }
        }

        /*List<Projectile> deadProjectiles = new ArrayList<Projectile>();
        List<Hurtable> deadEnemies = new ArrayList<Hurtable>();
        List<Explosion> deadExplosions = new ArrayList<Explosion>();
        List<Pickup> deadPickups = new ArrayList<Pickup>();
        List<Graphic> deadGraphics = new ArrayList<Graphic>();*/

        int killed = 0;
        float killedX[MAX_ENTITY];
        float killedY[MAX_ENTITY];
        foreach(int indexExplode, Explosion explosion ; explosions) {
            if(explosion is null) continue;
        
            explosion.update(delta);
            foreach(int index, Hurtable other ; enemies) {
                if(other is null) continue;
                
                if (explosion.getCollider().intersects(other.getCollider())) {
                    if (other.hurt(explosion, 100, 0, 0)) {
                        killedX[killed] = explosion.getX(); //TODO: nan otherwise?
                        killedY[killed] = explosion.getY();
                        //OSReport("new2 %f %f\n", killedX[killed], killedY[killed]);
                        killed++;
                        
                        if(cast(Boss)other)
                            bfrags++;
                        else
                            frags++;
                        
                        
                        int explosionDelay = other.getExplosionDelay();
                        for(int j = 0; j < MAX_ENTITY; j++)
                        {
                            if(explosions[j] is null)
                            {
                                explosions[j] = new Explosion(other.getX(), other.getY(), explosion.getDecreasedSize(), explosion.getScore() * 2, explosionDelay, explosion.getChain() + 1); //Woo
                                break;
                            }
                        }
                        if (explosionDelay > 0) {
                            other.onDeath();
                        }
                        
                        
                        
                        delete enemies[index];
                        enemies[index] = null;
                        shakeDuration = 0;
                    }
                }
            }
            if (explosion.isFinished()) {
                score = score + explosion.getScore();
                
                delete explosion;
                explosions[indexExplode] = null;
                //deadExplosions[deadCount++] = indexExplode; //TODO
            }
        }
        
        foreach(int index, Hurtable hurtable ; enemies) {
            if(hurtable is null) continue;
            
            hurtable.update(delta);
            foreach(Mattis m ; mattis)
            {
                if(m is null) break;
                
            	if (hurtable.getCollider().intersects(m.getCollider())) {
            		bool dead = m.hurt(hurtable, hurtable.getDamageOnCollision(), 0, 0);
            		if (dead) {
            			m.kill();
            		}
            		explode(hurtable, 30, 2);
            		
            		killedX[killed] = hurtable.getX();
                    killedY[killed] = hurtable.getY();
                    //OSReport("new1 %f %f\n", killedX[killed], killedY[killed]);
            		killed++;
            		
            		if(cast(Boss)hurtable)
                        bfrags++;
                    else
                        frags++;
            		
            		delete hurtable;
            		enemies[index] = null;
            		break;
            	}
            }
        }
        
        int numDead = 0;
        for(int i = 0; i < mattis.length; i++)
        {
            if(mattis[i] is null) break;
            
        	if(mattis[i].isDead())
        		numDead++;
        }
        
        if(numDead == MultiControls.getNumPlayers())
			return true;

        foreach(int index, Pickup pickup ; pickups) {
            if(pickup is null) continue;
            
            pickup.update(delta);
        	foreach(Mattis m ; mattis)
        	{
        	    if(m is null) break;

        		if (pickup.getCollider().intersects(m.getCollider())) {
        			addEntity(new PickupGraphic(screensize, pickup.getPickupString(), pickupDelay));
        			pickupDelay += 1000;
        			pickup.onPickup(m);
        			
        			//delete pickup; //TODO?
        			pickups[index] = null;
        			break;
        		}
        		
        	}
        	if (pickup.isFinished()) {
       			delete pickup;
       			pickups[index] = null;
            }
        }

        foreach(Mattis m ; mattis)
        {
            if(m is null) break;
            
        	m.update(delta);
        }

        foreach(int index, Projectile projectile ; projectiles) {
            if(projectile is null) continue;
            projectile.update(delta);
            if (!bounds.contains(projectile.getX(), projectile.getY()) || projectile.isFinished()) {
                if (projectile.isFinished() && cast(OdysseyRocket)projectile) {
                    addEntity(new Explosion(projectile.getX(), projectile.getY(), 20, 8, 0, 0));
                }
                delete projectile;
                projectiles[index] = null;
                continue; // Done with this one -- bye!
            }

            foreach(int enemyIndex, Hurtable target ; enemies) {
                if(target is null) continue;
                
                if (target.getCollider().intersects(projectile.getCollider())) {
                    //Game.playSound(Game.SOUND_BULLET_HIT, 1.0f, 0.8f);
                    //MultiControls.rumble(projectile.getOwnerNum(), 0.2f);
                    addEntity(projectile.onPoof());

                    //deadProjectiles.add(projectile);

                    if (target.hurt(projectile, projectile.getDamage(), projectile.getDx(), projectile.getDy())) {
                        OSReport("rip");
                        explode(target, 100, 8);
                        /*float distance = new Vector2f(target.getX(), target.getY()).distance(new Vector2f(mattis[projectile.getOwnerNum()].getX(),mattis[projectile.getOwnerNum()].getY()));
                        
                        MultiControls.rumble(projectile.getOwnerNum(),4f - (distance * 0.028f),400);*/
                        killedX[killed] = target.getX();
                        killedY[killed] = target.getY();
                        //OSReport("new3 %f %f\n", killedX[killed], killedY[killed]);
                        killed++;
                        
                        if(cast(Boss)target)
                            bfrags++;
                        else
                            frags++;
                        
                        delete target;
                        enemies[enemyIndex] = null;
                    }
                    
                    delete projectile;
                    projectiles[index] = null;

                    break; // Just one hit per bullet
                }
            }
        }

        /*foreach(Hurtable deadEnemy ; deadEnemies) {
            
            //if(deadEnemy instanceof Boss)
            //	addBossFrag();
        }*/

        foreach(int index, Graphic graphic ; graphics) {
            if(graphic is null) continue;
            
            graphic.update(delta);
            if (graphic.isFinished()) {
                delete graphic;
                graphics[index] = null;
            }
        }
        
        for(int i = 0; i < killed; i++)
        {
            if ((cast(float)(rand() % 100) / 100.0) < DROP_SPAWN_CHANCE) 
            {
                addEntity(pickupSpawner.spawnPickup(killedX[i], killedY[i]));
            }
        }

        /*graphics.removeAll(deadGraphics);
        pickups.removeAll(deadPickups);
        projectiles.removeAll(deadProjectiles);
        enemies.removeAll(deadEnemies);
        explosions.removeAll(deadExplosions);*/

        return false;
    }
    
    public void draw(Graphics g)
    {
        float tx = cast(float)(cast(long)(cam.x + shake.x));
        float ty = cast(float)(cast(long)(cam.y + shake.y));
    	drawGrid(g,false);
        /*foreach(Hurtable hurtable ; enemies) {
            hurtable.drawShadow(g);
        }*/
        foreach(Mattis m ; mattis)
        {
            if(m is null) break;
            
        	if(!m.isDead())
        		m.drawShadow(g);
        }
        foreach(Pickup pickup ; pickups) {
            if(pickup is null) continue;
            pickup.draw(g);
        }
        //g.setDrawMode(GraphicsMode.MODE_ADD);
        foreach(Explosion explosion ; explosions) {
            if(explosion is null) continue;
            explosion.draw(g);
        }
        //g.setDrawMode(GraphicsMode.MODE_NORMAL);
        foreach(Graphic graphic ; graphics) {
            if(graphic is null) continue;
            graphic.draw(g);
        }
        foreach(Projectile projectile ; projectiles) {
            if(projectile is null) continue;
            projectile.draw(g);
        }
        foreach(Hurtable hurtable ; enemies) {
            if(hurtable is null) continue;
            hurtable.draw(g);
        }
        foreach(Mattis m ; mattis)
        {
            if(m is null) break;
            
        	if(!m.isDead())
        		m.draw(g);
        }
        g.translate(tx, ty);
        foreach(Graphic graphic ; graphics) {
            if(graphic is null) continue;
            graphic.drawGUI(g);
        }
        foreach(Mattis m ; mattis)
            if(m !is null)
        	    if(!m.isDead())
        			    m.drawGUI(g);
    }
    
    public void drawGrid(Graphics g, bool gridonly)
    {
        float tx = cast(float)(cast(long)(cam.x + shake.x));
        float ty = cast(float)(cast(long)(cam.y + shake.y));

        g.translate(-tx, -ty);
        //g.setDrawMode(GraphicsMode.MODE_ADD_ALPHA);
        for (int x = -64; x < bounds.getWidth() + 64; x += 128) {
            for (int y = -64; y < bounds.getHeight() + 64; y += 128) {
                bool west = x < 0;
                bool east = x >= bounds.getWidth() - 64;
                bool north = y < 0;
                bool south = y >= bounds.getHeight() - 64;
                int sprite = SPRITE_C;
                if (west && north) {
                    sprite = SPRITE_NW;
                } else if (east && north) {
                    sprite = SPRITE_NE;
                } else if (south && west) {
                    sprite = SPRITE_SW;
                } else if (south && east) {
                    sprite = SPRITE_SE;
                } else if (west) {
                    sprite = SPRITE_W;
                } else if (east) {
                    sprite = SPRITE_E;
                } else if (south) {
                    sprite = SPRITE_S;
                } else if (north) {
                    sprite = SPRITE_N;
                }
                g.drawImage(lasergrid[sprite], x, y, cast(Color)0xFFFFFF4D);
            }
        }
        //g.setDrawMode(GraphicsMode.MODE_NORMAL);
        if(gridonly)
        	g.translate(tx, ty);
    }
    
    private void explode(Hurtable enemy, int size, int score) {
        int explosionDelay = enemy.getExplosionDelay();
        addEntity(new Explosion(enemy.getX(), enemy.getY(), size, score, explosionDelay, 0));
        if (explosionDelay > 0) {
            enemy.onDeath();
        }
        shakeDuration = 0;
    }
    
    public void addEntity(Entity[] list ...) {
        if (list is null) return;
        foreach(Entity entity ; list) {
            if(entity is null) continue;
            addEntity(entity);
        }
    }

    public void addEntity(Entity entity) {
        //OSReport("addEntity");
        if (entity is null) return;

        if (cast(Projectile)entity) {
            for(int i = 0; i < MAX_ENTITY; i++)
            {
                if(projectiles[i] is null)
                {
                    projectiles[i] = cast(Projectile) entity;
                        break;
                }
            }
        } else if (cast(Hurtable)entity) {
            for(int i = 0; i < MAX_ENTITY; i++)
            {
                if(enemies[i] is null)
                {
                    enemies[i] = cast(Hurtable) entity;
                    break;
                }
            }
        } else if (cast(Explosion)entity) {
            for(int i = 0; i < MAX_ENTITY; i++)
            {
                if(explosions[i] is null)
                {
                    explosions[i] = cast(Explosion) entity;
                    break;
                }
            }
        } else if (cast(Graphic)entity) {
            for(int i = 0; i < MAX_ENTITY; i++)
            {
                if(graphics[i] is null)
                {
                    graphics[i] = cast(Graphic) entity;
                    break;
                }
            }
        } else if (cast(Pickup)entity) {
            for(int i = 0; i < MAX_ENTITY; i++)
            {
                if(pickups[i] is null)
                {
                    pickups[i] = cast(Pickup) entity;
                    break;
                }
            }
        } else {
            OSReport("couldn't add entity!");
            //System.out.println("Unable to add type: " + entity);
        }
    }
    
    public void addFrag()
    {
    }
    
    public void addBossFrag()
    {
    }
    
    public ulong getScore()
    {
        return score;
    }
    
    public ulong getFrags()
    {
        return frags;
    }
    
    public ulong getBossFrags()
    {
        return bfrags;
    }
    
    public float getCameraPositionX() {
        return cam.x + shake.x;
    }
    
    public float getCameraPositionY() {
        return cam.y + shake.y; 
    }
    
    public int getClosestEnemy(Entity origin, int maxRange) {
        int closestEnemy = MAX_ENTITY-1;
        float bestDistSquared = float.max;
        foreach(int index, Hurtable e ; enemies) {
            if(e is null) continue;
        
            Vector2f pos = new Vector2f(e.getX(), e.getY());
            Vector2f pos2 = new Vector2f(origin.getX(), origin.getY());
            float distSquared = pos.distanceSquared(pos2);
            
            delete pos;
            delete pos2;
            if (distSquared < bestDistSquared && distSquared < maxRange * maxRange) {
                bestDistSquared = distSquared;
                closestEnemy = index;
            }
        }
        return closestEnemy;
    }
    
    public Hurtable getEnemy(int index)
    {
        return enemies[index];
    }
    
    public Rectangle getBounds() {
        return bounds;
    }
    
    public bool inBounds(Circle circle) {
        return Util.contains(bounds, circle);
    }

    public Rectangle getSpawnBounds() {
        return new Rectangle(bounds.getX() + 100, bounds.getY() + 100, bounds.getMaxX() - 200, bounds.getMaxY() - 200);
    }
    
    public bool isBossAlive()
    {
        return false;
    }
    
    void clearEntities()
    {
        for(int i = 0; i < MAX_ENTITY; i++)
        {
            if(enemies[i] !is null)
            {
                delete enemies[i];
                enemies[i] = null;
            }
            if(projectiles[i] !is null)
            {
                delete projectiles[i];
                projectiles[i] = null;
            }
            if(explosions[i] !is null)
            {
                delete explosions[i];
                explosions[i] = null;
            }
            if(pickups[i] !is null)
            {
                delete pickups[i];
                pickups[i] = null;
            }
            if(graphics[i] !is null)
            {
                delete graphics[i];
                graphics[i] = null;
            }
        }
    }
}
