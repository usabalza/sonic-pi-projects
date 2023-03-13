# Welcome to Sonic Pi
use_bpm 200

use_transpose -2
define :battery do |a, b|
  1.times do
    3.times { a.call }
    1.times { b.call }
  end
end
define :bass do |a1, a, b1, b, c1, c, d1, d2, d, e, e1, f|
  sleep 2.5
  1.times do
    1.times { d1.call }
    2.times { c.call }
    2.times { c1.call }
    2.times { b.call }
    2.times { b1.call }
    2.times { a.call }
    1.times { a1.call }
    1.times { b1.call }
    2.times { b.call }
    1.times { d1.call }
  end
  1.times do
    1.times { d1.call }
    2.times { c.call }
    2.times { c1.call }
    2.times { f.call }
    2.times { e1.call }
    2.times { a.call }
    1.times { a1.call }
    1.times { b1.call }
    2.times { b.call }
    1.times { d1.call }
  end
  1.times do
    1.times { d1.call }
    2.times { c.call }
    2.times { c1.call }
    2.times { b.call }
    2.times { b1.call }
    2.times { a.call }
    1.times { a1.call }
    1.times { b1.call }
    2.times { b.call }
    1.times { d1.call }
  end
  1.times do
    1.times { d2.call }
    1.times { d.call }
    1.times { e.call }
    1.times { d1.call }
    1.times { c1.call }
    1.times { c.call }
    1.times { b1.call }
    1.times { b.call }
    2.times { a.call }
    3.times { a1.call }
    sleep 3
  end
end

define :bg do
  sleep 2.5
  1.times do
    use_synth :dark_ambience
    play :f5, release: 8, amp: 4
    sleep 4
    play :g5, release: 8, amp: 4
    sleep 4
    play :a5, release: 8, amp: 4
    sleep 4
    play :g5, release: 8, amp: 4
    sleep 4
    play :f5, release: 8, amp: 4
    sleep 4
    play :gs5, release: 8, amp: 4
    sleep 4
    play :a5, release: 8, amp: 4
    sleep 4
    play :g5, release: 8, amp: 4
    sleep 4
    play :f5, release: 8, amp: 4
    sleep 4
    play :g5, release: 8, amp: 4
    sleep 4
    play :a5, release: 8, amp: 4
    sleep 4
    play :g5, release: 8, amp: 4
    sleep 4
    play :f5, release: 8, amp: 4
    sleep 4
    play :g5, release: 8, amp: 4
    sleep 4
    play :a5, release: 8, amp: 4
    sleep 8
  end
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  sleep 2.5
  pattern_a = -> {
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6, :a6, :a, :a6, :a], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 0.5])
  }
  pattern_b = -> {
    play_pattern_timed([:a, :a6, nil, :a, :a, :a6, nil, :a, :a, :a6, nil, :a, nil, :a8, nil, :a8], [0.5])
  }
  sleep 1.5
  battery(pattern_a, pattern_b)
end

define :noise do
  4.times do
    use_synth :noise
    use_synth_defaults release: 0.2
    7.times do
      play_pattern_timed([nil, nil, nil, :a2], [0.5])
    end
    play_pattern_timed([nil, nil, :a2, :a2], [0.5])
    
  end
end

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  
  section_a1 = -> {
    play :a3, release: 2
    sleep 1
  }
  section_a = -> {
    play_pattern_timed([:a3, :a3, :a3, nil], [0.25])
  }
  section_b1 = -> {
    play :g3, release: 2
    sleep 1
  }
  section_b = -> {
    play_pattern_timed([:g3, :g3, :g3, nil], [0.25])
  }
  section_c1 = -> {
    play :f3, release: 2
    sleep 1
  }
  section_c = -> {
    play_pattern_timed([:f3, :f3, :f3, nil], [0.25])
  }
  section_d1 = -> {
    play :e3, release: 2
    sleep 1
  }
  section_d2 = -> {
    play :d3, release: 2
    sleep 1
  }
  section_d = -> {
    play_pattern_timed([:d3, :d3, :d3, nil], [0.25])
  }
  section_e = -> {
    play_pattern_timed([:e3, :e3, :e3, nil], [0.25])
  }
  section_e1 = -> {
    play :gs3, release: 2
    sleep 1
  }
  section_f = -> {
    play_pattern_timed([:gs3, :gs3, :gs3, nil], [0.25])
  }
  
  
  bass(section_a1, section_a, section_b1, section_b, section_c1, section_c, section_d1, section_d2, section_d, section_e, section_e1, section_f)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.8, mod_rate: 5, amp: 2
  play_pattern_timed([:e5, :f5, :g5, :a5, nil, :g5, nil, nil, :f5, nil, :e5, nil, :d5, :c5, nil, nil, :d5, nil, :e5, nil, :d5, nil, :f5, nil, :g5, :e5, nil, nil, nil, nil, nil, nil], [0.5])
  play_pattern_timed([:e5, :f5, :g5, :a5, nil, :g5, nil, nil, :f5, nil, :e5, nil, :d5, :b5, nil, nil, :f5, nil, :e5, nil, :f5, nil, :e5, nil, :d5, :c5, nil, nil, nil, nil, nil], [0.5])
  play_pattern_timed([:f5, :e5, :d5, :c5, :g4, nil, :g4, nil, :a4, :a4, nil, :a4, nil, :g4, nil, :g4, nil, :a4, :a4, nil, :a4, nil, :a4, nil, :b4, :b4, nil, :b4, nil, :d5, nil, :f5, :e5, :d5, :c5, nil], [0.5])
  play_pattern_timed([:e5, :f5, :g5, nil, :e5, :f5, :g5, nil, :e5, :f5, :g5, nil, :d5, nil, :g5, nil, :f5, nil], [0.5])
  play :e5, release: 4
end

in_thread do
  sleep 2.5
  noise
end

in_thread do
  bg
end
