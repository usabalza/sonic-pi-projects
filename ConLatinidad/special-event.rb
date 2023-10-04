use_bpm 180

live_loop :tabla do
  sample :loop_tabla, amp: 3
  sleep 32
end

live_loop :left_hand2 do
  use_synth :piano
  play_pattern_timed([:f4, :gs4, :c5, :e4, :c5, :ds4, :c5, :d4, :d4, :as4], [1, 1, 1, 2, 2, 2, 2, 1, 2, 2])
  play_pattern_timed([:f4, :gs4, :c5, :e4, :c5, :ds5, :cs5, :c5, :as4, :gs4, :g4], [1, 1, 1, 2, 2, 2, 2, 1, 2, 1, 1])
  play_pattern_timed([:gs4, :g4, :f4, :as4, :c5, :as4, :gs4, :g4, :as4, :gs4, :g4, :f4], [0.25, 0.25, 2.5, 1, 1, 1, 1, 1, 2, 1, 1, 1])
  play_pattern_timed([:f4, :gs4, :f4, :as4, :gs4, :g4, :g4, :gs4, :as4, :cs5], [1, 1, 1, 2, 1, 1, 1, 1, 1, 1])
  play :c5, release: 2
  sleep 2
  play :as4, release: 2
  sleep 2
  play :gs4, release: 2
  sleep 2
  play_pattern_timed([:f4, :g4, :gs4, :as4], [0.5, 0.5, 0.5, 0.5])
  play :c5, release: 2
  play :cs4, release: 2
  sleep 1
  play_pattern_timed([:f4, :f4, :g4, :gs4, :f4], [0.5, 0.5, 0.5, 0.5, 0.5])
  play :c5, release: 2
  play :cs4, release: 2
  sleep 2
  play_pattern_timed([:f4, :f4, :g4, :gs4, :f4], [0.5, 0.5, 0.5, 0.5, 0.5])
  play :c5, release: 2
  play :cs4, release: 2
  sleep 1
  play_pattern_timed([:f4, :f4, :g4, :gs4, :f4], [0.5, 0.5, 0.5, 0.5, 0.5])
  play :c5, release: 2
  play :cs4, release: 2
  sleep 2
  play_pattern_timed([:f4, :ds5, :cs5, :c5, :as4, :as4], [0.5, 0.5, 0.5, 0.5, 0.5, 1])
  play_pattern_timed([:ds4, :ds4, :g4, :ds4, :ds4, :as4], [0.5, 0.5, 0.5, 0.5, 0.5, 1])
  play_pattern_timed([:ds4, :f4, :g4, :gs4, :as4, :cs5, :as4], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
  play :c5, release: 2
  play :g4, release: 2
  sleep 2
  play :as4, release: 2
  sleep 2
  play :gs4, release: 2
  sleep 1.5
  play_pattern_timed([:as4, :gs4, :g4], [0.25, 0.25, 2])
end

live_loop :left_hand3 do
  use_synth :piano
  2.times do
    play :c3, release: 4
    play :f3, release: 4
    sleep 3
    play :c3, release: 4
    play :g3, release: 4
    sleep 4
    play :ds3, release: 4
    play :gs3, release: 4
    sleep 4
    play :d3, release: 4
    play :as3, release: 4
    sleep 3
    play :gs3
    sleep 1
    play :g3
    sleep 1
  end
  2.times do
    4.times do
      play :cs3, release: 4
      play :gs3, release: 4
      sleep 1
      play :f3
      sleep 1
      play :gs3
      sleep 1
    end
    play :cs3, release: 2
    sleep 2
    play :c3, release: 2
    sleep 2
    play :ds3, release: 4
    play :as3, release: 4
    sleep 1
    play :g3
    sleep 1
    play :gs3
    sleep 1
    play :as3
    sleep 1
    play :gs3
    sleep 1
    play :g3
    sleep 1
    play :f3
    sleep 1
    play :gs3
    sleep 1
    play :g3, release: 4
    play :c3, release: 4
    sleep 2
    play :f3
    sleep 1
    play :gs3
    sleep 1
    play :as3, release: 4
    sleep 1.5
    play :as3
    sleep 0.25
    play :gs3
    sleep 0.25
    play :g3, release: 4
    sleep 2
  end
end
