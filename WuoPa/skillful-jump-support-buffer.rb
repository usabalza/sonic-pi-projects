use_bpm 250

define :salsa_intro do |intro|
  1.times { intro.call }
end

define :salsa_bass do |intro_bass, main_bass, bridge_bass, final_bass|
  1.times { intro_bass.call }
  sleep 5
  2.times { main_bass.call }
  1.times { bridge_bass.call }
  sleep 4
  1.times { final_bass.call }
end

define :salsa_drums do |drums1, drums2|
  7.times { drums1.call }
  1.times { drums2.call }
  16.times { drums1.call }
  7.times { drums1.call }
  1.times { drums2.call }
  24.times { drums1.call }
  
end

define :salsa_noise do |noise1, noise2, noise3|
  1.times { noise1.call }
  1.times { noise2.call }
  sleep 64 + 4.5
  2.times { noise1.call }
  7.times { noise3.call }
  sleep 8.5
  6.times { noise1.call }
end

define :chorus do
  sleep 257
  use_synth :hollow
  play :g5, release: 8, amp: 8
  sleep 8
  play :a5, release: 8, amp: 8
  sleep 8
  play :fs5, release: 8, amp: 8
  sleep 8
  play :g5, release: 8, amp: 8
  sleep 40
  
  play :g5, release: 8, amp: 8
  sleep 8
  play :a5, release: 8, amp: 8
  sleep 8
  play :fs5, release: 8, amp: 8
  sleep 8
  play :b5, release: 8, amp: 8
  sleep 24
  2.times do
    play :b5, release: 8, amp: 8
    sleep 8
    play :a5, release: 8, amp: 8
    sleep 8
    play :gs5, release: 8, amp: 8
    sleep 8
    play :g5, release: 8, amp: 8
    sleep 4
    play :a5, release: 8, amp: 8
    sleep 4
  end
end


define :main_melody do |melody1|
  sleep 64 + 0.5
  1.times { melody1.call }
end

define :counter_melody do |counter1|
  sleep 64 + 0.5
  1.times { counter1.call }
end

define :riff_intro1 do |a, b|
  play_pattern_timed([a, b, a, b, a, b, a, a, b], [1, 0.5, 1, 1])
end

define :bass_intro1 do |a|
  play_pattern_timed([a, a, a, a, a, a, a, a, a], [1, 1, 0.5, 1, 1, 0.5, 1, 1, 1])
end

define :bass_intro2 do |a, b|
  play_pattern_timed([a, a, a, a, b, b, b, b, b], [1, 1, 0.5, 1, 1, 0.5, 1, 1, 1])
end

define :piano_chord do |a, b, c|
  play a, release: 4
  play b, release: 4
  play c, release: 4
  sleep 1.5
end

define :complete_intro do
  riff_intro1(:f3, :c4)
  riff_intro1(:g3, :d4)
  riff_intro1(:e3, :b3)
  the_licc
  riff_intro1(:f3, :c4)
  riff_intro1(:g3, :d4)
  riff_finale
  play :c4, release: 5
end

define :counter_melody1 do |a|
  play_pattern_timed([a, a, a, a, a, a], [1.5, 1.5, 1.5, 1.5, 1, 1])
end

define :the_licc do
  play_pattern_timed([:a3, :c4, :c4, :a3, :c4, :a3, :ds4, :d4, :c4, :a3], [0.5, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1, 1.5])
end

define :harmony do
  play_pattern_timed([:g5, :f5, :e5, :d5, :e5, :d5], [1.5, 1.5, 1, 1.5, 1.5, 1])
end

define :riff_finale do
  play_pattern_timed([:a3, :a3, :a3, :f3, :g3, :a3, :b3, :b3, :c4, :b3, :c4, :d4, :e4, :d4, :c4, :d4, :c4, :b3], [1, 1, 0.5, 0.5, 0.5, 0.5, 1, 1, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
end

define :harmony_finale do |a, b, c, d|
  play_pattern_timed([a, b, c, d], [0.5, 0.5, 0.5, 0.5])
  play c, release: 8
end
