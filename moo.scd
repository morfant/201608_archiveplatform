



//~pm4를 조금씩 시간차를 주어서 실행시킨다. 무 씬?
~masterEQ.gui.onSelect('moo');
~pm4Syn = Array.newClear(20);
~pm4Syn[0] = ~pm4.play;~pbPlay_4 = ~pb3_4.play;~pbPlay_5 = ~pb3_5.play; //베이스 + 미들 + 하이
~pbPlay_4 = ~pb3_4.play;~pbPlay_5 = ~pb3_5.play; //베이스 + 미들
~pbPlay_5 = ~pb3_5.play; //미들

~pm4Syn[1] = ~pm4.play;
~pm4Syn[2] = ~pm4.play;
~pm4Syn[3] = ~pm4.play;
~pm4Syn[4] = ~pm4.play;
~pm4Syn[5] = ~pm4.play;
~pm4Syn[6] = ~pm4.play;
~pm4Syn[7] = ~pm4.play;
~pm4Syn[8] = ~pm4.play;
~pm4Syn[9] = ~pm4.play;
~pm4Syn[10] = ~pm4.play;
~pm4Syn[11] = ~pm4.play;
~pm4Syn[12] = ~pm4.play;
~pm4Syn[13] = ~pm4.play;
~pm4Syn[14] = ~pm4.play;
~pm4Syn[15] = ~pm4.play;
~pm4Syn[16] = ~pm4.play;
~pm4Syn[17] = ~pm4.play;
~pm4Syn[18] = ~pm4.play;
~pm4Syn[19] = ~pm4.play;


//소리 끄기
~pbPlay_4.stop; //베이스
~pbPlay_5.stop; //미들


// 모두 정지!
20.do{|i| ~pm4Syn[i].stop;};~pbPlay_4.stop;~pbPlay_5.stop;




//--------------나경화의저서...----------------
~masterEQ.gui.onSelect('x_flat');n = Synth(\na, [\amp, 0.75]); //na - 민씨가 맥심 받았을 때