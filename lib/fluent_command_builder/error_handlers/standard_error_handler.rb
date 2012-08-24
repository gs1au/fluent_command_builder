module FluentCommandBuilder
  class StandardErrorHandler

    def handler_error(status, failed_command_text)
      fail "Command failed with status (#{status.exitstatus}): [#{failed_command_text}]"
    end

  end
end