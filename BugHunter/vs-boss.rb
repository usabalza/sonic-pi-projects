#boss_fight
use_bpm 150

define :main_bass do |bass_a, bass_b|
  2.times { bass_a.call }
  1.times { bass_b.call }
end

define :main_battery do |battery_a, battery_b|
  12.times do
    7.times { battery_a.call }
    1.times { battery_b.call }
  end
end

define :main_noise do |noise|
  12.times { noise.call }
end

define :main_solo do |solo|
  sleep 64
  1.times { solo.call }
end

define :main_melody do |melody|
  sleep 126
  1.times { melody.call }
end

define :main_countermelody do |countermelody|
  sleep 126
  1.times { countermelody.call }
end

define :bass_riff_a do |a, n|
  play a
  sleep 0.5
  n.times do
    play a
    sleep 0.25
  end
end

define :bass_riff_b do |a, b, c|
  play_pattern_timed([a, b, c], [0.75, 0.75, 0.5])
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  battery_snippet_a = -> {
    play_pattern_timed([:a, :a6, :a, :a, :a6], [0.5, 0.5, 0.25, 0.25, 0.5])
  }
  battery_snippet_b = -> {
    play_pattern_timed([:a6, :a, :a6, :a, :a6, :a6], [0.5, 0.25, 0.5, 0.25, 0.25, 0.25])
  }
  main_battery(battery_snippet_a, battery_snippet_b)
end

in_thread do
  use_synth :saw
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  solo_snippet = -> {
    4.times do
      play_pattern_timed([:e5, :c5, :a5], [0.25, 0.25, 0.5])
    end
    5.times do
      play_pattern_timed([:a5, :e5, :c5], [0.25, 0.25, 0.25])
    end
    play_pattern_timed([:a5, :d6, :c6, :e5, :b5, :c6, :b5, :a5, :gs5, :a5, :b5, :c6, :b5], [0.25, 1, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5])
    play_pattern_timed([:d5, :e5, :b5, :c6, :a5, :c6, :a5, :d6, :c6, :b5, :e5], [0.5, 1, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1])
    play_pattern_timed([:d5, :e5, :f5, :g5, :f5, :g5, :a5, :g5, :a5, :b5, :c6, :b5, :c6, :d6, :c6, :d6, :g5, :e6], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 4])
    play_pattern_timed([:e6, :d6, :c6, :b5, :a5, :a5, :gs5, :a5, :b5], [0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.25, 0.25, 3])
    play_pattern_timed([:b5, :c6, :d6, :c6, :b5, :a5, :gs5, :a5, :b5, :e5], [0.25, 0.25, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.5, 0.5])
    play_pattern_timed([:d5, :e5, :g5, :f5, :e5, :d5, :e5], [0.5, 0.25, 0.75, 0.5, 0.5, 0.25, 0.75])
    play_pattern_timed([:b4, :d5, :e5, :g5, :f5, :e5, :d5, :e5], [0.5, 0.5, 0.25, 0.75, 0.5, 0.5, 0.25, 0.75])
    play_pattern_timed([:g5, :b5, :d6, :e6, :b5, :c6, :d6, :e6, :g6, :f6, :e6], [0.5, 0.5, 0.25, 0.75, 0.5, 0.5, 0.5, 0.75, 0.75, 0.5, 0.75])
  }
  main_solo(solo_snippet)
end

in_thread do
  use_synth :pulse
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  melody_snippet = -> {
    play_pattern_timed([:gs4, :a4, :b4, :d5, :c5, :b4, :c5, :e4, :e4, :d5, :c5, :b4, :c5, :d5, :g4], [0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5])
    play_pattern_timed([:e5, :d5, :c5, :b4, :g4, :g4, :g4, :a4, :a4, :a4], [0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 1.5])
    play_pattern_timed([:f4, :e4, :d4, :f4, :a4, :d4, :f4, :a4, :e4, :g4, :b4, :e4, :g4, :b4], [0.25, 0.25, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5])
    play_pattern_timed([:c5, :f4, :f4, :a4, :d5, :c5, :b4], [0.75, 0.75, 0.5, 1, 1, 1.5, 1.5])
    play_pattern_timed([:e4, :d5, :c5, :b4, :c5, :e4, :e4, :d5, :c5, :b4, :c5, :d5, :g4], [1, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5])
    play_pattern_timed([:e5, :d5, :e5, :g5, :e5, :e4, :b4, :c5, :b4, :a4], [0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 1.5])
    play_pattern_timed([:e4, :g4, :a4, :g4, :a4, :b4, :a4, :b4, :c5, :e4, :e4, :g5, :f5, :e5, :d5, :e5], [0.25, 0.25, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.25, 0.25, 4])
  }
  main_melody(melody_snippet)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  countermelody_snippet = -> {
    play_pattern_timed([:e3, :e3, :e3, :a3, :a3, :a3, :a3, :a3, :a3, :b3, :b3, :b3, :b3, :b3, :b3], [0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5])
    play_pattern_timed([:c4, :c4, :c4, :c4, :c4, :c4, :a3, :a3, :a3, :a3], [0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 1.5])
    play_pattern_timed([:g3, :g3, :a3, :a3, :a3, :a3, :a3, :b3, :b3, :b3, :b3, :b3, :b3, :b3], [0.25, 0.25, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5])
    play_pattern_timed([:a3, :a3, :a3, :a3, :a3, :a3, :b3], [0.75, 0.75, 0.5, 1, 1, 1.5, 1.5])
    play_pattern_timed([:g3, :a3, :a3, :a3, :a3, :a3, :a3, :b3, :b3, :b3, :b3, :b3, :b3], [1, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5])
    play_pattern_timed([:c4, :c4, :c4, :c4, :c4, :c4, :a3, :a3, :a3, :a3], [0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 1.5])
    play_pattern_timed([:g3, :g3, :a3, :a3, :a3, :b3, :b3, :b3, :c4, :c4, :c4, :b3, :b3, :b3, :b3, :c4], [0.25, 0.25, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.5, 0.75, 0.75, 0.25, 0.25, 4])
  }
  main_countermelody(countermelody_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  bass_snippet_a = -> {
    bass_riff_a(:a3, 14)
    bass_riff_a(:b3, 14)
    bass_riff_a(:c4, 14)
    bass_riff_a(:d4, 6)
    bass_riff_b(:c4, :b3, :as3)
    
    bass_riff_a(:a3, 14)
    bass_riff_a(:b3, 14)
    bass_riff_a(:c4, 14)
    bass_riff_a(:d4, 6)
    bass_riff_b(:c4, :c4, :d4)
    
    bass_riff_a(:e3, 14)
    bass_riff_a(:f3, 14)
    bass_riff_a(:g3, 14)
    bass_riff_a(:f3, 6)
    bass_riff_b(:g3, :fs3, :f3)
    
    bass_riff_a(:e3, 14)
    bass_riff_a(:f3, 14)
    bass_riff_a(:g3, 14)
    bass_riff_a(:e3, 6)
    bass_riff_b(:e3, :fs3, :gs3)
  }
  bass_snippet_b = -> {
    bass_riff_a(:f3, 14)
    bass_riff_a(:g3, 14)
    bass_riff_a(:a3, 14)
    bass_riff_a(:fs3, 14)
    
    bass_riff_a(:d3, 14)
    bass_riff_a(:e3, 14)
    bass_riff_a(:f3, 14)
    bass_riff_a(:g3, 6)
    bass_riff_a(:e3, 6)
    
    bass_riff_a(:f3, 14)
    bass_riff_a(:g3, 14)
    bass_riff_a(:a3, 14)
    bass_riff_a(:fs3, 14)
    
    bass_riff_a(:d3, 6)
    bass_riff_a(:e3, 6)
    bass_riff_a(:f3, 6)
    bass_riff_a(:g3, 6)
    bass_riff_a(:a3, 30)
  }
  main_bass(bass_snippet_a, bass_snippet_b)
end

in_thread do
  use_synth :dsaw
  use_synth_defaults release: 5, amp: 0.6
  2.times do
    play_pattern_timed([:a4, :g4, :d4, :e4], [4, 4, 4, 4])
  end
  play_pattern_timed([:e4, :f4, :g4, :f4], [4, 4, 4, 4])
  play_pattern_timed([:e4, :f4, :g4, :gs4], [4, 4, 4, 4])
end

in_thread do
  use_synth :noise
  use_synth_defaults release: 0.5
  noise_snippet_a = -> {
    7.times do
      play_pattern_timed([nil, :a2, nil, :a2], [0.5])
    end
    play_pattern_timed([nil, :a2, nil, :a2, :a2, nil, :a2, :a2], [0.25])
  }
  main_noise(noise_snippet_a)
end

