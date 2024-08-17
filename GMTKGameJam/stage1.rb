#loop_garzul, loop_amen_full

#16.times do
#  sample :loop_amen_full
#  sleep 6.85
#end

use_bpm 140

repetitions = 256

define :hihats_loop do |hh1|
  ((repetitions/2 + 16)*4 - 16).times { hh1.call }
  sleep 4
  ((repetitions/2)*4 - 16).times { hh1.call }
  sleep 4
  
end

define :beat_loop do |b1|
  ((repetitions/2 + 16) - 4).times { b1.call }
  sleep 4
  ((repetitions/2) - 4).times { b1.call }
  sleep 4
end


define :bass_loop do |b1, b2|
  sleep repetitions/16
  6.times { b1.call }
  4.times { b2.call }
  
end

define :chord_loop do |c1, c2|
  sleep (repetitions/8) + 16
  5.times { c1.call }
  sleep 0.5
  4.times { c2.call }
end

define :melody_loop do |m1|
  sleep (repetitions/2) + 16
  2.times { m1.call }
end

define :techsaw_loop do |ts1|
  sleep (repetitions/4) + 16
  4.times { ts1.call }
end

define :blip_loop do |b1|
  sleep (repetitions/2 + 112)
  16.times { b1.call }
end



in_thread do
  hihats1 = -> {
    sample :drum_cymbal_closed , amp: 0.5
    sleep 0.25
  }
  hihats_loop(hihats1)
end

in_thread do
  beat1 = -> {
    sample :bd_haus
    sleep 1
  }
  beat_loop(beat1)
end

in_thread do
  use_synth :fm
  use_synth_defaults release: 0.5
  bass1 = -> {
    4.times do
      play_pattern_timed([:a2, :b2, :b2, :a2, :a2, :b2, :b2], [0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 1.25])
    end
    2.times do
      play_pattern_timed([:fs2, :g2, :g2, :fs2, :fs2, :g2, :g2], [0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 1.25])
    end
    play_pattern_timed([:g2, :a2, :a2, :g2, :g2, :a2, :a2], [0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 1.25])
    play_pattern_timed([:e2, :fs2, :fs2, :e2, :e2, :fs2, :fs2], [0.5, 0.5, 0.5, 0.5, 0.25, 0.5, 1.25])
  }
  
  bass2 = -> {
    play_pattern_timed([:b2, :a2, :g2, :fs2, :fs2, :g2], [0.75, 0.75, 0.75, 0.75, 0.5, 0.5])
    play_pattern_timed([:a2, :g2, :fs2, :e2, :e2, :fs2], [0.75, 0.75, 0.75, 0.75, 0.5, 0.5])
    play_pattern_timed([:g2, :fs2, :e2, :d2, :d2, :e2], [0.75, 0.75, 0.75, 0.75, 0.5, 0.5])
    play_pattern_timed([:fs2, :fs2, :fs2, :fs2, :g2, :a2], [0.75, 0.75, 0.75, 0.75, 0.5, 0.5])
  }
  
  bass_loop(bass1, bass2)
end

in_thread do
  use_synth :piano
  use_synth_defaults amp: 2
  chords1 = -> {
    2.times do
      2.times do
        play chord(:A, :major)
        sleep 0.75
      end
      play chord(:B, :minor)
      sleep 6.5
    end
    play chord(:B, :minor)
    sleep 0.75
    play chord(:A, :major)
    sleep 0.75
    play chord(:G, :major)
    sleep 6.5
    play chord(:G, :major)
    sleep 0.75
    2.times do
      play chord(:A, :major)
      sleep 0.75
    end
    sleep 1.75
    play chord(:E, :major)
    sleep 0.75
    2.times do
      play chord(:FS, :major)
      sleep 0.75
    end
    sleep 1.75
  }
  
  chords2 = -> {
    2.times do
      play chord(:B, :minor)
      sleep 0.5
    end
    sleep 0.75
    2.times do
      play chord(:G, :major)
      sleep 0.75
    end
    sleep 0.75
    2.times do
      play chord(:A, :major)
      sleep 0.5
    end
    sleep 0.5
    3.times do
      play chord(:FS, :minor)
      sleep 0.75
    end
    sleep 0.25
    2.times do
      play chord(:G, :major)
      sleep 0.5
    end
    sleep 0.75
    2.times do
      play chord(:E, :minor)
      sleep 0.75
    end
    sleep 0.75
    2.times do
      play chord(:FS, :minor)
      sleep 0.5
    end
    sleep 0.5
    3.times do
      play chord(:FS, :minor)
      sleep 0.75
    end
    sleep 0.25
    
  }
  chord_loop(chords1, chords2)
end

in_thread do
  use_synth :dpulse
  use_synth_defaults amp: 0.5
  
  melody1 = -> {
    play_pattern_timed([:fs4, :fs4, :b4], [0.5, 0.25, 4.75])
    play_pattern_timed([:d5, :cs5, :b4, :a4, :a4, :b4], [0.5, 0.75, 0.75, 0.5, 0.75, 4.75])
    play_pattern_timed([:d5, :cs5, :d5, :e5, :fs5, :b4], [0.5, 0.75, 0.75, 0.5, 0.75, 4.75])
    play_pattern_timed([:b4, :cs5, :d5, :e5, :d5, :cs5, :b4, :as4], [0.5, 0.75, 0.75, 0.5, 0.75, 3.25, 0.75, 3.25])
  }
  melody_loop(melody1)
end

in_thread do
  use_synth :tech_saws
  techsaw1 = -> {
    2.times do
      play :d4, release: 5
      sleep 8
    end
    play :b3, release: 5
    sleep 8
    play :d4, release: 5
    sleep 4
    play :cs4, release: 5
    sleep 4
  }
  techsaw_loop(techsaw1)
end

in_thread do
  use_synth :chiplead
  use_synth_defaults release: 0.25, amp: 0.5
  blip1 = -> {
    play_pattern_timed([:fs5, :fs5, :b5, :fs5, :fs5, :b5, :fs5, :b5], [0.25])
  }
  blip_loop(blip1)
end
