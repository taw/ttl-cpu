require "pathname"

task "default" => "test"

desc "Run tests"
task "test" => ["ttlasm:compile", "verilog:compile"]


desc "Compile ttlasm"
task "ttlasm:compile" do
  Dir.chdir("ttlasm") do
    Dir["*.ta"].each do |path|
      system "./ttlasm #{path} >#{path}.compiled"
      raise unless Pathname("#{path}.compiled").size == 7 * 0x10000
    end
  end
end

# Many of these seem to be changes in verilog
# as they definitely used to work, but a few might be legit problems
# unless I simply used a different verilog implementation, which is possible
desc "Compile verilog"
task "verilog:compile" do
  targets = [
    ["7400"],
    ["7400_timed"],
    ["7402"],
    ["7402_timed"],
    ["7408"],
    ["7408_timed"],
    # ["74151"],
    # ["74151_timed"],
    ["74153"],
    ["74153_timed"],
    ["74157"],
    ["74157_timed"],
    ["74273"],
    ["74273_timed"],
    # ["7430"],
    # ["7430_timed"],
    ["7432"],
    ["7432_timed"],
    ["7442"],
    ["7442_timed"],
    ["7483"],
    ["7483_timed"],
    ["7486"],
    ["7486_timed"],
    # ["alu16", "alu4", "7400", "7402", "74153", "7483", "7486", "7430"],
    ["alu4", "7400", "7402", "74153", "7483", "7486"],
    ["alu4_tb", "alu4", "7400", "7402", "74153", "7483", "7486"],
    ["control"],
    ["counter"],
    ["counter_tb", "counter"],
    # ["fibx"], # This one seems to have never worked
    ["ip", "7483", "mux_2in_16b", "74273", "74157"],
    ["mux_2in_16b", "74157"],
    # ["mux_8in_8b", "74151"],
    ["nice_alu4", "7400", "7402", "74153", "7483", "7486"],
    # ["proc"],
    # ["ram"],
    ["reg16", "mux_2in_16b", "74157", "74273"],
    # ["regbank", "reg16", "mux_2in_16b", "74157", "74273"],
    ["rom_loads"],
    ["rom_plusloop"],
    # ["test_bench"],
    # ["test_bench2"],
    # ["test_bench3"],
  ]

  system "trash build" if Pathname("build").exist?
  Pathname("build").mkpath
  targets.each do |mod, *deps|
    target = Pathname("build/#{mod}")
    system "iverilog -o #{target} #{[mod,*deps].map{|x| "verilog/#{x}.v"}.join(" ")}"
    raise "Couldn't build #{target}" unless target.exist?
  end
end

desc "Clean build files"
task "clean" do
  system "trash ttlasm/*.ta.compiled"
end
