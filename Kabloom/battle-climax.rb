use_bpm 200

define :bass do |a, b, c|
  2.times do
    4.times { a.call }
    2.times { b.call }
    2.times { c.call }
  end
  
end

define :drums do |a, b|
  2.times do
    7.times { a.call }
    1.times { b.call }
  end
end

define :melody do |a|
  1.times { a.call }
end

define :chorus do |a, b, c, d|
  1.times do
    2.times { a.call }
    1.times { b.call }
    1.times { c.call }
    1.times { d.call }
  end
  
end

define :piano do |a|
  sleep 40
  1.times { a.call }
  
end

define :chords do |a, b, c|
  sleep 40
  1.times { a.call }
  sleep 8
  1.times { a.call }
  sleep 8
  1.times { b.call }
  sleep 8
  1.times { c.call }
end

#Bassline
in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  bass_a = -> {
    use_transpose 0
    play :a2, release: 1
    sleep 1.3
    play :a3, release: 1
    sleep 1.3
    play_pattern_timed([:a2, :g3, :a2, :a3, :a2], [0.3, 0.6, 0.3, 0.6, 0.6])
  }
  
  bass_b = -> {
    use_transpose -4
    play :a2, release: 1
    sleep 1.3
    play :a3, release: 1
    sleep 1.3
    play_pattern_timed([:a2, :g3, :a2, :a3, :a2], [0.3, 0.6, 0.3, 0.6, 0.6])
  }
  
  bass_c = -> {
    use_transpose -2
    play :a2, release: 1
    sleep 1.3
    play :a3, release: 1
    sleep 1.3
    play_pattern_timed([:a2, :g3, :a2, :a3, :a2], [0.3, 0.6, 0.3, 0.6, 0.6])
  }
  
  bass(bass_a, bass_b, bass_c)
end

#Drums
in_thread do
  drums_a = -> {
    sample :drum_heavy_kick
    sleep 1.25
    sample :drum_snare_hard
    sleep 1.25
    sample :drum_heavy_kick
    sleep 1
    sample :drum_heavy_kick
    sleep 0.25
    sample :drum_snare_hard
    sleep 1.25
  }
  
  drums_b = -> {
    sample :drum_heavy_kick
    sleep 0.6
    sample :drum_snare_hard
    sleep 0.6
    sample :drum_heavy_kick
    sleep 0.6
    sample :drum_snare_hard
    sleep 0.6
    sample :drum_heavy_kick
    sleep 0.6
    sample :drum_snare_hard
    sleep 0.3
    sample :drum_snare_hard
    sleep 0.3
    sample :drum_heavy_kick
    sleep 0.6
    sample :drum_snare_hard
    sleep 0.3
    sample :drum_snare_hard
    sleep 0.3
    sample :drum_cymbal_hard
    
  }
  drums(drums_a, drums_b)
end

#Main Melody
in_thread do
  use_synth :blade
  use_synth_defaults release: 0.8, mod_rate: 5, amp: 2
  melody_a = -> {
    play_pattern_timed([:g4, :a4, :g4, :a4, :a4], [1.3, 1.2, 0.3, 0.6, 1])
    play_pattern_timed([:b4, :c5, :d5, :e5, :d5, :c5, :b4], [0.6, 1, 0.6, 1, 0.9, 0.6, 0.9])
    play_pattern_timed([:g4, :a4, :g4, :a4, :a4], [1.3, 1.2, 0.3, 0.6, 1])
    play_pattern_timed([:b4, :g5, :f5, :e5, :d5, :c5, :b4], [0.6, 1, 0.6, 1, 0.9, 0.6, 0.9])
    play_pattern_timed([:c5, :d5, :b4, :c5, :d5, :b4, :c5, :b4, :a4], [1, 1, 0.9, 0.6, 1, 0.6, 1.2, 0.6, 1.2])
    play_pattern_timed([:a4, :b4, :c5, :d5, :e5, :d5, :e5, :f5, :g5, :e5, :f5, :e5, :f5, :e5], [0.6, 0.6, 0.7, 1.2, 0.6, 1.2, 0.6, 0.6, 0.6, 1, 1, 1.2, 0.7, 1.1])
  }
  melody(melody_a)
  
end

#Chorus
in_thread do
  use_synth :hollow
  chorus_a = -> {
    play :a5, release: 8, amp: 4
    sleep 10
  }
  chorus_b = -> {
    play :f5, release: 8, amp: 4
    sleep 10
  }
  chorus_c = -> {
    play :g5, release: 8, amp: 4
    sleep 5
  }
  chorus_d = -> {
    play :e5, release: 8, amp: 4
    sleep 5
  }
  chorus(chorus_a, chorus_b, chorus_c, chorus_d)
end

#Piano solo
in_thread do
  use_synth :piano
  piano_a = -> {
    play_pattern_timed([:a4, :a4, :g4, :a4, :c5, :a4, :g4, :a4], [0.6, 0.7, 0.2, 0.6, 0.9, 0.6, 0.6, 1.4])
    play_pattern_timed([:a4, :c5, :a4, :ds5, :d5, :c5, :a4], [0.6, 0.6, 0.2, 0.6, 0.9, 0.6, 1.4])
    play_pattern_timed([:a4, :g4, :a4, :c5, :a4, :g4, :a4], [0.7, 0.2, 0.6, 0.9, 0.6, 0.6, 0.7])
    play_pattern_timed([:g4, :f4, :g4, :a4, :g4, :a4, :b4, :a4, :b4, :c5, :c5, :d5, :e5], [0.7, 0.2, 0.2, 0.9, 0.2, 0.2, 0.9, 0.2, 0.2, 0.9, 0.2, 0.2, 0.9])
    play_pattern_timed([:d5, :c5, :e5, :d5, :c5], [0.8, 0.8, 0.8, 0.8, 1])
    5.times do
      play_pattern_timed([:e5, :d5, :c5], [0.3, 0.3, 0.3])
    end
    sleep 0.5
    play_pattern_timed([:g5, :f5, :e5, :f5, :g5, :e5, :d5, :c5, :b4], [1.2, 0.6, 1.2, 0.6, 0.6, 0.6, 0.9, 0.9, 0.6])
    
  }
  piano(piano_a)
end

#Piano chords
in_thread do
  use_synth :piano
  chord_a = -> {
    play :b3, release: 4
    play :e4, release: 4
    play :g4, release: 4
    sleep 0.7
    play :b3, release: 4
    play :e4, release: 4
    play :g4, release: 4
    sleep 1
    play :c3, release: 4
    play :e4, release: 4
    play :a4, release: 4
    sleep 0.3
  }
  
  chord_b = -> {
    play :c3, release: 4
    play :e4, release: 4
    play :a4, release: 4
    sleep 0.7
    play :b3, release: 4
    play :e4, release: 4
    play :g4, release: 4
    sleep 1
    play :a3, release: 4
    play :f4, release: 4
    play :c4, release: 4
    sleep 0.3
    
  }
  
  chord_c = -> {
    play :a3, release: 4
    play :f4, release: 4
    play :c4, release: 4
    sleep 0.7
    play :a3, release: 4
    play :f4, release: 4
    play :c4, release: 4
    sleep 1
    play :b3, release: 4
    play :e4, release: 4
    play :g4, release: 4
    sleep 0.3
    
  }
  
  chords(chord_a, chord_b, chord_c)
end
