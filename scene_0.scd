//----------------Ment----------------
//멘트씬
~masterEQ.gui.onSelect('x_flat');
~masterEQ.gui.onSelect('x_flat');m = Synth(\mentbr, [\amp, 0.8]); //ment : 원 두개 애니메이션 끝나면 튼다.


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

//특정 키를 누르면 진주 떨어지는 소리 나도록 셋팅 할 것

//볼레로
e = Synth(\bolero, [\amp, 2]); //bolero
e.free;

// a = Synth(\dd, [\atTime, 20, \amp, 1.4]); //text 읽을 때

//텍스트 읽을 때 - new 버전 : 짥은 페이드인?
~masterEQ.gui.onSelect('text');
a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 370, \nf, 3]); //정아
a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 370, \nf, 4]); //민하
a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 370, \nf, 5]); //민 : 수치심이 따라다닌다
a.release(0.1);a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 370, \nf, 7]); //민하 : 마지막 - "확인된다"로 끝난다.
a.release(0.3);

//볼레로
e = Synth(\bolero, [\amp, 2]); //bolero
e.free; //볼레로 정지

a.release(0.3);
