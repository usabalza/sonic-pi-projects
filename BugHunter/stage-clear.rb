use_bpm 150

define :main_melody do |melody|
  1.times { melody.call }
end

define :main_countermelody do |countermelody|
  1.times { countermelody.call }
end

define :main_bass do |bass|
  1.times { bass.call }
end

define :main_battery do |battery_a, battery_b|
  sleep 2
  6.times { battery_a.call }
  1.times { battery_b.call }
end

define :main_impact do |impact|
  sleep 2
  1.times { impact.call }
end

define :main_noise do |noise|
  sleep 2
  1.times { noise.call }
end

in_thread do
  use_synth :pulse
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  use_transpose 2
  melody_snippet = -> {
    play_pattern_timed([:gs4, :a4, :b4, :d5, :c5, :b4, :c5, :e4, :e4, :d5, :c5, :b4, :c5, :d5, :g4, :e5], [0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 4])
    play_pattern_timed([:a4, :a4, :a4, :a4, :g4, :a4], [0.25, 0.5])
  }
  main_melody(melody_snippet)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  use_transpose 2
  countermelody_snippet = -> {
    play_pattern_timed([:e3, :e3, :e3, :a3, :a3, :a3, :a3, :a3, :a3, :b3, :b3, :b3, :b3, :b3, :b3, :cs4], [0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 1.5, 0.25, 0.25, 0.75, 0.75, 0.5, 4])
    play_pattern_timed([:e3, :e3, :e3, :e3, :d3, :e3], [0.25, 0.5])
  }
  main_countermelody(countermelody_snippet)
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
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  use_transpose 2
  bass_snippet = -> {
    bass_riff_b(:a3, :g3, :e3)
    bass_riff_a(:f3, 14)
    bass_riff_a(:g3, 14)
    bass_riff_a(:a3, 14)
    3.times do
      play :a3
      sleep 0.75
    end
  }
  main_bass(bass_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  battery_snippet_a = -> {
    play_pattern_timed([:a, :a6, :a, :a, :a6], [0.5, 0.5, 0.25, 0.25, 0.5])
  }
  battery_snippet_b = -> {
    play_pattern_timed([:a, :a6, :a, :a6, :a, :a6], [0.25, 0.5, 0.25, 0.5, 0.25, 0.5])
  }
  main_battery(battery_snippet_a, battery_snippet_b)
end

in_thread do
  use_synth :hoover
  use_synth_defaults release: 4
  use_transpose 2
  impact_snippet = -> {
    play :f3
    sleep 4
    play :g3
    sleep 4
    play :a3
    sleep 4
  }
  main_impact(impact_snippet)
end

in_thread do
  use_synth :noise
  use_synth_defaults release: 0.5
  noise_snippet_a = -> {
    6.times do
      play_pattern_timed([nil, :a2, nil, :a2], [0.5])
    end
    play_pattern_timed([nil, :a2, nil, nil, :a2, nil, nil, :a2], [0.25])
  }
  main_noise(noise_snippet_a)
end

