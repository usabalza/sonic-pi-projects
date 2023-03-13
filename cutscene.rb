use_bpm 120
use_debug false

define :bg do
  use_synth :hollow
  play :a5, release: 8, amp: 4
  sleep 12
  play :a5, release: 8, amp: 4
  sleep 12
  play :f5, release: 8, amp: 4
  sleep 12
  play :g5, release: 8, amp: 4
  sleep 12
  play :f5, release: 4, amp: 4
  sleep 6
  play :e5, release: 4, amp: 4
  sleep 6
  play :f5, release: 4, amp: 4
  sleep 6
  play :g5, release: 4, amp: 4
  sleep 6
  play :a5, release: 8, amp: 4
  sleep 12
  stop
end

define :bass do |a, b, c, d|
  1.times do
    4.times { a.call }
    2.times { b.call }
    2.times { c.call }
    1.times { b.call }
    1.times { d.call }
    1.times { b.call }
    1.times { c.call }
    2.times { a.call }
  end
end

define :melody do |a|
  1.times { a.call }
end

in_thread do
  1.times do
    bg
  end
end

in_thread do
  use_synth :fm
  section_a = -> {
    play :a2, release: 0.5
    sleep 0.5
    play :a2, release: 0.5
    sleep 2.5
    play :a2, release: 1
    sleep 1
    play :a2, release: 1
    sleep 2
  }
  
  section_b = -> {
    play :f2, release: 0.5
    sleep 0.5
    play :f2, release: 0.5
    sleep 2.5
    play :f2, release: 1
    sleep 1
    play :f2, release: 1
    sleep 2
  }
  
  section_c = -> {
    play :g2, release: 0.5
    sleep 0.5
    play :g2, release: 0.5
    sleep 2.5
    play :g2, release: 1
    sleep 1
    play :g2, release: 1
    sleep 2
  }
  
  section_d = -> {
    play :e2, release: 0.5
    sleep 0.5
    play :e2, release: 0.5
    sleep 2.5
    play :e2, release: 1
    sleep 1
    play :e2, release: 1
    sleep 2
  }
  bass(section_a, section_b, section_c, section_d)
end

in_thread do
  use_synth :organ_tonewheel
  section_a = -> {
    play :a4, release: 2
    sleep 3
    play :c5, release: 2
    sleep 3
    play :e5, release: 2
    sleep 2
    play_pattern_timed([:a4, :g5, :f5, :e5, :e5], [1])
    sleep 2
    play :f5, release: 2
    sleep 3
    play :g5, release: 2
    sleep 2
    play_pattern_timed([:f5, :e5, :d5, :a4, :c5], [1])
    sleep 2
    play :d5, release: 2
    sleep 2
    play :c5, release: 0.5
    sleep 0.5
    play :b4, release: 0.5
    sleep 0.5
    play :c5, release: 2
    sleep 3
    play_pattern_timed([:b4, :c5, :d5, :e5], [1])
    sleep 2
    play_pattern_timed([:d5, :g5, :f5], [1])
    play :e5, release: 2
    sleep 2
    play_pattern_timed([:f5, :e5, :b4, :d5], [1])
    play_pattern_timed([:c5, :b4], [0.5])
    play :a4, release: 2
    sleep 5
    play_pattern_timed([:c5, :b4], [0.5])
    play :a4, release: 2
    sleep 5
    play_pattern_timed([:c5, :d5], [0.5])
    play :e5, release: 2
    sleep 2
    play_pattern_timed([:d5, :e5], [0.5])
    play :f5, release: 2
    sleep 2
    play_pattern_timed([:e5, :f5], [0.5])
    play :g5, release: 2
    sleep 1
    play_pattern_timed([:f5, :g5, :a5, :g5, :a5, :b5, :a5, :b5], [0.5])
    play :e6, release: 4
  }
  melody(section_a)
end