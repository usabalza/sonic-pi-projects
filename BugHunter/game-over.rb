#game-over
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

define :main_battery do |battery|
  1.times { battery.call }
end

define :main_noise do |noise|
  1.times { noise.call }
end



in_thread do
  use_synth :pulse
  use_synth_defaults release: 0.2, mod_rate: 5, amp: 0.6
  melody_snippet = -> {
    play_pattern_timed([:f4, :f4, :ds4, :f4, :f4, :ds4, :f4], [0.75, 0.5, 0.75, 1.25, 0.5, 0.75, 1])
    sleep 2
    play_pattern_timed([:as4, :gs4, :g4, :f4, :ds4, :f4], [0.4, 0.4, 0.4, 0.75, 0.5, 0.5])
  }
  main_melody(melody_snippet)
end

in_thread do
  use_synth :blade
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 1
  countermelody_snippet = -> {
    play_pattern_timed([:c3, :c3, :as2, :c3, :c3, :as2, :c3], [0.75, 0.5, 0.75, 1.25, 0.5, 0.75, 1])
    sleep 2
    play_pattern_timed([:f3, :f3, :f3, :f3, :f3, :c3], [0.4, 0.4, 0.4, 0.75, 0.5, 0.5])
  }
  main_countermelody(countermelody_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5, mod_rate: 5, amp: 0.6
  bass_snippet = -> {
    2.times do
      play_pattern_timed([:f2, :f2, :f3, :f3], [0.75, 0.5, 0.75, 0.5])
    end
    2.times do
      play_pattern_timed([:g2, :g2, :g3, :g3], [0.75, 0.5, 0.75, 0.5])
    end
    play :f3
    sleep 2
  }
  main_bass(bass_snippet)
end

in_thread do
  use_synth :fm
  use_synth_defaults divisor: 1.6666, attack: 0.0, depth: 1500, sustain: 0.05, release: 0.0
  battery_snippet = -> {
    2.times do
      play_pattern_timed([:a, :a6, :a6, :a, :a6], [1.25, 0.75, 1.25, 0.5, 1.25])
    end
    play :a6
  }
  main_battery(battery_snippet)
end

in_thread do
  use_synth :noise
  use_synth_defaults release: 0.5
  noise_snippet_a = -> {
    2.times do
      play_pattern_timed([nil, nil, nil, nil, nil, :a2, nil, nil, :a2, nil, nil, nil, nil, nil, nil, :a2], [0.25])
      sleep 1
    end
    play :a2
  }
  main_noise(noise_snippet_a)
end

in_thread do
  use_synth :bass_highend
  play :f3, release: 3
  sleep 5
  play :g3, release: 3
  sleep 5
  play :f3, release: 0.5
end
