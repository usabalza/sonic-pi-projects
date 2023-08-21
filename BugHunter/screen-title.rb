#start-screen
use_bpm 180

define :main_bass do |bass|
  1.times { bass.call }
end

define :main_battery do |battery_a|
  1.times { battery_a.call }
end

define :main_melody do |melody|
  1.times { melody.call }
end

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  bass_snippet = -> {
    1.times do
      bass_pattern(:d3, :d3, 6)
      bass_pattern(:c3, :b2, 6)
      bass_pattern(:as2, :as2, 6)
      bass_pattern(:c3, :c3, 2)
      bass_pattern(:a2, :a2, 2)
    end
    play :as2, release: 6
  }
  main_bass(bass_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  
  pattern_a = -> {
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6, :a6, :a, :a6, :a], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 0.5])
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6, :a6, :a, :a6, :a], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 0.5])
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6, :a6, :a, :a6, :a], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5, 0.5])
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6, :a6, :a, :a6], [1, 1, 1, 1, 1, 0.5, 0.5, 0.5, 1, 0.5])
  }
  sleep 1.5
  main_battery(pattern_a)
end

define :bass_pattern do |a, b, n|
  play a
  sleep 1
  n.times do
    play_pattern_timed([a, a, a, nil], [0.25])
  end
  play b
  sleep 1
end

in_thread do
  use_synth :pulse
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  melody_snippet = -> {
    play_pattern_timed([:d4, :e4, :f4, :d4, :c5, :d4, :as4, :d4, :a4, :d4, :g4, :d4, :f4, :e4, :c4], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:c4, :e4, :f4, :c4, :c5, :d4, :as4, :d4, :a4, :d4, :g4, :d4, :f4, :e4, :c4], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:as3, :c4, :d4, :e4, :f4, :g4, :a4, :g4, :f4, :e4, :d4, :c4, :e4, :g4, :c4, :cs4], [1, 0.5, 0.5, 0.5, 1, 0.5, 1, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 1])
    play_pattern_timed([:a3, :d4, :e4, :f4, :g4, :c4], [0.5, 0.5, 0.5, 0.5, 0.5])
    play :a4, release: 6
  }
  main_melody(melody_snippet)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  countermelody_snippet = -> {
    play_pattern_timed([:a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4, :c4], [1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:as3, :as3, :as3, :as3, :as3, :as3, :as3, :as3, :as3, :as3, :as3, :c4, :c4, :c4, :c4, :c4], [1, 0.5, 0.5, 0.5, 1, 0.5, 1, 0.5, 0.5, 1, 1, 1, 1, 1, 1, 1])
    play_pattern_timed([:c4, :c4, :a3, :a3, :a3, :a3], [0.5, 0.5, 0.5, 0.5, 0.5])
    play :as3, release: 6
  }
  main_melody(countermelody_snippet)
end

define :noise do
  2.times do
    use_synth :noise
    use_synth_defaults release: 0.2
    7.times do
      play_pattern_timed([nil, nil, nil, :a2], [0.5])
    end
    play_pattern_timed([nil, nil, :a2, :a2], [0.5])
  end
end

in_thread do
  noise
end
