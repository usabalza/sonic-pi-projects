use_bpm 180

live_loop :tabla do
  sample :loop_tabla, amp: 3, rate: 0.5
  sleep 32
end

live_loop :dark_ambience do
  sample :ambi_haunted_hum, pitch: 3
  sleep 12
end

live_loop :left_hand do
  use_synth :piano
  2.times do
    play_pattern_timed([:b4, :cs5, :d5, :a5], [0.5, 0.5, 0.5, 1])
    2.times do
      play_pattern_timed([:cs5, :d5, :a5], [0.5, 0.5, 1])
    end
    sleep 9.5
  end
  play_pattern_timed([:g4, :cs5, :d5, :g4], [0.5, 0.5, 0.5, 1])
  2.times do
    play_pattern_timed([:cs5, :d5, :g4], [0.5, 0.5, 1])
  end
  sleep 9.5
  play_pattern_timed([:e4, :a4, :b4, :e4], [0.5, 0.5, 0.5, 1])
  2.times do
    play_pattern_timed([:a4, :b4, :e4], [0.5, 0.5, 1])
  end
  sleep 9.5
  play_pattern_timed([:b4, :d5, :fs5, :d5, :e5, :fs5, :e5, :d5, :cs5, :b4], [0.25, 0.25, 4.5, 1, 1, 1, 1, 1, 1, 5])
  play_pattern_timed([:b4, :d5, :fs5, :d5, :fs5, :d5, :e5, :fs5, :e5, :d5, :cs5, :b4, :as4, :b4, :cs5, :as4, :b4], [0.25, 0.25, 4.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4])
  play_pattern_timed([:cs5, :d5, :e5, :fs5, :cs5, :e5, :d5, :cs5, :d5, :b4], [1, 1, 2, 1, 1, 1, 1, 1, 1, 7.5])
  play_pattern_timed([:as4, :b4, :cs5, :d5, :cs5, :d5, :e5, :a4, :d5, :e5, :fs5], [0.25, 0.25, 3, 1, 1, 1, 1, 1, 0.25, 0.25, 1.5])
  play_pattern_timed([:d5, :e5, :fs5, :e5, :d5, :cs5, :d5, :b4, :b4, :cs5, :d5, :cs5, :gs4, :gs4, :cs5, :gs4, :b4, :cs5, :b4, :as4], [1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 4, 1, 1, 1, 1, 3.5, 0.25, 0.25, 4])
  2.times do
    play_pattern_timed([:fs6, :fs5, :e6, :fs5, :d6, :fs5, :cs6, :fs5, :b5, :fs5, :cs6, :fs5, :d6, :fs5, :e6, :fs5], [0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5])
  end
  play_pattern_timed([:f6, :e6, :d6, :cs6, :b5, :cs6, :d6, :e6, :d6, :cs6], [3, 1, 1, 1, 1, 1, 3.5, 0.25, 0.25, 4])
end

live_loop :right_hand do
  use_synth :piano
  #1st chorus
  play :b2, release: 4
  play :fs3, release: 4
  sleep 6
  
  play :fs2, release: 4
  sleep 2
  play :b2, release: 4
  sleep 2
  play :cs3, release: 4
  sleep 2
  play :d3, release: 4
  sleep 2
  play :cs3, release: 4
  sleep 2
  
  play :b2, release: 4
  play :fs3, release: 4
  sleep 6
  
  play :d3, release: 4
  sleep 2
  play :e3, release: 4
  sleep 2
  play :fs3, release: 4
  sleep 2
  play :e3, release: 4
  sleep 2
  play :d3, release: 4
  sleep 2
  
  play :g2, release: 4
  play :d3, release: 4
  sleep 6
  
  play :a2, release: 4
  sleep 2
  play :b2, release: 4
  sleep 2
  play :a2, release: 4
  sleep 2
  play :g2, release: 4
  sleep 2
  play :g2, release: 2
  sleep 1
  play :fs2, release: 2
  sleep 1
  
  play :e2, release: 4
  play :b2, release: 4
  sleep 8
  play :fs2, release: 4
  play :cs3, release: 4
  sleep 4
  play :g2, release: 4
  sleep 2
  play :a2, release: 4
  sleep 2
  
  #2nd chorus
  play :b2, release: 4
  play :fs3, release: 4
  sleep 6
  
  play :fs2, release: 4
  sleep 2
  play :b2, release: 4
  sleep 2
  play :cs3, release: 4
  sleep 2
  play :d3, release: 4
  sleep 2
  play :cs3, release: 4
  sleep 2
  
  play :b2, release: 4
  play :fs3, release: 4
  sleep 6
  
  play :fs2, release: 4
  sleep 2
  play :b2, release: 4
  sleep 2
  play :as2, release: 4
  sleep 2
  play :a2, release: 4
  sleep 2
  play :gs2, release: 4
  sleep 2
  
  play :g2, release: 4
  play :d3, release: 4
  sleep 6
  
  play :d2, release: 4
  sleep 2
  play :g2, release: 4
  sleep 2
  play :a2, release: 4
  sleep 2
  play :b2, release: 4
  sleep 2
  play :d3, release: 2
  sleep 1
  play :cs3, release: 2
  sleep 1
  
  play :e2, release: 4
  play :b2, release: 4
  sleep 8
  play :fs2, release: 4
  play :cs3, release: 4
  sleep 4
  play :d3, release: 4
  sleep 2
  play :cs3, release: 4
  sleep 2
  
  #Finale
  
  play :b2, release: 4
  play :g2, release: 4
  sleep 2
  play :g2, release: 2
  sleep 1
  play :b2, release: 4
  sleep 2
  play :b2, release: 2
  sleep 1
  play :a2, release: 2
  sleep 1
  play :g2, release: 2
  sleep 1
  
  play :b2, release: 4
  play :fs2, release: 4
  sleep 2
  play :fs2, release: 2
  sleep 1
  play :a2, release: 4
  sleep 2
  play :a2, release: 2
  sleep 1
  play :g2, release: 2
  sleep 1
  play :fs2, release: 2
  sleep 1
  
  play :b2, release: 4
  play :f2, release: 4
  sleep 2
  play :f2, release: 2
  sleep 1
  play :b2, release: 4
  sleep 2
  play :a2, release: 2
  sleep 1
  play :g2, release: 2
  sleep 1
  play :a2, release: 2
  sleep 1
  
  play :b2, release: 4
  play :fs2, release: 4
  sleep 4
  play :as2, release: 4
  play :fs2, release: 4
  sleep 4
  
  4.times do
    play :b2, release: 2
    play :g2, release: 2
    sleep 2
  end
  4.times do
    play :b2, release: 2
    play :fs2, release: 2
    sleep 2
  end
  4.times do
    play :b2, release: 2
    play :f2, release: 2
    sleep 2
  end
  
  play :b2, release: 4
  play :fs2, release: 4
  sleep 4
  play :as2, release: 4
  play :fs2, release: 4
  sleep 4
end
