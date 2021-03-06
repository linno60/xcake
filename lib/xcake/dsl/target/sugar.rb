require 'xcodeproj'

module Xcake
  class Target
    # Creates a new Copy Files build phase for the
    # target
    #
    # @param   [String] name
    #          the name to use for the build phase
    #
    # @param   [Proc] block
    #          an optional block that configures the build phase through the DSL.
    #
    # @return [CopyFilesBuildPhase] the new xcode build phase
    #
    def copy_files_build_phase(name, &block)
      phase = CopyFilesBuildPhase.new(&block)
      phase.name = name
      build_phases << phase
      phase
    end

    # Creates a new Copy Headers build phase for the
    # target
    #
    # @param  [Proc] block
    #         an optional block that configures the build phase through the DSL.
    #
    # @return [HeadersBuildPhase] the new xcode build phase
    #
    def headers_build_phase(&block)
      phase = HeadersBuildPhase.new(&block)
      build_phases << phase
      phase
    end

    # Creates a new Shell Script build phase for the
    # target before all of the other build phases
    #
    # @param   [String] name
    #          the name to use for the build phase
    #
    # @param   [Proc] block
    #          an optional block that configures the build phase through the DSL.
    #
    # @return [ShellScriptBuildPhase] the new xcode build phase
    #
    def pre_shell_script_build_phase(name, script, &block)
      phase = ShellScriptBuildPhase.new(&block)
      phase.name = name
      phase.script = script
      pinned_build_phases << phase
      phase
    end

    # Creates a new Shell Script build phase for the
    # target
    #
    # @param   [String] name
    #          the name to use for the build phase
    #
    # @param   [Proc] block
    #          an optional block that configures the build phase through the DSL.
    #
    # @return [ShellScriptBuildPhase] the new xcode build phase
    #
    def shell_script_build_phase(name, script, &block)
      phase = ShellScriptBuildPhase.new(&block)
      phase.name = name
      phase.script = script
      build_phases << phase
      phase
    end
  end
end
