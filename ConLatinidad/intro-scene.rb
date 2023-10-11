use_bpm 60

water_sample = "/Users/uzielsabalza/Documents/samples/0008_Water_small_drainpipe_close_to_opening.wav"

live_loop :water do
  sample water_sample, amp: 4
  sleep 32
end

live_loop :left_hand_piano do
  use_synth :piano
  play :e3, release: 8
  play :g3, release: 8
  play :b3, release: 8
  sleep 8
end

live_loop :metronome do
  sample :tabla_te_m
  sleep 1
end

live_loop :right_hand_piano do
  use_synth :piano
  use_synth_defaults amp: 0.75, decay: 2
  play :g5, release: 4
  sleep 2
  play :fs5, release: 4
  sleep 2
  play :c5
  sleep 0.75
  play :b4, release: 2
  sleep 3.25
  
  play :g5, release: 4
  sleep 2
  play :fs5, release: 4
  sleep 1.5
  play :d5
  sleep 0.5
  play :a5, release: 2
  sleep 0.75
  play :g5, release: 4
  sleep 3.25
  
  play :g5, release: 4
  sleep 2
  play :fs5, release: 4
  sleep 2
  play :c5
  sleep 0.75
  play :b4, release: 2
  sleep 3.25
  
  play :e5, release: 4
  sleep 1.5
  play :g5
  sleep 0.5
  play :fs5, release: 4
  sleep 1.5
  play :d5
  sleep 0.5
  play :d5
  sleep 0.75
  play :e5, release: 4
  sleep 3.25
  
end

live_loop :piano_bass do
  use_synth :piano
  use_synth_defaults amp: 0.5
  play :e1
  sleep 0.5
  3.times do
    play :e1
    sleep 0.25
  end
  sleep 0.25
  2.times do
    play :e1
    sleep 0.25
  end
  sleep 0.25
  2.times do
    play :e1
    sleep 0.25
  end
  sleep 0.25
  2.times do
    play :e1
    sleep 0.5
  end
end
