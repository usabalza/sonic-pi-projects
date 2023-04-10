use_bpm 130

define :melody do |a, b, c, d, e, f, g, s|
  1.times { a.call }
  1.times { b.call }
  1.times { a.call }
  1.times { c.call }
  1.times { d.call }
  2.times { e.call }
  1.times { f.call }
  1.times { g.call }
  sleep 22
  1.times { a.call }
  1.times { b.call }
  1.times { a.call }
  1.times { c.call }
  1.times { d.call }
  2.times { e.call }
  1.times { f.call }
  1.times { g.call }
  sleep 8
  1.times { s.call }
  sleep 33
  use_transpose 2
  1.times { a.call }
  1.times { b.call }
  1.times { a.call }
  1.times { c.call }
  1.times { d.call }
  2.times { e.call }
  1.times { f.call }
  1.times { g.call }
end

define :battery1 do |a1, a2, a3, b|
  sleep 64
  2.times {
    a1.call
    sleep 0.5
    a1.call
    a2.call
  }
  8.times {
    a3.call
  }
  sleep 30
  b.call
  4.times {
    a3.call
  }
  2.times {
    a1.call
    sleep 0.5
    a1.call
    a2.call
  }
end

define :battery2 do |a, b|
  sleep 64 + 14
  256.times { a.call }
  32.times { b.call }
  128.times { a.call }
end

define :bass1 do |a1, a2, a3, a4, b1, b2, c|
  4.times do
    2.times { a1.call 8,4 }
    1.times { a2.call 8,4 }
    1.times { a3.call 8,2 }
    1.times { a4.call 8,2 }
  end
  2.times do
    2.times { b1.call }
    sleep 0.5
    2.times { b1.call }
    sleep 0.5
    b2.call
    sleep 1
  end
  8.times do
    16.times { a1.call 1,0.5 }
    8.times { a2.call 1,0.5 }
    4.times { a3.call 1,0.5 }
    4.times { a4.call 1,0.5 }
  end
  c.call
  sleep 4
  use_transpose 2
  4.times do
    16.times { a1.call 1,0.5 }
    8.times { a2.call 1,0.5 }
    4.times { a3.call 1,0.5 }
    4.times { a4.call 1,0.5 }
  end
  2.times do
    2.times { b1.call }
    sleep 0.5
    2.times { b1.call }
    sleep 0.5
    b2.call
    sleep 1
  end
end

#Battery 1
in_thread do
  section_a1 = -> {
    2.times do
      3.times do
        sample :drum_snare_soft
        sleep 0.25
      end
      sample :drum_snare_hard
      sleep 0.5
    end
  }
  
  section_a2 = -> {
    sample :drum_snare_hard
    sleep 0.5
    sample :drum_snare_hard
    sample :drum_cymbal_hard
    sleep 1
  }
  
  section_a3 = -> {
    7.times do
      sample :drum_snare_soft
      sleep 0.5
      sample :drum_snare_hard
      sleep 0.5
      sample :drum_snare_soft
      sleep 0.25
      sample :drum_snare_soft
      sleep 0.25
      sample :drum_snare_hard
      sleep 0.5
    end
    2.times do
      sample :drum_cymbal_hard
      sample :drum_snare_hard
      sleep 0.75
    end
    sample :drum_cymbal_hard
    sample :drum_snare_hard
    sleep 0.5
    sample :drum_cymbal_open
    sample :drum_snare_hard
  }
  
  section_b = -> {
    4.times do
      sample :drum_snare_soft
      sleep 0.25
    end
    4.times do
      sample :drum_snare_hard
      sleep 0.25
    end
    
    
  }
  battery1(section_a1, section_a2, section_a3, section_b)
end

#Battery 2
in_thread do
  section_a = -> {
    sample :drum_heavy_kick
    sleep 0.5
  }
  
  section_b = -> {
    sample :drum_heavy_kick
    sleep 1
  }
  battery2(section_a, section_b)
end

#Bass 1
in_thread do |r, s|
  use_synth :piano
  
  section_a1 = ->(r, s) {
    play :a3, release: r
    play :c4, release: r
    play :f3, release: r
    sleep s
  }
  
  section_a2 = ->(r, s) {
    play :b3, release: r
    play :d4, release: r
    play :g3, release: r
    sleep s
  }
  
  section_a3 = ->(r, s) {
    play :c4, release: r
    play :e4, release: r
    play :a3, release: r
    sleep s
  }
  
  section_a4 = ->(r, s) {
    play :g3, release: r
    play :b3, release: r
    play :d4, release: r
    sleep s
  }
  
  section_b1 = -> {
    play :g2
    play :b2
    play :d3
    sleep 0.25
    2.times do
      play :a2
      play :c3
      play :e3
      sleep 0.5
    end
  }
  
  section_b2 = -> {
    play :as2
    play :f2
    play :d3
  }
  
  section_c = -> {
    2.times do
      play_pattern_timed([:f2, :f2, :f2, :f2, :f2], [0.75, 0.75, 1, 0.75, 0.75])
    end
    play_pattern_timed([:g2, :g2, :g2, :g2, :g2], [0.75, 0.75, 1, 0.75, 0.75])
    play_pattern_timed([:a2, :a2, :a2], [0.75, 0.75, 0.5])
    play_pattern_timed([:g2, :g2, :g2], [0.75, 0.75, 0.5])
    2.times do
      play_pattern_timed([:f2, :f2, :f2, :f2, :f2], [0.75, 0.75, 1, 0.75, 0.75])
    end
    play_pattern_timed([:g2, :g2, :g2, :g2, :g2], [0.75, 0.75, 1, 0.75, 0.75])
  }
  
  
  bass1(section_a1, section_a2, section_a3, section_a4, section_b1, section_b2, section_c)
end

#Main melody
in_thread do
  use_synth :piano
  section_a = -> {
    play_pattern_timed([:e5, :d5, :f4, :f4, :e5, :d5], [0.75, 1.75, 1, 0.5, 0.75, 1.75])
  }
  
  section_b = -> {
    play_pattern_timed([:e4, :e4, :d5, :c5, :e4, :e4, :d5, :c5, :e4, :e4], [1, 0.5, 0.75, 1.75, 1, 0.5, 0.75, 1.75, 1, 0.5])
  }
  
  section_c = -> {
    play_pattern_timed([:e4, :e4, :g5, :e5, :e4, :e4, :g5, :e5], [1, 0.5, 0.75, 1.75, 1, 0.5, 0.75, 0.75])
  }
  
  section_d = -> {
    play_pattern_timed([:f5, :g5, :f5, :e5, :d5, :e5, :c5], [0.5, 0.75, 0.75, 0.5, 1, 0.5, 2])
  }
  
  section_e = -> {
    play_pattern_timed([:b4, :c5, :d5, :e5, :c5], [0.25, 0.25, 0.75, 0.75, 2])
  }
  
  section_f = -> {
    play_pattern_timed([:c5, :b4, :g4, :g4], [0.5, 0.5, 0.5, 2.5])
  }
  
  section_g = -> {
    play_pattern_timed([:f4, :g4, :a4, :g4, :a4, :b4, :a4, :b4, :c5, :b4, :a4, :a4, :a4, :g5], [0.25, 0.25, 1.5, 0.25, 0.25, 0.5, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7])
    play :g5, release: 8
  }
  
  solo = -> {
    play_pattern_timed([:e5, :e6, :d6, :c6, :b5, :c6, :b5, :g5, :g5, :a5], [0.5, 2.75, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.5])
    sleep 0.75
    play_pattern_timed([:g5, :f5, :e5, :f5, :g5, :a5, :b5, :c6, :d6, :e6], [0.25, 0.25, 1.5, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5])
    sleep 3
    play_pattern_timed([:d5, :e5, :f5, :f5, :f5, :e5, :d5, :c5, :d5, :e5, :d5, :c5], [0.25, 0.25, 1.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    sleep 1.5
    play_pattern_timed([:b4, :c5, :d5, :d5, :d5, :c5, :b4, :c5, :b4, :g4], [0.25, 0.25, 1.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    sleep 2
    play_pattern_timed([:a5, :b5, :c6, :d6, :e6], [0.25, 0.25, 0.25, 0.25, 1])
    sleep 1
    3.times do
      sleep 0.5
      play_pattern_timed([:b5, :c6, :d6, :e6], [0.5, 0.5, 0.5, 2])
    end
    play_pattern_timed([:d6, :g6, :f6, :e6], [0.75, 0.75, 0.5, 0.5])
    2.times do
      sleep 2
      play_pattern_timed([:d6, :c6, :b5, :a5], [0.5, 0.5, 0.5, 0.5])
    end
    sleep 1.5
    play_pattern_timed([:g5, :b5, :g5], [0.75, 0.75, 0.5])
    4.times do
      play :a5
      sleep 0.5
    end
    4.times do
      play :a5
      sleep 0.25
    end
  }
  
  melody(section_a, section_b, section_c, section_d, section_e, section_f, section_g, solo)
end
