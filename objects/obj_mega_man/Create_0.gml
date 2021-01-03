/// @description Insert description here
Health = 28;
h = 0;
v = 0;
xslop = 0;
yslop = 0;
xprev = x;
yprev = y;
sprite_index = spr_megaman_idle;

SLIDE_VEL = 2.5;
RUN_VEL = 1.5;
JUMP_VEL = 5.42;
GRAVITY = .275;
RUN_DELAY = 5;
FIRE_DELAY = 13;

facing = 1;
isJumping = false;
hasFinishedJumping = false;
isLanding = false;
isAirborne = false;
ladderDropTimer = 0;
isOnLadder = false;
isClimbing = 0;
runningTimer = 0;
isRunning = 0;
isNudging = 0;
isSliding = 0;
slidingTimer = 0;
isFiring = false;
firingTimer = FIRE_DELAY;
isCharging = false;
chargingTimer = 0;
isStunned = false;
stunnedTimer = 0;
isIntangible = false;
intangibleTimer = 0;
isAtLadderTop = false;
isCrushed = false;
aniTimer = 0;
aniFrame = 0;
isDead = false;
deadTimer = 0;
isAdvancing = right;
destination = rm_engine_test_boot;
drawHB = false;
offset = 0;

damage = 0;