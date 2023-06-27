# Welcome to Sonic Pi
use_bpm 250
in_thread do
  intro = -> {
    use_synth :piano
    complete_intro
    sleep 5.5
    2.times do
      2.times do
        2.times do
          piano_chord(:a3, :c4, :e4)
        end
        sleep 13
      end
      2.times do
        piano_chord(:f3, :a3, :c4)
      end
      sleep 5
      2.times do
        piano_chord(:g3, :b3, :d4)
      end
      sleep 5
      2.times do
        piano_chord(:a3, :c4, :e4)
      end
      sleep 13
    end
  }
  salsa_intro(intro)
end

in_thread do
  chorus
end

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  intro_bass = -> {
    bass_intro1(:f2)
    bass_intro1(:g2)
    bass_intro1(:e2)
    play_pattern_timed([:a2, :a2, :a2, :a2, :g2, :g2, :g2, :e2, :e2], [1, 1, 0.5, 1, 1, 0.5, 1, 1, 1])
    bass_intro1(:f2)
    bass_intro1(:g2)
    bass_intro2(:d2, :e2)
    play_pattern_timed([:a2, :a2, :g2, :g2], [1, 1, 0.5, 1])
    play :f2, release: 5
  }
  main_bass = -> {
    4.times do
      bass_intro1(:a2)
    end
    bass_intro1(:f2)
    bass_intro1(:g2)
    2.times do
      bass_intro1(:a2)
    end
  }
  bridge_bass = -> {
    bass_intro1(:f2)
    bass_intro1(:g2)
    bass_intro1(:a2)
    bass_intro2(:g2, :e2)
    bass_intro1(:f2)
    bass_intro1(:g2)
    bass_intro1(:a2)
    play_pattern_timed([:gs2, :gs2, :gs2, :gs2, :gs2], [1, 1, 0.5, 1, 1])
  }
  final_bass = -> {
    bass_intro1(:g2)
    bass_intro1(:a2)
    bass_intro1(:fs2)
    bass_intro1(:g2)
    bass_intro1(:e2)
    bass_intro1(:fs2)
    bass_intro1(:b2)
    bass_intro2(:a2, :fs2)
    
    bass_intro1(:g2)
    bass_intro1(:a2)
    bass_intro2(:fs2, :as2)
    bass_intro2(:b2, :a2)
    bass_intro2(:e2, :fs2)
    bass_intro2(:g2, :a2)
    
    2.times do
      bass_intro1(:b2)
      bass_intro1(:a2)
      bass_intro1(:gs2)
      bass_intro2(:g2, :a2)
    end
    bass_intro1(:f2)
    bass_intro1(:g2)
  }
  salsa_bass(intro_bass, main_bass, bridge_bass, final_bass)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  battery1 = -> {
    play_pattern_timed([:a, :a, :a6, :a, :a, :a, :a, :a6, :a, :a], [1, 1, 0.5, 1, 1, 0.5, 1, 0.5, 1, 0.5, 1])
  }
  
  battery2 = -> {
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6], [0.5, 1, 0.5, 1, 0.5, 5])
  }
  salsa_drums(battery1, battery2)
end

in_thread do
  use_synth :noise
  use_synth_defaults release: 0.2
  noise1 = -> {
    7.times do
      play_pattern_timed([nil, nil, nil, nil, :a2, nil, nil, nil], [0.5])
    end
    play_pattern_timed([nil, :a2, nil, nil, :a2, nil, :a2, nil], [0.5])
  }
  
  noise2 = -> {
    6.times do
      play_pattern_timed([nil, nil, nil, nil, :a2, nil, nil, nil], [0.5])
    end
    play_pattern_timed([nil, nil, :a2, nil, nil, :a2, nil, :a2], [0.5])
  }
  
  noise3 = -> {
    play_pattern_timed([nil, nil, nil, nil, :a2, nil, nil, nil], [0.5])
    play_pattern_timed([nil, :a2, nil, nil, :a2, nil, :a2, nil], [0.5])
  }
  
  salsa_noise(noise1, noise2, noise3)
end

in_thread do
  use_synth :pulse
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  melody1 = -> {
    play :a4, release: 5
    sleep 3
    play_pattern_timed([:e4, :a4, :b4, :c5, :d5, :c5, :b4, :g4, :c5], [1, 1, 1, 1, 1, 2, 1, 3, 2])
    play :b4, release: 5
    sleep 3
    play :c5, release: 5
    sleep 3
    play :a4, release: 5
    sleep 9
    
    play_pattern_timed([:a4, :g4, :f4, :a4, :c5, :f4, :a4, :c5, :g4, :b4, :d5, :g4, :b4, :d5], [0.5, 0.5, 1.5, 1.5, 2, 1, 1, 1, 1.5, 1.5, 2, 1, 1, 1])
    play :e5, release: 5
    sleep 8
    
    use_synth :fm
    the_licc
    use_synth :pulse
    use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
    
    play :a4, release: 5
    sleep 3
    play_pattern_timed([:e4, :a4, :b4, :c5, :d5, :c5, :b4, :g4, :c5], [1, 1, 1, 1, 1, 2, 1, 3, 2])
    play :b4, release: 5
    sleep 3
    play :c5, release: 5
    sleep 3
    play :a4, release: 5
    sleep 2
    harmony
    play :c5, release: 5
    play_pattern_timed([:f4, :a4, :c5, :f4, :a4, :c5, :f4, :a4, :c5], [1, 1, 1, 0.5, 1, 1, 0.5, 1, 1])
    play :d5, release: 5
    play_pattern_timed([:g4, :b4, :d5, :g4, :b4, :d5, :g4, :b4, :d5], [1, 1, 1, 0.5, 1, 1, 0.5, 1, 1])
    play :e5, release: 5
    play_pattern_timed([:e5, :d5, :c5, :d5, :c5, :b4, :g4, :g4, :c5, :b4, :a4, :c6, :b5, :a5], [0.5, 1, 1.5, 0.5, 1, 1.5, 1, 1, 0.5, 1, 1.5, 0.5, 1, 1])
    sleep 2.5
    play_pattern_timed([:f4, :g4, :a4, :f4, :g4, :a4], [1.5, 1.5, 1.5, 1.5, 1, 1])
    play_pattern_timed([:g4, :a4, :b4, :g4, :c5, :b4, :c5, :d5], [1.5, 1.5, 1.5, 1.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:e5, :d5, :c5, :d5, :c5, :b4, :gs4, :a4, :b4, :d5, :c5, :b4, :a4], [1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1])
    play_pattern_timed([:b4, :c5, :c5, :a4, :d5, :c5, :b4, :g4, :g5, :f5, :e5, :e5], [1.5, 1, 1, 1, 1, 1.5, 2, 2, 1, 1, 1, 1])
    play :e5, release: 5
    sleep 8
    play_pattern_timed([:f5, :f5, :f5, :f5, :f5, :e5], [0.5, 1, 0.5, 1, 0.5, 1])
    sleep 2
    play_pattern_timed([:fs5, :g5, :a5, :d5, :cs5, :d5, :fs5], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:e5, :fs5, :g5, :a5, :d5, :cs5, :d5, :fs5], [1, 1, 1, 1, 1, 1, 0.5, 2.5])
    play_pattern_timed([:fs5, :g5, :a5, :b5, :a5, :b5, :a5], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:g5, :fs5, :e5, :d5, :e5, :fs5, :g5, :fs5], [1, 1, 1, 1, 1, 1, 0.5, 2.5])
    play_pattern_timed([:d5, :cs5, :b4, :cs5, :d5, :b4, :cs5, :d5, :b4, :cs5, :d5], [1, 1, 1, 1, 1, 0.5, 1, 1, 0.5, 1, 1])
    play_pattern_timed([:cs5, :d5, :e5, :cs5, :d5, :e5, :cs5, :d5, :e5,], [1, 1, 1, 0.5, 1, 1, 0.5, 1, 1])
    play_pattern_timed([:fs5, :e5, :d5, :cs5, :b4, :cs5, :d5, :e5, :fs5, :d5, :fs5, :g5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1])
    play_pattern_timed([:a5, :g5, :fs5, :g5], [1.5, 1, 1, 0.5])
    play :fs5, release: 4
    sleep 1.5
    play_pattern_timed([:b4, :cs5, :d5, :e5, :fs5, :g5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:a5, :d5, :cs5, :d5, :fs5], [1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:e5, :fs5, :g5, :a5, :d5, :cs5, :d5, :fs5], [1, 1, 1, 1, 1, 1, 0.5, 2.5])
    play_pattern_timed([:fs5, :g5, :a5, :fs5, :e5, :fs5, :as5], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:fs5, :e5, :fs5, :e5, :d5, :cs5, :d5, :d5, :cs5, :b4, :a4], [1, 1, 1, 1, 1, 1, 0.5, 1.5, 1, 1, 1])
    play_pattern_timed([:cs5, :d5, :a4, :a4, :cs5, :d5, :a4, :a4], [1, 1, 1, 0.5, 1.5, 1, 1, 1, 1])
    play_pattern_timed([:cs5, :d5, :cs5, :d5, :e5, :d5, :cs5, :a4], [1, 1, 1, 1, 1, 1, 0.5, 1.5])
    play :b4, release: 5
    sleep 14
    harmony_finale(:d5, :cs5, :b4, :a4)
    sleep 30
    harmony_finale(:d5, :cs5, :b4, :a4)
  }
  main_melody(melody1)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  counter1 = -> {
    sleep 64
    play :c4, release: 5
    sleep 3
    play_pattern_timed([:g3, :c4, :d4, :e4, :f4, :e4, :d4, :b3, :e4], [1, 1, 1, 1, 1, 2, 1, 3, 2])
    play :d4, release: 5
    sleep 3
    play :e4, release: 5
    sleep 3
    play :c4, release: 5
    sleep 10
    counter_melody1(:a3)
    counter_melody1(:b3)
    3.times do
      counter_melody1(:c4)
    end
    counter_melody1(:d4)
    play_pattern_timed([:g4, :f4, :e4, :f4, :e4, :d4, :b3, :c4, :d4, :f4, :e4, :d4], [1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1])
    counter_melody1(:c4)
    counter_melody1(:b3)
    play :c4, release: 5
    sleep 8
    play_pattern_timed([:a3, :a3, :a3, :a3, :a3, :gs3], [0.5, 1, 0.5, 1, 0.5, 1])
    sleep 2
    play_pattern_timed([:d4, :e4, :fs4, :b3, :a3, :b3, :fs4], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:cs4, :d4, :e4, :fs4, :b3, :a3, :b3, :fs4], [1, 1, 1, 1, 1, 1, 0.5, 2.5])
    play_pattern_timed([:d4, :e4, :fs4, :g4, :fs4, :g4, :fs4], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:e4, :d4, :cs4, :b3, :cs4, :d4, :e4, :d4], [1, 1, 1, 1, 1, 1, 0.5, 4.5])
    counter_melody1(:g4)
    counter_melody1(:a4)
    play_pattern_timed([:b4, :b4, :b4, :b4, :b4, :b4], [1.5, 1.5, 1.5, 1.5, 1, 0.5])
    play_pattern_timed([:fs4, :e4, :d4, :e4], [1.5, 1, 1, 0.5])
    play :d4, release: 4
    sleep 2.5
    play_pattern_timed([:d4, :e4, :fs4, :b3, :a3, :b3, :fs4], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:cs4, :d4, :e4, :fs4, :b3, :a3, :b3, :fs4], [1, 1, 1, 1, 1, 1, 0.5, 2.5])
    play_pattern_timed([:d4, :e4, :fs4, :g4, :fs4, :g4, :fs4], [1, 1, 1, 1, 1, 0.5, 1.5])
    play_pattern_timed([:e4, :d4, :cs4, :b3, :cs4, :d4, :e4, :fs4, :e4, :d4, :cs4], [1, 1, 1, 1, 1, 1, 0.5, 1.5, 1, 1, 1])
    play_pattern_timed([:e4, :e4, :e4, :fs4, :fs4, :fs4, :g4, :g4, :g4, :e4, :e4, :e4], [1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1, 1.5, 1.5, 1])
    play :fs4, release: 5
    sleep 46
    harmony_finale(:fs5, :e5, :d5, :cs5)
  }
  counter_melody(counter1)
end
