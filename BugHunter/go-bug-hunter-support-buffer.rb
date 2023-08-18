use_bpm 120

define :main_bass do |bass, interlude|
  2.times { bass.call }
  2.times { interlude.call }
  1.times { bass.call }
  2.times { interlude.call }
end

define :main_battery do |battery_a, battery_b1, battery_b2, battery_interlude|
  24.times { battery_a.call }
  4.times { battery_interlude.call }
  1.times { battery_b1.call }
  11.times { battery_b2.call }
  4.times { battery_interlude.call }
end

define :main_beep do |beep|
  1.times { beep.call }
end

define :main_impact do |impact|
  sleep 96
  2.times { impact.call }
  sleep 48.25
  2.times { impact.call }
end

define :main_solo do |solo|
  sleep 112
  1.times { solo.call }
end

define :main_noise do |noise_a, noise_b|
  sleep 47.5
  3.times { noise_a.call }
  sleep 16
  3.times { noise_b.call }
end

define :main_melody do |melody|
  sleep 47.25
  1.times { melody.call }
end

define :main_countermelody do |countermelody, interlude|
  sleep 47.25
  1.times { countermelody.call }
  2.times { interlude.call }
  sleep 48.25
  2.times { interlude.call }
end
define :bass_a do |a, b, c, n|
  n.times do
    play_pattern_timed([a, a, b, c, c, b, a, a], [0.25])
  end
end
