# Welcome to Sonic Pi

use_bpm 180

define :bass do |a1, a, b1, b, c1, c, d1, d2, d, e, e1|
  loop do
    2.times do
      1.times { a1.call }
      6.times { a.call }
      1.times { a1.call }
      1.times { b1.call }
      6.times { b.call }
      1.times { b1.call }
      1.times { c1.call }
      6.times { c.call }
      1.times { d1.call }
      1.times { d2.call }
      1.times { d.call }
      1.times { e.call }
      1.times { d1.call }
      1.times { c1.call }
      1.times { c.call }
      1.times { b1.call }
      1.times { e1.call }
    end
    3.times do
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
end

define :battery do |a, b|
  loop do
    3.times { a.call }
    1.times { b.call }
  end
end

define :melody do |a, b, c|
  loop do
    1.times { a.call }
    1.times { b.call }
    1.times { c.call }
  end
end

define :noise do
  loop do
    use_synth :noise
    use_synth_defaults release: 0.2
    7.times do
      play_pattern_timed([nil, nil, nil, :a2], [0.5])
    end
    play_pattern_timed([nil, nil, :a2, :a2], [0.5])
    
  end
end

define :bg do
  loop do
    use_synth :hollow
    play :a5, release: 8, amp: 4
    sleep 8
    play :g5, release: 8, amp: 4
    sleep 8
    play :f5, release: 8, amp: 4
    sleep 8
    play :d5, release: 4, amp: 4
    sleep 4
    play :e5, release: 4, amp: 4
    sleep 4
    play :a5, release: 8, amp: 4
    sleep 8
    play :g5, release: 8, amp: 4
    sleep 8
    play :f5, release: 8, amp: 4
    sleep 8
    play :g5, release: 4, amp: 4
    sleep 4
    play :a5, release: 4, amp: 4
    sleep 4
    3.times do
      play :f5, release: 8, amp: 4
      sleep 4
      play :g5, release: 8, amp: 4
      sleep 4
      play :a5, release: 8, amp: 4
      sleep 4
      play :g5, release: 8, amp: 4
      sleep 4
    end
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
  
  bass(section_a1, section_a, section_b1, section_b, section_c1, section_c, section_d1, section_d2, section_d, section_e, section_e1)
end

in_thread do
  use_synth :fm
  x = -> { play :a, sustain: 0.1; sleep 0.75 }
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  
  pattern_a = -> {
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6, :a6, :a, :a6, :a], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 0.5])
  }
  pattern_b = -> {
    play_pattern_timed([:a, :a6, nil, :a, :a, :a6, nil, :a, :a, :a6, nil, :a, nil, :a8, nil, :a8], [0.5])
  }
  sleep 1.5
  battery(pattern_a, pattern_b)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.8, mod_rate: 5, amp: 2
  section_a = -> {
    play_pattern_timed([:e5, nil, :g5, :f5, :e5, :d5, nil, :c5, nil, :b4, :c5, :d5, :e5, nil, nil, nil], [0.5])
    play_pattern_timed([:e5, nil, :g5, :f5, :e5, :d5, nil, :c5, nil, :b4, :g5, :f5, :e5, nil, :d5, :c5], [0.5])
    play_pattern_timed([:b4, nil, :c5, :c5, nil, :b4, nil, :c5, nil, :b4, :c5, nil, :c5, nil, :c5, nil], [0.5])
    play_pattern_timed([:c5, nil, :d5, :d5, nil, :d5, nil, :d5, nil, :e5, :f5, :g5, :f5, nil, :e5, nil], [0.5])
  }
  section_b = -> {
    play_pattern_timed([:e5, nil, :g5, :f5, :e5, :d5, nil, :c5, nil, :b4, :c5, :d5, :e5, nil, :g5, :a5], [0.5])
    play_pattern_timed([:b5, nil, :a5, :b5, :c6, :d6, nil, :e6, nil, :g6, :f6, :e6, :d6, nil, :e6, :d6], [0.5])
    play_pattern_timed([:c6, nil, :d6, :b5, nil, :c6, nil, :b5, nil, :c5, nil, :b5, :a5, nil, :c5, :d5], [0.5])
    play_pattern_timed([:c5, nil, :d5, :f5, :e5, nil, :b5, :a5, :g5, nil, :a5, nil, :b5, nil, :c6, nil], [0.5])
  }
  section_c = -> {
    play_pattern_timed([:g5, nil, nil, nil, :a5, nil, :a5, nil, nil, nil, :a5, nil, :a5, nil, nil, nil, :b5, nil, nil, nil, :b5, nil, :b5, nil, nil, nil, :b5, nil, :c6, nil, :d6, nil, :e6, nil, nil, nil, nil, nil, :a5, nil, :g6, nil, nil, nil, :f6, nil, nil, nil, :e6, nil, nil, nil, :d6, nil, nil, nil, :c6, nil, nil, nil, :g5, nil, nil, nil], [0.25])
    play_pattern_timed([:g5, nil, nil, nil, :a5, nil, :a5, nil, nil, nil, :a5, nil, :a5, nil, nil, nil, :b5, nil, nil, nil, :b5, nil, :b5, nil, nil, nil, :a5, nil, :d6, nil, :c6, nil, :b5, nil, nil, nil, :a5, nil, :g5, nil, :a5, nil, nil, nil, :f6, nil, nil, nil, :e6, nil, nil, nil, :d6, nil, nil, nil, :c6, nil, nil, nil, :g5, nil, nil, nil], [0.25])
    play_pattern_timed([:b5, nil, :a5, :g5, :f5, :e5, nil, :b5, :a5, nil, :f5, :g5, :a5, :b5, nil , :c6, :e6, :g6, nil, :g6, nil, :g6, nil, :g6, nil, :g6, :f6, :e6, :d6, :c6, :b5, :a5, nil, nil], [0.5])
    play_pattern_timed([:e6, :d6, :c6, nil, :e6, :d6, :c6, nil, :a5, :b5, :c6, nil, :g6, :f6], [0.5])
    play :e6, release: 4
    sleep 8
  }
  melody(section_a, section_b, section_c)
end

in_thread do
  noise
end

in_thread do
  bg
end




