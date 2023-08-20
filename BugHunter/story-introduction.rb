#intro
use_bpm 90
define :main_bass do |bass|
  2.times { bass.call }
end

define :main_hollow do |hollow|
  2.times { hollow.call }
end

define :main_battery do |battery_a|
  16.times { battery_a.call }
end

define :main_piano do |piano|
  2.times { piano.call }
end

define :main_melody do |melody|
  sleep 32
  1.times { melody.call }
end


in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  bass_snippet = -> {
    4.times do
      bass_pattern(:e2)
      sleep 1
    end
    bass_pattern(:c3)
    sleep 1
    bass_pattern(:a2)
    sleep 0.25
    play :f2, release: 2
    sleep 0.75
    2.times do
      bass_pattern(:e2)
      sleep 1
    end
  }
  main_bass(bass_snippet)
end

define :bass_pattern do |a|
  2.times do
    play_pattern_timed([a, a], [0.25, 0.25])
    sleep 1
  end
end

define :piano_pattern do |a, b, c, d|
  play_pattern_timed([a, b, c, d], [0.25, 0.25, 0.25, 0.25])
end

in_thread do
  use_synth :hollow
  use_synth_defaults release: 4
  hollow_snippet = -> {
    2.times do
      play :e5
      sleep 8
    end
    play :c5
    sleep 4
    play :d5
    sleep 4
    2.times do
      play :e5
      sleep 4
    end
    
  }
  main_hollow(hollow_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  battery_snippet_a = -> {
    play_pattern_timed([:a, :a, :a6, :a, :a, :a, :a6], [0.25, 0.75, 0.75, 0.5, 0.25, 0.5, 1])
  }
  main_battery(battery_snippet_a)
end

in_thread do
  use_synth :piano
  piano_snippet = -> {
    2.times do
      piano_pattern(:e4, :fs4, :g4, :d5)
      sleep 7
    end
    piano_pattern(:c4, :fs4, :g4, :c4)
    sleep 3
    piano_pattern(:d4, :g4, :a4, :d4)
    sleep 3
    piano_pattern(:b4, :a4, :g4, :fs4)
    sleep 3
    piano_pattern(:fs4, :g4, :fs4, :d4)
    sleep 3
  }
  main_piano(piano_snippet)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  melody_snippet = -> {
    play_pattern_timed([:fs4, :g4, :b3], [0.25, 0.25, 2])
    sleep 2.5
    play_pattern_timed([:a4, :g4, :fs4, :e4, :d4], [0.25, 0.25, 0.25, 0.75, 1.5])
    play_pattern_timed([:fs4, :g4, :b3], [0.25, 0.25, 2])
    sleep 2.5
    play_pattern_timed([:fs4, :g4, :a4, :b4, :a4, :fs4, :d4, :e4], [0.25, 0.25, 0.25, 0.75, 0.75, 0.75, 0.75, 2])
    sleep 0.5
    play_pattern_timed([:b3, :d4, :e4], [0.75, 0.75, 2])
    sleep 0.5
    play_pattern_timed([:b3, :fs4, :g4], [0.75, 0.75, 2])
    sleep 0.5
    play_pattern_timed([:d4, :a4, :b4], [0.75, 0.75, 2])
  }
  main_melody(melody_snippet)
end
