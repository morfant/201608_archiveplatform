

//----------------Scene 1: 관객들의 연습 소리 녹----------------


//--------------- RECORD -------------------

//반드시 외부 마이크 혹은 이어폰을 사용할 것.
//아래 코드를 한 번 실행 한 후, 정지하고 다시 한 번 실행한다. - 녹음이 되는지 확인 할 것.


~recPath = "/Users/giy/Desktop/2016_08_ap/audiencesSound.aiff";

(
var curTime = 0;
var time = 120;


~mic = Synth(\micIn, [\amp, 1.0]);

s.prepareForRecord(~recPath);
s.record;


SystemClock.sched(0.0,{ arg time;
	curTime = time;
	("curTime: " + curTime).postln;
	});


SystemClock.sched(
		120, {|time|
		// time.postln;
		"MicIn stop.".postln;
		s.stopRecording;
		~mic.free;
	}
);



SystemClock.sched(0.0,{ arg time;
	(120 - (time - curTime)).postln;
	// time.postln;
	1;
	});

CmdPeriod.doOnce{ s.stopRecording; ~mic.free;};
)

~mic.free;



//--------------- 관객 인터뷰 중간중간 멜로디 -------------------


a = Synth(\tak, [\freq, 28.midicps, \filfreq, 100, \amp, 15])
a = Synth(\tak, [\freq, 28.midicps, \filfreq, 100, \amp, 15])
a = Synth(\tak, [\freq, 28.midicps, \filfreq, 100, \amp, 15])
a = Synth(\tak, [\freq, 40.midicps, \filfreq, 300, \amp, 15])

a = Synth(\tak, [\freq, 41.midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, 45.midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, 41.midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, 40.midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, 36.midicps, \filfreq, 300, \amp, 15])

a = Synth(\tak, [\freq, (41-5).midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, (45-5).midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, (41-5).midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, (40-5).midicps, \filfreq, 300, \amp, 15])
a = Synth(\tak, [\freq, (36-5).midicps, \filfreq, 300, \amp, 15])

//2분 다 되어가면 기회 봐서 cmd + .




//--------------- 민씨 솔로 첫번째는 음악 없음, 텍스트 읽는 것에 맞추어 튼다-------------------

a = Synth(\dd, [\atTime, 20, \amp, 1.4]); //text 읽을 때

b = Synth(\dd, [\atTime, 0.1, \amp, 4.2]); //진주 떨어 뜨릴 때
b = Synth(\dd, [\atTime, 0.25, \amp, 4.2]); //진주 떨어 뜨릴 때 - 더 큰 소리

d = Synth(\bass, [\freqs, #[920, 870, 880, 760], \amp, 6, \envdur, 2.5]);~pb2_2.play; //tv 손모양에 맞추어서

