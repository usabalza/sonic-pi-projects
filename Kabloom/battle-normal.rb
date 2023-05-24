use_bpm 200

define :bass do |a, b, c|
  4.times { a.call }
  5.times do
    4.times { a.call }
    4.times { b.call }
    4.times { c.call }
    4.times { a.call }
  end
end

define :drums do |a, b, c|
  sleep 16
  10.times do
    3.times do
      1.times { a.call }
      1.times { b.call }
    end
    1.times { c.call }
  end
  
end

define :piano do |a|
  sleep 16
  32.times { a.call }
end


define :melody do |a, b|
  sleep 80
  2.times do
    1.times { a.call }
    1.times { b.call }
    sleep 7
  end
end

define :chorus do |a|
  sleep 80
  4.times { a.call }
end


in_thread do
  use_synth :fm
  bass_a = -> {
    use_transpose 0
    2.times do
      play_pattern_timed([:g2, :a2, :a2], [0.5, 0.5, 0.5])
    end
    play_pattern_timed([:g2, :a2], [0.5, 0.5])
  }
  
  bass_b = -> {
    use_transpose -4
    2.times do
      play_pattern_timed([:g2, :a2, :a2], [0.5, 0.5, 0.5])
    end
    play_pattern_timed([:g2, :a2], [0.5, 0.5])
  }
  
  bass_c = -> {
    use_transpose -2
    2.times do
      play_pattern_timed([:g2, :a2, :a2], [0.5, 0.5, 0.5])
    end
    play_pattern_timed([:g2, :a2], [0.5, 0.5])
  }
  bass(bass_a, bass_b, bass_c)
end

in_thread do
  use_synth :piano
  piano_a = -> {
    play_pattern_timed([:e6, :d6, :c6, :b5, :a5, :b5, :c6, :d6], [1])
  }
  piano(piano_a)
end

in_thread do
  drum_a = -> {
    sample :drum_heavy_kick
    sleep 2
    sample :drum_snare_hard
    sleep 2
  }
  
  drum_b = -> {
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_snare_hard
    sleep 1
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_snare_hard
    sleep 2
  }
  
  drum_c = -> {
    sample :drum_heavy_kick
    sleep 1
    sample :drum_heavy_kick
    sleep 1
    sample :drum_snare_hard
    sleep 1
    sample :drum_heavy_kick
    sleep 1
    sample :drum_snare_hard
    sleep 1
    sample :drum_snare_hard
    sleep 0.5
    sample :drum_heavy_kick
    sleep 1
    sample :drum_snare_hard
    sleep 0.5
    sample :drum_snare_hard
    sample :drum_cymbal_hard
    sleep 1
  }
  
  drums(drum_a, drum_b, drum_c)
end

in_thread do
  use_synth :hollow
  chorus_a = -> {
    play :a5, release: 8, amp: 8
    sleep 16
    play :f5, release: 8, amp: 8
    sleep 16
    play :g5, release: 8, amp: 8
    sleep 8
    play :e5, release: 8, amp: 8
    sleep 8
    play :g5, release: 8, amp: 8
    sleep 8
    play :a5, release: 8, amp: 8
    sleep 8
    
  }
  chorus(chorus_a)
end


in_thread do
  use_synth :blade
  use_synth_defaults release: 0.8, mod_rate: 5, amp: 2
  melody_a = -> {
    play :a4, release: 4
    sleep 6
    play :b4, release: 4
    sleep 2
    play :c5, release: 4
    sleep 6
    play :d5, release: 4
    sleep 2
    play :e5, release: 4
    sleep 6
    play :f5, release: 4
    sleep 2
    play :e5, release: 4
    sleep 6
    play :d5, release: 4
    sleep 2
    play :c5, release: 4
    sleep 6
    play :e5, release: 4
    sleep 2
    play :d5, release: 4
    sleep 6
    play :c5, release: 4
    sleep 2
    play :b4, release: 4
    sleep 7
    play :c5, release: 4
    sleep 9
  }
  
  melody_b = -> {
    play_pattern_timed([:e5, :d5, :c5, :b4, :c5, :b4, :a4, :g4, :a4, :e5, :e5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 2])
    play_pattern_timed([:a4, :f5, :e5, :d5, :c5, :b4, :e5, :d5, :c5, :g4, :a4], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 2])
    play_pattern_timed([:e5, :d5, :c5, :b4, :c5, :b4, :a4, :g4, :a4, :e5, :e5], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 2])
    play_pattern_timed([:c5, :e4, :f4, :g4, :a4, :b4, :c5, :d5, :c5, :b4, :a4], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 2])
    play_pattern_timed([:e5, :d5, :c5, :b4, :c5, :b4, :a4, :g4, :a4, :e5, :e5], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 1])
    play_pattern_timed([:d5, :e5, :f5], [0.5, 0.5, 0.5])
    play :g5, release: 4
    sleep 2
    play :f5, release: 4
    sleep 2
    play :e5, release: 4
    sleep 2
    play :d5, release: 4
    sleep 2
    play :d5, release: 8
    sleep 7
    play :c5, release: 4
    sleep 2
    
  }
  
  melody(melody_a, melody_b)
end
