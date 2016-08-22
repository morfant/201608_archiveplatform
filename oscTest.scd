//Sound Check
{SinOsc.ar(300, mul: 0.2)!2}.play;
{BrownNoise.ar(0.1)!2}.play;
{WhiteNoise.ar(0.1)!2}.play;




//OSC Check
o.free;o = OSCFunc({|msg, time, addr, recvPort| msg.postln;}, '/3/xy');
o.free;

NetAddr.langPort;

//ip 주소를 맞췄는데도 osc가 오지 않을때는 touch osc 앱을 종료시켰다 다시 실행한다.
OSCFunc.trace(true); // Turn posting on
OSCFunc.trace(false); // Turn posting off





