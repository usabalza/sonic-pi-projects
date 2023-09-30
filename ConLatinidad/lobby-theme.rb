use_bpm 180
live_loop :safari do
  sample :loop_safari, amp: 3, rate: 0.75
  sleep 32
end

live_loop :clave do
  3.times do
    sample :tabla_na_s, rate: 2
    sleep 1.5
  end
  sleep 0.5
  2.times do
    sample :tabla_na_s, rate: 2
    sleep 1
  end
  sleep 1
end

live_loop :left_hand do
  salsa_piano(0)
  salsa_piano(2)
  salsa_piano_alt(2)
  salsa_piano(0)
end

live_loop :right_hand do
  use_synth :piano
  salsa_intro
  2.times do
    play_pattern_timed([:e4, :a4, :b4, :c5, :d5, :c5, :b4, :a4], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 2])
  end
  play_pattern_timed([:d5, :e5, :b4, :d5, :c5, :d5, :c5, :b4], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1.5])
  play_pattern_timed([:d5, :c5, :d5, :c5, :b4, :a4, :gs4, :a4, :b4, :d5], [0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 2])
  play_pattern_timed([:c5, :c5, :b4, :b4, :a4, :a4, :gs4, :gs4, :a4, :b4], [0.5, 1, 0.5, 1, 0.5, 1, 0.5, 1, 1, 1])
  salsa_intro
  2.times do
    play_pattern_timed([:e5, :d5, :e5, :d5, :c5, :c5], [0.5, 0.5, 0.5, 1, 1, 0.5])
  end
  2.times do
    play_pattern_timed([:f5, :e5, :f5, :e5, :d5, :d5], [0.5, 0.5, 0.5, 1, 1, 0.5])
  end
  play_pattern_timed([:f5, :e5, :d5, :e5, :d5, :c5, :d5, :e5, :f5, :g5, :a5, :g5, :a5, :b5, :c6], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 1])
  play_pattern_timed([:d6, :c6, :b5, :a5, :gs5, :a5, :b5, :c6], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5])
  salsa_intro
  play_pattern_timed([:a4, :b4, :c5, :b4, :a4, :c5, :d5, :e5, :d5, :c5, :b4, :g4], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 0.5])
  play_pattern_timed([:d5, :e5, :f5, :g5, :f5, :e5, :g5, :f5, :e5, :g5, :f5, :e5, :d5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 2])
  play_pattern_timed([:g5, :a5, :b5, :a5, :g5, :f5, :e5, :d5, :e5, :f5, :a5, :c6], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5])
  play_pattern_timed([:a5, :gs5, :a5, :b5, :c6, :b5, :b5, :b5], [1, 1, 1, 1, 1, 1, 0.5, 1])
end

define :salsa_intro do
  use_synth :piano
  2.times do
    play_pattern_timed([:a5, :c6, :e6, :a6], [0.5, 0.5, 0.5, 1])
  end
  sleep 3
  2.times do
    play_pattern_timed([:g5, :b5, :d6, :g6], [0.5, 0.5, 0.5, 1])
  end
  sleep 3
  play_pattern_timed([:c6, :c6, :b5, :c6, :g5, :c6, :d6, :e6, :d6, :c6, :b5], [0.5, 0.5, 0.5, 1, 1, 1, 1, 1, 0.5, 0.5, 0.5])
  play_pattern_timed([:c6, :b5, :a5, :b5, :a5, :g5, :a5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
  sleep 3
end


define :salsa_piano do |t|
  use_synth :piano
  
  use_transpose t
  play :a3, release: 2
  sleep 1
  play :a3, release: 2
  play :c4, release: 2
  sleep 0.5
  play :g3, release: 2
  sleep 1
  play :g3, release: 2
  play :c4, release: 2
  sleep 1
  play :fs3, release: 2
  sleep 1
  play :fs3, release: 2
  play :c4, release: 2
  sleep 1
  play :f3
  sleep 0.5
  play :f3
  sleep 1
  play :g3
  sleep 0.5
  play :gs3
  sleep 0.5
end

define :salsa_piano_alt do |t|
  use_synth :piano
  use_transpose t
  play :a3, release: 2
  play :c4, release: 2
  sleep 1
  play :e3
  sleep 0.5
  play :a3, release: 2
  play :c4, release: 2
  sleep 0.5
  play :g3
  sleep 0.5
  play :g3
  sleep 1
  play :fs3
  sleep 1
  play :fs3
  sleep 1
  play :f3
  sleep 1
  play :fs3
  sleep 0.5
  play :g3
  sleep 0.5
  play :gs3
  sleep 0.5
end

in_thread do
  use_synth :hollow
  use_synth_defaults amp: 4
  3.times do
    play :a4, release: 8
    sleep 8
    play :g4, release: 8
    sleep 8
    play :g4, release: 8
    sleep 8
    play :fs4, release: 8
    sleep 8
    sleep 32
  end
end
