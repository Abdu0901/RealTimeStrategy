//Class EnemyUnit includes the different EnemyUnits and their interactions
class EnemyUnit {
  PVector pos;
  PVector vel;
  int taller = 0;
  boolean FbaseTargetted = false;
  boolean FswordTargetted = false;
  boolean FkingTargetted = false;
  boolean FhorseTargetted = false;
  boolean FarcherTargetted = false;
}

class Esword extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (MediumSpeed, 0);
  int life = SwordHP;

  void update() {
    if (life > 1) {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKSword.resize(50, 50);
      image(BKSword, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    }
  }

  void EswordMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (FbaseTargetted == true && taller > VeryFastAttackSpeed) {
      vel.set( 0, 0);      
      taller = 0;
      FriendBase.life = FriendBase.life -SwordDamage;
    } //If above is false, EnemyUnit will move towards enemy base
    else if (FbaseTargetted == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(MediumSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, FbaseTargetted becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
      FbaseTargetted = true;
    }
  }
}

class Eking extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (FastSpeed, 0);
  int life = KingHP;

  void EkingMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (FbaseTargetted == true && taller > SlowAttackSpeed) {
      vel.set( 0, 0);
      taller = 0;
      FriendBase.life = FriendBase.life -KingDamage;
    } //If above is false, EnemyUnit will move towards enemy base
    else if (FbaseTargetted == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(FastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, FbaseTargetted becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
      FbaseTargetted = true;
    }
  }

  void update() {
    if (life > 1) {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKKing.resize(50, 50);
      image(BKKing, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    }
  }
}

class Earcher extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (SlowSpeed, 0);
  int life = ArcherHP;

  void update() {
    if (life > 1) {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKBow.resize(50, 50);
      image(BKBow, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    }
  }

  void EarcherMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (FbaseTargetted == true && taller > MediumAttackSpeed) {
      vel.set( 0, 0);
      taller = 0;
      FriendBase.life = FriendBase.life -ArcherDamage;
    } //If above is false, EnemyUnit will move towards enemy base
    else if (FbaseTargetted == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(SlowSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, FbaseTargetted becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize+BowRange) {
      FbaseTargetted = true;
    }
  }
}

class Ehorseman extends EnemyUnit {
  PVector pos = new PVector (EDeployLocationX, EDeployLocationY);
  PVector vel = new PVector (VeryFastSpeed, 0);
  int life = HorseManHP;

  void update() {
    if (life > 1) {
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(atan2(FriendBase.pos.y - pos.y, FriendBase.pos.x - pos.x));
      rectMode(CENTER);
      fill(255, 0, 0);
      ellipse(0, 0, 50, 50);
      BKHorseman.resize(50, 50);
      image(BKHorseman, 0, 0);
      fill(255);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("HP:" + life, 0, -40);
      popMatrix();
    }
  }

  void EhorsemanMovement() {
    taller++;
    //Checks if EnemyUnit is in combat, if true, stops the EnemyUnit from moving
    if (FbaseTargetted == true && taller > FastAttackSpeed) {
      vel.set(0, 0);      
      taller = 0;
      FriendBase.life = FriendBase.life -HorseManDamage;
    } //If above is false, EnemyUnit will move towards enemy base
    else if (FbaseTargetted == false) {
      PVector vel = PVector.sub(FriendBase.pos, pos);
      vel.setMag(VeryFastSpeed);
      pos.x = constrain(pos.x, 0, width);
      pos.y = constrain(pos.y, 0, height);
      pos.add(vel);
    } //If EnemyUnit is close to enemy base, FbaseTargetted becomes true and EnemyUnit damages the base
    if (dist(pos.x, pos.y, FriendBase.pos.x, FriendBase.pos.y)<=BaseSize) {
      FbaseTargetted = true;
    }
  }
}
