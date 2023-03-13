# Welcome to Sonic Pi
use_bpm 150
use_debug false

define :bass do |i|
  1.times { i.call }
end

define :battery do |i,a,b|
  4.times { i.call }
  2.times { a.call }
  1.times { b.call }
end

define :melody do |i|
  1.times { i.call }
end


in_thread do
  use_synth :tri
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  intro = -> {
    play_pattern_timed([:a2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2, :b2],
                       [0.25])
    play_pattern_timed([:g2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2, :a2],
                       [0.25])
    play_pattern_timed([:f2, :g2, :g2, :g2, :g2, :g2, :g2, :g2, :g2, :a2, :a2, :a2, :a2, :a2, :a2, :a2],
                       [0.25])
    play_pattern_timed([:b2, :a2, :g2, :a2, :g2, :f2, :g2], [0.25])
    play :g2, release: 5
  }
  bass(intro)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  intro = -> {
    play_pattern_timed([:a, nil, :a6, nil, :a, :a, :a6, nil], [0.25])
  }
  x = -> { play :a, sustain: 0.1; sleep 0.75 }
  section_a = -> {
    play_pattern_timed([:a, :a, nil, x, nil], [0.25])
  }
  section_b = -> {
    play_pattern_timed([:a, :a, nil, :a, :a, nil, :a, :a6], [0.25])
  }
  
  battery(intro, section_a, section_b)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  intro = -> {
    play :b4, release: 2
    sleep 1.5
    play_pattern_timed([:fs4, :g4, :b4, nil, nil, :cs5, nil, :e5, nil, :fs5, nil, nil, :e5, nil, nil, :d5, nil, nil, :cs5, nil, :d5, :cs5, :d5, nil, :a4, nil], [0.25])
    play_pattern_timed([:b4, nil, nil, :d5, nil, :b4, nil, :c5, :cs5, nil, nil, :e5, nil, :cs5, :d5, :e5, :g5, :fs5, nil, :es5, nil, :f5], [0.25])
    play :fs5, release: 3
  }
  melody(intro)
  
end