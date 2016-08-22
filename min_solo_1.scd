
~pm5.play;


// e = ~pm8.play;f = ~pm9.play; // 사운드만 탁탁하게 바꿔서 의자씬? 더 간헐적으로 나와야 한다.
//옥타브 아래 소리!!!
e = ~pm7.play;
f = ~pm1.play;
e.stop;f.stop;


// 민씨 솔로 전에 민하씨 마이크 들고 얘기 할 때
f = ~pm1.play;
g = ~pm3.play;
// f = ~pm7.play;g = ~pm1.play;
f.stop;g.stop;
g.stop;



f.stop;g.stop;


a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 60, \nf, 5]); // 정아씨 텍스트 : '구름'으로 끝 = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 40, \nf, 7]); // 마지막 민하씨 읽을 때는 nf를 7-9정도로 높인다.
a = Synth(\dds, [\freq, 1, \amp, 0.7, \filfreq, 300, \susTime, 60, \nf, 7]); // 민희, 정아씨 바나나 텍스트 : 민씨 동작으로 끝을 봄
a.release(0.1);


//TV
d = Synth(\bass, [\freqs, #[920, 870, 880, 760], \amp, 6, \envdur, 2.5]);~pb2_2.play; //tv 손모양에 맞추어서



//-------여기-------

~masterEQ.gui.onSelect('text');c = Synth(\dds, [\freq, 700, \amp, 1.0, \filfreq, 300, \susTime, 50, \nf, 9]); // 민씨 바구니 버리고 센터로 나오면

d = Synth(\bass, [\freqs, #[920, 870, 880, 760], \amp, 7, \envdur, 2.5]);~pb2_2.play; //tv 손모양에 맞추어서 TV

c.release(1.1);
c.release(0.1);


//--------------niga 니가 그랬잖아...----------------
~masterEQ.gui.onSelect('x_flat');u = Synth(\niga, [\amp, 0.3]);  //민하씨 혼자 춤 추다가 양팔을 상하 대각선으로 펼치는 동작이 다 끝나면
