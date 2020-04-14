//Class FriendlyUnit includes the different FriendlyUnits and their interactions
class FriendlyUnit {
  PVector pos;
  PVector vel;
  int taller = 0;
  boolean InCombat = false;
}

class Fsword extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (MediumSpeed, 0);
  int life = SwordHP;

  void update() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
    rectMode(CENTER);
    fill(0, 0, 255);
    ellipse(0, 0, 50, 50);
    BKSword.resize(50, 50);
    image(BKSword, -25, -25);
    popMatrix();
  }

  void swordMovement() {
    taller++;
    //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, FriendlyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(MediumSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=120 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyBase.life = EnemyBase.life -SwordDamage;
    }
  }
}

class Fking extends FriendlyUnit {
  PVector pos = new PVector (DeployX, DeployY);
  PVector vel = new PVector (FastSpeed, 0);
  int life = KingHP;

  void kingMovement() {
    taller++;
    //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
    if (InCombat == true) {
      vel.set( 0, 0);
    } //If above is false, FriendlyUnit will move towards enemy base
    else if (InCombat == false) {
      PVector vel = PVector.sub(EnemyBase.pos, pos);
      vel.setMag(FastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=120 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyBase.life = EnemyBase.life -KingDamage;
    }
/* if (dist(pos.x, pos.y, EnemyUnit.pos.x, EnemyUnit.pos.y)<=120 && taller > 9) {
      InCombat = true;
      taller = 0;
      EnemyUnit.life = EnemyUnit.life - KingDamage;
    }
  } */

    void update() {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKKing.resize(50, 50);
      image(BKKing, -25, -25);
      popMatrix();
    }
  }

  class Farcher extends FriendlyUnit {
    PVector pos = new PVector (DeployX, DeployY);
    PVector vel = new PVector (SlowSpeed, 0);
    int life = ArcherHP;

    void update() {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKBow.resize(50, 50);
      image(BKBow, -25, -25);
      popMatrix();
    }

    void archerMovement() {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (InCombat == true) {
        vel.set( 0, 0);
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (InCombat == false) {
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(SlowSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
      if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=300 && taller > 9) {
        InCombat = true;
        taller = 0;
        EnemyBase.life = EnemyBase.life -ArcherDamage;
      }
      /*
    if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=200) {
       PVector vel = PVector.sub(EnemyBase.pos, pos);
       vel.setMag(2.5);
       pos.add(vel);
       
       //   add(arrow);
       }
       pos.x = constrain(pos.x, 0, width);
       pos.y = constrain(pos.y, 0, height);
       pos.add(this.vel);
       */
    }
  }

  class Fhorseman extends FriendlyUnit {
    PVector pos = new PVector (DeployX, DeployY);
    PVector vel = new PVector (VeryFastSpeed, 0);
    int life = HorseManHP;

    void update() {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(EnemyBase.pos.y - pos.y, EnemyBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(0, 0, 255);
      ellipse(0, 0, 50, 50);
      BKHorseman.resize(50, 50);
      image(BKHorseman, -25, -25);
      popMatrix();
    }

    void horsemanMovement() {
      taller++;
      //Checks if FriendlyUnit is in combat, if true, stops the FriendlyUnit from moving
      if (InCombat == true) {
        vel.set(0, 0);
      } //If above is false, FriendlyUnit will move towards enemy base
      else if (InCombat == false) {
        PVector vel = PVector.sub(EnemyBase.pos, pos);
        vel.setMag(VeryFastSpeed);
        pos.x = constrain(pos.x, 0, width);
        pos.y = constrain(pos.y, 0, height);
        pos.add(vel);
      } //If FriendlyUnit is close to enemy base, InCombat becomes true and FriendlyUnit damages the base
      if (dist(pos.x, pos.y, EnemyBase.pos.x, EnemyBase.pos.y)<=120 && taller > 9) {
        InCombat = true;
        taller = 0;
        EnemyBase.life = EnemyBase.life -HorseManDamage;
      }
    }
  }

  /*
class arrow extends FriendlyUnit {
   //  PVector pos = new PVector (archer.pos.x, archer.pos.y);
   PVector vel = new PVector (15, 0);
   
   void update() {
   pushMatrix();
   translate(pos.x, pos.y);
   rectMode(CENTER);
   fill(255, 0, 0);
   ellipse(0, 0, 20, 20);
   popMatrix();
   }
   
   void arrowMovement() {
   PVector vel = PVector.sub(EnemyBase.pos, pos);
   vel.setMag(2.5);
   pos.add(vel);
   pos.add(this.vel);
   }
   }*/
