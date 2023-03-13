# Welcome to Sonic Pi
use_debug false # help RPi performance
use_bpm 120
use_synth :pulse
use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
define :melody1 do |i|
  loop do
    1.times { i.call }
  end
end

define :melody2 do |i|
  1.times { i.call }
end

in_thread do
  intro = -> {
    play_pattern_timed([:g4, nil, :f5, nil, nil, nil, :d5, :e5, :f5, nil, :e5, nil, :d5, nil, :c5, nil, nil, :b4, nil, nil, :a4, nil, nil, :g4, nil, nil],
                       [0.25])
    play_pattern_timed([:g5, nil, nil, nil, :e5, :f5, :g5, nil, :a5, nil, :bb5, nil, :a5, nil, nil, :g5, nil, nil, :f5, nil, nil, :e5, nil, nil],
                       [0.25])
    play_pattern_timed([:d5, :e5, nil, :f5, nil, nil, :e5, :f5, nil, :g5, nil, nil, :f5, :g5, nil, :a5, nil, nil, :g5, :a5, :b5, :c6, :cb6, :d6], [0.25])
    play :e6, release: 2
    sleep 3
    play :d6, release: 2
    sleep 2
    play_pattern_timed([:e4, :g4, nil, :f4, :g4, :f4, :d4, :e4, nil, :d4, :f4, :e4, :d4, :c4, nil, :b3, :c4, :e4, :f4], [1])
    play :e4, release: 2
    sleep 3
    play :d4, release: 2
    sleep 2
    play_pattern_timed([:e4, :g4, nil, :f4, :g4, :c5, :d4, :e4, nil, :d4, :f4, :e4, :d4, :c4, nil, :c4, :d4, :c4, :a4], [1])
    play :e4, release: 2
    sleep 3
    play :d4, release: 2
    sleep 2.5
  }
  melody1(intro)
end

in_thread do
  use_synth :tri
  use_synth_defaults attack: 0, sustain: 0.1, decay: 0.1, release: 1, amp: 0.4
  intro = -> {
    play_pattern_timed([nil, :d4, nil, nil, nil, nil, nil, :g4, nil, nil, :f4, nil, nil, :e4, nil, nil, nil, nil, nil, :db4, nil, nil, nil, nil, nil], [0.5])
    play_pattern_timed([:d4, nil, nil, :e4, nil, nil, :f4, nil, nil, :fs4, nil, nil, :g4, nil, nil, nil, nil, nil, nil, nil], [0.5])
  }
  melody2(intro)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  intro = -> {
    play_pattern_timed([nil, :f4, :a4, :c5, :f5, :c5, :a4, :g4, :b4, :d5, :g5, :d5, :b4], [0.5])
    play_pattern_timed([:e4, :g4, :b4, :d5, :b4, :g4, :cs4, :e4, :g4, :as4, :g4, :e4], [0.5])
    play_pattern_timed([:d4, :f4, :a4, :e4, :g4, :b4, :f4, :a4, :c5, :fs4, :a4, :c5, :g4, :b4, :d5, :g4, :b4, :d5, :g4, :b4, :d5, :g4, :b4, :d5], [0.5])
    play_pattern_timed([:c4, :e4, :g4, :c5, :g4, :e4, :c4, :e4, :g4, :c5, :g4, :e4], [0.5])
    play_pattern_timed([:c4, :e4, :g4, :c5, :g4, :e4, :c4, :e4, :g4, :c5, :g4, :e4], [0.5])
    play_pattern_timed([:f3, :a3, :c4, :f4, :c4, :a3, :f3, :a3, :c4, :f4, :c4, :a3], [0.5])
    play_pattern_timed([:g3, :b3, :d4, :g4, :d4, :b3, :g3, :b3, :d4, :g4, :d4, :b3], [0.5])
    play_pattern_timed([:c4, :e4, :g4, :c5, :g4, :e4, :c4, :e4, :g4, :c5, :g4, :e4], [0.5])
    play_pattern_timed([:c4, :e4, :g4, :c5, :g4, :e4, :c4, :e4, :g4, :c5, :g4, :e4], [0.5])
    play_pattern_timed([:f3, :a3, :c4, :f4, :c4, :a3, :f3, :a3, :c4, :f4, :c4, :a3], [0.5])
    play_pattern_timed([:g3, :b3, :d4, :g4, :d4, :b3, :g3, :b3, :d4, :g4, :d4, :b3], [0.5])
  }
  melody1(intro)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  define :drum do
    play :a
    sleep 1
    play :a
    sleep 0.5
    play :a6
    sleep 1
    play :a
    sleep 0.5
    play :a
    sleep 1
    play :a
    sleep 0.5
    play_pattern_timed([:a6, :a6, :a6, :a, :a, :a], [0.25])
  end
  
  with_fx :level, amp: 0.5 do
    sleep 0.5
    loop do
      2.times { drum }
    end
  end
end

in_thread do
  use_synth :noise
  use_synth_defaults release: 0.2
  sleep 2
  loop do
    play :a2
    sleep 3
  end
end