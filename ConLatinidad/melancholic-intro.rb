use_bpm 60

in_thread do
  use_synth :piano
  play_pattern_timed([:c5, :d5, :ds5, :g5], [0.5, 0.5, 0.5, 1])
  play_pattern_timed([:c5, :g5, :f5], [0.5, 0.5, 1])
  play_pattern_timed([:ds5, :d5, :d5, :ds5, :c5], [0.5, 0.5, 0.5, 0.5, 1.5])
  play_pattern_timed([:c5, :d5, :ds5, :g5], [0.5, 0.5, 0.5, 1])
  play_pattern_timed([:f5, :g5, :as5, :gs5, :g5, :f5, :g5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 2.25])
  play_pattern_timed([:c5, :d5, :ds5, :g5], [0.5, 0.5, 0.5, 1])
  play_pattern_timed([:c5, :as5, :f5], [0.5, 0.5, 1])
  play_pattern_timed([:ds5, :f5, :g5, :f5, :ds5, :d5, :c5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1])
  play_pattern_timed([:g4, :as4, :c5, :ds5, :d5, :c5, :ds5, :d5, :c5], [0.5, 0.5, 1, 0.5, 0.5, 1, 0.5, 0.5, 3])
  play_pattern_timed([:g4, :as4, :c5, :ds5, :d5, :c5, :ds5, :d5, :c5], [0.5, 0.5, 1, 0.5, 0.5, 1, 0.5, 0.5, 1])
  
end

in_thread do
  use_synth :piano
  use_synth_defaults amp: 0.75, release: 2
  sleep 1.5
  play_pattern_timed([:gs3, :c4, :ds4], [0.0625])
  sleep 1.75
  play_pattern_timed([:as3, :d4, :f4], [0.0625])
  sleep 1.75
  play_pattern_timed([:c4, :ds4, :g4], [0.0625])
  sleep 3.85
  play_pattern_timed([:gs3, :c4, :ds4], [0.0625])
  sleep 1.75
  play_pattern_timed([:as3, :d4, :f4], [0.0625])
  sleep 1.75
  play_pattern_timed([:c4, :ds4, :g4], [0.0625])
  sleep 1.75
  play :as4
  play :f4
  sleep 1
  play :g4
  play :d4
  sleep 1
  play_pattern_timed([:gs3, :c4, :ds4], [0.0625])
  sleep 1.35
  play :as4
  play :f4
  sleep 0.4
  play_pattern_timed([:as3, :d4, :f4], [0.0625])
  sleep 1.35
  play :g4
  play :d4
  sleep 0.5
  play_pattern_timed([:c4, :ds4, :g4], [0.0625])
  sleep 1.35
  play :g4
  play :d4
  sleep 0.4
  play_pattern_timed([:a3, :c4, :f4], [0.0625])
  sleep 1.75
  play_pattern_timed([:gs3, :c4, :ds4], [0.0625])
  sleep 1.85
  play_pattern_timed([:as3, :d4, :f4], [0.0625])
  sleep 1.75
  play_pattern_timed([:c4, :ds4, :g4], [0.0625])
  sleep 1.95 + 0.0625
  play :as4, release: 4
  play :f4, release: 4
  sleep 1
  play :g4, release: 4
  play :d4, release: 4
  sleep 0.85
  
  play :gs3, release: 0.5
  play :ds3, release: 0.5
  sleep 0.125
  play :gs3, amp: 2, release: 4
  play :ds3, amp: 2, release: 4
  sleep 2
  play :as3, amp: 2, release: 0.5
  play :f3, amp: 2, release: 0.5
  sleep 0.25
  play :as3, amp: 2, release: 0.5
  play :f3, amp: 2, release: 0.5
  sleep 2.5
  play_pattern_timed([:c4, :ds4, :g4], [0.5])
  play_pattern_timed([:c4, :ds4, :g4], [0.0625])
end
