if instance_exists( currentStage ) instance_destroy( currentStage );
currentStage = instance_create_layer( 100, 100, "Instances", cnt_stage );
currentStage.checkpoint = testStage;
Master.gameState = play;
room_goto( currentStage.checkpoint );