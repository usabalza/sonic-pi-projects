#stage 1
use_bpm 120

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  bass_snippet = -> {
    bass_a(:e2, :e3, :d3, 8)
    bass_a(:a2, :a3, :g3, 4)
    bass_a(:e2, :e3, :d3, 4)
    bass_a(:b2, :b3, :a3, 2)
    bass_a(:a2, :a3, :g3, 2)
    bass_a(:e2, :e3, :d3, 4)
  }
  
  bass_interlude_snippet = -> {
    play_pattern_timed([:e2, :e2, :e2, :e2, :e2, :e2, :e2, :e2, :e2, :e2], [0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5])
    play_pattern_timed([:e2, :e2, :e2, :e2, :e2, :e2, :e2, :e2, :f2, :f2], [0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5])
  }
  main_bass(bass_snippet, bass_interlude_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  battery_snippet_a = -> {
    play_pattern_timed([:a, :a, :a6, :a, :a, :a, :a, :a6, :a], [0.5, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5, 0.5, 0.5, 0.5])
  }
  battery_snippet_b1 = -> {
    play_pattern_timed([:a, :a6, :a, :a, :a6, :a, :a, :a6, :a, :a, :a6, :a], [0.5, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5])
  }
  battery_snippet_b2 = -> {
    play_pattern_timed([:a, :a6, :a, :a, :a6, :a, :a, :a6, :a, :a, :a6, :a], [0.25, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5])
  }
  battery_interlude_snippet = -> {
    play_pattern_timed([:a, :a, :a6, :a, :a, :a6, :a, :a6, :a6], [0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5])
  }
  main_battery(battery_snippet_a, battery_snippet_b1, battery_snippet_b2, battery_interlude_snippet)
end

in_thread do
  use_synth :chiplead
  use_synth_defaults release: 0.2
  beep_snippet = -> {
    bass_a(:e3, :e4, :d4, 8)
    bass_a(:a3, :a4, :g4, 4)
    bass_a(:e3, :e4, :d4, 4)
    bass_a(:b3, :b4, :a4, 2)
    bass_a(:a3, :a4, :g4, 2)
    bass_a(:e3, :e4, :d4, 4)
  }
  main_beep(beep_snippet)
end

in_thread do
  use_synth :pulse
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  melody_snippet_a = -> {
    play_pattern_timed([:b4, :d5, :e5, :g5, :fs5, :e5, :b4, :b4, :d5, :e5, :e5], [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5])
    play_pattern_timed([:b4, :d5, :e5, :g5, :fs5, :g5, :a5, :a5, :b5, :e5, :e5], [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5])
    play_pattern_timed([:b4, :d5, :e5, :g5, :fs5, :e5, :b4, :b4, :d5, :e5, :e5], [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5])
    play_pattern_timed([:e5, :d6, :c6, :b5, :a5, :g5, :fs5, :a5, :g5, :fs5, :e5], [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5])
    play_pattern_timed([:e5, :g5, :b5, :a5, :e5, :g5, :b5, :a5, :e5, :e5, :g5, :e5], [0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.5])
    play_pattern_timed([:b5, :a5, :e5, :b5, :a5, :e5, :g5, :fs5, :g5, :fs5, :g5, :a5, :b5], [0.25, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5])
    play_pattern_timed([:a5, :g5, :fs5, :fs5, :g5, :fs5, :d5, :b4, :c5, :b4, :e5, :e5, :g5, :fs5, :e5], [0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5, 0.25, 0.5, 0.25, 1])
    play_pattern_timed([:e5, :g5, :a5, :d6, :d6, :d6, :c6, :b5, :a5, :a5, :e5, :g5, :a5, :b5, :b5], [0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:e5, :c6, :b5, :a5, :e5, :g5, :a5, :b5, :a5, :g5, :fs5, :fs5, :g5, :fs5, :e5, :e5, :g5, :a5, :b5, :b5, :b5, :b5, :b5, :b5, :b5, :b5, :a5, :b5],
                       [0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.5, 0.5])
  }
  main_melody(melody_snippet_a)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  countermelody_snippet_a = -> {
    4.times do
      play_pattern_timed([:b3, :b3, :b3, :d4, :e4, :e4, :b3, :b3, :d4, :e4, :e4], [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5])
    end
    play_pattern_timed([:b3, :b3, :b3, :a3, :a3, :g3, :a3, :a3, :a3, :a3, :g3, :a3], [0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.5])
    play_pattern_timed([:g3, :a3, :a3, :g3, :a3, :a3, :g3, :g3, :a3, :a3, :a3, :b3, :b3], [0.25, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5])
    play_pattern_timed([:b3, :b3, :a3, :a3, :g3, :g3, :g3, :fs3, :fs3, :fs3, :g3, :g3, :g3, :fs3, :g3], [0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.5, 0.5, 0.25, 0.25, 0.5, 0.25, 0.5, 0.25, 1])
    play_pattern_timed([:e3, :e3, :e3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :a3], [0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5])
    play_pattern_timed([:a3, :a3, :a3, :a3, :a3, :a3, :a3, :a3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :b3, :e3, :e3, :e3, :e3, :e3, :e3, :e3, :e3, :a3, :a3],
                       [0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.25, 0.5, 0.5, 0.5])
  }
  interlude_snippet = -> {
    play_pattern_timed([:d4, :e4, :e4, :e4, :e4, :e4, :e4, :d4, :d4], [0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5])
    play_pattern_timed([:d4, :e4, :e4, :e4, :e4, :e4, :e4, :f4, :f4], [0.25, 0.5, 0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5])
  }
  main_countermelody(countermelody_snippet_a, interlude_snippet)
end

in_thread do
  use_synth :saw
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  solo_snippet = -> {
    play_pattern_timed([:b5, :b4, :a5, :b4, :g5, :b4, :fs5, :b4, :e5], [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25])
    play_pattern_timed([:b4, :fs5, :b4, :g5, :b4, :a5, :b4, :b5, :e5, :e5, :b4, :e5, :a5, :g5, :fs5, :e5], [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.25, 0.25, 0.25, 0.5, 0.25, 0.5])
    play_pattern_timed([:e5, :d5, :e5, :g5, :fs5, :g5, :g5, :fs5, :g5, :fs5, :g5, :g5, :d5, :b5, :a5, :g5, :fs5, :d5, :a5, :g5, :fs5, :d5, :c5],
                       [0.25, 0.25, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5, 0.5, 0.25])
    16.times do
      play_pattern_timed([:a5, :e5, :c5], [0.125, 0.125, 0.25])
    end
    12.times do
      play_pattern_timed([:b5, :g5, :e5], [0.125, 0.125, 0.25])
    end
    play_pattern_timed([:b5, :a5, :g5, :fs5, :e5, :fs5, :g5, :a5], [0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25])
    play_pattern_timed([:d6, :d6, :d6, :c6, :b5, :a5, :c6, :b5, :a5, :g5, :a5, :b5, :a5, :g5, :fs5], [0.75, 0.75, 0.75, 0.75, 0.5, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5])
    play_pattern_timed([:a5, :b5, :e5, :e5, :e5, :d5, :e5, :e5, :d5, :e5], [0.25, 0.5, 0.5, 0.25, 0.5, 0.5, 0.25, 0.5, 0.25, 0.5])
    play_pattern_timed([:b4, :e5, :ds5, :e5, :fs5, :g5, :e5, :fs5, :g5, :a5, :fs5, :g5, :a5, :fs5, :g5, :a5, :e5],
                       [0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25])
    play :b5, release: 4
  }
  main_solo(solo_snippet)
end

in_thread do
  use_synth :hoover
  use_synth_defaults release: 2
  impact_snippet = -> {
    play :e3
    sleep 4
    play :e3
    sleep 2
    play :f3
    sleep 2
  }
  main_impact(impact_snippet)
end

in_thread do
  use_synth :noise
  use_synth_defaults release: 0.5
  noise_snippet_a = -> {
    3.times do
      play_pattern_timed([nil, nil, nil, :a2, nil, nil, nil, :a2], [0.5])
    end
    play_pattern_timed([nil, nil, nil, :a2, nil, nil, :a2, :a2], [0.5])
  }
  noise_snippet_b = -> {
    3.times do
      play_pattern_timed([:a2, nil, nil, nil, :a2, nil, nil, nil, :a2, nil, nil, nil, :a2, nil, nil, nil], [0.25])
    end
    play_pattern_timed([:a2, nil, nil, nil, :a2, nil, nil, nil, :a2, nil, nil, :a2, nil, nil, :a2, nil], [0.25])
  }
  main_noise(noise_snippet_a, noise_snippet_b)
end
