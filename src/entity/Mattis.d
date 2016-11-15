module entity.Mattis;

import nuclear.Game;
import nuclear.Util;
import entity.Entity;
import entity.BaseEntity;
import entity.Hurtable;
import entity.CollidingEntity;
import entity.projectile.Projectile;
import weapon.Blaster;
import weapon.Shotgun;
import weapon.FlameThrower;
import weapon.Blink;
import weapon.Iliad;
import weapon.Nuke;
import weapon.HealthBox;
import core.stdc.math;
//import com.mojang.mojam.giraffe.World;
import animator.Direction;
//import com.mojang.mojam.giraffe.animator.DirectionalAnimator;
import animator.DirectionalType;
import weapon.Weapon;

//import org.lwjgl.input.Controllers;
import nuclear.Color;
//import org.newdawn.slick.Font;
import nuclear.World;
import nuclear.Graphics;
import nuclear.Input;
import nuclear.Util;
import geom.Circle;
import geom.Rectangle;
import geom.Vector2f;

import wiiu.font;

import coreinit.debugout;
import animator.DirectionalAnimator;
import nuclear.MultiControls;
//import org.zzl.minegaming.engine.XBOXButtons;

//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;

extern (C) int snprintf ( char * s, size_t n, const char * format, ... );

public class Mattis : BaseEntity, Hurtable {

    private static const int INVINCIBILITY_TIME_AFTER_BLINK = 250;
    private static const int RED_FLASH_DURATION = 200;

    private DirectionalAnimator muzzleAnimator;
    private DirectionalAnimator idleAnimator;
    private DirectionalAnimator shootingAnimator;
    private DirectionalAnimator walkingAnimator;
    private DirectionalAnimator shotgunMuzzleAnimator;
    private DirectionalAnimator currentAnimator;

    private int time = 0;
    private float rotation = 0.0f;
    private bool isShooting;

    private Weapon[] weapons = [null, null, null, null];
    private int[] lastShot = [0,0,0,0];

    private Vector2f screensize;

    private int health = 100;
    private bool flash;
    private int flashDuration;
    private int muzzleAnimDuration = -1;
    private int player = 0;
    private bool isdead = false;

    private int timeSinceBlink = INVINCIBILITY_TIME_AFTER_BLINK;
    private DirectionalAnimator currentMuzzleAnimator;

    private Game game;

    public this(Game g, float x, float y, Vector2f screensize, int player) {
        super(x, y, new Circle(x, y, 10));
        this.screensize = screensize;
        this.player = player;
        this.game = g;

        muzzleAnimator = new DirectionalAnimator(DirectionalType.EIGHT, true);
        muzzleAnimator.load("muzzleflash_48.png", 48, 48);

        muzzleAnimator.setAnimation(Direction.SOUTH, 0, 0, 3, 30);
        muzzleAnimator.setAnimation(Direction.SOUTH_EAST, 0, 1, 3, 30);
        muzzleAnimator.setAnimation(Direction.EAST, 0, 2, 3, 30);
        muzzleAnimator.setAnimation(Direction.NORTH_EAST, 0, 3, 3, 30);
        muzzleAnimator.setAnimation(Direction.NORTH, 0, 4, 3, 30);
        muzzleAnimator.autoFill();

        shotgunMuzzleAnimator = new DirectionalAnimator(DirectionalType.EIGHT, true);
        shotgunMuzzleAnimator.load("shotgunblast_02.png", 95, 95);

        shotgunMuzzleAnimator.setAnimation(Direction.EAST, 0, 0, 1, 20);
        shotgunMuzzleAnimator.setAnimation(Direction.SOUTH, 1, 0, 1, 20);
        shotgunMuzzleAnimator.setAnimation(Direction.SOUTH_EAST, 2, 0, 1, 20);
        shotgunMuzzleAnimator.autoFill();

        int duration = 40;
        idleAnimator = new DirectionalAnimator(DirectionalType.EIGHT, true);
        idleAnimator.load("mattis.png", 48, 48);
        idleAnimator.setAnimation(Direction.SOUTH, 0, 0, 1, duration);
        idleAnimator.setAnimation(Direction.SOUTH_EAST, 0, 3, 1, duration);
        idleAnimator.setAnimation(Direction.EAST, 0, 6, 1, duration);
        idleAnimator.setAnimation(Direction.NORTH_EAST, 0, 9, 1, duration);
        idleAnimator.setAnimation(Direction.NORTH, 0, 12, 1, duration);
        idleAnimator.autoFill();

        shootingAnimator = new DirectionalAnimator(DirectionalType.EIGHT, true);
        shootingAnimator.load("mattis.png", 48, 48);

        shootingAnimator.setAnimation(Direction.SOUTH, 0, 1, 1, duration);
        shootingAnimator.setAnimation(Direction.SOUTH_EAST, 0, 4, 1, duration);
        shootingAnimator.setAnimation(Direction.EAST, 0, 7, 1, duration);
        shootingAnimator.setAnimation(Direction.NORTH_EAST, 0, 10, 1, duration);
        shootingAnimator.setAnimation(Direction.NORTH, 0, 13, 1, duration);
        shootingAnimator.autoFill();


        walkingAnimator = new DirectionalAnimator(DirectionalType.EIGHT, true);
        walkingAnimator.load("mattis.png", 48, 48);

        walkingAnimator.setAnimation(Direction.SOUTH, 0, 2, 8, duration);
        walkingAnimator.setAnimation(Direction.SOUTH_EAST, 0, 5, 8, duration);
        walkingAnimator.setAnimation(Direction.EAST, 0, 8, 8, duration);
        walkingAnimator.setAnimation(Direction.NORTH_EAST, 0, 11, 8, duration);
        walkingAnimator.setAnimation(Direction.NORTH, 0, 14, 8, duration);
        walkingAnimator.autoFill();

        currentAnimator = idleAnimator;
        currentMuzzleAnimator = muzzleAnimator;

        setWeapon(new Blink(game.mattis, 5));
        setWeapon(new Blaster(game.mattis, 1));
    }

    public void update(int delta) {
        super.update(delta);
        for (int i = 0; i < delta; i++) {
            dx *= 0.99f;
            dy *= 0.99f;
        }
        time += delta;
        currentAnimator.update(delta);
        if (flash) {
            flashDuration += delta;
            if (flashDuration > RED_FLASH_DURATION) {
                flash = false;
                flashDuration = 0;
            }
        }
        if (muzzleAnimDuration >= 0) {
            currentMuzzleAnimator.setRotation(rotation);
            currentMuzzleAnimator.update(delta);
            muzzleAnimDuration += delta;
            if (muzzleAnimDuration >= 150) {
                muzzleAnimDuration = -1;
            }
        }
        timeSinceBlink += delta;
    }

    public bool isFinished() {
        return false;
    }
    
    public bool isDead()
    {
    	return isdead;
    }
    
    public void kill()
    {
    	isdead = true;
    }

    public void setRotation(float rotation) {
        this.rotation = rotation;
        currentAnimator = walkingAnimator;

        if (fabs(dx) < 0.1f && fabs(dy) < 0.1f) {
            if (isShooting) {
                currentAnimator = shootingAnimator;
            } else {
                currentAnimator = idleAnimator;
            }
        }
        currentAnimator.setRotation(rotation);
        currentMuzzleAnimator.setRotation(rotation);
    }

    public void collisionX(Rectangle bounds, float x, float newX) {
        dx = 0;
        this.x = x;
    }

    public void collisionY(Rectangle bounds, float y, float newY) {
        dy = 0;
        this.y = y;
    }

    public void drawShadow(Graphics g) {
        //g.setColor(new Color(0, 0, 0, 0.3f));
        //g.fillOval(x - 12, y + 10, 24, 12);
    }

    public void draw(Graphics g) {
        int direction = Util.getDirectionForRotation(rotation);
        bool muzzleUp = direction > Direction.WEST && direction < Direction.EAST;

        float muzzleX = cast(int) x + gunOffsetX[direction];
        float muzzleY = cast(int) y + gunOffsetY[direction];
        
        if(currentMuzzleAnimator is null || currentAnimator is null) return;

        if (muzzleAnimDuration >= 0 && muzzleUp) {
            currentMuzzleAnimator.draw(g, muzzleX, muzzleY);
        }

        if (timeSinceBlink < INVINCIBILITY_TIME_AFTER_BLINK) {
            currentAnimator.draw(g, x, y, true, cast(Color)0x0099FFFF);
        } else {
            currentAnimator.draw(g, x, y, flash, Color.red);
        }

        if (muzzleAnimDuration >= 0 && !muzzleUp) {
            currentMuzzleAnimator.draw(g, muzzleX, muzzleY);
        }
    }

    public void drawGUI(Graphics g) {
        //g.setLineWidth(2);
        g.pushTransform();
        g.translate(0, -64*player);

        for (int count = 0; count <= WeaponSlot.NONE; count++) {
            WeaponSlot slot = cast(WeaponSlot)count;

            Weapon weapon = getWeapon(slot);

            int barWidth = 0;
            int barHeight = 8;
            int rowHeight = barHeight + 4;
            int margin = 6;
            float actualScreenSize = screensize.y / 2f;

            int barLocation = count + 1;
            int textWidth = 0;

            if (weapon !is null) {
                barWidth = 60;
                int duration = time - lastShot[slot];

                // Edge
                g.setColor(gameInstance.playerColors[player]);
                g.fillRect(margin + textWidth, actualScreenSize - margin - rowHeight * barLocation, barWidth, barHeight);

                // Background
                g.setColor(cast(Color)0x0000004D);
                g.fillRect(margin + textWidth, actualScreenSize - margin - rowHeight * barLocation, barWidth, barHeight);

                // Bar
                int delay = weapon.getFireDelay();
                g.setColor(gameInstance.playerColors[player]);
                g.fillRect(margin + 2 + textWidth, actualScreenSize - margin - rowHeight * barLocation + 2, (barWidth - 4) * Util.min(delay, duration) / cast(float) delay, barHeight - 4);
            }

            // Draw weapon name
            {
                float offX = margin*2.0f * (barWidth > 0 ? 2 : 1) + barWidth*2.0f + textWidth;
                float offY = (actualScreenSize - margin)*2.0f - (rowHeight)*2.0f * barLocation;
                g.translate(offX, offY);
                g.scale(1 / 2f, 1 / 2f);
                g.setFont(FONT);
                if (weapon is null) 
                {
                    if (slot == WeaponSlot.SECONDARY) 
                    {
                        //g.drawString("NO " + slot.toString().toUpperCase() + "", 0, 0);
                    }
                } 
                else 
                {
                    char[0x200] temp;
                    if(cast(FlameThrower)weapon)
                    {
                        snprintf(cast(char*)temp.ptr, 0x200, "%s [%u]", cast(char*)weapon.getName(), weapon.getPower());
                    }
                    else if(cast(Nuke)weapon)
                    {
                        snprintf(cast(char*)temp.ptr, 0x200, "%s (%u)", cast(char*)weapon.getName(), weapon.getPower());
                    }
                    else if(cast(HealthBox)weapon)
                    {
                        snprintf(cast(char*)temp.ptr, 0x200, "%s", cast(char*)weapon.getName());
                    }
                    else
                    {
                        snprintf(cast(char*)temp.ptr, 0x200, "%s %u", cast(char*)weapon.getName(), weapon.getPower());
                    }
                    g.drawString(cast(string)temp, 0, 0);
                }
                g.scale(2f, 2f);
                g.translate(-offX, -offY);
            }
        }

        g.scale(1 / 2f, 1 / 2f);
        g.setFont(FONT_LARGE);
        
        char[0x200] healthstr;
        snprintf(cast(char*)healthstr.ptr, 0x200, "%u%%", health);
        g.drawString(cast(string)healthstr, screensize.x - 16 - font_measure_string_width_height(FONT_LARGE, cast(char*)healthstr.ptr), screensize.y - 48);
        g.scale(2f, 2f);
        g.popTransform();
        //g.setLineWidth(1);

    }

    public void setWeapon(Weapon weapon) {
        WeaponSlot slot = weapon.getSlot();
        weapons[slot] = weapon;
        lastShot[slot] = 0;
    }

    public Projectile[] shoot(WeaponSlot slot) {
        if (weapons[slot] !is null) {
            int duration = time - lastShot[slot];
            Weapon weapon = weapons[slot];
            if (duration > weapon.getFireDelay()) {
                if (weapon.hasAmmo()) {
                    muzzleAnimDuration = 0;

                    if (cast(Shotgun)weapon || cast(Iliad)weapon) {
                        currentMuzzleAnimator = shotgunMuzzleAnimator;
                    } else {
                        currentMuzzleAnimator = muzzleAnimator;
                    }

                    lastShot[slot] = time;
                    Projectile[] entities = weapon.shoot(player);

                    if (cast(Blink)weapon) {
                        timeSinceBlink = 0;
                    }

                    if (!weapon.hasAmmo()) {
                        delete weapons[slot];
                        weapons[slot] = null;
                    }
                    return entities;
                }
            }
        }
        return null;
    }

    public void handleInput(Input input, World world) {
    	if(isdead)
    		return;
        float speed = 1 / 4.0f;

        this.dy = MultiControls.getLeftYAxisValue(player) * speed;
        this.dx = MultiControls.getLeftXAxisValue(player) * speed;

        //float offsetX = (this.x - cam.x) - input.getAbsoluteMouseX() / 2f;
        //float offsetY = (this.y - cam.y) - input.getAbsoluteMouseY() / 2f;
        float offsetX = (this.x*2 - world.getCameraPositionX()) - cursorPos[player].x;
        float offsetY = (this.y*2 - world.getCameraPositionY()) - cursorPos[player].y;
        setRotation(cast(float) Util.toDegrees(atan2(offsetY, offsetX)));

        isShooting = false;
        if (MultiControls.isPrimaryButton(player)) {
            Projectile[] entities = shoot(WeaponSlot.PRIMARY);
            if(entities !is null)
                world.addEntity(cast(Entity[])entities);
            isShooting = entities == null || !entities.length == 0;
        }
        
        if (MultiControls.isSecondaryButton(player)) {
            Projectile[] entities = shoot(WeaponSlot.SECONDARY);
            if(entities !is null)
                world.addEntity(cast(Entity[])entities);
            isShooting = entities == null || !entities.length == 0;
        }
        /*if ((player == 0 && MultiControls.getMode() == MultiControls.P2X_CONTROLLER ? input.isMouseButtonDown(Input.MOUSE_RIGHT_BUTTON) : MultiControls.getController(player).getAxisValue(XBOXButtons.AX_LEFT_TRIGGER) > -1)) {
            List<? extends CollidingEntity> entities = shoot(WeaponSlot.SECONDARY);
            world.addEntity(entities);
            isShooting = entities == null || !entities.isEmpty();
        }
        if ((player == 0 && MultiControls.getMode() == MultiControls.P2X_CONTROLLER ? input.isKeyPressed(Input.KEY_SPACE) : MultiControls.getController(player).isButtonPressed(XBOXButtons.BTN_LEFT_THUMB_3) || MultiControls.getController(player).isButtonPressed(XBOXButtons.BTN_RIGHT_THUMB_3) || MultiControls.getController(player).isButtonPressed(XBOXButtons.BTN_X))) {
            MultiControls.rumble(player, 4f, 400);
        	List<? extends CollidingEntity> entities = shoot(WeaponSlot.PANIC);
            world.addEntity(entities);
            isShooting = entities == null || !entities.isEmpty();
        }*/
    }

    public float getRotation() {
        return rotation;
    }

    public int getPlayerNum()
    {
    	return player;
    }
    
    private const float[8] gunOffsetX = [-17, -18, 4.5f, 16, 16, 9, -4.5f, -10];
    private const float[8] gunOffsetY = [7, -3, -10, -2, 7, 11, 12, 11];

    public float getGunX() {
        return getGunX(0);
    }

    public float getGunY() {
        return getGunY(0);
    }

    public float getGunX(float offset) {
        return getGunX(offset, 90);
    }

    public float getGunY(float offset) {
        return getGunY(offset, 90);
    }

    public float getGunX(float offset, int offsetAngle) {
        return cast(float) (x + gunOffsetX[Util.getDirectionForRotation(rotation)] + offset * cos(Util.toRadians(rotation + offsetAngle)));
    }

    public float getGunY(float offset, int offsetAngle) {
        return cast(float) (y + gunOffsetY[Util.getDirectionForRotation(rotation)] + offset * sin(Util.toRadians(rotation + offsetAngle)));
    }

    public Weapon getWeapon(WeaponSlot slot) {
        return weapons[slot];
    }

    public bool hasWeapon(WeaponSlot slot) {
        return null !is getWeapon(slot);
    }

    public bool hurt(Entity source, int damage, float dx, float dy) {
        if (timeSinceBlink > INVINCIBILITY_TIME_AFTER_BLINK) {
            Weapon primary = weapons[WeaponSlot.PRIMARY];
            primary.setPower(Util.max(primary.getPower() - 1, 1));
            health = Util.max(0, health - damage);
            flash = true;
            flashDuration = 0;
        }
        return health <= 0;
    }

    public int getHealth() {
        return health;
    }

    public int getDamageOnCollision() {
        return 0;
    }

    public int getExplosionDelay() {
        return 0;
    }

    public void onDeath() {
    }

    public void setY(float y) {
        this.y = y;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void knockback(float force) {
        float newX = x + cast(float) cos(Util.toRadians(rotation)) * force;
        float newY = y + cast(float) sin(Util.toRadians(rotation)) * force;
        tryMove(gameInstance.world, newX, newY);
    }

    public void setHealth(int health) {
        this.health = health;
    }
    
    public float getX() {
        return super.getX();
    }

    public float getY() {
        return super.getY();
    }

    public float getDx() {
        return super.getDx();
    }

    public float getDy() {
        return super.getDy();
    }
    
    Circle getCollider()
    {
        return super.getCollider();
    }
}
