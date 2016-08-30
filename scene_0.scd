//mic test
m = Synth(\micin, [\amp, 1.0]);
m.free;


// Recording 시작!!

//----------------Ment----------------
//멘트씬
~masterEQ.gui.onSelect('normal');
~masterEQ.gui.onSelect('normal');m = Synth(\mentbr, [\amp, 0.5]); //ment : 설명 영상 끝나면 튼다. 멘트 틀면 불 들어온다.
m.free;

(
var win, but;
win = Window.new("tingting", Rect(0, 0, 150, 150));

but = Button(win, Rect(20, 20, 100, 100))
        .states_([
                ["sound", Color.black, Color.green]
        ])
        .action_({ |butt|
    var c = 2.rand;
    if (c == 0, {
        b = Synth(\dd, [\atTime, 0.1, \amp, 6.7]); //진주 떨어 뜨릴 때
    }, {
        b = Synth(\dd, [\atTime, 0.2, \amp, 6.2]); //진주 떨어 뜨릴 때 - 더 큰 소리
    });
        });
win.front;
)


//----------------Scene 0----------------
b = Synth(\dd, [\atTime, 0.1, \amp, 6.7]); //진주 떨어 뜨릴 때
b = Synth(\dd, [\atTime, 0.2, \amp, 6.2]); //진주 떨어 뜨릴 때 - 더 큰 소리


//볼레로
e = Synth(\boleroFadeIn, [\amp, 1]); //bolero - 페이드 인으로 할것


//----------------!!!이걸로 정지한다. 모두 정지!!!----------------
e.free;b.free;


//텍스트 읽을 때 - new 버전 : 짥은 페이드인?
// 마이크 on 과 동시에 음량 조절 / 음량조절 and off.

~masterEQ.gui.onSelect('normal');
m.free;m = Synth(\micin, [\amp,  0.4]);a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.4, \filfreq, 300, \susTime, 370, \nf, 3]);
 //정아 : 할것이다
m.free;m = Synth(\micin, [\amp, 0.4]);a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.4, \filfreq, 300, \susTime, 370, \nf, 4]);
 //민하 : 그런 용무를 위해서는 ...
m.free;m = Synth(\micin, [\amp, 0.2]);a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.4, \filfreq, 300, \susTime, 370, \nf, 5]);
 //민 : 수치심이 따라다닌다
m.free;m = Synth(\micin, [\amp, 0.4]);a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.4, \filfreq, 300, \susTime, 370, \nf, 7]);
 //민하 : 마지막 - "확인된다"로 끝난다.

a.release(0.3);m.free;

//두번째 볼레로 - 좀 작은 소리
e = Synth(\bolero, [\amp, 0.6]); //bolero
e.free; //볼레로 정지
